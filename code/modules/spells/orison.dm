/obj/effect/proc_holder/spell/targeted/touch/orison
	name = "Молитва"
	overlay_state = "thaumaturgy"
	desc = "Основная заповедь священного чудотворства основана на силе молитвы и обращении к Божественному Покровителю за крошечной частичкой Их могущества."
	clothes_req = FALSE
	drawmessage = "Я успокаиваю свой разум и готовлюсь произнести молитву."
	dropmessage = "Я возвращаю свои мысли в настоящее."
	school = "transmutation"
	chargedrain = 0
	chargetime = 0
	releasedrain = 5
	miracle = TRUE
	devotion_cost = 5
	chargedloop = /datum/looping_sound/invokegen
	associated_skill = /datum/skill/magic/holy
	hand_path = /obj/item/melee/touch_attack/orison

/obj/item/melee/touch_attack/orison
	name = "Малая молитва"
	desc = "Вы вспоминаете основы учения богословию:\n \
		<b>Fill</b>: Попросите своего Покровителя создать небольшое количество воды в контейнере, к которому вы прикоснетесь, за некоторую преданность.\n \
		<b>Touch</b>: Направьте частицу божественной магии в свое существо, и ваш голос станет ГРОМКИМ, когда вы в следующий раз заговорите. Известно, что это часто пугает крыс внутри линий SCOM. Может использоваться на источниках света на расстоянии, что приведет к их мерцанию.\n \
		<b>Use</b>: Произнесите молитву об освещении, заставив вас или другое живое существо начать светиться ярким светом в течение пяти минут — длительность эффекта суммируется каждый раз, когда вы ее произносите, без верхнего предела. Использование чудотворства на человеке лишит его этого благословения, а нажатие ПКМ на вашей молящейся руке удалит любые благословения света с вас самих."
	catchphrase = null
	possible_item_intents = list(/datum/intent/fill, INTENT_HELP, /datum/intent/use)
	icon = 'icons/mob/roguehudgrabs.dmi'
	icon_state = "pulling"
	icon_state = "grabbing_greyscale"
	color = "#FFFFFF"
	var/xp_interval = 150
	var/xp_cooldown = 0
	var/right_click = FALSE
	var/thaumaturgy_devotion = 10
	var/light_devotion = 5
	var/water_moisten = 2

/obj/item/melee/touch_attack/orison/attack_self()
	qdel(src)

/obj/item/melee/touch_attack/orison/MiddleClick(mob/living/user, params)
	. = ..()
	if (user.has_status_effect(/datum/status_effect/light_buff))
		user.remove_status_effect(/datum/status_effect/light_buff)
		user.visible_message(span_notice("[user] закрывает свои глаза, и окружающий [user.rus_them()] святой свет отступает в [user.rus_them()] грудь и исчезает."), span_notice("Я отказываюсь от дара света, и [user.patron.name] забирает его обратно."))
		return

/obj/item/melee/touch_attack/orison/afterattack(atom/target, mob/living/carbon/human/user, proximity)
	var/fatigue_used
	switch (user.used_intent.type)
		if (/datum/intent/fill)
			fatigue_used = create_water(target, user)
			if (fatigue_used)
				qdel(src)
		if (INTENT_HELP)
			fatigue_used = thaumaturgy(target, user)
			if (fatigue_used)
				user.devotion?.update_devotion(-fatigue_used)
				qdel(src)
		if (/datum/intent/use)
			fatigue_used = cast_light(target, user)
			if (fatigue_used)
				user.devotion?.update_devotion(-fatigue_used)
				qdel(src)

#define BLESSINGOFLIGHT_FILTER "bol_glow"

/atom/movable/screen/alert/status_effect/light_buff
	name = "Чудесный Свет"
	desc = "Благословение света отгоняет тьму, окружающую меня."
	icon_state = "stressvg"

/datum/status_effect/light_buff
	id = "orison_light_buff"
	alert_type = /atom/movable/screen/alert/status_effect/light_buff
	duration = 5 MINUTES
	status_type = STATUS_EFFECT_REFRESH
	examine_text = "SUBJECTPRONOUN окруженENDING аурой мягкого света."
	var/outline_colour = "#ffffff"
	var/list/mobs_affected
	var/obj/effect/dummy/lighting_obj/moblight/mob_light_obj

