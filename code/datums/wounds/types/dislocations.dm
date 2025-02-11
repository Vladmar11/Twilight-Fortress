/datum/wound/dislocation
	name = "вывих"
	check_name = span_bone("ВЫВИХ")
	severity = WOUND_SEVERITY_MODERATE
	crit_message = list(
		"Видно, как %BODYPART неестественно толкает в сторону!",
		"В результате, %BODYPART смещается со своего места!",
		"При этом, %BODYPART вырывается из своего сустава!",
		"Кажется, %BODYPART вывихнуло!",
	)
	sound_effect = "fracturedry"
	whp = 40
	woundpain = 40
	mob_overlay = ""
	sewn_overlay = ""
	can_sew = FALSE
	can_cauterize = FALSE
	disabling = FALSE
	critical = TRUE
	passive_healing = 0.25
	qdel_on_droplimb = TRUE
	zombie_infection_probability = 0
	werewolf_infection_probability = 0
	/// Whether or not we can be surgically relocated
	var/can_relocate = TRUE

/datum/wound/dislocation/can_stack_with(datum/wound/other)
	if(istype(other, /datum/wound/dislocation) && (type == other.type))
		return FALSE
	return TRUE

/datum/wound/dislocation/on_bodypart_gain(obj/item/bodypart/affected)
	. = ..()
	//disable temporarily
	affected.temporary_crit_paralysis(20 SECONDS)
	ADD_TRAIT(affected, TRAIT_FINGERLESS, "[type]")
	ADD_TRAIT(affected, TRAIT_BRITTLE, "[type]")
	switch(affected.body_zone)
		if(BODY_ZONE_R_LEG)
			affected.owner.add_movespeed_modifier(MOVESPEED_ID_DISLOCATION_RIGHT_LEG, multiplicative_slowdown = DISLOCATED_ADD_SLOWDOWN)
		if(BODY_ZONE_L_LEG)
			affected.owner.add_movespeed_modifier(MOVESPEED_ID_DISLOCATION_LEFT_LEG, multiplicative_slowdown = DISLOCATED_ADD_SLOWDOWN)

/datum/wound/dislocation/on_bodypart_loss(obj/item/bodypart/affected)
	. = ..()
	REMOVE_TRAIT(affected, TRAIT_FINGERLESS, "[type]")
	REMOVE_TRAIT(affected, TRAIT_BRITTLE, "[type]")
	switch(affected.body_zone)
		if(BODY_ZONE_R_LEG)
			affected.owner.remove_movespeed_modifier(MOVESPEED_ID_DISLOCATION_RIGHT_LEG)
		if(BODY_ZONE_L_LEG)
			affected.owner.remove_movespeed_modifier(MOVESPEED_ID_DISLOCATION_LEFT_LEG)

/datum/wound/dislocation/on_mob_gain(mob/living/affected)
	. = ..()
	affected.emote("paincrit", TRUE)
	affected.Slowdown(20)
	shake_camera(affected, 2, 2)

/datum/wound/dislocation/proc/relocate_bone()
	if(!can_relocate)
		return FALSE
	qdel(src)
	return TRUE

/datum/wound/dislocation/neck
	name = "смещение шейных позвонков"
	check_name = span_bone("ШЕЯ")
	crit_message = list(
		"Позвонки соскальзывают до щелчка!",
		"Позвоночник перекрутило!",
		"При этом, %BODYPART вырывается из своего сустава!",
	)
	whp = 80
	woundpain = 100

/datum/wound/dislocation/neck/on_mob_gain(mob/living/affected)
	. = ..()
	ADD_TRAIT(affected, TRAIT_PARALYSIS, "[type]")
	if(iscarbon(affected))
		var/mob/living/carbon/carbon_affected = affected
		carbon_affected.update_disabled_bodyparts()

/datum/wound/dislocation/neck/on_mob_loss(mob/living/affected)
	. = ..()
	REMOVE_TRAIT(affected, TRAIT_PARALYSIS, "[type]")
	if(iscarbon(affected))
		var/mob/living/carbon/carbon_affected = affected
		carbon_affected.update_disabled_bodyparts()
