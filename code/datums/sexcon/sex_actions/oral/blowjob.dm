/datum/sex_action/blowjob
	name = "Отсосать"
	check_same_tile = FALSE
	check_incapacitated = FALSE
	gags_user = TRUE

/datum/sex_action/blowjob/shows_on_menu(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user == target)
		return FALSE
	if(!target.getorganslot(ORGAN_SLOT_PENIS))
		return FALSE
	if(HAS_TRAIT(target, TRAIT_TINY))	//Someone else can figure out how a full sized humen gives a male seelie a blowjob...
		return FALSE
	return TRUE

/datum/sex_action/blowjob/can_perform(mob/living/user, mob/living/target)
	if(user == target)
		return FALSE
	if(!get_location_accessible(target, BODY_ZONE_PRECISE_GROIN))
		return FALSE
	if(!get_location_accessible(user, BODY_ZONE_PRECISE_MOUTH))
		return FALSE
	if(!target.getorganslot(ORGAN_SLOT_PENIS))
		return FALSE
	return TRUE

/datum/sex_action/blowjob/on_start(mob/living/carbon/human/user, mob/living/carbon/human/target)
	..()
	if(HAS_TRAIT(user, TRAIT_TINY) && !(HAS_TRAIT(target, TRAIT_TINY)))
		user.visible_message(span_warning("[user] вывалив язычок, прикасается тем к пенису [target]..."))	//Changed to licking due to fairy size
	else
		user.visible_message(span_warning("[user] раскрыв свой ротик, помещает головку члена [target] внутрь..."))

/datum/sex_action/blowjob/on_perform(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(user.sexcon.do_message_signature("[type]"))
		if(HAS_TRAIT(user, TRAIT_TINY) && !(HAS_TRAIT(target, TRAIT_TINY)))
			user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] вылизывает член [target]..."))
		else
			user.visible_message(user.sexcon.spanify_force("[user] [user.sexcon.get_generic_force_adjective()] сосет хер [target]..."))
	user.make_sucking_noise()
	do_thrust_animate(user, target)

	user.sexcon.perform_sex_action(target, 2, 0, TRUE)
	if(!target.sexcon.considered_limp())
		user.sexcon.perform_deepthroat_oxyloss(user, 1.3)
	if(target.sexcon.check_active_ejaculation())
		if(HAS_TRAIT(user, TRAIT_TINY) && !(HAS_TRAIT(target, TRAIT_TINY)))
			target.visible_message(span_lovebold("[target] кончает на волосы и личико [user]!"))
			target.sexcon.cum_onto()
		else
			target.visible_message(span_lovebold("[target] кончает прямо в рот [user]!"))
			target.sexcon.cum_into()

/datum/sex_action/blowjob/on_finish(mob/living/carbon/human/user, mob/living/carbon/human/target)
	..()
	if(HAS_TRAIT(user, TRAIT_TINY) && !(HAS_TRAIT(target, TRAIT_TINY)))
		user.visible_message(span_warning("[user] перестает вылизывать член [target]..."))
	else
		user.visible_message(span_warning("[user] вынимает из пасти хер [target]..."))

/datum/sex_action/blowjob/is_finished(mob/living/carbon/human/user, mob/living/carbon/human/target)
	if(target.sexcon.finished_check())
		return TRUE
	return FALSE
