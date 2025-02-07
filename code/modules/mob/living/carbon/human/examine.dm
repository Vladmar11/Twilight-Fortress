/mob/living/carbon/human/proc/on_examine_face(mob/living/carbon/human/user)
	if(!istype(user))
		return
	if(user.mind)
		user.mind.i_know_person(src)
	var/datum/species/self_species = dna.species
	var/datum/species/examiner_species = user.dna.species
	if(self_species.stress_examine && self_species.type != examiner_species.type)
		var/event_type = /datum/stressevent/shunned_race
		if(HAS_TRAIT(user, TRAIT_XENOPHOBIC))
			event_type = /datum/stressevent/shunned_race_xenophobic
		var/datum/stressevent/event = user.add_stress(event_type)
		event.desc = self_species.stress_desc
	if(user.has_flaw(/datum/charflaw/paranoid))	//We hate different species, that are stronger than us, and aren't racist themselves
		if(dna.species.name != user.dna.species.name && (STASTR - user.STASTR) > 1 && !has_flaw(/datum/charflaw/paranoid))
			user.add_stress(/datum/stressevent/parastr)
	if(HAS_TRAIT(user, TRAIT_JESTERPHOBIA) && job == "Jester")
		user.add_stress(/datum/stressevent/jesterphobia)
	if(HAS_TRAIT(src, TRAIT_BEAUTIFUL))
		user.add_stress(/datum/stressevent/beautiful)

