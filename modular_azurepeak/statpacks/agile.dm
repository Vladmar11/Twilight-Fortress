// Ranger/rogue archetypes
/datum/statpack/agile/swift
	name = "Быстрый"
	desc = "Ты - эталон выражения «скользкий тип». Вёрткий язык выручит тебя, а быстрые ноги спасут, когда кто-то решит использовать его не по назначению."
	stat_array = list(STAT_STRENGTH = -1, STAT_CONSTITUTION = -1, STAT_ENDURANCE = 1, STAT_SPEED = 2)

/datum/statpack/agile/hardy
	name = "Крепкий"
	desc = "Пестра одарила тебя живучестью: большинство болезней и ран сходят с тебя, как с гуся вода."
	stat_array = list(STAT_STRENGTH = -1, STAT_CONSTITUTION = 2, STAT_ENDURANCE = 1, STAT_SPEED = -1)

/datum/statpack/agile/tricky
	name = "Хитрый"
	desc = "Ухмылка на лице и чужой серебряк в кармане - что может сделать твою жизнь ещё лучше, если не толика удачи?"
	stat_array = list(STAT_STRENGTH = -1, STAT_PERCEPTION = 1, STAT_INTELLIGENCE = 1, STAT_ENDURANCE = -1, STAT_SPEED = 1, STAT_FORTUNE = list(-1, 1))

/datum/statpack/agile/thug
	name = "Разбойник"
	desc = "Городские разборки научили тебя не просто быть сильным, но и попутно присматривать за своими не самыми надёжными дружками."
	stat_array = list(STAT_STRENGTH = 2, STAT_PERCEPTION = 1, STAT_INTELLIGENCE = -1, STAT_SPEED = -1)

/datum/statpack/agile/wary
	name = "Осторожный"
	desc = "Чтобы из неприятностей не бежать - нужно в неприятности не вляпываться. Держи ушки на макушке, а глаза - на заднице."
	stat_array = list(STAT_STRENGTH = -1, STAT_PERCEPTION = 1, STAT_INTELLIGENCE = 1, STAT_CONSTITUTION = 1, STAT_SPEED = -1)
