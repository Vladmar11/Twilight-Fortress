/datum/stressevent/vice
	timer = 5 MINUTES
	stressadd = 5
	desc = list(span_boldred("Я не потворствую своему пороку."),span_boldred("Мне нужно утолить свои порочные нужды."))

/datum/stressevent/miasmagas
	timer = 10 SECONDS
	stressadd = 2
	desc = span_red("Здесь пахнет смертью.")

/datum/stressevent/miasmagas/can_apply(mob/living/user)
	if(HAS_TRAIT(user, TRAIT_ORGAN_EATER) || HAS_TRAIT(user, TRAIT_NASTY_EATER) || HAS_TRAIT(user, TRAIT_NOSTINK))
		return FALSE
	return TRUE

/datum/stressevent/peckish
	timer = 10 MINUTES
	stressadd = 1
	desc = span_red("Перекусить бы.")

/datum/stressevent/hungry
	timer = 10 MINUTES
	stressadd = 3
/datum/stressevent/hungry/add_effects(param)
	. = ..()
	var/mob/living/carbon/human/owner_mob = owner_mob()
	desc = span_red("Я проголода[owner_mob.rus_sya()].")

/datum/stressevent/starving
	timer = 10 MINUTES
	stressadd = 5
	desc = span_boldred("Я умираю с голоду.")

/datum/stressevent/drym
	timer = 10 MINUTES
	stressadd = 1
/datum/stressevent/drym/add_effects(param)
	. = ..()
	var/mob/living/carbon/human/owner_mob = owner_mob()
	desc = span_red("Я бы выпил[owner_mob.rus_a()] немного воды.")

/datum/stressevent/thirst
	timer = 10 MINUTES
	stressadd = 3
	desc = span_red("Я сильно хочу пить.")

/datum/stressevent/parched
	timer = 10 MINUTES
	stressadd = 5
	desc = span_boldred("Я умираю от жажды.")

/datum/stressevent/dismembered
	timer = 40 MINUTES
	stressadd = 5
	desc = span_boldred("Мне оторвало конечность.")

/datum/stressevent/dismembered/can_apply(mob/living/user)
	if(user.has_flaw(/datum/charflaw/masochist))
		return FALSE
	return TRUE

/datum/stressevent/dwarfshaved
	timer = 40 MINUTES
	stressadd = 6
	desc = span_boldred("Я лучше перережу себе горло, чем свою бороду.")

/datum/stressevent/guillotinefail
	timer = 5 MINUTES
	stressadd = 3
	desc = span_red("Эта казнь - отстой!")

/datum/stressevent/guillotineexecutorfail
	timer = 15 MINUTES
	stressadd = 5
	desc = span_boldred("У меня не получилось нормально казнить на гильотине! Какой позор!")

/datum/stressevent/viewdismember
	timer = 15 MINUTES
	max_stacks = 5
	stressadd = 2
	stressadd_per_extra_stack = 2
	desc = span_red("Как на скотобойне...")

/datum/stressevent/viewdismember/can_apply(mob/living/user)
	if(HAS_TRAIT(user, TRAIT_ORGAN_EATER) || HAS_TRAIT(user, TRAIT_STEELHEARTED))
		return FALSE
	return TRUE

/datum/stressevent/fviewdismember
	timer = 1 MINUTES
	max_stacks = 10
	stressadd = 1
	stressadd_per_extra_stack = 1
/datum/stressevent/fviewdismember/add_effects(param)
	. = ..()
	var/mob/living/carbon/human/owner_mob = owner_mob()
	desc = span_red("Я увидел[owner_mob.rus_a()] что-то ужасное!")

/datum/stressevent/fviewdismember/can_apply(mob/living/user)
	if(HAS_TRAIT(user, TRAIT_ORGAN_EATER) || HAS_TRAIT(user, TRAIT_STEELHEARTED))
		return FALSE
	return TRUE

/datum/stressevent/viewgib
	timer = 5 MINUTES
	stressadd = 2