/datum/status_effect/light_buff/refresh()
	duration += initial(duration) // stack this up as much as we can be bothered to cast it

/datum/status_effect/light_buff/on_apply()
	. = ..()
	if (!.)
		return
	playsound(owner, 'sound/magic/whiteflame.ogg', 75, FALSE)
	to_chat(owner, span_notice("Чудесный свет исходит вокруг меня!"))
	var/filter = owner.get_filter(BLESSINGOFLIGHT_FILTER)
	if (!filter)
		owner.add_filter(BLESSINGOFLIGHT_FILTER, 2, list("type" = "outline", "color" = outline_colour, "alpha" = 60, "size" = 1))
	mob_light_obj = owner.mob_light(7, 7, _color ="#f5edda")
	return TRUE

/datum/status_effect/light_buff/on_remove()
	playsound(owner, 'sound/items/firesnuff.ogg', 75, FALSE)
	to_chat(owner, span_notice("Чудесный свет, окружающий меня, исчез..."))
	owner.remove_filter(BLESSINGOFLIGHT_FILTER)
	QDEL_NULL(mob_light_obj)

/obj/item/melee/touch_attack/orison/proc/cast_light(atom/thing, mob/living/carbon/human/user)
	var/holy_skill = user.mind?.get_skill_level(attached_spell.associated_skill)
	var/cast_time = 35 - (holy_skill * 3)
	if (!thing.Adjacent(user))
		to_chat(user, span_info("Мне нужно быть рядом с [thing], чтобы направить направить благословение света на [thing.rus_forthem()]!"))
		return

	if (isliving(thing))

		if (thing != user)
			user.visible_message(span_notice("[user] медленно тянется к [thing], искры света мерцают на [user.rus_them()] кончиках пальцев..."), span_notice("Благословенн[user.patron.rus_aya()] [user.patron.name], Я прошу лишь света, который укажет путь..."))
		else
			user.visible_message(span_notice("[user] закрывает свои глаза и кладет светящуюся руку на  [user.p_their()] chest..."), span_notice("Благословенн[user.patron.rus_aya()] [user.patron.name], Я прошу лишь света, который укажет путь..."))
		
		if (do_after(user, cast_time, target = thing))
			var/mob/living/living_thing = thing
			var/light_power = clamp(4 + (holy_skill - 3), 4, 7)
			set_light_on()

			if (living_thing.has_status_effect(/datum/status_effect/light_buff))
				user.visible_message(span_notice("Священный свет, исходящий из [living_thing], становится ярче!"), span_notice("Я питаю благословение света в теле [living_thing] большей преданностью."))
			else
				user.visible_message(span_notice("Слабое освещение внезапно расцветает вокруг сущности [living_thing]!"), span_notice("Я даю [living_thing] благословение света."))

			living_thing.apply_status_effect(/datum/status_effect/light_buff, light_power)

			return light_devotion
	else
		to_chat(user, span_notice("Только живые верующие могут нести благословение света, что дает [user.patron.name]."))
		return

#undef BLESSINGOFLIGHT_FILTER
/atom/movable/screen/alert/status_effect/thaumaturgy
	name = "Громозвучный голос"
	desc = "Сила моего бога заставит то, что я скажу, распространиться гораздо дальше!"
	icon_state = "stressvg"

/datum/status_effect/thaumaturgy
	id = "thaumaturgy"
	alert_type = /atom/movable/screen/alert/status_effect/thaumaturgy
	duration = 30 SECONDS
	var/potency = 1

/datum/status_effect/thaumaturgy/on_creation(mob/living/new_owner, skill_power)
	potency = skill_power
	return ..()

