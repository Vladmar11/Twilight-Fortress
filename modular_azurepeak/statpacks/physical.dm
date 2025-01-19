// Martial/warrior archetypes

/datum/statpack/physical/trained
	name = "Подтянутый"
	desc = "Ни воскресная школа, ни наставник не смогли заместить собой твоё утешение: ведро воды, площадка, упражнения."
	stat_array = list(STAT_STRENGTH = 1, STAT_PERCEPTION = -1, STAT_INTELLIGENCE = -1, STAT_CONSTITUTION = 1, STAT_ENDURANCE = 1)

/datum/statpack/physical/muscular
	name = "Мощный"
	desc = "Союз ежедневного перетаскивания мешков с картошкой и хорошего питания дал свои плоды: твои мышцы вздулись, но в голове беззаботно гуляет ветер."
	stat_array = list(STAT_STRENGTH = 2, STAT_INTELLIGENCE = -2, STAT_CONSTITUTION = 1)

/datum/statpack/physical/tactician
	name = "Зрячий"
	desc = "Ты жил в лесу и просто до ужаса боялся волков: каждый день ты готовился к их нападению и даже прочитал пару бестиариев, пропустив множество семейных обедов."
	stat_array = list(STAT_STRENGTH = 1, STAT_PERCEPTION = 1, STAT_INTELLIGENCE = 1, STAT_CONSTITUTION = -1, STAT_ENDURANCE = -1)

/datum/statpack/physical/taut
	name = "Зашуганный"
	desc = "В детстве тебя много били, что вынудило тебя взять яйца в кулак и начать бить первым... Просто ради ошеломления врага, чтобы затем кабанчиком сбежать."
	stat_array = list(STAT_STRENGTH = 1, STAT_PERCEPTION = -1, STAT_CONSTITUTION = -1, STAT_ENDURANCE = 1, STAT_SPEED = 1)

/datum/statpack/physical/toil
	name = "Бывалый"
	desc = "Ты работал на одной из новоявленных мануфактур. Зизовы условия труда и частые производственные травмы превратили твою кожу в сплошную мозоль, а мозг - в губку."
	stat_array = list(STAT_PERCEPTION = -1, STAT_INTELLIGENCE = -1, STAT_CONSTITUTION = 1, STAT_ENDURANCE = 2)
