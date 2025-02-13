#define GUILLOTINE_BLADE_MAX_SHARP  5 // This is maxiumum sharpness and will decapitate without failure
#define GUILLOTINE_DECAP_MIN_SHARP  4 // Minimum amount of sharpness for decapitation. Any less and it will just do severe brute damage. 2 executions before it needs to be sharpened.
#define GUILLOTINE_ANIMATION_LENGTH 5 // How many deciseconds the animation is
#define GUILLOTINE_ANIMATION_RAISE_LENGTH 36
#define GUILLOTINE_BLADE_RAISED     1
#define GUILLOTINE_BLADE_MOVING     2
#define GUILLOTINE_BLADE_DROPPED    3
#define GUILLOTINE_BLADE_SHARPENING 4
#define GUILLOTINE_HEAD_OFFSET      16 // How much we need to move the player to center their head
#define GUILLOTINE_LAYER_DIFF       1.2 // How much to increase/decrease a head when it's buckled/unbuckled
#define GUILLOTINE_ACTIVATE_DELAY   30 // Delay for executing someone
#define GUILLOTINE_WRENCH_DELAY     10
#define GUILLOTINE_ACTION_INUSE      5
#define GUILLOTINE_ACTION_WRENCH     6

/obj/structure/guillotine
	name = "гильотина"
	desc = ""
	icon = 'icons/obj/guillotine.dmi'
	icon_state = "guillotine_raised"
	can_buckle = TRUE
	anchored = TRUE
	density = TRUE
	max_buckled_mobs = 1
	buckle_lying = FALSE
	buckle_prevents_pull = TRUE
	layer = ABOVE_MOB_LAYER
	plane = GAME_PLANE_UPPER
	var/blade_status = GUILLOTINE_BLADE_RAISED
	var/blade_sharpness = GUILLOTINE_BLADE_MAX_SHARP // How sharp the blade is
	var/kill_count = 0
	var/current_action = 0 // What's currently happening to the guillotine

/obj/structure/guillotine/Initialize()
	LAZYINITLIST(buckled_mobs)
	. = ..()

/obj/structure/guillotine/examine(mob/user)
	..()
	var/msg = "Лезвие "

	if (blade_status == GUILLOTINE_BLADE_RAISED)
		msg += "поднято, готовое упасть, и"

		if (blade_sharpness >= GUILLOTINE_DECAP_MIN_SHARP)
			msg += " выглядит достаточно острым, чтобы обезглавить обреченного без какого-либо сопротивления."
		else
			msg += " выглядит не особенно острым. Возможно, для его заточки можно использовать камень."
	else
		msg += "упало вниз."
	to_chat(user, "<span class='info'>[msg]</span>")

/obj/structure/guillotine/attack_hand(mob/user)
	add_fingerprint(user)

	// Currently being used by something
	if (current_action)
		return

	if (LAZYLEN(buckled_mobs))
		var/mob/living/carbon/human/H = buckled_mobs[1]

		if(H == user)
			return

		if (H)
			H.regenerate_icons()

		unbuckle_all_mobs()

