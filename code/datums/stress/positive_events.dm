/datum/stressevent/psyprayer
	timer = 30 MINUTES
	stressadd = -2
	desc = span_green("Боги улыбнулись мне.")

/datum/stressevent/blueb
	timer = 1 MINUTES
	stressadd = -2
	desc = span_green("Это приятное чувство.")

/datum/stressevent/cumok
	timer = 60 MINUTES
	stressadd = -3
/datum/stressevent/cumok/add_effects(param)
	. = ..()
	var/mob/living/carbon/human/owner_mob = owner_mob()
	desc = span_green("Я кончил[owner_mob.rus_a()].")

/datum/stressevent/cumgood
	timer = 60 MINUTES
	stressadd = -5
/datum/stressevent/cumgood/add_effects(param)
	. = ..()
	var/mob/living/carbon/human/owner_mob = owner_mob()
	desc = span_boldgreen("Я испытал[owner_mob.rus_a()] невероятное удовольствие.")

/datum/stressevent/lovezizo
	timer = 99999 MINUTES
	stressadd = -10 
	desc = "<span class='green'>ЗИЗОЗИЗОЗИЗОЗИЗО</span>"

/datum/stressevent/viewsinpunish
	timer = 5 MINUTES
	stressadd = -2
/datum/stressevent/viewsinpunish/add_effects(param)
	. = ..()
	var/mob/living/carbon/human/owner_mob = owner_mob()
	desc = span_green("Я видел[owner_mob.rus_a()], как грешник был наказан! Поделом!")

/datum/stressevent/joke
	timer = 30 MINUTES
	stressadd = -2
/datum/stressevent/joke/add_effects(param)
	. = ..()
	var/mob/living/carbon/human/owner_mob = owner_mob()
	desc = span_green("Я услышал[owner_mob.rus_a()] хорошую шутку.")

/datum/stressevent/tragedy
	timer = 30 MINUTES
	stressadd = -2
	desc = span_green("В конце концов, жизнь не так уж и плоха.")

/datum/stressevent/blessed
	timer = 60 MINUTES
	stressadd = -2
	desc = span_green("Я чувствую умиротворение.")

/datum/stressevent/triumph
	timer = 10 MINUTES
	stressadd = -5
	desc = span_boldgreen("Я помню о своем ТРИУМФЕ.")

/datum/stressevent/drunk
	timer = 1 MINUTES
	stressadd = -2
	desc = list(span_green("Алкоголь облегчает боль на душе."),span_green("Алкоголь, мой лучший друг."))

/datum/stressevent/pweed
	timer = 1 MINUTES
	stressadd = -2
	desc = list(span_green("Расслабляющий дым заполняет легкие."),span_green("Ароматный дым успокаивает меня."))

/datum/stressevent/weed
	timer = 5 MINUTES
	stressadd = -4
	desc = span_blue("Я люблю тебя, сладкая травка.")

/datum/stressevent/high
	timer = 5 MINUTES
	stressadd = -4
	desc = span_blue("Мне та-а-а-А-А-А-а-ак хорошо-о...")

/datum/stressevent/stuffed
	timer = 20 MINUTES
	stressadd = -1
	desc = span_green("Мой желудок полон. Это приятно!")

/datum/stressevent/prebel
	timer = 5 MINUTES
	stressadd = -5
	desc = span_boldgreen("Долой тиранию!")

/datum/stressevent/music
	timer = 1 MINUTES
	stressadd = -1
	desc = span_green("Мне нравится эта музыка.")

/datum/stressevent/music/two
	stressadd = -2
	desc = span_green("Эта музыка расслабляет.")
	timer = 2 MINUTES

/datum/stressevent/music/three
	stressadd = -2
	desc = span_green("Эта музыка снимает стресс.")
	timer = 4 MINUTES

/datum/stressevent/music/four
	stressadd = -3
	desc = span_green("Эта музыка божественна.")
	timer = 6 MINUTES

/datum/stressevent/music/five
	stressadd = -3
	timer = 8 MINUTES
	desc = span_green("Эту музыку будто играют ангелы.")

/datum/stressevent/music/six
	stressadd = -4
	timer = 10 MINUTES
	desc = span_boldgreen("Эта музыка - благословение от Эоры.")

/datum/stressevent/eora
	stressadd = -4
	timer = 6969 MINUTES //69 is the letter for E, roughly 116 hours
	desc = span_boldgreen("Эора дарит мне счастье.")

/datum/stressevent/vblood
	stressadd = -5
	desc = span_boldred("Девственная кровь!")
	timer = 5 MINUTES

/datum/stressevent/bathwater
	stressadd = -1
	desc = span_blue("Расслабляющая ванна!")
	timer = 1 MINUTES

/datum/stressevent/beautiful
	stressadd = -2
	timer = 2 MINUTES
/datum/stressevent/beautiful/add_effects(param)
	. = ..()
	var/mob/living/carbon/human/owner_mob = owner_mob()
	desc = span_green("Я увидел[owner_mob.rus_a()] прекрасное лицо.")
	

/datum/stressevent/night_owl
	stressadd = -3
	desc = span_green("Ночь такая расслабляющая и спокойная.")
	timer = 20 MINUTES

/datum/stressevent/ozium
	stressadd = -99
	timer = 2 MINUTES
/datum/stressevent/ozium/add_effects(param)
	. = ..()
	var/mob/living/carbon/human/owner_mob = owner_mob()
	desc = span_blue("Я принял[owner_mob.rus_a()] дозу, и мир без боли распахнул свои двери.")
	

/datum/stressevent/moondust
	stressadd = -6
	desc = span_boldgreen("Лунная пыль проходит сквозь меня.")
	timer = 4 MINUTES

/datum/stressevent/moondust_purest
	stressadd = -8
	desc = span_boldgreen("ЧИСТЕЙШАЯ лунная пыль проходит сквозь меня!")
	timer = 4 MINUTES

/datum/stressevent/perfume
	stressadd = -1
	desc = span_green("Меня окутывает приятный успокаивающий аромат.")
	timer = 10 MINUTES

/datum/stressevent/guillotinekill
	stressadd = -5
	desc = span_green("Отличная казнь. Хорошее современное развлечение.")
	timer = 10 MINUTES
