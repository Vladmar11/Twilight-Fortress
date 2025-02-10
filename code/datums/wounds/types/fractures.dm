/datum/wound/fracture
	name = "перелом"
	check_name = span_bone("<B>ПЕРЕЛОМ</B>")
	severity = WOUND_SEVERITY_SEVERE
	crit_message = list(
		"Кость рассыпается на осколки!", 
		"Кость сломана!", 
		"На глазах %BODYPART принимает неестественную форму!", 
		"Кусок кости вырывается наружу!",
	)
	sound_effect = "wetbreak"
	whp = 40
	woundpain = 100
	mob_overlay = "frac"
	can_sew = FALSE
	can_cauterize = FALSE
	disabling = TRUE
	critical = TRUE
	sleep_healing = 0 // no sleep healing that is stupid
	zombie_infection_probability = 0
	werewolf_infection_probability = 0
	/// Whether or not we can be surgically set
	var/can_set = TRUE
	/// Emote we use when applied
	var/gain_emote = "paincrit"

/datum/wound/fracture/get_visible_name(mob/user)
	. = ..()
	if(passive_healing)
		. += " <span class='green'>(встала на место)</span>"

/datum/wound/fracture/can_stack_with(datum/wound/other)
	if(istype(other, /datum/wound/fracture) && (type == other.type))
		return FALSE
	return TRUE

/datum/wound/fracture/on_mob_gain(mob/living/affected)
	. = ..()
	if(gain_emote)
		affected.emote(gain_emote, TRUE)
	affected.Slowdown(20)
	shake_camera(affected, 2, 2)

/datum/wound/fracture/proc/set_bone()
	if(!can_set)
		return FALSE
	sleep_healing = max(sleep_healing, 1)
	passive_healing = max(passive_healing, 1)
	can_set = FALSE // No reason for us to be able to set the same bone multiple times.
	check_name += span_bone(" (Встала на место)")
	return TRUE

/datum/wound/fracture/head
	name = "перелом черепа"
	check_name = span_bone("<B>ТРЕЩИНА В ЧЕРЕПЕ</B>")
	crit_message = list(
		"Череп ужасным образом раскалывается!", 
		"Голову сотрясает перелом!", 
		"Череп сломан!", 
		"Часть черепа проваливается вовнутрь!",
	)
	sound_effect = "headcrush"
	whp = 150
	sleep_healing = 0
	/// Most head fractures are serious enough to cause paralysis
	var/paralysis = TRUE
	/// Some head fractures are so serious they cause instant death
	var/mortal = FALSE
	/// Funny easter egg
	var/dents_brain = TRUE

/datum/wound/fracture/head/New()
	. = ..()
	if(dents_brain && prob(1))
		name = "dentbrain"
		check_name = span_bone("<B>DENTBRAIN</B>")

/datum/wound/fracture/head/on_mob_gain(mob/living/affected)
	. = ..()
	ADD_TRAIT(affected, TRAIT_DISFIGURED, "[type]")
	if(paralysis)
		ADD_TRAIT(affected, TRAIT_NO_BITE, "[type]")
		ADD_TRAIT(affected, TRAIT_PARALYSIS, "[type]")
		ADD_TRAIT(affected, TRAIT_NOPAIN, "[type]")
		if(iscarbon(affected))
			var/mob/living/carbon/carbon_affected = affected
			carbon_affected.update_disabled_bodyparts()
	if(mortal || HAS_TRAIT(affected, TRAIT_CRITICAL_WEAKNESS))
		affected.death()

/datum/wound/fracture/head/on_mob_loss(mob/living/affected)
	. = ..()
	REMOVE_TRAIT(affected, TRAIT_DISFIGURED, "[type]")
	if(paralysis)
		REMOVE_TRAIT(affected, TRAIT_NO_BITE, "[type]")
		REMOVE_TRAIT(affected, TRAIT_PARALYSIS, "[type]")
		REMOVE_TRAIT(affected, TRAIT_NOPAIN, "[type]")
		if(iscarbon(affected))
			var/mob/living/carbon/carbon_affected = affected
			carbon_affected.update_disabled_bodyparts()

/datum/wound/fracture/head/on_life()
	. = ..()
	owner.stuttering = max(owner.stuttering, 5)

/datum/wound/fracture/head/brain
	name = "вдавленный перелом черепа"
	crit_message = list(
		"Череп проколот!",
		"Череп пробит!",
		"В черепе проломлено отверстие!",
	)
	embed_chance = 100
	paralysis = TRUE
	mortal = FALSE
	dents_brain = TRUE

/datum/wound/fracture/head/eyes
	name = "перелом глазницы"
	crit_message = list(
		"Кости вокруг глазницы проколоты!",
		"Кости в глазнице пробиты!",
		"Глазница проколота!",
		"Глазница пробита!",
	)
	embed_chance = 100
	paralysis = TRUE
	mortal = TRUE
	dents_brain = FALSE