/obj/structure/guillotine/attack_right(mob/user)
	if(.)
		return
	user.changeNext_move(CLICK_CD_MELEE)
	add_fingerprint(user)

	// Currently being used by something
	if (current_action)
		return

	switch (blade_status)
		if (GUILLOTINE_BLADE_MOVING)
			return
		if (GUILLOTINE_BLADE_DROPPED)
			blade_status = GUILLOTINE_BLADE_MOVING
			icon_state = "guillotine_raise"
			addtimer(CALLBACK(src, PROC_REF(raise_blade)), GUILLOTINE_ANIMATION_RAISE_LENGTH)
			return
		if (GUILLOTINE_BLADE_RAISED)
			if (LAZYLEN(buckled_mobs))
				user.visible_message(span_warning("[user] начинает тянуть за рычаг!"),
					                 span_warning("Я начинаю тянуть за рычаг!"))
				current_action = GUILLOTINE_ACTION_INUSE

				if (do_after(user, GUILLOTINE_ACTIVATE_DELAY, target = src) && blade_status == GUILLOTINE_BLADE_RAISED)
					current_action = 0
					blade_status = GUILLOTINE_BLADE_MOVING
					playsound(src, 'sound/misc/wood_saw.ogg', 100, TRUE)
					icon_state = "guillotine_drop"
					addtimer(CALLBACK(src, PROC_REF(drop_blade), user), GUILLOTINE_ANIMATION_LENGTH) // Minus two so we play the sound and decap faster
				else
					current_action = 0
			else
				blade_status = GUILLOTINE_BLADE_MOVING
				playsound(src, 'sound/misc/wood_saw.ogg', 100, TRUE)
				icon_state = "guillotine_drop"
				addtimer(CALLBACK(src, PROC_REF(drop_blade)), GUILLOTINE_ANIMATION_LENGTH)

/obj/structure/guillotine/proc/raise_blade()
	blade_status = GUILLOTINE_BLADE_RAISED
	icon_state = "guillotine_raised"

/obj/structure/guillotine/proc/drop_blade(mob/user)
	if (buckled_mobs.len && blade_sharpness)
		var/mob/living/carbon/human/H = buckled_mobs[1]

		if (!H)
			return

		var/obj/item/bodypart/head/head = H.get_bodypart("head")

		if (QDELETED(head))
			return

		playsound(src, 'sound/misc/guillotine.ogg', 100, TRUE)

		// The delay is to making large crowds have a longer laster applause
		var/delay_offset = 0

		if(blade_sharpness >= GUILLOTINE_DECAP_MIN_SHARP || head.brute_dam >= 100)
			if(head.dismemberable)
				head.dismember()
			else
				H.death()
			log_combat(user, H, "beheaded", src)
			H.regenerate_icons()
			unbuckle_all_mobs()
			kill_count += 1

//			H.adjust_triumphs(-1)

			var/blood_overlay = "bloody"

			if (kill_count == 2)
				blood_overlay = "bloodier"
			else if (kill_count > 2)
				blood_overlay = "bloodiest"

			blood_overlay = "guillotine_" + blood_overlay + "_overlay"
			cut_overlays()
			add_overlay(mutable_appearance(icon, blood_overlay))

			// The crowd is pleased
			for(var/mob/M in viewers(src, 7))
				var/mob/living/carbon/human/C = M
				if (ishuman(M))
					C.add_stress(/datum/stressevent/guillotinekill)
					addtimer(CALLBACK(C, TYPE_PROC_REF(/mob, emote), "clap"), delay_offset * 0.3)
					delay_offset++
		else
			H.apply_damage(30 * blade_sharpness, BRUTE, head)
			log_combat(user, H, "dropped the blade on", src, " non-fatally")
			H.emote("scream")
			// Executor has failed and was ashamed
			user.add_stress(/datum/stressevent/guillotineexecutorfail)
			// The crowd is unpleased
			for(var/mob/M in viewers(src, 7))
				var/mob/living/carbon/human/C = M
				if (ishuman(M))
					C.add_stress(/datum/stressevent/guillotinefail)
					addtimer(CALLBACK(C, TYPE_PROC_REF(/mob, emote), "huh"), delay_offset * 0.3)
					delay_offset++

		if (blade_sharpness > 1)
			blade_sharpness -= 1

	blade_status = GUILLOTINE_BLADE_DROPPED
	icon_state = "guillotine"

