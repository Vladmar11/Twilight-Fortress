/obj/item/gem_device
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
	var/usage_prompt

/obj/item/gem_device/attack_self(mob/living/user)
	var/alert = alert(user, "Я хочу использовать это? \n[usage_prompt]", "Зачарованный камень", "Да", "Нет")
	if(alert != "Да")
		return
	if(!on_use(user))
		to_chat(user, span_warning("В вашей руке [src] вспыхивает, а затем быстро гаснет!"))
		return
	to_chat(user, span_warning("Издав яркую вспышку, [src] исчезает!"))
	qdel(src)

/obj/item/gem_device/proc/on_use(mob/living/user)
	return FALSE

/obj/item/gem_device/goldface
	name = "гемеральд"
	icon_state = "emerald_cut"
	desc = "Отсвечивает зеленым блеском."
	usage_prompt = "Призвать GOLDFACE"

/obj/item/gem_device/goldface/on_use(mob/living/user)
	var/turf/step_turf = get_step(get_turf(user), user.dir)
	do_sparks(3, TRUE, step_turf)
	new /obj/structure/roguemachine/merchantvend(step_turf)
	to_chat(user, span_notice("Издав яркую вспышку, перед вами появляется GOLDFACE!"))
	return TRUE
