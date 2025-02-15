/datum/sex_action/toy_other_vagina
	name = "Трахнуть игрушкой (вагина)"

/datum/sex_action/toy_other_vagina/shows_on_menu(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user == target)
		return FALSE
	if(!target.getorganslot(ORGAN_SLOT_VAGINA))
		return FALSE
	if(!get_dildo_in_either_hand(user))
		return FALSE
	return TRUE

/datum/sex_action/toy_other_vagina/can_perform(mob/living/user, mob/living/target)
	if(user == target)
		return FALSE
	if(!get_location_accessible(target, BODY_ZONE_PRECISE_GROIN))
		return FALSE
	if(!target.getorganslot(ORGAN_SLOT_VAGINA))
		return FALSE
	if(!get_dildo_in_either_hand(user))
		return FALSE
	return TRUE

/datum/sex_action/toy_other_vagina/on_start(mob/living/carbon/human/user, mob/living/carbon/human/target)
	..()
	var/obj/item/dildo = get_dildo_in_either_hand(user)
	if(HAS_TRAIT(target, TRAIT_TINY) && !(HAS_TRAIT(user, TRAIT_TINY)))
		//Scream and rib break
		user.visible_message(span_warning("[user] вбивает [dildo] в миниатюрную киску [target]!"))
		var/obj/item/bodypart/BPC = target.get_bodypart(BODY_ZONE_CHEST)
		var/obj/item/bodypart/BPG = target.get_bodypart(BODY_ZONE_PRECISE_GROIN)
		BPC.add_wound(/datum/wound/fracture/chest)
		BPG.add_wound(/datum/wound/fracture/groin)
		target.apply_damage(30, BRUTE, BPC)
	else
		user.visible_message(span_warning("[user] запихивает [dildo] в кисоньку [target]..."))

/datum/sex_action/toy_other_vagina/on_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user.sexcon.do_message_signature("[type]"))
		if(HAS_TRAIT(target, TRAIT_TINY) && !(HAS_TRAIT(user, TRAIT_TINY)))
			user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] трахает маленькую киску [target] игрушкой..."))
		else
			user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] удовлетворяет киску [target] при помощи игрушки..."))
	playsound(user, 'sound/misc/mat/fingering.ogg', 30, TRUE, -2, ignore_walls = FALSE)

	if(HAS_TRAIT(target, TRAIT_TINY) && !(HAS_TRAIT(user, TRAIT_TINY)))
		//Scream and organ damage
		target.apply_damage(10, BRUTE, target.get_bodypart(BODY_ZONE_CHEST))
		target.apply_damage(3, BRUTE, target.get_bodypart(BODY_ZONE_PRECISE_GROIN))

	user.sexcon.perform_sex_action(target, 2, 4, TRUE)
	target.sexcon.handle_passive_ejaculation()

/datum/sex_action/toy_other_vagina/on_finish(mob/living/carbon/human/user, mob/living/carbon/human/target)
	..()
	var/obj/item/dildo = get_dildo_in_either_hand(user)
	user.visible_message(span_warning("[user] вытаскивает [dildo] из лона [target]."))

/datum/sex_action/toy_other_vagina/is_finished(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(target.sexcon.finished_check())
		return TRUE
	return FALSE
