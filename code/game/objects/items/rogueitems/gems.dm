
/obj/item/roguegem
	name = "ронц"
	icon_state = "ruby_cut"
	icon = 'icons/roguetown/items/gems.dmi'
	desc = "Его алые грани ярко сияют."
	lefthand_file = 'icons/mob/inhands/misc/food_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/misc/food_righthand.dmi'
	w_class = WEIGHT_CLASS_TINY
	slot_flags = ITEM_SLOT_MOUTH
	dropshrink = 0.4
	drop_sound = 'sound/items/gem.ogg'
	sellprice = 100
	static_price = FALSE

/obj/item/roguegem/getonmobprop(tag)
	. = ..()
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.4,"sx" = -1,"sy" = 0,"nx" = 11,"ny" = 1,"wx" = 0,"wy" = 1,"ex" = 4,"ey" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 15,"sturn" = 0,"wturn" = 0,"eturn" = 39,"nflip" = 8,"sflip" = 0,"wflip" = 0,"eflip" = 8)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)

/obj/item/roguegem/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	playsound(loc, pick('sound/items/gems (1).ogg','sound/items/gems (2).ogg'), 100, TRUE, -2)
	..()

/obj/item/roguegem/green
	name = "гемеральд"
	icon_state = "emerald_cut"
	sellprice = 42
	desc = "Отсвечивает зеленым блеском."

/obj/item/roguegem/blue
	name = "блорц"
	icon_state = "quartz_cut"
	sellprice = 88
	desc = "Бледно-голубой, как замерзшая слеза." // i am not sure if this is really quartz.

/obj/item/roguegem/yellow
	name = "топер"
	icon_state = "topaz_cut"
	sellprice = 34
	desc = "Его янтарные переливающиеся оттенки напоминают о закате."

/obj/item/roguegem/violet
	name = "саффира"
	icon_state = "sapphire_cut"
	sellprice = 56
	desc = "Этим драгоценным камнем восхищаются многие волшебники."

/obj/item/roguegem/diamond
	name = "дорпель"
	icon_state = "diamond_cut"
	sellprice = 121
	desc = "Прекрасный и чистый, вызывает уважение к себе."


/obj/item/roguegem/random
	name = "random gem"
	desc = "You shouldn't be seeing this."
	icon_state = null

/obj/item/roguegem/random/Initialize()
	var/newgem = list(/obj/item/roguegem = 5, /obj/item/roguegem/green = 15, /obj/item/roguegem/blue = 10, /obj/item/roguegem/yellow = 20, /obj/item/roguegem/violet = 10, /obj/item/roguegem/diamond = 5, /obj/item/riddleofsteel = 1, /obj/item/rogueore/silver = 3)
	var/pickgem = pickweight(newgem)
	new pickgem(get_turf(src))
	return INITIALIZE_HINT_QDEL


/// riddle


/obj/item/riddleofsteel
	name = "Загадка Стали"
	icon_state = "ros"
	icon = 'icons/roguetown/items/gems.dmi'
	desc = "Плоть или разум?"
	lefthand_file = 'icons/mob/inhands/misc/food_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/misc/food_righthand.dmi'
	w_class = WEIGHT_CLASS_TINY
	slot_flags = ITEM_SLOT_MOUTH
	dropshrink = 0.4
	drop_sound = 'sound/items/gem.ogg'
	sellprice = 100

/obj/item/riddleofsteel/Initialize()
	. = ..()
	set_light(2, 1, "#ff0d0d")