/datum/stressevent/viewgib/add_effects(param)
	. = ..()
	var/mob/living/carbon/human/owner_mob = owner_mob()
	desc = span_red("Я увидел[owner_mob.rus_a()] что-то отвратительное!")

/datum/stressevent/viewgib/can_apply(mob/living/user)
	if(HAS_TRAIT(user, TRAIT_ORGAN_EATER))
		return FALSE
	return TRUE

/datum/stressevent/bleeding
	timer = 2 MINUTES
	stressadd = 2
	desc = list(span_red("Мне кажется, я истекаю кровью."),span_red("У меня кровь течет."))

/datum/stressevent/bleeding/can_apply(mob/living/user)
	if(user.has_flaw(/datum/charflaw/masochist))
		return FALSE
	return TRUE

/datum/stressevent/painmax
	timer = 1 MINUTES
	stressadd = 2
	desc = span_red("БОЛЬНО!")

/datum/stressevent/painmax/can_apply(mob/living/user)
	if(user.has_flaw(/datum/charflaw/masochist))
		return FALSE
	return TRUE

/datum/stressevent/freakout
	timer = 15 SECONDS
	stressadd = 2
	desc = span_red("Меня охватила паника!")

/datum/stressevent/felldown
	timer = 1 MINUTES
	stressadd = 1
/datum/stressevent/felldown/add_effects(param)
	. = ..()
	var/mob/living/carbon/human/owner_mob = owner_mob()
	desc = span_red("Я упал[owner_mob.rus_a()]. Какая оплошность!")

/datum/stressevent/hatezizo
	timer = 999 MINUTES
	stressadd = 10
	desc = "<span class='red'>ЗИЗОЗИЗОЗИЗОЗИЗО</span>"

/datum/stressevent/hatezizo/can_apply(mob/living/user)
	if(HAS_TRAIT(user, TRAIT_ZIZO_MARKED))
		return FALSE
	return TRUE

/datum/stressevent/burntmeal
	timer = 2 MINUTES
	stressadd = 2
	desc = span_red("Меня тошнит от подгоревшей пищи!")

/datum/stressevent/burntmeal/can_apply(mob/living/user)
	if(HAS_TRAIT(user, TRAIT_NASTY_EATER))
		return FALSE
	return TRUE

/datum/stressevent/rotfood
	timer = 2 MINUTES
	stressadd = 4
	desc = span_red("Меня тошнит от гнилой пищи!")

/datum/stressevent/rotfood/can_apply(mob/living/user)
	if(HAS_TRAIT(user, TRAIT_NASTY_EATER))
		return FALSE
	return TRUE

/datum/stressevent/psycurse
	timer = 999 MINUTES
	stressadd = 5
/datum/stressevent/psycurse/add_effects(param)
	. = ..()
	var/mob/living/carbon/human/owner_mob = owner_mob()
	desc = span_boldred("О, нет! Я получил[owner_mob.rus_a()] божественное наказание!")

/datum/stressevent/virginchurch
	timer = 999 MINUTES
	stressadd = 10
/datum/stressevent/virginchurch/add_effects(param)
	. = ..()
	var/mob/living/carbon/human/owner_mob = owner_mob()
	desc = span_boldred("Я нарушил[owner_mob.rus_a()] клятву целомудрия перед богами!")

/datum/stressevent/badmeal
	timer = 3 MINUTES
	stressadd = 2
	desc = span_red("Какой МЕРЗКИЙ вкус!")

/datum/stressevent/badmeal/can_apply(mob/living/user)
	if(HAS_TRAIT(user, TRAIT_NASTY_EATER))
		return FALSE
	return TRUE

/datum/stressevent/vomit
	timer = 3 MINUTES
	stressadd = 2
	max_stacks = 3
	stressadd_per_extra_stack = 2
	desc = span_red("Меня вырвало!")

/datum/stressevent/vomit/can_apply(mob/living/user)
	if(HAS_TRAIT(user, TRAIT_NASTY_EATER))
		return FALSE
	return TRUE

