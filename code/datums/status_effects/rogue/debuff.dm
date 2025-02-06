/datum/status_effect/debuff
	status_type = STATUS_EFFECT_REFRESH

///////////////////////////

/datum/status_effect/debuff/hungryt1
	id = "hungryt1"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/hungryt1
	effectedstats = list("constitution" = -1)
	duration = 100

/atom/movable/screen/alert/status_effect/debuff/hungryt1
	name = "Голод"
	desc = "Голод ослабляет мое тело."
	icon_state = "hunger1"

/datum/status_effect/debuff/hungryt2
	id = "hungryt2"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/hungryt2
	effectedstats = list("strength" = -2, "constitution" = -2, "endurance" = -1)
	duration = 100

/atom/movable/screen/alert/status_effect/debuff/hungryt2
	name = "Сильный голод"
	desc = "Мое тело сильно страдает от голода."
	icon_state = "hunger2"

/datum/status_effect/debuff/hungryt3
	id = "hungryt3"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/hungryt3
	effectedstats = list("strength" = -5, "constitution" = -3, "endurance" = -2)
	duration = 100

/atom/movable/screen/alert/status_effect/debuff/hungryt3
	name = "Смертельный голод"
	desc = "Моё тело едва выдерживает это!"
	icon_state = "hunger3"

//SILVER DAGGER EFFECT

/datum/status_effect/debuff/silver_curse
	id = "silver_curse"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/silver_curse
	duration = 5 SECONDS

/atom/movable/screen/alert/status_effect/debuff/silver_curse
	name = "Серебряное проклятие"
	desc = "Моя ПОГИБЕЛЬ!"
	icon_state = "hunger3"

////////////////////

/datum/status_effect/debuff/moondust_crash
	id = "moondust_crash"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/moondust_crash
	effectedstats = list("speed" = -3, "endurance" = -3)
	duration = 20 SECONDS

/atom/movable/screen/alert/status_effect/debuff/moondust_crash
	name = "Ломка (Лунная пыль)"
	desc = "Мое тело кажется неповоротливым и напряженным."
	icon_state = "muscles"


/datum/status_effect/debuff/thirstyt1
	id = "thirsty1"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/thirstyt1
	effectedstats = list("endurance" = -1)
	duration = 100

/atom/movable/screen/alert/status_effect/debuff/thirstyt1
	name = "Жажда"
	desc = "Мне нужна вода."
	icon_state = "thirst1"

/datum/status_effect/debuff/thirstyt2
	id = "thirsty2"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/thirstyt2
	effectedstats = list("speed" = -1, "endurance" = -2)
	duration = 100

/atom/movable/screen/alert/status_effect/debuff/thirstyt2
	name = "Сильная жажда"
	desc = "Во рту стало намного суше."
	icon_state = "thirst2"

/datum/status_effect/debuff/thirstyt3
	id = "thirsty3"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/thirstyt3
	effectedstats = list("strength" = -1, "speed" = -2, "endurance" = -3)
	duration = 100

/atom/movable/screen/alert/status_effect/debuff/thirstyt3
	name = "Невыносимая жажда"
	desc = "мне срочно нужна вода! Прямо сейчас!"
	icon_state = "thirst3"

/////////

/datum/status_effect/debuff/uncookedfood
	id = "uncookedfood"
	effectedstats = null
	duration = 1

/datum/status_effect/debuff/uncookedfood/on_apply()
	if(HAS_TRAIT(owner, TRAIT_NASTY_EATER) || HAS_TRAIT(owner, TRAIT_ORGAN_EATER) || HAS_TRAIT(owner, TRAIT_WILD_EATER))
		return ..()
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.add_nausea(100)
	return ..()

/datum/status_effect/debuff/badmeal
	id = "badmeal"
	effectedstats = null
	duration = 1

/datum/status_effect/debuff/badmeal/on_apply()
	owner.add_stress(/datum/stressevent/badmeal)
	return ..()

/datum/status_effect/debuff/burnedfood
	id = "burnedfood"
	effectedstats = null
	duration = 1