/obj/item/melee/touch_attack/orison/proc/thaumaturgy(thing, mob/living/carbon/human/user)
	var/holy_skill = user.mind?.get_skill_level(attached_spell.associated_skill)
	if (thing == user)
		// give us a buff that makes our next spoken thing really loud and also cause any linked, un-muted scom to shriek out the phrase at a 15% chance
		var/cast_time = 50 - (holy_skill * 5)
		user.visible_message(span_notice("[user] торжественно опускает свою голову, c [user.rus_them()] губ шепотом срываются слова молитвы..."), span_notice("О пресвят[user.patron.rus_oy()] [user.patron.name], поделись со мной частичкой своей силы..."))
		
		if (!user.has_status_effect(/datum/status_effect/thaumaturgy))
			if (do_after(user, cast_time, target = user))
				user.apply_status_effect(/datum/status_effect/thaumaturgy, holy_skill)
				user.visible_message(span_notice("[user] раскрывает свои глаза, внезапно взбодрившись!"), span_notice("Чувство силы подступает к горлу: скажи, и многие услышат!"))
				return thaumaturgy_devotion
		else
			to_chat(user, span_notice("Я уже наделен[user.rus_a()] божественной силой!"))
			return
	else
		// make a light source flicker, and others around it within a radius	
		if (istype(thing, /obj/machinery/light) || istype(thing, /obj/item/flashlight))
			for (var/obj/maybe_light in view(3 + holy_skill, thing))
				if (istype(maybe_light, /obj/machinery/light))
					var/obj/machinery/light/other_light = maybe_light
					other_light.flicker(holy_skill * 5)
					user.devotion?.update_devotion(-1)
				else if (istype(maybe_light, /obj/item/flashlight/flare))
					var/obj/item/flashlight/flare/mobile_light = maybe_light
					if (mobile_light.on)
						mobile_light.turn_off()
						user.devotion?.update_devotion(-1)

			to_chat(user, span_notice("Я направляю тяжесть своей веры на ближайший огонь, заставляя его мерцать!"))
			
			return thaumaturgy_devotion
		else if (isturf(thing))

			var/did_flicker = FALSE
			for (var/obj/machinery/light/other_lights in view(3 + holy_skill, thing))
				other_lights.flicker(holy_skill * 5)
				user.devotion?.update_devotion(-1)
				did_flicker = TRUE

			if (did_flicker)
				to_chat(user, span_notice("Я направляю тяжесть своей веры на ближайший огонь, заставляя его мерцать!"))

				return thaumaturgy_devotion
			else
				to_chat(user, span_notice("Моя вера не находит пламени, которое бы отреагировало на её течение..."))
				qdel(src)
		else if (isliving(thing))

			var/mob/living/living_thing = thing
			if (living_thing.has_status_effect(/datum/status_effect/light_buff))
				living_thing.remove_status_effect(/datum/status_effect/light_buff)
				user.visible_message(span_notice("[user] делает сдержанный жест в сторону [living_thing], и священный свет покидает [living_thing.rus_them()]."), span_notice("Я указываю на [living_thing], и [living_thing.rus_them()] благословение света отступает."))
				return
			else
				to_chat(user, span_notice("Моя божественная магия может только усилить мой собственный голос или лишить других благословения света."))
				return
		else
			to_chat(user, span_warning("Я могу направить молитву только на себя, в землю и на ближайшие источники света."))
			return

/datum/reagent/water/blessed
	name = "святая вода"
	description = "Дар Преданности. Очень слабо заживляет раны."

/datum/reagent/water/blessed/on_mob_life(mob/living/carbon/M)
	. = ..()
	if (M.mob_biotypes & MOB_UNDEAD)
		M.adjustFireLoss(0.5*REM)
	else
		M.adjustBruteLoss(-0.1*REM)
		M.adjustFireLoss(-0.1*REM)
		M.adjustOxyLoss(-0.1, 0)
		var/list/our_wounds = M.get_wounds()
		if (LAZYLEN(our_wounds))
			var/upd = M.heal_wounds(1)
			if (upd)
				M.update_damage_overlays()

/datum/reagent/water/blessed/reaction_mob(mob/living/M, method=TOUCH, reac_volume)
	if (!istype(M))
		return ..()
	
	if (method == TOUCH)
		if (M.mob_biotypes & MOB_UNDEAD)
			M.adjustFireLoss(2*reac_volume, 0)
			M.visible_message(span_warning("[M] извергает сердитое шипение и хрип!"), span_warning("СВЯТАЯ ВОДА!!! ЖЖЕТСЯ!!!"))
			M.emote("scream")
	
	return ..()