/obj/structure/guillotine/attackby(obj/item/W, mob/user, params)
	if (istype(W, /obj/item/natural/stone))
		add_fingerprint(user)
		if (blade_status == GUILLOTINE_BLADE_SHARPENING)
			return

		if (blade_status == GUILLOTINE_BLADE_RAISED)
			if (blade_sharpness < GUILLOTINE_BLADE_MAX_SHARP)
				blade_status = GUILLOTINE_BLADE_SHARPENING
				if(do_after(user, 7, target = src))
					blade_status = GUILLOTINE_BLADE_RAISED
					user.visible_message(span_notice("[user] затачивает большое лезвие гильотины."),
						                 span_notice("Я затачиваю большое лезвие гильотины."))
					blade_sharpness += 1
					playsound(src, 'sound/items/sharpen_long1.ogg', 100, TRUE)
					return
				else
					blade_status = GUILLOTINE_BLADE_RAISED
					return
			else
				to_chat(user, span_warning("Лезвие достаточно острое!"))
				return
		else
			to_chat(user, span_warning("Мне нужно поднять лезвие, чтобы заточить его!"))
			return
	else
		return ..()

/obj/structure/guillotine/buckle_mob(mob/living/M, force = FALSE, check_loc = TRUE)
	if (!anchored)
		return FALSE

	if ((!istype(M, /mob/living/carbon/human)) || HAS_TRAIT(M, TRAIT_TINY))
		to_chat(usr, span_warning("Не похоже, что [M] можно разместить на гильотине!"))
		return FALSE // Can't decapitate non-humans

	if (blade_status != GUILLOTINE_BLADE_RAISED)
		to_chat(usr, span_warning("Мне нужно поднять лезвие, прежде чем положить кого-то!"))
		return FALSE

	return ..(M, force, FALSE)

/obj/structure/guillotine/post_buckle_mob(mob/living/M)
	if (!istype(M, /mob/living/carbon/human))
		return

	var/mob/living/carbon/human/H = M

	if (H.dna)
		if (H.dna.species)
			var/datum/species/S = H.dna.species

			if (istype(S))
				H.cut_overlays()
				H.regenerate_icons()
				H.update_body_parts_head_only()
				H.set_mob_offsets("bed_buckle", _x = 0, _y = -GUILLOTINE_HEAD_OFFSET)
				H.layer += GUILLOTINE_LAYER_DIFF
			else
				unbuckle_all_mobs()
		else
			unbuckle_all_mobs()
	else
		unbuckle_all_mobs()

	..()

/obj/structure/guillotine/post_unbuckle_mob(mob/living/M)
	M.regenerate_icons()
	M.reset_offsets("bed_buckle")
	M.layer -= GUILLOTINE_LAYER_DIFF
	..()

/obj/structure/guillotine/can_be_unfasten_wrench(mob/user, silent)
	if (LAZYLEN(buckled_mobs))
		if (!silent)
			to_chat(user, span_warning("Не могу открутить, кто-то пристегнут к гильотине!"))
		return FAILED_UNFASTEN

	if (current_action)
		return FAILED_UNFASTEN

	return ..()

/obj/structure/guillotine/wrench_act(mob/living/user, obj/item/I)
	. = ..()
	if (current_action)
		return

	current_action = GUILLOTINE_ACTION_WRENCH

	if (do_after(user, GUILLOTINE_WRENCH_DELAY, target = src))
		current_action = 0
		default_unfasten_wrench(user, I, 0)
		setDir(SOUTH)
		return TRUE
	else
		current_action = 0

#undef GUILLOTINE_BLADE_MAX_SHARP
#undef GUILLOTINE_DECAP_MIN_SHARP
#undef GUILLOTINE_ANIMATION_LENGTH
#undef GUILLOTINE_BLADE_RAISED
#undef GUILLOTINE_BLADE_MOVING
#undef GUILLOTINE_BLADE_DROPPED
#undef GUILLOTINE_BLADE_SHARPENING
#undef GUILLOTINE_HEAD_OFFSET
#undef GUILLOTINE_LAYER_DIFF
#undef GUILLOTINE_ACTIVATE_DELAY
#undef GUILLOTINE_WRENCH_DELAY
#undef GUILLOTINE_ACTION_INUSE
#undef GUILLOTINE_ACTION_WRENCH
