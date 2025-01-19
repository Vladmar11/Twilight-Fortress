// Mental-based archetypes
/datum/statpack/mental/scholarly
	name = "Знающий"
	desc = "Сотни прочитанных книг. Один вывод: знания - сила. Но хватит ли у тебя мудрости использовать силу правильно?"
	stat_array =  list(STAT_STRENGTH = -1, STAT_PERCEPTION = 1, STAT_INTELLIGENCE = 2, STAT_ENDURANCE = -1)

/datum/statpack/mental/faithdriven
	name = "Набожный"
	desc = "Ты привык, что рука твоего бога ведёт тебя и твоему телу нужно лишь выдержать все преграды на этом нелёгком пути. К сожалению, сам ты стал слеп."
	stat_array = list(STAT_PERCEPTION = -2, STAT_INTELLIGENCE = 1, STAT_CONSTITUTION = 1, STAT_ENDURANCE = 1)

/datum/statpack/mental/zealous
	name = "Одержимый"
	desc = "Невероятно сильная идея заставляет тебя медленно идти к ней сквозь самые неприступные преграды."
	stat_array = list(STAT_STRENGTH = 1, STAT_PERCEPTION = -1, STAT_INTELLIGENCE = 1, STAT_ENDURANCE = 1, STAT_SPEED = -1)

/datum/statpack/mental/augury
	name = "Мудрый"
	desc = "Ты осознаёшь настоящее, а следовательно - можешь предполагать будущее."
	stat_array = list(STAT_STRENGTH = -1, STAT_PERCEPTION = 2, STAT_INTELLIGENCE = 1, STAT_ENDURANCE = -1)

/datum/statpack/mental/adept
	name = "Ищущий"
	desc = "Сквозь тернии к звёздам ты пойдёшь; пойдёшь и нас с собою поведёшь."
	stat_array = list(STAT_STRENGTH = -1, STAT_PERCEPTION = 1, STAT_INTELLIGENCE = 1, STAT_CONSTITUTION = -1, STAT_SPEED = 1)
