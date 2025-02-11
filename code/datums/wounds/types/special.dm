/datum/wound/facial
	name = "лицевая травма"
	sound_effect = 'sound/combat/crit.ogg'
	severity = WOUND_SEVERITY_SEVERE
	whp = null
	woundpain = 0
	can_sew = FALSE
	can_cauterize = FALSE
	critical = FALSE

/datum/wound/facial/can_stack_with(datum/wound/other)
	if(istype(other, /datum/wound/facial) && (type == other.type))
		return FALSE
	return TRUE

/datum/wound/facial/ears
	name = "разрыв барабанных перепонок"
	check_name = span_danger("УШИ")
	crit_message = list(
		"Барабанные перепонки разорваны!",
		"Барабанные перепонки порваны!",
	)
	can_sew = FALSE
	can_cauterize = FALSE
	critical = TRUE

/datum/wound/facial/ears/can_apply_to_mob(mob/living/affected)
	. = ..()
	if(!.)
		return
	return affected.getorganslot(ORGAN_SLOT_EARS)

/datum/wound/facial/ears/on_mob_gain(mob/living/affected)
	. = ..()
	affected.Stun(10)
	var/obj/item/organ/ears/ears = affected.getorganslot(ORGAN_SLOT_EARS)
	if(ears)
		ears.Remove(affected)
		ears.forceMove(affected.drop_location())

/datum/wound/facial/eyes
	name = "выпадание глаза"
	check_name = span_warning("ГЛАЗ")
	crit_message = list(
		"Глаз выколот!",
		"Глаз выдолблен из глазницы!",
		"Глаз превратился в месиво!",
	)
	woundpain = 30
	can_sew = FALSE
	can_cauterize = FALSE
	critical = TRUE
	var/do_blinding = TRUE

/datum/wound/facial/eyes/can_apply_to_mob(mob/living/affected)
	. = ..()
	if(!.)
		return
	return affected.getorganslot(ORGAN_SLOT_EYES)

/datum/wound/facial/eyes/on_mob_gain(mob/living/affected)
	. = ..()
	if(do_blinding)
		affected.Stun(10)
		affected.blind_eyes(5)

/datum/wound/facial/eyes/right
	name = "выпадание правого глаза"
	check_name = span_danger("ПРАВЫЙ ГЛАЗ")
	crit_message = list(
		"Правый глаз выколот!",
		"Правый глаз выдолблен из глазницы!",
		"Правый гла превратился в месиво!",
	)

/datum/wound/facial/eyes/right/can_stack_with(datum/wound/other)
	if(istype(other, /datum/wound/facial/eyes/right))
		return FALSE
	return TRUE

/datum/wound/facial/eyes/right/on_mob_gain(mob/living/affected)
	. = ..()
	ADD_TRAIT(affected, TRAIT_CYCLOPS_RIGHT, "[type]")
	affected.update_fov_angles()
	if(affected.has_wound(/datum/wound/facial/eyes/left) && affected.has_wound(/datum/wound/facial/eyes/right))
		var/obj/item/organ/my_eyes = affected.getorganslot(ORGAN_SLOT_EYES)
		if(my_eyes)
			my_eyes.Remove(affected)
			my_eyes.forceMove(affected.drop_location())

/datum/wound/facial/eyes/right/on_mob_loss(mob/living/affected)
	. = ..()
	REMOVE_TRAIT(affected, TRAIT_CYCLOPS_RIGHT, "[type]")
	affected.update_fov_angles()

/datum/wound/facial/eyes/right/permanent
	whp = null
	woundpain = 0
	sound_effect = null
	do_blinding = FALSE

/datum/wound/facial/eyes/left
	name = "выпадание левого глаза"
	check_name = span_danger("ЛЕВЫЙ ГЛАЗ")
	crit_message = list(
		"Левый глаз выколот!",
		"Левый глаз выдолблен из глазницы!",
		"Левый глаз превратился в месиво!",
	)

/datum/wound/facial/eyes/left/can_stack_with(datum/wound/other)
	if(istype(other, /datum/wound/facial/eyes/left))
		return FALSE
	return TRUE

/datum/wound/facial/eyes/left/on_mob_gain(mob/living/affected)
	. = ..()
	ADD_TRAIT(affected, TRAIT_CYCLOPS_LEFT, "[type]")
	affected.update_fov_angles()
	if(affected.has_wound(/datum/wound/facial/eyes/left) && affected.has_wound(/datum/wound/facial/eyes/right))
		var/obj/item/organ/my_eyes = affected.getorganslot(ORGAN_SLOT_EYES)
		if(my_eyes)
			my_eyes.Remove(affected)
			my_eyes.forceMove(affected.drop_location())

/datum/wound/facial/eyes/left/on_mob_loss(mob/living/affected)
	. = ..()
	REMOVE_TRAIT(affected, TRAIT_CYCLOPS_LEFT, "[type]")
	affected.update_fov_angles()