/datum/stressevent/vomitself
	timer = 3 MINUTES
	stressadd = 2
	max_stacks = 3
	stressadd_per_extra_stack = 2
/datum/stressevent/vomitself/add_effects(param)
	. = ..()
	var/mob/living/carbon/human/owner_mob = owner_mob()
	desc = span_red("Я вырвал[owner_mob.rus_a()] прямо на себя!")

/datum/stressevent/cumbad
	timer = 5 MINUTES
	stressadd = 5
	desc = span_boldred("Меня опорочили...")

/datum/stressevent/cumbad/can_apply(mob/living/user)
	if(HAS_TRAIT(user, TRAIT_CRACKHEAD))
		return FALSE
	return TRUE

/datum/stressevent/cumcorpse
	timer = 1 MINUTES
	stressadd = 10
/datum/stressevent/cumcorpse/add_effects(param)
	. = ..()
	var/mob/living/carbon/human/owner_mob = owner_mob()
	desc = span_boldred("Что я наделал[owner_mob.rus_a()]..?")

/datum/stressevent/cumcorpse/can_apply(mob/living/user)
	if(HAS_TRAIT(user, TRAIT_CRACKHEAD))
		return FALSE
	return TRUE

/datum/stressevent/leechcult
	timer = 1 MINUTES
	stressadd = 3
	desc = list("<span class='red'>В моей голове сидит маленький гоблин, который говорит мне что-то делать, и мне это не нравится!</span>","<span class='red'>\"Убей своих друзей.\"</span>","<span class='red'>\"Пусть истекают кровью.\"</span>","<span class='red'>\"Не дай им времени визжать.\"</span>","<span class='red'>\"Восславь Зизо.\"</span>","<span class='red'>\"Смерть Десяти!\"</span>","<span class='red'>\"Плачущий плачет в последний раз.\"</span>")

/datum/stressevent/delf
	timer = 1 MINUTES
	stressadd = 1
	desc = span_red("Стоит держаться подальше...")

/datum/stressevent/shunned_race
	timer = 1 MINUTES
	stressadd = 1
	desc = span_red("Стоит держаться подальше...")

/datum/stressevent/shunned_race_xenophobic
	timer = 2 MINUTES
	stressadd = 5
	desc = span_red("Отвратительные пришлые, подите прочь!")

/datum/stressevent/paracrowd
	timer = 15 SECONDS
	stressadd = 2
	desc = span_red("Здесь слишком много тех, кто не похож на меня.")

/datum/stressevent/parablood
	timer = 15 SECONDS
	stressadd = 3
	desc = span_red("Здесь столько крови... как на поле боя!")

/datum/stressevent/viewdismember/can_apply(mob/living/user)
	if(HAS_TRAIT(user, TRAIT_ORGAN_EATER) || HAS_TRAIT(user, TRAIT_STEELHEARTED))
		return FALSE
	return TRUE

/datum/stressevent/parastr
	timer = 2 MINUTES
	stressadd = 2
	desc = span_red("Этот зверь сильнее меня... он может легко меня убить!")

/datum/stressevent/paratalk
	timer = 2 MINUTES
	stressadd = 2
	desc = span_red("Злые языки что-то замышляют против меня...")

/datum/stressevent/jesterphobia
	timer = 4 MINUTES
	stressadd = 5
	desc = span_boldred("Нет! Уберите этого шута от меня!")

/datum/stressevent/coldhead
	timer = 60 SECONDS
	stressadd = 1
	desc = span_red("Моя голова ничем не покрыта.")

/datum/stressevent/sleepytime
	timer = 40 MINUTES
	stressadd = 2
/datum/stressevent/sleepytime/add_effects(param)
	. = ..()
	var/mob/living/carbon/human/owner_mob = owner_mob()
	desc = span_red("Я устал[owner_mob.rus_a()].")

/datum/stressevent/tortured
	stressadd = 3
	max_stacks = 5
	stressadd_per_extra_stack = 2
	timer = 60 SECONDS
