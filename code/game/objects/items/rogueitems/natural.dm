
/obj/item/natural
	icon = 'icons/roguetown/items/natural.dmi'
	lefthand_file = 'icons/mob/inhands/misc/food_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/misc/food_righthand.dmi'
	desc = ""
	w_class = WEIGHT_CLASS_TINY
	var/bundletype = null
	var/bundling_time = 4 SECONDS

/obj/item/natural/attackby(obj/item/W, mob/living/user)
	if(istype(W, /obj/item/natural/bundle))
		var/obj/item/natural/bundle/B = W
		if(istype(src, B.stacktype))
			if(B.amount < B.maxamount)
				B.amount++
				B.update_bundle()
				user.visible_message("[user] добавляет [src] к [W].")
				qdel(src)
			else
				to_chat(user, "Недостаточно места в [W].")
			return
	else if(istype(W, /obj/item/natural))
		var/obj/item/natural/B = W
		if(B.bundletype == src.bundletype && src.bundletype != null)
			var/obj/item/natural/bundle/N = new bundletype(src.loc)
			qdel(B)
			qdel(src)
			user.put_in_hands(N)
			to_chat(user, "Вы собираете [N.stackname] в одну связку.")
	else
		return ..()


/obj/item/natural/bundle
	name = "bundle"
	desc = "You shouldn't be seeing this."
	possible_item_intents = list(/datum/intent/use)
	force = 0
	throwforce = 0
	firefuel = 5 MINUTES
	resistance_flags = FLAMMABLE
	var/firemod = 5 MINUTES
	var/amount = 2
	var/maxamount = 10
	var/icon1 = "fibersroll1"
	var/icon1step = 3
	var/icon2 = "fibersroll2"
	var/icon2step = 6
	var/icon3 = null
	var/stacktype = /obj/item/natural/fibers/
	var/stackname = "fibers"

/obj/item/natural/bundle/attackby(obj/item/W, mob/living/user)
	if(istype(W, /obj/item/natural/bundle))
		var/obj/item/natural/bundle/B = W
		if(src.stacktype == B.stacktype)
			if(src.amount + B.amount > maxamount)
				B.amount = (src.amount + B.amount) - maxamount
				src.amount = maxamount
				src.update_bundle()
				B.update_bundle()
				to_chat(user, "Недостаточно места в [src].")
				if(B.amount == 1)
					var/obj/H = new stacktype(src.loc)
					user.put_in_hands(H)
					qdel(B)
			else
				to_chat(user, "Вы добавляете [W] в [src].")
				src.amount += B.amount
				update_bundle()
				qdel(B)
	else if(istype(W, stacktype))
		if(src.amount < src.maxamount)
			to_chat(user, "Вы добавляете [W] в [src].")
			src.amount++
			qdel(W)
		else
			to_chat(user, "Недостаточно места в [src].")
	else
		return ..()

/obj/item/natural/bundle/attack_right(mob/user)
	var/mob/living/carbon/human/H = user
	switch(amount)
		if(2)
			var/obj/F = new stacktype(src.loc)
			var/obj/I = new stacktype(src.loc)
			qdel(src)
			H.put_in_hands(F)
			H.put_in_hands(I)
			return
		else
			amount -= 1
			var/obj/F = new stacktype(src.loc)
			H.put_in_hands(F)
			user.visible_message("[user] берет [F] из [src]")
	update_bundle()

/obj/item/natural/bundle/attack_turf(turf/T, mob/living/user)
	var/list/obj/item/stackables = list()
	for(var/obj/I in T.contents)
		if(I.type == stacktype)
			stackables += I
	if(stackables.len)
		if(amount >= maxamount)
			to_chat(user, span_info("[src] развалится, если попробовать."))
			return
		to_chat(user, span_info("Я заполняю [src]..."))
		for(var/obj/I in stackables)
			if(amount >= maxamount)
				break
			if(I.type == stacktype)
				if(!do_after(user, 5, TRUE, src))
					break
				if(!(I in T.contents))
					continue
				qdel(I)
				src.amount++
				update_bundle()

/obj/item/natural/bundle/examine(mob/user)
	. = ..()
	if(amount == maxamount )
		to_chat(user, span_notice("В этой связке [amount] [stackname]. Больше в неё не влезет."))
	else
		to_chat(user, span_notice("В этой связке [amount] [stackname]."))


/obj/item/natural/bundle/proc/update_bundle()
	if(firefuel != 0)
		firefuel = firemod * amount
	if((amount <= icon1step) && (icon1 != null))
		icon_state = icon1
	else if((icon1step < amount <= icon2step) && (icon2 != null))
		icon_state = icon2
	else
		if(icon3 != null)
			icon_state = icon3