/datum/status_effect/debuff/burnedfood/on_apply()
	if(HAS_TRAIT(owner, TRAIT_NASTY_EATER))
		return ..()
	owner.add_stress(/datum/stressevent/burntmeal)
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.add_nausea(100)
	return ..()

/datum/status_effect/debuff/rotfood
	id = "rotfood"
	effectedstats = null
	duration = 1

/datum/status_effect/debuff/rotfood/on_apply()
	if(HAS_TRAIT(owner, TRAIT_NASTY_EATER) || HAS_TRAIT(owner, TRAIT_ROT_EATER))
		return ..()
	owner.add_stress(/datum/stressevent/rotfood)
	if(iscarbon(owner))
		var/mob/living/carbon/C = owner
		C.add_nausea(200)
	return ..()

/datum/status_effect/debuff/bleeding
	id = "bleedingt1"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/bleedingt1
	effectedstats = list("speed" = -1)
	duration = 100

/atom/movable/screen/alert/status_effect/debuff/bleedingt1
	name = "Головокружение"
	desc = ""
	icon_state = "bleed1"

/datum/status_effect/debuff/bleedingworse
	id = "bleedingt2"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/bleedingt2
	effectedstats = list("strength" = -1, "speed" = -2)
	duration = 100

/atom/movable/screen/alert/status_effect/debuff/bleedingt2
	name = "Слабость"
	desc = ""
	icon_state = "bleed2"

/datum/status_effect/debuff/bleedingworst
	id = "bleedingt3"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/bleedingt3
	effectedstats = list("strength" = -3, "speed" = -4)
	duration = 100

/atom/movable/screen/alert/status_effect/debuff/bleedingt3
	name = "Анемия"
	desc = ""
	icon_state = "bleed3"

/datum/status_effect/debuff/sleepytime
	id = "sleepytime"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/sleepytime
	effectedstats = list("speed" = -1, "endurance" = -1)

/atom/movable/screen/alert/status_effect/debuff/sleepytime
	name = "Усталость"
	desc = "Мне следует немного отдохнуть."
	icon_state = "sleepy"

/datum/status_effect/debuff/muscle_sore
	id = "muscle_sore"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/muscle_sore
	effectedstats = list("strength" = -1, "endurance" = -1)

/atom/movable/screen/alert/status_effect/debuff/muscle_sore
	name = "Боль в мышцах"
	desc = "Мне нужен сон, чтобы мои мышцы могли восстановиться."
	icon_state = "muscles"

/datum/status_effect/debuff/goblingas
	id = "goblingas"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/goblingas
	effectedstats = list("intelligence" = -3, "endurance" = -3)
	duration = 40 SECONDS

/atom/movable/screen/alert/status_effect/debuff/goblingas
	name = "Гоблиноголовый"
	desc = "Все мое тело немеет..."
	icon_state = "fentanyl"

/datum/status_effect/debuff/vamp_dreams
	id = "sleepytime"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/vamp_dreams

/atom/movable/screen/alert/status_effect/debuff/vamp_dreams
	name = "Озарение"
	desc = "Немного поспав в гробу, я чувствую, что могу стать лучше."
	icon_state = "sleepy"

/datum/status_effect/debuff/cumbrained
	id = "cumbrained"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/cumbrained
	effectedstats = list("intelligence" = -10, "strength" = -6, "speed" = -6)
	duration = 60 SECONDS

/atom/movable/screen/alert/status_effect/debuff/cumbrained
	name = "Изношенность"
	desc = "Тяжело даже думать..."
	icon_state = "fentanyl"

/// SURRENDERING DEBUFFS

/datum/status_effect/debuff/breedable
	id = "breedable"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/breedable
	duration = 30 SECONDS

/datum/status_effect/debuff/breedable/on_apply()
	. = ..()
	ADD_TRAIT(owner, TRAIT_CRITICAL_RESISTANCE, id)
	ADD_TRAIT(owner, TRAIT_SPELLCOCKBLOCK, id)