/datum/stressevent/tortured/add_effects(param)
	. = ..()
	var/mob/living/carbon/human/owner_mob = owner_mob()
	desc = span_boldred("Я сломан[owner_mob.rus_a()]. Я так больше не могу!")

/datum/stressevent/confessed
	stressadd = 3
	timer = 15 MINUTES
/datum/stressevent/confessed/add_effects(param)
	. = ..()
	var/mob/living/carbon/human/owner_mob = owner_mob()
	desc = span_red("Я призна[owner_mob.rus_sya()] во грехе.")
	

/datum/stressevent/confessedgood
	stressadd = 1
	timer = 15 MINUTES
/datum/stressevent/confessedgood/add_effects(param)
	. = ..()
	var/mob/living/carbon/human/owner_mob = owner_mob()
	desc = span_red("Я призна[owner_mob.rus_sya()] во грехе, но мне от этого стало легче.")
	

/datum/stressevent/saw_wonder
	stressadd = 4
	timer = 999 MINUTES
/datum/stressevent/saw_wonder/add_effects(param)
	. = ..()
	var/mob/living/carbon/human/owner_mob = owner_mob()
	desc = span_boldred("<B>Я увидел[owner_mob.rus_a()] нечто кошмарное и теперь боюсь за свою жизнь.!</B>")
	

/datum/stressevent/maniac_woke_up
	stressadd = 10
	desc = span_boldred("Нет... Я хочу вернуться...")
	timer = 999 MINUTES

/datum/stressevent/drankrat
	stressadd = 1
	timer = 1 MINUTES
/datum/stressevent/drankrat/add_effects(param)
	. = ..()
	var/mob/living/carbon/human/owner_mob = owner_mob()
	desc = span_red("Я пил[owner_mob.rus_a()] кровь из меньшего существа.")


/datum/stressevent/lowvampire
	stressadd = 1
/datum/stressevent/lowvampire/add_effects(param)
	. = ..()
	var/mob/living/carbon/human/owner_mob = owner_mob()
	desc = span_red("Я мертв[owner_mob.rus_a()]... что теперь?")

/datum/stressevent/oziumoff
	stressadd = 10
	desc = span_blue("Мне нужна еще одна доза.")
	timer = 1 MINUTES

/datum/stressevent/ooc_ic
	stressadd = 6
	timer = 5 MINUTES
/datum/stressevent/ooc_ic/add_effects(param)
	. = ..()
	var/mob/living/carbon/human/owner_mob = owner_mob()
	desc = span_boldred("Плохое предзнаменование! Будто бы я сломал[owner_mob.rus_a()] какую-то стену...")


/datum/stressevent/sleepfloor
	stressadd = 3
	timer = 1 MINUTES
/datum/stressevent/sleepfloor/add_effects(param)
	. = ..()
	var/mob/living/carbon/human/owner_mob = owner_mob()
	desc = "Я спал[owner_mob.rus_a()] на полу. Это было неудобно."
	

/datum/stressevent/sleepfloornoble
	stressadd = 6
	timer = 3 MINUTES
/datum/stressevent/sleepfloornoble/add_effects(param)
	. = ..()
	var/mob/living/carbon/human/owner_mob = owner_mob()
	desc = "Я спал[owner_mob.rus_a()] на полу! Я что, по-вашему, какое-то животное?!"

/datum/stressevent/darkling_toobright
	stressadd = 1
	desc = span_red("Слишком ярко, свет режет глаза.")
	timer = 30 SECONDS
/datum/stressevent/darkling_migraine
	stressadd = 3
	desc = span_red("Голова раскалывается, мне нужно отдохнуть в темноте.")
	timer = 1 MINUTES
  
/datum/stressevent/crowd
	timer = 2 MINUTES
	stressadd = 2
	desc = "<span class='red'>Почему все здесь...? Они что, пытаются меня убить?!</span>"

/datum/stressevent/nopeople
	timer = 2 MINUTES
	stressadd = 2
	desc = "<span class='red'>Куда все ушли? Что-то случилось?!</span>"
