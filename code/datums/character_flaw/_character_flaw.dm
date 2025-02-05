
GLOBAL_LIST_INIT(character_flaws, list(
	"Алкоголизм"=/datum/charflaw/addiction/alcoholic,
	"Курильщик"=/datum/charflaw/addiction/smoker,
	"Нимфомания"=/datum/charflaw/addiction/lovefiend,
	"Садизм"=/datum/charflaw/addiction/sadist,
	"Изоляционизм"=/datum/charflaw/isolationist,
	"Дальтонизм"=/datum/charflaw/colorblind,
	"Близорукость"=/datum/charflaw/badsight,
	"Прилипчивость"=/datum/charflaw/clingy,
	"Пиромания"=/datum/charflaw/addiction/pyromaniac,
	"Наркомания"=/datum/charflaw/addiction/junkie,
	"Жадность"=/datum/charflaw/greedy,
	"Нарколепсия"=/datum/charflaw/narcoleptic,
	"Мазохизм"=/datum/charflaw/masochist,
	"Паранойя"=/datum/charflaw/paranoid,
	"Циклоп (Нет правого)"=/datum/charflaw/noeyer,
	"Циклоп (Нет левого)"=/datum/charflaw/noeyel,
	"Деревянная рука (Правая)"=/datum/charflaw/limbloss/arm_r,
	"Деревянная рука (Левая)"=/datum/charflaw/limbloss/arm_l,
	//"Преследуемый"=/datum/charflaw/dead_or_alive,
	"Случайный изъян или без изъяна (50/50)"=/datum/charflaw/randflaw,
	"Без изъяна (3 ТРИУМФА)"=/datum/charflaw/noflaw
	))

/datum/charflaw
	var/name
	var/desc
	var/ephemeral = FALSE // This flaw is currently disabled and will not process

/datum/charflaw/proc/on_mob_creation(mob/user)
	return

/datum/charflaw/proc/apply_post_equipment(mob/user)
	return

/datum/charflaw/proc/flaw_on_life(mob/user)
	return

/mob/proc/has_flaw(flaw)
	return

/mob/living/carbon/human/has_flaw(flaw)
	if(!flaw)
		return
	if(istype(charflaw, flaw))
		return TRUE

/mob/proc/get_flaw(flaw_type)
	return

/mob/living/carbon/human/get_flaw(flaw_type)
	if(!flaw_type)
		return
	if(charflaw.type != flaw_type)
		return
	return charflaw

/datum/charflaw/randflaw
	name = "Случайный изъян"
	desc = "50% шанс получить случайный изъян или 50% шанс не иметь НИКАКОГО недостатка."
	var/nochekk = TRUE

/datum/charflaw/randflaw/flaw_on_life(mob/user)
	if(!nochekk)
		return
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.ckey)
			nochekk = FALSE
			if(prob(50))
				var/flawz = GLOB.character_flaws.Copy()
				var/charflaw = pick_n_take(flawz)
				charflaw = GLOB.character_flaws[charflaw]
				if((charflaw == type) || (charflaw == /datum/charflaw/noflaw))
					charflaw = pick_n_take(flawz)
					charflaw = GLOB.character_flaws[charflaw]
				if((charflaw == type) || (charflaw == /datum/charflaw/noflaw))
					charflaw = pick_n_take(flawz)
					charflaw = GLOB.character_flaws[charflaw]
				H.charflaw = new charflaw()
				H.charflaw.on_mob_creation(H)
			else
				H.charflaw = new /datum/charflaw/eznoflaw()
				H.charflaw.on_mob_creation(H)


/datum/charflaw/eznoflaw
	name = "Без изъянов"
	desc = "Я личность без недостатков, какая редкость!"

/datum/charflaw/noflaw
	name = "Без изъянов (3 ТРИУМФА)"
	desc = "Я личность без недостатков, какая редкость! (Требует 3 триумфа или дает случайный недостаток.)"
	var/nochekk = TRUE