/mob/living/carbon/human/examine(mob/user)
	var/observer_privilege = isobserver(user)
	var/aghost_privilege = isadminobserver(user)
	var/t_He = rus_they(TRUE)
	var/t_His = rus_them(TRUE)
	var/t_his = rus_them()
	var/t_him = rus_onthem()
	//var/t_has = p_have()
	//var/t_is = p_are()
	var/obscure_name = FALSE
	var/race_name = (gender == FEMALE && dna.species.name_f) ? dna.species.name_f : dna.species.name
	var/datum/antagonist/maniac/maniac = user.mind?.has_antag_datum(/datum/antagonist/maniac)
	if(maniac && (user != src))
		race_name = "отвратительная свинья"

	var/m1 = "[t_He]" // Он/она
	// var/m2 = "[t_his]"	// Его/её
	var/m3 = "На [t_him]" //На нем/на ней
	if(user == src)
		m1 = "Я"
		// m2 = "my"
		m3 = "На мне"

	var/static/list/unknown_names = list(
		"Unknown",
		"Unknown Man",
		"Unknown Woman",
	)
	if(get_visible_name() in unknown_names)
		obscure_name = TRUE

	if(observer_privilege)
		obscure_name = FALSE

	if(obscure_name)
		. = list("<span class='info'>ø ------------ ø\nЭто <EM>Unknown</EM>.")
	else
		on_examine_face(user)
		var/used_name = name
		var/used_title = get_role_title()
		var/display_as_wanderer = FALSE
		var/display_as_foreign = FALSE
		var/am_foreign = FALSE
		var/are_mercenary = FALSE
		var/am_mercenary = FALSE
		var/is_returning = FALSE
		if(observer_privilege)
			used_name = real_name
		if(migrant_type)
			var/datum/migrant_role/migrant = MIGRANT_ROLE(migrant_type)
			if(migrant.show_wanderer_examine)
				display_as_wanderer = TRUE
			if(migrant.show_foreign_examine)
				display_as_foreign = TRUE
		else if(job)
			var/datum/job/J = SSjob.GetJob(job)
			if(J.wanderer_examine)
				display_as_wanderer = TRUE
			if(J.foreign_examine)
				display_as_foreign = TRUE
			if(J.mercenary_examine)
				are_mercenary = TRUE
			if(islatejoin && !are_mercenary)
				is_returning = TRUE
		if(user.migrant_type)
			var/datum/migrant_role/am_migrant = MIGRANT_ROLE(user.migrant_type)
			if(am_migrant.show_foreign_examine)
				am_foreign = TRUE
		else if(user.job)
			var/datum/job/OJ = SSjob.GetJob(user.job)
			if(OJ.foreign_examine)
				am_foreign = TRUE
			if(OJ.mercenary_examine)
				am_mercenary = TRUE

		if(display_as_wanderer)
			. = list("<span class='info'>ø ------------ ø\nЭто <EM>[used_name]</EM>, странствующ[rus_aya2()] [race_name].")
		else if(used_title)
			. = list("<span class='info'>ø ------------ ø\nЭто <EM>[used_name]</EM>, [is_returning ? "вернувш[rus_aya2()]ся " : ""][race_name], [used_title].")
		else
			. = list("<span class='info'>ø ------------ ø\nЭто <EM>[used_name]</EM>, [race_name].")

		if(GLOB.lord_titles[name])
			. += span_notice("[m1] облада[user == src ? "ю" : "ет"] титулом: \"[GLOB.lord_titles[name]]\".")
		
		if(HAS_TRAIT(src, TRAIT_NOBLE))
			if(HAS_TRAIT(user, TRAIT_NOBLE))
				. += span_notice("[user.rus_they(TRUE)] тоже дворянских кровей, как и я.")
			else
				. += span_notice("[user.gender == FEMALE ? "Дворянка!" : "Дворянин!"]")
		

		if(dna.species.use_skintones)
			var/skin_tone_wording = dna.species.skin_tone_wording ? lowertext(dna.species.skin_tone_wording) : "skin tone"
			var/list/skin_tones = dna.species.get_skin_list()
			var/skin_tone_seen = "incomprehensible"
			if(skin_tone)
				//AGGHHHHH this is stupid
				for(var/tone in skin_tones)
					if(src.skin_tone == skin_tones[tone])
						skin_tone_seen = lowertext(tone)
						break
			var/slop_lore_string = "."
			if(ishumannorthern(user))
				var/mob/living/carbon/human/racist = user
				var/list/user_skin_tones = racist.dna.species.get_skin_list()
				var/user_skin_tone_seen = "incomprehensible"
				for(var/tone in user_skin_tones)
					if(racist.skin_tone == user_skin_tones[tone])
						user_skin_tone_seen = lowertext(tone)
						break
				if((user_skin_tone_seen == "lalvestine" && skin_tone_seen == "shalvistine") || \
					(user_skin_tone_seen == "shalvistine" && skin_tone_seen == "lalvestine"))
					slop_lore_string = ", <span class='danger'>ПРЕДАТЕЛЬ!</span>"
			. += span_info("[capitalize(skin_tone_wording)] - [skin_tone_seen][slop_lore_string]")

		if(ishuman(user))
			var/mob/living/carbon/human/H = user
			if(H.isFamily(src))
				var/datum/relation/R = H.getRelationship(src)
				if(R)
					. += "Это мо[R.rus_my()] [R.name]!"
			else if(family)
				var/datum/family/F = getFamily()
				if(F)
					. += "[m1], должно быть, из семьи [F.name]!"

		if(display_as_foreign && user != src)
			if(are_mercenary && am_mercenary)
				. += span_notice("Наёмник")
			else if(!am_foreign)
				. += span_phobia("Чужестранец...")

		if(name in GLOB.excommunicated_players)
			. += span_userdanger("ОТЛУЧЕН[user.rus_a(TRUE)] ОТ ЦЕРКВИ!")

		if(name in GLOB.heretical_players)
			. += span_userdanger("КЛЕЙМО ЕРЕТИКА! ПОЗОР!")
		if(iszizocultist(user) || iszizolackey(user))
			if(virginity)
				. += "<span class='userdanger'>ДЕВА!</span>"

		if(real_name in GLOB.outlawed_players)
			. += "<span class='userdanger'>ПРЕСТУПНИК!</span>"
		var/inquisition_text =get_inquisition_text(user)
		if(inquisition_text)
			. +=span_notice(inquisition_text)
		if(mind && mind.special_role)
		else
			if(mind && mind.special_role == "Vampire Lord")
				. += "<span class='userdanger'>ЧУДОВИЩЕ!</span>"

		if(user != src)
			if(has_flaw(/datum/charflaw/addiction/lovefiend) && user.has_flaw(/datum/charflaw/addiction/lovefiend))
				. += span_aiprivradio("[m1] тоскует по любви так же, как и я.")

			if(has_flaw(/datum/charflaw/addiction/junkie) && user.has_flaw(/datum/charflaw/addiction/junkie))
				. += span_deadsay("[m1] с такими же следами пыли у ноздрей, как и у меня.")

			if(has_flaw(/datum/charflaw/addiction/smoker) && user.has_flaw(/datum/charflaw/addiction/smoker))
				. += span_suppradio("[m1] окутан[rus_a()] знакомым, слабым запахом дыма. Он мне хорошо знаком.")

			if(has_flaw(/datum/charflaw/addiction/alcoholic) && user.has_flaw(/datum/charflaw/addiction/alcoholic))
				. += span_syndradio("[m1] изо всех сил пытается скрыть похмелье и запах спиртного. Мы так похожи.")

			if(has_flaw(/datum/charflaw/paranoid) && user.has_flaw(/datum/charflaw/paranoid))
				if(ishuman(user))
					var/mob/living/carbon/human/H = user
					if(dna.species.name == H.dna.species.name)
						. += span_nicegreen("[m1], похоже, знает об опасности всех этих незнакомцев вокруг нас. Точно, как и я.")
					else
						. += span_nicegreen("[m1] из хороших. [m1] ненавидит другие лица так же, как и я.")
			if(has_flaw(/datum/charflaw/masochist) && user.has_flaw(/datum/charflaw/addiction/sadist))
				. += span_secradio("[m1] отмечен[rus_a()] шрамами, нанесенными ради удовольствия. Восхитительная цель для моих побуждений!")
			if(has_flaw(/datum/charflaw/addiction/sadist) && user.has_flaw(/datum/charflaw/masochist))
				. += span_secradio("[m1] смотрит глазами, полными желания причинить боль. Так захватывающе!")

		var/commie_text
		if(mind)
			if(mind.special_role == "Bandit")
				if(HAS_TRAIT(user, TRAIT_COMMIE))
					commie_text = span_notice("[src.gender == FEMALE ? "Вольная подруга" : "Вольный соратник"]...")

			if(mind.special_role == "Vampire Lord")
				. += span_userdanger("ЧУДОВИЩЕ!")

			if(mind.assigned_role == "Lunatic")
				. += span_userdanger("БЕЗУМЕЦ!")

			if(HAS_TRAIT(src, TRAIT_PUNISHMENT_CURSE))
				. += span_userdanger("ПРОКЛЯТАЯ ДУША!")

		if(HAS_TRAIT(src, TRAIT_MANIAC_AWOKEN))
			. += span_userdanger("МАНЬЯК!")

		if(commie_text)
			. += commie_text
		else if(HAS_TRAIT(src, TRAIT_COMMIE) && HAS_TRAIT(user, TRAIT_COMMIE))
			. += span_notice("Товарищ!")

	if(HAS_TRAIT(src, TRAIT_LEPROSY))
		. += span_necrosis("[src.gender == FEMALE ? "ПРОКАЖЕННАЯ" : "ПРОКАЖЕННЫЙ"]...")

	if (HAS_TRAIT(src, TRAIT_BEAUTIFUL))
		switch (gender)
			if (MALE)
				. += span_beautiful_masc("Он невероятно красивый!")
			if (FEMALE)
				. += span_beautiful_fem("Она невероятно красивая!")

	if(user != src)
		var/datum/mind/Umind = user.mind
		if(Umind && mind)
			for(var/datum/antagonist/aD in mind.antag_datums)
				for(var/datum/antagonist/bD in Umind.antag_datums)
					var/shit = bD.examine_friendorfoe(aD,user,src)
					if(shit)
						. += shit
			if(user.mind.has_antag_datum(/datum/antagonist/vampirelord) || user.mind.has_antag_datum(/datum/antagonist/vampire))
				. += span_userdanger("Объем крови: [blood_volume]")

	var/list/obscured = check_obscured_slots()
	var/skipface = (wear_mask && (wear_mask.flags_inv & HIDEFACE)) || (head && (head.flags_inv & HIDEFACE))

	if(wear_shirt && !(SLOT_SHIRT in obscured))
		. += "[m1] [user == src ? "ношу" : "носит"] [wear_shirt.get_examine_string(user)] на теле."

	//uniform
	if(wear_pants && !(SLOT_PANTS in obscured))
		//accessory
		var/accessory_msg
		if(istype(wear_pants, /obj/item/clothing/under))
			var/obj/item/clothing/under/U = wear_pants
			if(U.attached_accessory)
				accessory_msg += " с закрепленным [icon2html(U.attached_accessory, user)] [U.attached_accessory]"

		. += "[m1] [user == src ? "ношу" : "носит"] [wear_pants.get_examine_string(user)][accessory_msg] на ногах."

	//head
	if(head && !(SLOT_HEAD in obscured))
		. += "[m1] [user == src ? "ношу" : "носит"] [head.get_examine_string(user)] на голове."
	//suit/armor
	if(wear_armor && !(SLOT_ARMOR in obscured))
		. += "[m1] [user == src ? "ношу" : "носит"] [wear_armor.get_examine_string(user)] на теле."
		//suit/armor storage
		if(s_store && !(SLOT_S_STORE in obscured))
			. += "[m1] [user == src ? "ношу" : "носит"] [s_store.get_examine_string(user)] поверх [wear_armor.name]."
	//back
