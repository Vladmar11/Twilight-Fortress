/* Kitchen tools
 * Contains:
 *		Fork
 *		Kitchen knives
 *		Ritual Knife
 *		Butcher's cleaver
 *		Combat Knife
 *		Rolling Pins
 *		Plastic Utensils
 */

/obj/item/kitchen
	icon = 'icons/obj/kitchen.dmi'
	lefthand_file = 'icons/mob/inhands/equipment/kitchen_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/kitchen_righthand.dmi'

/obj/item/kitchen/fork
	name = "вилка"
	desc = "В три раза эффективнее протыкает еду."
	icon_state = "fork"
	force = 5
	w_class = WEIGHT_CLASS_TINY
	throwforce = 0
	throw_speed = 1
	throw_range = 5
	flags_1 = CONDUCT_1
	attack_verb = list("attacked", "stabbed", "poked")
	hitsound = 'sound/blank.ogg'
	armor = list("blunt" = 0, "slash" = 0, "stab" = 0, "bullet" = 0, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 30)
	var/datum/reagent/forkload //used to eat omelette

/obj/item/kitchen/fork/suicide_act(mob/living/carbon/user)
	user.visible_message(span_suicide("[user] втыкает [src] в свое тело! Как будто пытается откусить от себя кусочек!"))
	playsound(src, 'sound/blank.ogg', 50, TRUE)
	return BRUTELOSS

/obj/item/kitchen/fork/attack(mob/living/carbon/M, mob/living/carbon/user)
	if(!istype(M))
		return ..()

	if(forkload)
		if(M == user)
			M.visible_message(span_notice("[user] съедает вкусную порцию еды с вилки!"))
			M.reagents.add_reagent(forkload.type, 1)
		else
			M.visible_message(span_notice("[user] кормит [M] вкусной едой с вилки!"))
			M.reagents.add_reagent(forkload.type, 1)
		icon_state = "fork"
		forkload = null

	else if(user.zone_selected == BODY_ZONE_PRECISE_R_EYE)
		return eyestab(M,user)
	else
		return ..()

/obj/item/kitchen/rollingpin
	name = "скалка"
	desc = "Обычно ей раскатывают тесто. Хотя и огреть ей кого-нибудь тоже можно."
	icon_state = "rolling_pin"
	force = 8
	throwforce = 5
	throw_speed = 1
	throw_range = 7
	w_class = WEIGHT_CLASS_NORMAL
	attack_verb = list("bashed", "battered", "bludgeoned", "thrashed", "whacked")
	custom_price = 20

/obj/item/kitchen/rollingpin/suicide_act(mob/living/carbon/user)
	user.visible_message(span_suicide("[user] с силой бьет себя по голове [src]! Похоже, пытается покончить с собой!"))
	return BRUTELOSS