/datum/reagent/water/cursed
	name = "проклятая вода"
	description = "Дар Преданности. Очень слабо залечивает раны мёртвых и просвещённых."

/datum/reagent/water/cursed/on_mob_life(mob/living/carbon/M)
	. = ..()
	var/mob/living/carbon/human/M_hum
	if(istype(M,/mob/living/carbon/human/))
		M_hum = M
	if((M.mob_biotypes & MOB_UNDEAD) || (M_hum.patron.undead_hater == FALSE))
		M.adjustBruteLoss(-0.1*REM)
		M.adjustFireLoss(-0.1*REM)
		M.adjustOxyLoss(-0.1, 0)
		var/list/our_wounds = M.get_wounds()
		if (LAZYLEN(our_wounds))
			var/upd = M.heal_wounds(1)
			if (upd)
				M.update_damage_overlays()
	else
		M.adjustBruteLoss(-0.1*REM)
		M.adjustFireLoss(-0.1*REM)
		M.adjustOxyLoss(-0.1, 0)
		var/list/our_wounds = M.get_wounds()
		if (LAZYLEN(our_wounds))
			var/upd = M.heal_wounds(1)
			if (upd)
				M.update_damage_overlays()

/obj/item/melee/touch_attack/orison/proc/create_water(atom/thing, mob/living/carbon/human/user)
	// normally we wouldn't use fatigue here to keep in line w/ other holy magic, but we have to since water is a persistent resource
	if (!thing.Adjacent(user))
		to_chat(user, span_info("Мне нужно быть проближе к [thing] чтобы попытаться наполнить [thing.rus_them()] водой."))
		return

	if (thing.is_refillable())
		if (thing.reagents.holder_full())
			to_chat(user, span_warning("В [thing] больше не влезет."))
			return
		
		user.visible_message(span_info("[user] прикрыл[user.rus_a()] свои глаза в молитве, выставив руку над [thing], когда с [user.rus_them()] кончиков пальцев начала сочиться вода..."), span_notice("Я обращаюсь к [user.patron.name] с просьбой о помощи и протягиваю свою руку над [thing]..."))

		var/holy_skill = user.mind?.get_skill_level(attached_spell.associated_skill)
		var/drip_speed = 56 - (holy_skill * 8)
		var/fatigue_spent = 0
		var/fatigue_used = max(3, holy_skill)
		while (do_after(user, drip_speed, target = thing))
			if (thing.reagents.holder_full() || (user.devotion.devotion - fatigue_used <= 0))
				break

			var/water_qty = max(1, holy_skill) + 1
			var/list/water_contents = list(/datum/reagent/water/cursed = water_qty)
			if(user.patron.undead_hater == TRUE)
				water_contents = list(/datum/reagent/water/blessed = water_qty)

			var/datum/reagents/reagents_to_add = new()
			reagents_to_add.add_reagent_list(water_contents)
			reagents_to_add.trans_to(thing, reagents_to_add.total_volume, transfered_by = user, method = INGEST)

			fatigue_spent += fatigue_used
			user.devotion?.update_devotion(-1.0)

			if (prob(80))
				playsound(user, 'sound/items/fillcup.ogg', 55, TRUE)
		
		return min(50, fatigue_spent)
	else if (istype(thing, /obj/item/natural/cloth))
		// stupid little easter egg here: you can dampen a cloth to clean with it, because prestidigitation also lets you clean things. also a lot cheaper devotion-wise than filling a bucket
		var/obj/item/natural/cloth/the_cloth = thing
		if (!the_cloth.wet)
			var/holy_skill = user.mind?.get_skill_level(attached_spell.associated_skill)
			the_cloth.wet += holy_skill * 5
			user.visible_message(span_info("[user] прикрыл[user.rus_a()] свои глаза в молитве, капельки влаги слипаются в [user.rus_them()] руках и увлажняют [the_cloth]."), span_notice("Я обращаюсь с просьбой к [user.patron.name], и [user.patron.rus_them()] дар увлажняет [the_cloth] в моих руках. Теперь я смогу прибраться, как следует."))
			return water_moisten
	else
		to_chat(user, span_info("Мне нужно найти емкость, в которой можно хранить воду."))