//	if(back)
//		. += "[m3] [back.get_examine_string(user)] on [m2] back."

	//cloak
	if(cloak && !(SLOT_CLOAK in obscured))
		. += "[m1] [user == src ? "ношу" : "носит"] [cloak.get_examine_string(user)] поверх себя."

	//right back
	if(backr && !(SLOT_BACK_R in obscured))
		. += "На [user == src ? "моем" : t_his] правом плече висит [backr.get_examine_string(user)]."

	//left back
	if(backl && !(SLOT_BACK_L in obscured))
		. += "На [user == src ? "моем" : t_his] левом плече висит [backl.get_examine_string(user)]."

	//Hands
	for(var/obj/item/I in held_items)
		if(!(I.item_flags & ABSTRACT))
			. += "[m1] [user == src ? "держу" : "держит"] [I.get_examine_string(user)] в [get_held_index_name(get_held_index_of_item(I))]."

	var/datum/component/forensics/FR = GetComponent(/datum/component/forensics)
	//gloves
	if(gloves && !(SLOT_GLOVES in obscured))
		. += "На [user == src ? "мои" : t_his] руки надеты [gloves.get_examine_string(user)]."
	else if(FR && length(FR.blood_DNA))
		var/hand_number = get_num_arms(FALSE)
		if(hand_number)
			. += "[hand_number > 1 ? "[user == src ? "Мои" : t_His] руки" : "[user == src ? "Моя" : t_His] рукa"] <span class='bloody'>в крови</span>!"	//"Его руки в крови!"

	//belt
	if(belt && !(SLOT_BELT in obscured))
		. += "[m1] [user == src ? "ношу" : "носит"] [belt.get_examine_string(user)], крепко обвязав вокруг талии."

	//right belt
	if(beltr && !(SLOT_BELT_R in obscured))
		. += "На [user == src ? "моем" : t_his] поясе справа висит [beltr.get_examine_string(user)]."

	//left belt
	if(beltl && !(SLOT_BELT_L in obscured))
		. += "На [user == src ? "моем" : t_his] поясе слева висит [beltl.get_examine_string(user)]."

	//shoes
	if(shoes && !(SLOT_SHOES in obscured))
		. += "[m1] обут[rus_a()] в [shoes.get_examine_string(user)]."

	//mask
	if(wear_mask && !(SLOT_WEAR_MASK in obscured))
		. += "[m3] надета [wear_mask.get_examine_string(user)], закрывающ[wear_mask.rus_aya2()] лицо."

	//mouth
	if(mouth && !(SLOT_MOUTH in obscured))
		. += "[m1] [user == src ? "держу" : "держит"] [mouth.get_examine_string(user)] во рту."

	//neck
	if(wear_neck && !(SLOT_NECK in obscured))
		. += "[m1] [user == src ? "ношу" : "носит"] [wear_neck.get_examine_string(user)] на шее."

	//eyes
	if(!(SLOT_GLASSES in obscured))
		if(glasses)
			. += "[m1] [user == src ? "ношу" : "носит"] [glasses.get_examine_string(user)] на своих глазах."
		else if(eye_color == BLOODCULT_EYE)
			. += "<span class='warning'><B>[user == src ? "Мои" : t_His] глаза светятся неестественным красным светом!</B></span>"

	//ears
	if(ears && !(SLOT_HEAD in obscured))
		. += "[m1] [user == src ? "ношу" : "носит"] [ears.get_examine_string(user)] на ушах."

	//ID
	if(wear_ring && !(SLOT_RING in obscured))
		. += "[m1] [user == src ? "ношу" : "носит"] [wear_ring.get_examine_string(user)] на пальце."

	//wrists
	if(wear_wrists && !(SLOT_WRISTS in obscured))
		. += "[m1] [user == src ? "ношу" : "носит"] [wear_wrists.get_examine_string(user)] на запястьях."

	//handcuffed?
	if(handcuffed)
		if(user == src)
			. += "<span class='warning'>Мои руки скованы при помощи [handcuffed]!</span>"
		else
			. += "<A href='?src=[REF(src)];item=[SLOT_HANDCUFFED]'><span class='warning'>[t_His] руки скованы при помощи [handcuffed]!</span></A>"

	if(legcuffed)
		. += "<A href='?src=[REF(src)];item=[SLOT_LEGCUFFED]'><span class='warning'>[user == src ? "Мои" : t_His] ноги скованы при помощи [legcuffed]!</span></A>"

	if(has_status_effect(/datum/status_effect/leash_pet))
		. += "<A href='?src=[REF(src)];'><span class='warning'>[m3] закреплены поводья, их конец привязан к ошейнику!</span></A>"

	//Gets encapsulated with a warning span
	var/list/msg = list()

	var/appears_dead = FALSE
	if(stat == DEAD || (HAS_TRAIT(src, TRAIT_FAKEDEATH)))
		appears_dead = TRUE

	var/temp = getBruteLoss() + getFireLoss() //no need to calculate each of these twice

	if(!(user == src && src.hal_screwyhud == SCREWYHUD_HEALTHY)) //fake healthy
		// Damage
		switch(temp)
			if(5 to 25)
				msg += "[m1] слегка ранен[rus_a()]."
			if(25 to 50)
				msg += "[m1] ранен[rus_a()]."
			if(50 to 100)
				msg += "<B>[m1] тяжело ранен[rus_a()].</B>"
			if(100 to INFINITY)
				msg += span_danger("[m1] смертельно ранен[rus_a()].")

	// Blood volume
	switch(blood_volume)
		if(-INFINITY to BLOOD_VOLUME_SURVIVE)
			msg += span_artery("<B>[m1] мертвецки бледн[rus_aya()] и болезненн[rus_aya()].</B>")
		if(BLOOD_VOLUME_SURVIVE to BLOOD_VOLUME_BAD)
			msg += span_artery("<B>[m1] слишком бледн[rus_aya()].</B>")
		if(BLOOD_VOLUME_BAD to BLOOD_VOLUME_OKAY)
			msg += span_artery("[m1] побледнел[rus_a()].")
		if(BLOOD_VOLUME_OKAY to BLOOD_VOLUME_SAFE)
			msg += span_artery("[m1] слегка бледн[rus_aya()].")

	// Bleeding
	var/bleed_rate = get_bleed_rate()
	if(bleed_rate)
		var/bleed_wording = "кровь не останавливается"
		switch(bleed_rate)
			if(0 to 1)
				bleed_wording = ", кровь медленно вытекает из ран"
			if(1 to 5)
				bleed_wording = ", кровь не останавливается"
			if(5 to 10)
				bleed_wording = ", кровь быстро течет непрерывными струями"
			if(10 to INFINITY)
				bleed_wording = ", кровь обильно хлещет из ран"
		var/list/bleeding_limbs = list()
		var/static/list/bleed_zones = list(
			BODY_ZONE_HEAD,
			BODY_ZONE_CHEST,
			BODY_ZONE_R_ARM,
			BODY_ZONE_L_ARM,
			BODY_ZONE_R_LEG,
			BODY_ZONE_L_LEG,
		)
		for(var/bleed_zone in bleed_zones)
			var/obj/item/bodypart/bleeder = get_bodypart(bleed_zone)
			if(!bleeder?.get_bleed_rate() || (!observer_privilege && !get_location_accessible(src, bleeder.body_zone)))
				continue
			bleeding_limbs += parse_zone(bleeder.body_zone)
		if(length(bleeding_limbs))
			if(bleed_rate >= 5)
				msg += span_bloody("<B>[bleeding_limbs.len > 1 ? \
				"[user == src ? "Мои" : t_His] [english_list(bleeding_limbs)] истекают кровью" : \
				"[user == src ? "Моя" : t_His] [english_list(bleeding_limbs)] истекает кровью"][bleed_wording]!</B>")
			else
				msg += span_bloody("[bleeding_limbs.len > 1 ? \
				"[user == src ? "Мои" : t_His] [english_list(bleeding_limbs)] истекают кровью" : \
				"[user == src ? "Моя" : t_His] [english_list(bleeding_limbs)] истекает кровью"][bleed_wording]!")
		else
			if(bleed_rate >= 5)
				msg += span_bloody("<B>[m1] [user == src ? "истекаю" : "истекает"] кровью[bleed_wording]</B>!")
			else
				msg += span_bloody("[m1] [user == src ? "истекаю" : "истекает"] кровью[bleed_wording]!")

	// Missing limbs
	var/missing_head = FALSE
	var/list/missing_limbs = list()
	for(var/missing_zone in get_missing_limbs())
		if(missing_zone == BODY_ZONE_HEAD)
			missing_head = TRUE
		missing_limbs += parse_zone(missing_zone)

	if(length(missing_limbs))
		var/missing_limb_message = "<B>[missing_limbs.len > 1 ? \
		"[user == src ? "Мои" : t_His] [english_list(missing_limbs)] оторваны" : "[user == src ? "Моя" : t_His] [english_list(missing_limbs)] оторвана"].</B>"
		if(missing_head)
			missing_limb_message = span_dead("[missing_limb_message]")
		else
			missing_limb_message = span_danger("[missing_limb_message]")
		msg += missing_limb_message

	//Grabbing
	if(pulledby && pulledby.grab_state)
		msg += "[m1] в крепкой хватке [pulledby]."

	//Nutrition
	if(nutrition < (NUTRITION_LEVEL_STARVING - 50))
		msg += "[m1] изголода[rus_sya()]."
