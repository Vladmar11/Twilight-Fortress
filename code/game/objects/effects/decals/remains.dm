/obj/effect/decal/remains
	name = "останки"
	gender = PLURAL
	icon = 'icons/effects/blood.dmi'

/obj/effect/decal/remains/acid_act()
	visible_message(span_warning("[src] dissolve[gender==PLURAL?"":"s"] into a puddle of sizzling goop!"))
	playsound(src, 'sound/blank.ogg', 150, TRUE)
	new /obj/effect/decal/cleanable/greenglow(drop_location())
	qdel(src)

/obj/effect/decal/remains/human
	desc = ""
	icon_state = "remains"

/obj/effect/decal/remains/plasma
	icon_state = "remainsplasma"

/obj/effect/decal/remains/xeno
	desc = ""
	icon_state = "remainsxeno"

/obj/effect/decal/remains/xeno/larva
	icon_state = "remainslarva"

/obj/effect/decal/remains/robot
	desc = ""
	icon = 'icons/mob/robots.dmi'
	icon_state = "remainsrobot"

/obj/effect/decal/cleanable/robot_debris/old
	name = "dusty robot debris"
	desc = ""