/datum/charflaw/noflaw/flaw_on_life(mob/user)
	if(!nochekk)
		return
	if(ishuman(user))
		var/mob/living/carbon/human/H = user
		if(H.ckey)
			if(H.get_triumphs() < 3)
				nochekk = FALSE
				var/flawz = GLOB.character_flaws.Copy()
				var/charflaw = pick_n_take(flawz)
				charflaw = GLOB.character_flaws[charflaw]
				if((charflaw == type) || (charflaw == /datum/charflaw/randflaw))
					charflaw = pick_n_take(flawz)
					charflaw = GLOB.character_flaws[charflaw]
				if((charflaw == type) || (charflaw == /datum/charflaw/randflaw))
					charflaw = pick_n_take(flawz)
					charflaw = GLOB.character_flaws[charflaw]
				H.charflaw = new charflaw()
				H.charflaw.on_mob_creation(H)
			else
				nochekk = FALSE
				H.adjust_triumphs(-3)

/datum/charflaw/badsight
	name = "Близорукость"
	desc = "Спустя годы, проведенные за чтением книг, мне нужны очки, чтобы хоть как-то нормально видеть."

/datum/charflaw/badsight/flaw_on_life(mob/user)
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/H = user
	if(H.wear_mask)
		if(isclothing(H.wear_mask))
			if(istype(H.wear_mask, /obj/item/clothing/mask/rogue/spectacles))
				var/obj/item/I = H.wear_mask
				if(!I.obj_broken)
					return
	H.blur_eyes(2)
	H.apply_status_effect(/datum/status_effect/debuff/badvision)

/datum/status_effect/debuff/badvision
	id = "badvision"
	alert_type = null
	effectedstats = list("perception" = -20, "speed" = -5)
	duration = 10 SECONDS

/datum/charflaw/badsight/on_mob_creation(mob/user)
	..()
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/H = user
	if(!H.wear_mask)
		H.equip_to_slot_or_del(new /obj/item/clothing/mask/rogue/spectacles(H), SLOT_WEAR_MASK)
	else
		new /obj/item/clothing/mask/rogue/spectacles(get_turf(H))
	
	// we don't seem to have a mind when on_mob_creation fires, so set up a timer to check when we probably will
	addtimer(CALLBACK(src, PROC_REF(apply_reading_skill), H), 5 SECONDS)

/datum/charflaw/badsight/proc/apply_reading_skill(mob/living/carbon/human/H)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)

/datum/charflaw/paranoid
	name = "Паранойя"
	desc = "Я волнуюсь даже больше, чем большинство людей. Я не слишком доверяю представителям других рас и не переношу вида крови."
	var/last_check = 0

/datum/charflaw/paranoid/flaw_on_life(mob/user)
	if(world.time < last_check + 10 SECONDS)
		return
	if(!user)
		return
	last_check = world.time
	var/cnt = 0
	for(var/mob/living/carbon/human/L in hearers(7, user))
		if(L == src)
			continue
		if(L.stat)
			continue
		if(L.dna?.species)
			if(ishuman(user))
				var/mob/living/carbon/human/H = user
				if(L.dna.species.id != H.dna.species.id)
					cnt++
		if(cnt > 2)
			break
	if(cnt > 2)
		user.add_stress(/datum/stressevent/paracrowd)
	cnt = 0
	for(var/obj/effect/decal/cleanable/blood/B in view(7, user))
		cnt++
		if(cnt > 3)
			break
	if(cnt > 6)
		user.add_stress(/datum/stressevent/parablood)


/datum/charflaw/noeyer
	name = "Циклоп (Правый)"
	desc = "Давным-давно меня лишили правого глаза."

/datum/charflaw/noeyer/on_mob_creation(mob/user)
	..()
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/H = user
	var/obj/item/bodypart/head/head = H.get_bodypart(BODY_ZONE_HEAD)
	head?.add_wound(/datum/wound/facial/eyes/right/permanent)
	H.update_fov_angles()


/datum/charflaw/noeyer/apply_post_equipment(mob/user)
	..()
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/H = user
	var/obj/item/eyepatch = new /obj/item/clothing/mask/rogue/eyepatch(get_turf(H))
	H.put_in_hands(eyepatch, forced = TRUE)
	H.equip_to_slot_if_possible(eyepatch, SLOT_WEAR_MASK, FALSE, TRUE, FALSE, TRUE, TRUE)

