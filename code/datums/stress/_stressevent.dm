/datum/stressevent
	var/timer
	var/stressadd = 0
	var/desc
	var/time_added
	var/stacks = 0
	var/max_stacks = 1
	var/stressadd_per_extra_stack = 0
	var/mob/owner

/datum/stressevent/proc/can_apply(mob/living/user)
	return TRUE

/datum/stressevent/proc/get_stress(mob/living/user)
	return stressadd + ((stacks - 1) * stressadd_per_extra_stack)

/datum/stressevent/New(mob/M, param)
	owner = M
	add_effects(param)

/datum/stressevent/Destroy()
	remove_effects()
	owner = null
	return ..()

/datum/stressevent/proc/on_apply(mob/living/user)
	return

/datum/stressevent/proc/add_effects(param)
	return

/datum/stressevent/proc/remove_effects()
	return

/datum/stressevent/test
	timer = 5 SECONDS
	stressadd = 3
	desc = span_red("This is a positive test event.")

/datum/stressevent/testr
	timer = 5 SECONDS
	stressadd = -3
	desc = span_green("This is a negative test event.")
