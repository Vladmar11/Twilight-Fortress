/datum/patron/inhumen
	name = null
	associated_faith = /datum/faith/inhumen
	undead_hater = FALSE
	confess_lines = list()

/datum/patron/inhumen/graggar
	name = "Graggar"
	domain = "Бог завоеваний, убийств и мародёрства"
	desc = "Бессердечный, Граггар научил злых существ, что сила есть право, и создал гоблинов, и орков по своему образу и подобию."
	worshippers = "Заключенные, убийцы и жестокие существа"
	mob_traits = list(TRAIT_ORGAN_EATER)
	confess_lines = list(
		"ГРАГГАР - ЗВЕРЬ, КОТОРОМУ Я ПОКЛОНЯЮСЬ!",
		"ГРАГГАР НЕСЁТ НЕЧЕСТИВОЕ РАЗРУШЕНИЕ!",
		"ЧЁРНОЕ СОЛНЦЕ ТРЕБУЕТ КРОВИ!",
	)

/datum/patron/inhumen/matthios 
	name = "Matthios"
	domain = "Бог грабежа, разбоя и перераспределения богатства"
	desc = "Человек, превратившийся в бога, Маттиос учил людей, что только с помощью воровства и народных восстаний можно облегчить социальные беды."
	worshippers = "Бандиты, разбойники и угнетенные крестьяне"
	mob_traits = list(TRAIT_COMMIE)
	confess_lines = list(
		"МАТТИОС КРАДЕТ У НИКЧЕМНЫХ!",
		"МАТТИОС - ЭТО СПРАВЕДЛИВОСТЬ!",
		"МАТТИОС - МОЙ ГОСПОДИН!",
	)

/datum/patron/inhumen/baotha
    name = "Baotha"
    domain = "Богиня вырождения, разврата и наркомании"
    desc = "Женщина, превратившаяся в бога, Баота учила разумных существ, что жизнь слишком коротка, чтобы заботиться о последствиях своих удовольствий, \
	и вела их к своеобразным порокам и извращениям."
    worshippers = "Извращенцы, азартные игроки, пьяницы и барды"
    mob_traits = list(TRAIT_CRACKHEAD)
    confess_lines = list(
        "БАОТА ТРЕБУЕТ УДОВОЛЬСТВИЯ!",
        "ЖИВИ, СМЕЙСЯ, ЛЮБИ!",
        "БАОТА - МОЯ РАДОСТЬ!",
	)