/datum/charflaw/noeyel
	name = "Циклоп (Левый)"
	desc = "Давным-давно меня лишили левого глаза."

/datum/charflaw/noeyel/on_mob_creation(mob/user)
	..()
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/H = user
	var/obj/item/bodypart/head/head = H.get_bodypart(BODY_ZONE_HEAD)
	head?.add_wound(/datum/wound/facial/eyes/left/permanent)
	H.update_fov_angles()

/datum/charflaw/noeyel/apply_post_equipment(mob/user)
	..()
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/H = user
	var/obj/item/eyepatch = new /obj/item/clothing/mask/rogue/eyepatch/left(get_turf(H))
	H.put_in_hands(eyepatch, forced = TRUE)
	H.equip_to_slot_if_possible(eyepatch, SLOT_WEAR_MASK, FALSE, TRUE, FALSE, TRUE, TRUE)

/datum/charflaw/greedy
	name = "Жадность"
	desc = "Мне не хватает маммонов, мне нужно еще и еще! Я также хорошо понимаю, сколько стоят вещи вокруг меня."
	var/last_checked_mammons = 0
	var/required_mammons = 0
	var/next_mammon_increase = 0
	var/last_passed_check = 0
	var/first_tick = FALSE
	var/extra_increment_value = 0

/datum/charflaw/greedy/on_mob_creation(mob/user)
	next_mammon_increase = world.time + rand(15 MINUTES, 25 MINUTES)
	last_passed_check = world.time
	ADD_TRAIT(user, TRAIT_SEEPRICES_SHITTY, "[type]")

/datum/charflaw/greedy/flaw_on_life(mob/user)
	if(!first_tick)
		determine_starting_mammons(user)
		first_tick = TRUE
		return
	if(world.time >= next_mammon_increase)
		mammon_increase(user)
	mammon_check(user)

/datum/charflaw/greedy/proc/determine_starting_mammons(mob/living/carbon/human/user)
	var/starting_mammons = get_mammons_in_atom(user)
	required_mammons = round(starting_mammons * 0.7)
	extra_increment_value = round(starting_mammons * 0.15)

/datum/charflaw/greedy/proc/mammon_increase(mob/living/carbon/human/user)
	if(last_passed_check + (50 MINUTES) < world.time) //If we spend a REALLY long time without being able to satisfy, then pity downgrade
		required_mammons -= rand(10, 20)
		to_chat(user, span_blue("Может быть, пока этого количество маммонов хватит..."))
	else
		required_mammons += rand(25, 35) + extra_increment_value
	required_mammons = min(required_mammons, 250) //Cap at 250 coins maximum
	next_mammon_increase = world.time + rand(35 MINUTES, 40 MINUTES)
	var/current_mammons = get_mammons_in_atom(user)
	if(current_mammons >= required_mammons)
		to_chat(user, span_blue("Я вполне [user.gender == FEMALE ? "довольна" : "доволен"] количеством маммонов, которые у меня есть...."))
	else
		to_chat(user, span_boldwarning("Мне нужно больше маммонов! Того, что у меня есть, недостаточно..."))

	last_checked_mammons = current_mammons

/datum/charflaw/greedy/proc/mammon_check(mob/living/carbon/human/user)
	var/new_mammon_amount = get_mammons_in_atom(user)
	var/ascending = (new_mammon_amount > last_checked_mammons)

	var/do_update_msg = TRUE
	if(new_mammon_amount >= required_mammons)
		// Feel better
		if(user.has_stress_event(/datum/stressevent/vice))
			to_chat(user, span_blue("[new_mammon_amount] маммонов... Вот это другое дело.."))
		user.remove_stress(/datum/stressevent/vice)
		user.remove_status_effect(/datum/status_effect/debuff/addiction)
		last_passed_check = world.time
		do_update_msg = FALSE
	else
		// Feel bad
		user.add_stress(/datum/stressevent/vice)
		user.apply_status_effect(/datum/status_effect/debuff/addiction)

	if(new_mammon_amount == last_checked_mammons)
		do_update_msg = FALSE

	if(do_update_msg)
		if(ascending)
			to_chat(user, span_warning("Всего [new_mammon_amount] маммонов.. Мне нужно еще..."))
		else
			to_chat(user, span_boldwarning("Нет! Мои драгоценные маммоны..."))

	last_checked_mammons = new_mammon_amount