//	else if(nutrition >= NUTRITION_LEVEL_FAT)
//		if(user.nutrition < NUTRITION_LEVEL_STARVING - 50)
//			msg += "[t_He] [t_is] plump and delicious looking - Like a fat little piggy. A tasty piggy."
//		else
//			msg += "[t_He] [t_is] quite chubby."

	//Fire/water stacks
	if(fire_stacks > 0)
		msg += "[m1] вымазан[rus_a()] в чем-то горючем."
	else if(fire_stacks < 0)
		msg += "[m1] промок[rus_la()]."

	//Status effects
	var/list/status_examines = status_effect_examines()
	if(length(status_examines))
		msg += status_examines

	//Disgusting behemoth of stun absorption
	if(islist(stun_absorption))
		for(var/i in stun_absorption)
			if(stun_absorption[i]["end_time"] > world.time && stun_absorption[i]["examine_message"])
				msg += "[m1][stun_absorption[i]["examine_message"]]"

	if(!appears_dead)
		if(!skipface)
			//Disgust
			switch(disgust)
				if(DISGUST_LEVEL_SLIGHTLYGROSS to DISGUST_LEVEL_GROSS)
					msg += "[m1] a little disgusted."
				if(DISGUST_LEVEL_GROSS to DISGUST_LEVEL_VERYGROSS)
					msg += "[m1] disgusted."
				if(DISGUST_LEVEL_VERYGROSS to DISGUST_LEVEL_DISGUSTED)
					msg += "[m1] really disgusted."
				if(DISGUST_LEVEL_DISGUSTED to INFINITY)
					msg += "<B>[m1] extremely disgusted.</B>"

			//Drunkenness
			switch(drunkenness)
				if(11 to 21)
					msg += "[m1] слегка захмелел[rus_a()]."
				if(21.01 to 41) //.01s are used in case drunkenness ends up to be a small decimal
					msg += "[m1] захмелел[rus_a()]."
				if(41.01 to 51)
					msg += "[m1] пьян[rus_a()], изо рта пахнет алкоголем"
				if(51.01 to 61)
					msg += "[m1] сильно пьян[rus_a()], изо рта воняет алкоголем."
				if(61.01 to 91)
					msg += "[m1] перепил[rus_a()] и теперь едва шевелит языком."
				if(91.01 to INFINITY)
					msg += "[m1] напи[rus_sya()] до мертвецкого состояния."

			//Stress
			var/stress = get_stress_amount()
			if(HAS_TRAIT(user, TRAIT_EMPATH))
				switch(stress)
					if(20 to INFINITY)
						msg += "[m1] перенапряжен[rus_a()]."
					if(10 to 19)
						msg += "[m1] [user == src ? "испытываю" : "испытывает"] сильный стресс."
					if(1 to 9)
						msg += "[m1] [user == src ? "испытываю" : "испытывает"] стресс."
					if(-9 to 0)
						msg += "[m1] [user.gender == FEMALE ? "спокойна" : "спокоен"]."
					if(-19 to -10)
						msg += "[m1] [user == src ? "чувствую" : "чувствует"] себя расслабленно."
					if(-20 to INFINITY)
						msg += "[m1] обрел[rus_a()] внутренний покой."
			else if(stress > 10)
				msg += "На [user == src ? "моем" : t_his] лице заметна дрожь от сильного стресса."

		//Jitters
		switch(jitteriness)
			if(300 to INFINITY)
				msg += "<B>[m1] convulsing violently!</B>"
			if(200 to 300)
				msg += "[m1] extremely jittery."
			if(100 to 200)
				msg += "[m1] twitching ever so slightly."

		if(InCritical())
			msg += span_warning("[m1] едва в сознании.")
		else
			if(stat >= UNCONSCIOUS)
				msg += "[m1] [IsSleeping() ? "[user == src ? "сплю" : "спит"]" : "без сознания"].[client ? "" : " <b>[m1] не скоро сможет проснуться.</b>"]"
			else if(eyesclosed)
				msg += "[user == src ? "Мои" : t_His] глаза закрыты."
			else if(has_status_effect(/datum/status_effect/debuff/sleepytime))
				msg += "[user == src ? "Мои" : t_His] глаза слипаются от усталости."
	else
		msg += "[m1] без сознания."