/datum/wound/facial/eyes/left/permanent
	whp = null
	woundpain = 0
	sound_effect = null
	do_blinding = FALSE

/datum/wound/facial/tongue
	name = "отсечение языка"
	check_name = span_danger("ЯЗЫК")
	crit_message = list(
		"Язык отсечен!",
		"Язык разорван!",
		"Язык вырван изо рта!"
	)
	can_sew = FALSE
	can_cauterize = FALSE
	critical = TRUE

/datum/wound/facial/tongue/can_apply_to_mob(mob/living/affected)
	. = ..()
	if(!.)
		return
	return affected.getorganslot(ORGAN_SLOT_TONGUE)

/datum/wound/facial/tongue/on_mob_gain(mob/living/affected)
	. = ..()
	affected.Stun(10)
	var/obj/item/organ/tongue/tongue_up_my_asshole = affected.getorganslot(ORGAN_SLOT_TONGUE)
	if(tongue_up_my_asshole)
		tongue_up_my_asshole.Remove(affected)
		tongue_up_my_asshole.forceMove(affected.drop_location())

/datum/wound/facial/disfigurement
	name = "обезображивание"
	check_name = span_warning("ЛИЦО")
	severity = 0
	crit_message = "Лицо искалечено до неузнаваемости!"
	whp = null
	woundpain = 20
	mob_overlay = "cut"
	can_sew = FALSE
	can_cauterize = FALSE
	critical = TRUE

/datum/wound/facial/disfigurement/on_mob_gain(mob/living/affected)
	. = ..()
	ADD_TRAIT(affected, TRAIT_DISFIGURED, "[type]")

/datum/wound/facial/disfigurement/on_mob_loss(mob/living/affected)
	. = ..()
	REMOVE_TRAIT(affected, TRAIT_DISFIGURED, "[type]")
	
/datum/wound/facial/disfigurement/nose
	name = "перелом носа"
	check_name = span_warning("НОС")
	crit_message = list(
		"Нос искомсан до неузнаваемости!",
		"Нос сломан!",
	)

/datum/wound/facial/disfigurement/nose/on_mob_gain(mob/living/affected)
	. = ..()
	ADD_TRAIT(affected, TRAIT_MISSING_NOSE, "[type]")
	if(HAS_TRAIT(affected, TRAIT_CRITICAL_WEAKNESS))
		affected.death()

/datum/wound/facial/disfigurement/nose/on_mob_loss(mob/living/affected)
	. = ..()
	REMOVE_TRAIT(affected, TRAIT_MISSING_NOSE, "[type]")

/datum/wound/cbt
	name = "перекручение яичек"
	check_name = span_userdanger("<B>БУБЕНЦЫ</B>")
	crit_message = list(
		"Яички скручены!",
		"Яички перекручены!",
	)
	whp = 50
	woundpain = 100
	mob_overlay = ""
	sewn_overlay = ""
	can_sew = FALSE
	can_cauterize = FALSE
	disabling = TRUE
	critical = TRUE

/datum/wound/cbt/can_stack_with(datum/wound/other)
	if(istype(other, /datum/wound/cbt))
		return FALSE
	return TRUE

/datum/wound/cbt/on_mob_gain(mob/living/affected)
	. = ..()
	affected.emote("groin", forced = TRUE)
	affected.Stun(20)
	to_chat(affected, span_userdanger("Что-то крутится у меня в паху!"))
	if(affected.gender != MALE)
		name = "перекручение яичников"
		check_name = span_userdanger("<B>ЯИЧНИКИ</B>")
		crit_message = list(
			"Яичники скручены!",
			"Яичники перекручены!",
		)
	else
		name = "перекручение яичек"
		check_name = span_userdanger("<B>БУБЕНЦЫ</B>")
		crit_message = list(
			"Яички скручены!",
			"Яички перекручены!",
		)
	if(HAS_TRAIT(affected, TRAIT_CRITICAL_WEAKNESS))
		affected.death()

/datum/wound/cbt/on_life()
	. = ..()
	if(!iscarbon(owner))
		return
	var/mob/living/carbon/carbon_owner = owner
	if(!carbon_owner.stat && prob(5))
		carbon_owner.vomit(1, stun = TRUE)

/datum/wound/cbt/permanent
	name = "потрошение яичек"
	crit_message = list(
		"Яички уничтожены!",
		"Бубенцы разорваны!",
	)
	whp = null

/datum/wound/cbt/permanent/on_mob_gain(mob/living/affected)
	. = ..()
	if(affected.gender != MALE)
		name = "потрошение яичников"
		check_name = span_userdanger("<B>ЯИЧНИКИ</B>")
		crit_message = list(
			"Яичники уничтожены!",
			"Яичники разорваны!",
		)
	else
		name = "потрошение яичек"
		check_name = span_userdanger("<B>БУБЕНЦЫ</B>")
		crit_message = list(
			"Яички уничтожены!",
			"Бубенцы разорваны!",
		)