/datum/charflaw/narcoleptic
	name = "Нарколепсия"
	desc = "Я постоянно чувствую сонливость и могу внезапно провалиться в сон посреди работы. Из плюсов, я легче сплю, а лунная пыль помогает мне не засыпать какое-то время."
	var/last_unconsciousness = 0
	var/next_sleep = 0
	var/concious_timer = (10 MINUTES)
	var/do_sleep = FALSE
	var/pain_pity_charges = 3
	var/drugged_up = FALSE

/datum/charflaw/narcoleptic/on_mob_creation(mob/user)
	ADD_TRAIT(user, TRAIT_FASTSLEEP, "[type]")
	reset_timer()

/datum/charflaw/narcoleptic/proc/reset_timer()
	do_sleep = FALSE
	last_unconsciousness = world.time
	concious_timer = rand(8 MINUTES, 16 MINUTES)
	pain_pity_charges = rand(2,4)

/datum/charflaw/narcoleptic/flaw_on_life(mob/living/carbon/human/user)
	if(HAS_TRAIT(user, TRAIT_NOSLEEP))
		return
	if(user.stat != CONSCIOUS)
		reset_timer()
		return
	if(do_sleep)
		if(next_sleep <= world.time)
			var/pain = user.get_complex_pain()
			if(pain >= 40 && pain_pity_charges > 0)
				pain_pity_charges--
				concious_timer = rand(1 MINUTES, 2 MINUTES)
				to_chat(user, span_warning("Боль не дает мне уснуть..."))
			else
				if(drugged_up)
					drugged_up = FALSE
					concious_timer = rand(8 MINUTES, 16 MINUTES)
					to_chat(user, span_notice("Я чувствую себя [user.gender == FEMALE ? "взбодрившейся" : "взбодрившимся"]!"))
				else if(prob(40))
					concious_timer = rand(4 MINUTES, 6 MINUTES)
					to_chat(user, span_info("Чувство бодрости прошло..."))
				else
					concious_timer = rand(8 MINUTES, 16 MINUTES)
					to_chat(user, span_boldwarning("Я больше не могу держать глаза открытыми..."))
					user.Sleeping(rand(30 SECONDS, 50 SECONDS))
					user.visible_message(span_warning("[user] внезапно обмякает!"))
			do_sleep = FALSE
			last_unconsciousness = world.time
	else
		// Been conscious for ~10 minutes (whatever is the conscious timer)
		if(last_unconsciousness + concious_timer < world.time)
			drugged_up = FALSE
			to_chat(user, span_blue("Я начинаю засыпать..."))
			user.emote("yawn", forced = TRUE)
			next_sleep = world.time + rand(8 SECONDS, 12 SECONDS)
			do_sleep = TRUE

/proc/narcolepsy_drug_up(mob/living/living)
	var/datum/charflaw/narcoleptic/narco = living.get_flaw(/datum/charflaw/narcoleptic)
	if(!narco)
		return
	narco.drugged_up = TRUE

#define MASO_THRESHOLD_ONE 1
#define MASO_THRESHOLD_TWO 2
#define MASO_THRESHOLD_THREE 3
#define MASO_THRESHOLD_FOUR 4

/datum/charflaw/masochist
	name = "Мазохизм"
	desc = "Я так люблю чувство боли, что не могу насытиться им."
	var/next_paincrave = 0
	var/last_pain_threshold = NONE

/datum/charflaw/masochist/on_mob_creation(mob/living/carbon/human/user)
	next_paincrave = world.time + rand(15 MINUTES, 25 MINUTES)

