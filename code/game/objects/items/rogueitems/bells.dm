//////////////Church stuff

/obj/item/handheld_bell
	name = "церковный колокольчик"
	desc = "Маленький колокольчик, который громко звонит при использовании."
	icon = 'icons/roguetown/items/misc.dmi'
	icon_state = "churchbell"
	throw_speed = 2
	throw_range = 5
	throwforce = 5
	damtype = BRUTE
	force = 5
	hitsound = 'sound/items/bsmith1.ogg'
	var/cooldown = 3 SECONDS
	var/ringing = FALSE
	w_class = WEIGHT_CLASS_SMALL

/obj/item/handheld_bell/attack_self(mob/user)
	. = ..()
	if(ringing)
		return
	playsound(src.loc, 'sound/misc/bell.ogg', 50, 1)


	for(var/mob/M in view(10, src.loc))
		if(M.client)
			to_chat(M, span_notice("Звон колокольчика резко раздается в округе."))

	user.visible_message(span_notice("[user] звонит в [src]."))
	ringing = TRUE
	sleep(cooldown)
	ringing = FALSE

/obj/item/handheld_bell/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.4,"sx" = -1,"sy" = 0,"nx" = 11,"ny" = 1,"wx" = 0,"wy" = 1,"ex" = 4,"ey" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 15,"sturn" = 0,"wturn" = 0,"eturn" = 39,"nflip" = 8,"sflip" = 0,"wflip" = 0,"eflip" = 8)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

//////////Stationary Church bell

/obj/structure/bell_barrier
	name = "невидимый барьер"
	desc = "Невидимая преграда не дает вам двигаться через неё."
	icon = null
	icon_state = ""
	density = TRUE
	opacity = FALSE
	anchored = TRUE
	invisibility = INVISIBILITY_MAXIMUM

/obj/structure/stationary_bell
	name = "храмовый колокол"
	desc = "Большой церковный колокол, который громко звонит во всеуслышание."
	icon = 'icons/roguetown/misc/96x96.dmi'
	icon_state = "churchbell"
	anchored = TRUE
	density = TRUE
	layer = ABOVE_MOB_LAYER
	plane = GAME_PLANE_UPPER
	var/cooldown = 3 SECONDS
	var/ringing = FALSE

/*
	/obj/structure/stationary_bell/Initialize()
		. = ..()
		create_barriers()

    // Function to create barriers around the bell
	/obj/structure/stationary_bell/proc/create_barriers()
		for(var/direction in GLOB.cardinals)
			var/turf/adjacent_turf = get_step(src, direction)
			if((adjacent_turf) || istype(adjacent_turf, /obj/structure/bell_barrier))
				continue
			new /obj/structure/bell_barrier(adjacent_turf)
*/

/obj/structure/stationary_bell/attackby(obj/item/used_item, mob/user)
	if(ringing)
		return
	if(istype(used_item, /obj/item/rogueweapon/mace/church))
		playsound(loc, 'sound/misc/bell.ogg', 50, 1)
		for(var/mob/M in orange(150, src))
			if(M.client)
				to_chat(M, span_notice("Звон церковного колокола торжественно разносится по округе."))
		visible_message(span_notice("[user], используя [used_item], звонит в [src]."))
		ringing = TRUE
		sleep(cooldown)
		ringing = FALSE
	else

		return ..()