/datum/wound/fracture/head/ears
	name = "перелом височной кости"
	crit_message = list(
		"Височная кость ломается на глазах!",
		"Висок трещит!",
		"Ушной канал поврежден!",
		"Ушной канал пробит!",
	)
	embed_chance = 100
	paralysis = TRUE
	mortal = TRUE
	dents_brain = FALSE

/datum/wound/fracture/head/nose
	name = "перелом носовой кости"
	crit_message = list(
		"Носовая кость треснула!",
		"Носовая кость сломана!",
	)
	embed_chance = 100
	paralysis = FALSE
	mortal = FALSE
	dents_brain = FALSE

/datum/wound/fracture/mouth
	name = "перелом нижней челюсти"
	check_name = span_bone("ПЕРЕЛОМ ЧЕЛЮСТИ")
	crit_message = list(
		"Нижняя челюсть прекрасно отделяется от остального черепа!", 
		"Челюсть раздавило!", 
		"Челюсть разлетается по частям!", 
		"Челюсть проваливается внутрь!",
	)
	whp = 80
	sleep_healing = 0

/datum/wound/fracture/mouth/on_mob_gain(mob/living/affected)
	. = ..()
	ADD_TRAIT(affected, TRAIT_NO_BITE, "[type]")
	ADD_TRAIT(affected, TRAIT_GARGLE_SPEECH, "[type]")

/datum/wound/fracture/mouth/on_mob_loss(mob/living/affected)
	. = ..()
	REMOVE_TRAIT(affected, TRAIT_NO_BITE, "[type]")
	REMOVE_TRAIT(affected, TRAIT_GARGLE_SPEECH, "[type]")

/datum/wound/fracture/neck
	name = "перелом шейных позвонков"
	check_name = span_bone("<B>ШЕЯ</B>")
	crit_message = list(
		"Шея ломается под довольно зрелищным углом!", 
		"Шея хрустнула!",
		"Шея треснула!",
		"Шея сломалась!",
	)
	whp = 100
	sleep_healing = 0

/datum/wound/fracture/neck/on_mob_gain(mob/living/affected)
	. = ..()
	ADD_TRAIT(affected, TRAIT_PARALYSIS, "[type]")
	ADD_TRAIT(affected, TRAIT_NOPAIN, "[type]")
	if(iscarbon(affected))
		var/mob/living/carbon/carbon_affected = affected
		carbon_affected.update_disabled_bodyparts()
	if(HAS_TRAIT(affected, TRAIT_CRITICAL_WEAKNESS))
		affected.death()

/datum/wound/fracture/neck/on_mob_loss(mob/living/affected)
	. = ..()
	REMOVE_TRAIT(affected, TRAIT_PARALYSIS, "[type]")
	REMOVE_TRAIT(affected, TRAIT_NOPAIN, "[type]")
	if(iscarbon(affected))
		var/mob/living/carbon/carbon_affected = affected
		carbon_affected.update_disabled_bodyparts()

/datum/wound/fracture/chest
	name = "перелом ребер"
	check_name = span_bone("<B>РЕБРА</B>")
	crit_message = list(
		"Ребра ломаются чудесным образом!",
		"Ребра разламываются внутри!",
		"Ребра трещат и перемалываются!",
		"Грудная клетка проламывается внутрь тела!",
	)
	whp = 50

/datum/wound/fracture/chest/on_mob_gain(mob/living/affected)
	. = ..()
	affected.Stun(20)

/datum/wound/fracture/chest/on_life()
	. = ..()
	if(!iscarbon(owner))
		return
	var/mob/living/carbon/carbon_owner = owner
	if(!carbon_owner.stat && prob(5))
		carbon_owner.vomit(1, blood = TRUE, stun = TRUE)

/datum/wound/fracture/groin
	name = "перелом тазовой кости"
	check_name = span_bone("<B>ТАЗ</B>")
	crit_message = list(
		"Таз разбивается великолепным образом!", 
		"Кости таза ломаются!", 
		"Таз изувечен в результате перелома!", 
		"Низ таза вдавливается внутрь тела!",
	)
	whp = 50
	gain_emote = "groin"

/datum/wound/fracture/groin/New()
	. = ..()
	if(prob(1))
		name = "broken buck"
		check_name = span_bone("BUCKBROKEN")
		crit_message = "The buck is broken expertly!"
	
/datum/wound/fracture/groin/on_mob_gain(mob/living/affected)
	. = ..()
	affected.Stun(20)
	ADD_TRAIT(affected, TRAIT_PARALYSIS_R_LEG, "[type]")
	ADD_TRAIT(affected, TRAIT_PARALYSIS_L_LEG, "[type]")
	if(iscarbon(affected))
		var/mob/living/carbon/carbon_affected = affected
		carbon_affected.update_disabled_bodyparts()

/datum/wound/fracture/groin/on_mob_loss(mob/living/affected)
	. = ..()
	REMOVE_TRAIT(affected, TRAIT_PARALYSIS_R_LEG, "[type]")
	REMOVE_TRAIT(affected, TRAIT_PARALYSIS_L_LEG, "[type]")
	if(iscarbon(affected))
		var/mob/living/carbon/carbon_affected = affected
		carbon_affected.update_disabled_bodyparts()
