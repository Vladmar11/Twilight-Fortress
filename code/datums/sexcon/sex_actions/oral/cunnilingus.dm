/datum/sex_action/cunnilingus
	name = "Отлизать"
	check_incapacitated = FALSE
	gags_user = TRUE

/datum/sex_action/cunnilingus/shows_on_menu(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user == target)
		return FALSE
	if(!target.getorganslot(ORGAN_SLOT_VAGINA))
		return FALSE
	return TRUE

/datum/sex_action/cunnilingus/can_perform(mob/living/user, mob/living/target)
	if(user == target)
		return FALSE
	if(!get_location_accessible(target, BODY_ZONE_PRECISE_GROIN))
		return FALSE
	if(!get_location_accessible(user, BODY_ZONE_PRECISE_MOUTH))
		return FALSE
	if(!target.getorganslot(ORGAN_SLOT_VAGINA))
		return FALSE
	return TRUE

/datum/sex_action/cunnilingus/on_start(mob/living/carbon/human/user, mob/living/carbon/human/target)
	..()
	if(HAS_TRAIT(target, TRAIT_TINY) && !(HAS_TRAIT(user, TRAIT_TINY))) //Size difference check, non-fairy on fairy will say this
		//Entire groin area being covered due to size
		user.visible_message(span_warning("[user] вылизывает пах [target] целиком..."))
	else
		user.visible_message(span_warning("[user] прижимается губами к киске [target]..."))

/datum/sex_action/cunnilingus/on_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user.sexcon.do_message_signature("[type]"))
		if(HAS_TRAIT(target, TRAIT_TINY) && !(HAS_TRAIT(user, TRAIT_TINY))) //Size difference check, non-fairy on fairy will say this
			//Entire groin area being covered due to size
			user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] лижет пах [target]..."))
		else
			user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] проходит языком по киске [target]..."))
	user.make_sucking_noise()
	do_thrust_animate(user, target)

	user.sexcon.perform_sex_action(target, 2, 3, TRUE)
	if(target.sexcon.check_active_ejaculation())
		target.visible_message(span_lovebold("[target] кончает в рот [user]!"))
		target.sexcon.cum_into()

/datum/sex_action/cunnilingus/on_finish(mob/living/carbon/human/user, mob/living/carbon/human/target)
	..()
	if(HAS_TRAIT(target, TRAIT_TINY) && !(HAS_TRAIT(user, TRAIT_TINY))) //Size difference check, non-fairy on fairy will say this
		//Entire groin area being covered due to size
		user.visible_message(span_warning("[user] перестает лизать пах [target]..."))
	else
		user.visible_message(span_warning("[user] отрывается от киски [target]..."))

/datum/sex_action/cunnilingus/is_finished(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(target.sexcon.finished_check())
		return TRUE
	return FALSE
