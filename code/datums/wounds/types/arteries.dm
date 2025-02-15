/datum/wound/artery
	name = "перерезанная артерия"
	check_name = span_artery("<B>АРТЕРИЯ</B>")
	severity = WOUND_SEVERITY_CRITICAL
	crit_message = "%VICTIM быстро истекает кровью из %BODYPART!"
	sound_effect = 'sound/combat/crit.ogg'
	whp = 50
	sewn_whp = 20
	bleed_rate = 20
	sewn_bleed_rate = 0.2
	clotting_threshold = null
	sewn_clotting_threshold = null
	woundpain = 50
	sewn_woundpain = 20
	mob_overlay = "s1"
	sewn_overlay = "cut"
	can_sew = TRUE
	can_cauterize = TRUE
	critical = TRUE
	sleep_healing = 0
	embed_chance = 40

	zombie_infection_probability = 50
	werewolf_infection_probability = 50

/datum/wound/artery/can_stack_with(datum/wound/other)
	if(istype(other, /datum/wound/artery) && (type == other.type))
		return FALSE
	return TRUE

/datum/wound/artery/on_mob_gain(mob/living/affected)
	. = ..()
	affected.emote("paincrit", TRUE)
	affected.Slowdown(20)
	shake_camera(affected, 2, 2)

/datum/wound/artery/on_bodypart_gain(obj/item/bodypart/affected)
	. = ..()
	affected.temporary_crit_paralysis(10 SECONDS)

/datum/wound/artery/neck
	name = "разорванная сонная артерия"
	check_name = span_artery("<B>СОННАЯ АРТЕРИЯ</B>")
	severity = WOUND_SEVERITY_FATAL
	crit_message = "%VICTIM обильно брызжет кровью из своего горла!"
	whp = 100
	sewn_whp = 25
	bleed_rate = 50
	sewn_bleed_rate = 0.5
	woundpain = 60
	sewn_woundpain = 30
	mob_overlay = "s1_throat"

/datum/wound/artery/neck/on_mob_gain(mob/living/affected)
	. = ..()
	ADD_TRAIT(affected, TRAIT_GARGLE_SPEECH, "[type]")

/datum/wound/artery/neck/on_mob_loss(mob/living/affected)
	. = ..()
	REMOVE_TRAIT(affected, TRAIT_GARGLE_SPEECH, "[type]")

/datum/wound/artery/chest
	name = "рассечение аорты"
	check_name = span_artery("<B>АОРТА</B>")
	severity = WOUND_SEVERITY_FATAL
	whp = 100
	sewn_whp = 35
	bleed_rate = 50
	sewn_bleed_rate = 0.8
	woundpain = 100
	sewn_woundpain = 50

/datum/wound/artery/chest/on_mob_gain(mob/living/affected)
	. = ..()
	if(iscarbon(affected))
		var/mob/living/carbon/carbon_affected = affected
		carbon_affected.vomit(blood = TRUE)
	var/static/list/heartaches = list(
		"СЕДРЦЕ! С-СЕРДЦЕ!!!",
		"МОЕ СЕРДЦЕ! КАК БОЛЬНО!",
		"Я УМИРАЮ!",
		"БОЛЬ В ОБЛАСТИ СЕРДЦА ПРОСТО НЕВЫНОСИМА!",
		"ТАК БОЛЬНО, Я СЕЙЧАС УМРУ!!!",
	)
	to_chat(affected, span_userdanger("[pick(heartaches)]"))
	if(HAS_TRAIT(affected, TRAIT_CRITICAL_WEAKNESS))
		affected.death()

/datum/wound/artery/chest/on_life()
	. = ..()
	if(!iscarbon(owner))
		return
	var/mob/living/carbon/carbon_owner = owner
	if(!carbon_owner.stat && prob(5))
		carbon_owner.vomit(1, blood = TRUE, stun = TRUE)

/datum/wound/artery/reattachment
	name = "незавершенная пересадка"
	check_name = span_artery("<B>НЕ ЗАШИТА АРТЕРИЯ</B>")
	severity = WOUND_SEVERITY_FATAL
	whp = 100
	sewn_whp = 90
	bleed_rate = 50
	sewn_bleed_rate = 0.5
	woundpain = 60
	sewn_woundpain = 30
	disabling = TRUE
