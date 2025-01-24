
//custom lock unfinished
/obj/item/customlock
	name = "незавершенный замок"
	desc = "Замок без установленных штифтов. Бесконечные возможности..."
	icon = 'icons/roguetown/items/keys.dmi'
	icon_state = "lock"
	w_class = WEIGHT_CLASS_SMALL
	dropshrink = 0.75
	lockhash = 0

/obj/item/customlock/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/rogueweapon/hammer))
		var/input = input(user, "Какой идентификатор замка вы хотите установить??", "", 0) as num
		input = max(0, input)
		to_chat(user, span_notice("Вы установили идентификатор замка на [input]."))
		lockhash = 10000 + input //same deal as the customkey
	else if(istype(I, /obj/item/key))
		var/obj/item/key/ID = I
		if(ID.lockhash == src.lockhash)
			to_chat(user, span_notice("[I] мягко прокручивается в [src]."))
		else
			to_chat(user, span_warning("[I] застревает в [src],"))
	else if(istype(I, /obj/item/key_custom_blank))
		var/obj/item/key_custom_blank/ID = I
		if(ID.lockhash == src.lockhash)
			to_chat(user, span_notice("[I] мягко прокручивается в [src].")) //this makes no sense since the teeth aren't formed yet but i want people to be able to check whether the locks theyre making actually fit
		else
			to_chat(user, span_warning("[I] застревает в [src]."))

/obj/item/customlock/attack_right(mob/user)
	if(istype(user.get_active_held_item(), /obj/item/key))//i need to figure out how to avoid these massive if/then trees, this sucks
		var/obj/item/key/held = user.get_active_held_item()
		src.lockhash = held.lockhash
		to_chat(user, span_notice("Вы выравниваете внутренние части замка, чтобы те совпадали с [held].")) //locks for non-custom keys
	else if(istype(user.get_active_held_item(), /obj/item/key_custom_blank))
		var/obj/item/key_custom_blank/held = user.get_active_held_item()
		src.lockhash = held.lockhash
		to_chat(user, span_notice("Вы выравниваете внутренние части замка, чтобы те совпадали с [held]."))
	else if(istype(user.get_active_held_item(), /obj/item/rogueweapon/hammer) && src.lockhash != 0)
		var/obj/item/customlock/finished/F = new (get_turf(src))
		F.lockhash = src.lockhash
		to_chat(user, span_notice("Вы завершаете [F]."))
		qdel(src)

//finished lock
/obj/item/customlock/finished
	name = "замок"
	desc = "Индивидуальный железный замок, который открывается ключами."
	var/holdname = ""

/obj/item/customlock/finished/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/rogueweapon/hammer))
		src.holdname = input(user, "Как вы хотите его назвать?", "", "") as text
		if(holdname)
			to_chat(user, span_notice("Вы прикрепляете на [name] бирку: [holdname]."))
	else
		..()

/obj/item/customlock/finished/attack_right(mob/user)//does nothing. probably better ways to do this but whatever

/obj/item/customlock/finished/attack_obj(obj/structure/K, mob/living/user)
	if(istype(K, /obj/structure/closet))
		var/obj/structure/closet/KE = K
		if(KE.keylock == TRUE)
			to_chat(user, span_warning("[K] уже имеет замок."))
		else
			KE.keylock = TRUE
			KE.lockhash = src.lockhash
			if(src.holdname)
				KE.name = (src.holdname + " " + KE.name)
			to_chat(user, span_notice("Вы вставляете [src] в [K]."))
			qdel(src)
	if(istype(K, /obj/structure/mineral_door))
		var/obj/structure/mineral_door/KE = K
		if(KE.keylock == TRUE)
			to_chat(user, span_warning("[K] уже имеет замок."))
		else
			KE.keylock = TRUE
			KE.lockhash = src.lockhash
			if(src.holdname)
				KE.name = src.holdname
			to_chat(user, span_notice("Вы вставляете [src] в [K]."))
			qdel(src)