//		else
//			if(HAS_TRAIT(src, TRAIT_DUMB))
//				msg += "[m3] a stupid expression on [m2] face."
//			if(InCritical())
//				msg += "[m1] barely conscious."
//		if(getorgan(/obj/item/organ/brain))
//			if(!key)
//				msg += span_deadsay("[m1] totally catatonic. The stresses of life in deep-space must have been too much for [t_him]. Any recovery is unlikely.")
//			else if(!client)
//				msg += "[m3] a blank, absent-minded stare and appears completely unresponsive to anything. [t_He] may snap out of it soon."

	if(length(msg))
		. += span_warning("[msg.Join("\n")]")

	// Show especially large embedded objects at a glance
	for(var/obj/item/bodypart/part in bodyparts)
		if (LAZYLEN(part.embedded_objects))
			for(var/obj/item/stuck_thing in part.embedded_objects)
				if (stuck_thing.w_class >= WEIGHT_CLASS_SMALL)
					. += span_bloody("<b>[m1] [user == src ? "страдаю" : "страдает"] от [stuck_thing], что торчит из [part.name]!</b>")

	if((user != src) && isliving(user))
		var/mob/living/L = user
		var/final_str = STASTR
		if(HAS_TRAIT(src, TRAIT_DECEIVING_MEEKNESS))
			final_str = L.STASTR - rand(1,2)
		var/strength_diff = final_str - L.STASTR
		switch(strength_diff)
			if(5 to INFINITY)
				. += span_warning("<B>[t_He] выглядит гораздо сильнее меня.</B>")
			if(1 to 5)
				. += span_warning("[t_He] выглядит сильнее меня.")
			if(0)
				. += "[t_He] примерно одной силы со мной."
			if(-5 to -1)
				. += span_warning("[t_He] выглядит слабее меня.")
			if(-INFINITY to -5)
				. += span_warning("<B>[t_He] выглядит значительно слабее меня.</B>")

	if(maniac)
		var/obj/item/organ/heart/heart = getorganslot(ORGAN_SLOT_HEART)
		if(heart)
			var/inscryption_key = LAZYACCESS(heart.inscryption_keys, maniac) // SPECIFICALLY the key that WE wrote
			if(inscryption_key && (inscryption_key in maniac.key_nums))
				. += span_danger("[t_He] знает [inscryption_key], Я УВЕРЕН[rus_a()] В ЭТОМ!")

	if(aghost_privilege)
		var/obj/item/organ/heart/heart = getorganslot(ORGAN_SLOT_HEART)
		if(heart && heart.maniacs)
			for(var/datum/antagonist/maniac/M in heart.maniacs)
				var/K = LAZYACCESS(heart.inscryptions, M)
				var/W = LAZYACCESS(heart.maniacs2wonder_ids, M)
				var/N = M.owner?.name
				. += span_notice("Inscryption[N ? " by [N]'s " : ""][W ? "Wonder #[W]" : ""]: [K ? K : ""]")


	if(Adjacent(user) || aghost_privilege)
		if(observer_privilege)
			var/static/list/check_zones = list(
				BODY_ZONE_HEAD,
				BODY_ZONE_CHEST,
				BODY_ZONE_R_ARM,
				BODY_ZONE_L_ARM,
				BODY_ZONE_R_LEG,
				BODY_ZONE_L_LEG,
			)
			for(var/zone in check_zones)
				var/obj/item/bodypart/bodypart = get_bodypart(zone)
				if(!bodypart)
					continue
				. += "<a href='?src=[REF(src)];inspect_limb=[zone]'>Осмотреть [parse_zone(zone)]</a>"
			. += "<a href='?src=[REF(src)];check_hb=1'>Проверить сердцебиение</a>"
		else
			var/checked_zone = check_zone(user.zone_selected)
			. += "<a href='?src=[REF(src)];inspect_limb=[checked_zone]'>Осмотреть [parse_zone(checked_zone)]</a>"
			if(!(mobility_flags & MOBILITY_STAND) && user != src && (user.zone_selected == BODY_ZONE_CHEST))
				. += "<a href='?src=[REF(src)];check_hb=1'>Проверить сердцебиение</a>"

	if(!obscure_name && headshot_link)
		. += "<a href='?src=[REF(src)];task=view_headshot;'>Присмотреться к лицу поближе</a>"
	if(nudeshot_link && get_location_accessible(src, BODY_ZONE_CHEST) && get_location_accessible(src, BODY_ZONE_PRECISE_GROIN))
		. += "<a href='?src=[REF(src)];task=view_nudeshot;'>Присмотреться к телу поближе</a>"

	var/list/lines = build_cool_description(get_mob_descriptors(obscure_name, user), src)
	for(var/line in lines)
		. += span_info(line)

	var/trait_exam = common_trait_examine()
	if(!isnull(trait_exam))
		. += trait_exam

/mob/living/proc/status_effect_examines(pronoun_replacement) //You can include this in any mob's examine() to show the examine texts of status effects!
	var/list/dat = list()
	if(!pronoun_replacement)
		pronoun_replacement = rus_they(TRUE)
	var/ending_replacement = rus_a()
	for(var/V in status_effects)
		var/datum/status_effect/E = V
		if(E.examine_text)
			var/new_text = replacetext(E.examine_text, "SUBJECTPRONOUN", pronoun_replacement)
			new_text = replacetext(new_text, "ENDING", ending_replacement) //For endings in words based on gender
			dat += "[new_text]\n" //dat.Join("\n") doesn't work here, for some reason
	if(dat.len)
		return dat.Join()

// Used for Inquisition tags
/mob/living/proc/get_inquisition_text(mob/examiner)
	var/inquisition_text
	if(HAS_TRAIT(src, TRAIT_INQUISITION) && HAS_TRAIT(examiner, TRAIT_INQUISITION))
		inquisition_text += "[src.gender == FEMALE ? "Верная соратница" : "Преданный соратник"] Инквизиции"
	return inquisition_text