/datum/charflaw/masochist/flaw_on_life(mob/living/carbon/human/user)
	if(next_paincrave > world.time)
		last_pain_threshold = NONE
		return
	user.add_stress(/datum/stressevent/vice)
	user.apply_status_effect(/datum/status_effect/debuff/addiction)
	var/current_pain = user.get_complex_pain()
	// Bloodloss makes the pain count as extra large to allow people to bloodlet themselves with cutting weapons to satisfy vice
	var/bloodloss_factor = clamp(1.0 - (user.blood_volume / BLOOD_VOLUME_NORMAL), 0.0, 0.5)
	var/new_pain_threshold = get_pain_threshold(current_pain * (1.0 + (bloodloss_factor * 1.4))) // Bloodloss factor goes up to 50%, and then counts at 140% value of that
	if(last_pain_threshold == NONE)
		to_chat(user, span_boldwarning("Мне действительно не помешало бы немного боли прямо сейчас..."))
	else if (new_pain_threshold != last_pain_threshold)
		var/ascending = (new_pain_threshold > last_pain_threshold)
		switch(new_pain_threshold)
			if(MASO_THRESHOLD_ONE)
				to_chat(user, span_warning("Боль стихла..."))
			if(MASO_THRESHOLD_TWO)
				if(ascending)
					to_chat(user, span_blue("Да, еще боли!"))
				else
					to_chat(user, span_warning("Нет, моя боль!"))
			if(MASO_THRESHOLD_THREE)
				to_chat(user, span_blue("Больше, обожаю это!"))

	last_pain_threshold = new_pain_threshold
	if(new_pain_threshold == MASO_THRESHOLD_FOUR)
		to_chat(user, span_blue("<b>Вот это уже другое дело...</b>"))
		next_paincrave = world.time + rand(35 MINUTES, 45 MINUTES)
		user.remove_stress(/datum/stressevent/vice)
		user.remove_status_effect(/datum/status_effect/debuff/addiction)


/datum/charflaw/masochist/proc/get_pain_threshold(pain_amt)
	switch(pain_amt)
		if(-INFINITY to 50)
			return MASO_THRESHOLD_ONE
		if(50 to 95)
			return MASO_THRESHOLD_TWO
		if(95 to 140)
			return MASO_THRESHOLD_THREE
		if(140 to INFINITY)
			return MASO_THRESHOLD_FOUR

/proc/get_mammons_in_atom(atom/movable/movable)
	var/static/list/coins_types = typecacheof(/obj/item/roguecoin)
	var/mammons = 0
	if(coins_types[movable.type])
		var/obj/item/roguecoin/coin = movable
		mammons += coin.quantity * coin.sellprice
	for(var/atom/movable/content in movable.contents)
		mammons += get_mammons_in_atom(content)
	return mammons

/datum/charflaw/isolationist
	name = "Изоляционизм"
	desc = "Я не люблю находиться рядом с людьми. Возможно, они хотят что-то сделать со мной..."
	var/last_check = 0

/datum/charflaw/isolationist/flaw_on_life(mob/user)
	. = ..()
	if(world.time < last_check + 10 SECONDS)
		return
	if(!user)
		return
	last_check = world.time
	var/cnt = 0
	for(var/mob/living/carbon/human/L in hearers(7, user))
		if(L == src)
			continue
		if(L.stat)
			continue
		if(L.dna.species)
			cnt++
		if(cnt > 2)
			break
	var/mob/living/carbon/P = user
	if(cnt > 2)
		P.add_stress(/datum/stressevent/crowd)

/datum/charflaw/clingy
	name = "Прилипчивость"
	desc = "Мне нравится быть среди людей, с ними так оживленно..."
	var/last_check = 0

/datum/charflaw/clingy/flaw_on_life(mob/user)
	. = ..()
	if(world.time < last_check + 10 SECONDS)
		return
	if(!user)
		return
	last_check = world.time
	var/cnt = 0
	for(var/mob/living/carbon/human/L in hearers(7, user))
		if(L == src)
			continue
		if(L.stat)
			continue
		if(L.dna.species)
			cnt++
		if(cnt > 2)
			break
	var/mob/living/carbon/P = user
	if(cnt < 2)
		P.add_stress(/datum/stressevent/nopeople)

/datum/charflaw/colorblind
	name = "Дальтонизм"
	desc = "Я с рождения был проклят плохим зрением и не мог различать то, что видят другие."

/datum/charflaw/colorblind/on_mob_creation(mob/user)
	..()
	user.add_client_colour(/datum/client_colour/monochrome)