/datum/status_effect/debuff/breedable/on_remove()
	. = ..()
	REMOVE_TRAIT(owner, TRAIT_CRITICAL_RESISTANCE, id)
	REMOVE_TRAIT(owner, TRAIT_SPELLCOCKBLOCK, id)

/atom/movable/screen/alert/status_effect/debuff/breedable
	name = "Готовность к размножению"

/datum/status_effect/debuff/submissive
	id = "submissive"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/submissive
	duration = 60 SECONDS

/datum/status_effect/debuff/submissive/on_apply()
	. = ..()
	owner.add_movespeed_modifier("SUBMISSIVE", multiplicative_slowdown = 4)

/datum/status_effect/debuff/submissive/on_remove()
	. = ..()
	owner.remove_movespeed_modifier("SUBMISSIVE")

/atom/movable/screen/alert/status_effect/debuff/submissive
	name = "Покорность"

/// SEELIE DEBUFFS

/datum/status_effect/buff/seelie/sad
	id = "Seelie Curse"
	alert_type = /atom/movable/screen/alert/status_effect/buff/seelie/sad
	effectedstats = list("fortune" = -2)
	duration = 60 SECONDS

/atom/movable/screen/alert/status_effect/buff/seelie/sad
	name = "Опыление Феи"
	desc = "Фея поблизости поделилась со мной своим плохим настроением."
	icon_state = "stressb"

/datum/status_effect/debuff/seelie_wing_curse
	id = "seelie_wing_curse"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/seelie_wing_curse
	effectedstats = list("fortune" = -2)
	duration = 4 MINUTES

/atom/movable/screen/alert/status_effect/debuff/seelie_wing_curse
	name = "Проклятие Феи"
	desc = "Меня обрекли на проклятье за свой ужасный поступок..."
	icon_state = "stressb"

/// Ravox Curses
/datum/status_effect/debuff/ravox_burden
	id = "ravox_burden"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/ravox_burden
	effectedstats = list("speed" = -2, "endurance" = -3)
	duration = 12 SECONDS

/atom/movable/screen/alert/status_effect/debuff/ravox_burden
	name = "Бремя Равокса"
	desc = "Какая-то божественная сила напрягает мой разум!"
	icon_state = "muscles"


// Darkling debuffs
/datum/status_effect/debuff/darkling_glare
	id = "darkling_glare"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/darkling_glare
	effectedstats = list("perception" = -1)
	duration = 10 SECONDS

/atom/movable/screen/alert/status_effect/debuff/darkling_glare
	name = "Перенапряжение глаз"
	desc = "Глаза начинают слезиться, свет обжигает."
	icon_state = "stressb"

/datum/status_effect/debuff/darkling_migraine
	id = "darkling_migraine"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/darkling_migraine
	effectedstats = list("endurance" = -1, "intelligence" = -1) //Will basically always be stacked with the eye strain penalty
	duration = 20 SECONDS

/atom/movable/screen/alert/status_effect/debuff/darkling_migraine
	name = "Мигрень"
	icon_state = "muscles"
	desc = "Голова раскалывается, я едва могу думать. Мне нужно уйти от света и немного отдохнуть!"


/// Strengthen undead debuff
/datum/status_effect/debuff/weaken_living
	id = "weaken_living"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/weaken_living
	effectedstats = list("speed" = -3, "constitution" = -3)
	duration = 25 SECONDS

/atom/movable/screen/alert/status_effect/debuff/weaken_living
	name = "Смертная слабость"
	desc = "Я чувствую холодные объятия смерти, проникающие в мое нутро."
	icon_state = "muscles"

/datum/status_effect/debuff/death_weaken
	id = "death_weaken"
	alert_type = null
	status_type = STATUS_EFFECT_UNIQUE
	examine_text = span_notice("В теле нет целостности, как будто какая-то часть осталась позади.")
	effectedstats = list("strength" = -2, "perception" = -2, "intelligence" = -2, "constitution" = -2, "endurance" = -2, "speed" = -2)
	var/extralives = 1
