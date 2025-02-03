
/mob/living/carbon/human
	var/datum/charflaw/charflaw

/mob/proc/sate_addiction()
	return

/mob/living/carbon/human/sate_addiction()
	if(istype(charflaw, /datum/charflaw/addiction))
		var/datum/charflaw/addiction/A = charflaw
		if(!A.sated)
			to_chat(src, span_blue(A.sated_text))
		A.sated = TRUE
		A.time = initial(A.time) //reset roundstart sate offset to standard
		A.next_sate = world.time + A.time
		remove_stress(/datum/stressevent/vice)
		if(A.debuff)
			remove_status_effect(A.debuff)

/datum/charflaw/addiction
	var/next_sate = 0
	var/sated = TRUE
	var/time = 5 MINUTES
	var/debuff = /datum/status_effect/debuff/addiction
	var/needsate_text
	var/sated_text = "Гораздо лучше..."
	var/unsate_time


/datum/charflaw/addiction/New()
	..()
	time = rand(6 MINUTES, 30 MINUTES)
	next_sate = world.time + time

/datum/charflaw/addiction/flaw_on_life(mob/user)
	if(!ishuman(user))
		return
	if(user.mind.antag_datums)
		for(var/datum/antagonist/D in user.mind.antag_datums)
			if(istype(D, /datum/antagonist/vampirelord) || istype(D, /datum/antagonist/werewolf) || istype(D, /datum/antagonist/skeleton) || istype(D, /datum/antagonist/zombie) || istype(D, /datum/antagonist/lich))
				return
	var/mob/living/carbon/human/H = user
	var/oldsated = sated
	if(oldsated)
		if(next_sate)
			if(world.time > next_sate)
				sated = FALSE
	if(sated != oldsated)
		unsate_time = world.time
		if(needsate_text)
			to_chat(user, span_boldwarning("[needsate_text]"))
	if(!sated)
		H.add_stress(/datum/stressevent/vice)
		if(debuff)
			H.apply_status_effect(debuff)



/datum/status_effect/debuff/addiction
	id = "addiction"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/addiction
	effectedstats = list("endurance" = -1,"fortune" = -1)
	duration = 100


/atom/movable/screen/alert/status_effect/debuff/addiction
	name = "Зависимость"
	desc = ""
	icon_state = "debuff"


/// ALCOHOLIC

/datum/charflaw/addiction/alcoholic
	name = "Алкоголизм"
	desc = "Употребление алкоголя – мое любимое занятие."
	time = 40 MINUTES
	needsate_text = "Пора выпить чего покрепче."


/// JUNKIE

/datum/charflaw/addiction/junkie
	name = "Наркомания"
	desc = "Мне нужен НАСТОЯЩИЙ кайф, чтобы избавиться от боли этого гнилого мира."
	time = 40 MINUTES
	needsate_text = "Время принять немного порошка."

/// Smoker

/datum/charflaw/addiction/smoker
	name = "Курильщик"
	desc = "Мне нужно что-нибудь покурить, чтобы снять напряжение."
	time = 40 MINUTES
	needsate_text = "Время для ароматного дыма."

/// GOD-FEARING

/datum/charflaw/addiction/godfearing
	name = "Преданный последователь"
	desc = "Мне нужно помолиться своему Покровителю, их благословение сильнее."
	time = 40 MINUTES
	needsate_text = "Время молитвы."

/// ALCOHOLIC

/datum/charflaw/addiction/lovefiend
	name = "Нимфомания"
	desc = "Мне необходимо заниматься любовью!"
	time = 40 MINUTES
	needsate_text = "Похоже, я завожусь все больше."

/// SADIST

/datum/charflaw/addiction/sadist
	name = "Садизм"
	desc = "Нет большего удовольствия, чем страдания другого."
	time = 30 MINUTES
	needsate_text = "I need to hear someone whimper."

/// PYROMANIAC

/datum/charflaw/addiction/pyromaniac // from tf2?
	name = "Пиромания"
	desc = "Так весело чувствовать тепло и просто видеть, как что-то превращается в пепел!"
	time = 15 MINUTES
	needsate_text = "Мне нужно увидеть, как что-то обращается в пепел или горит. Что-угодно!"

/// KLEPTOMANIAC

/datum/charflaw/addiction/kleptomaniac
	name = "Клептомания"
	desc = "В детстве мне приходилось полагаться на воровство, чтобы выжить. Изменилось это или нет, теперь я просто не могу остановиться."
	time = 20 MINUTES
	needsate_text = "Мне нужно что-то украсть! Я умру, если не сделаю этого!"

