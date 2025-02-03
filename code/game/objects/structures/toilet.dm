/obj/structure/toilet
	name = "отхожее место"
	desc = ""
	icon = 'icons/roguetown/misc/structure.dmi'
	icon_state = "toilet"
	density = FALSE
	anchored = TRUE
	var/open = FALSE			//if the lid is up
	var/cistern = 1			//if the cistern bit is open
	var/w_items = 0			//the combined w_class of all the items in the cistern
	var/mob/living/swirlie = null	//the mob being given a swirlie
	var/buildstacktype
	var/buildstackamount = 1

/obj/structure/toilet/Initialize()
	. = ..()

/obj/structure/toilet/attack_hand(mob/living/user)
	. = ..()
	if(.)
		return

	if(cistern && user.CanReach(src))
		if(!contents.len)
			to_chat(user, "<span class='notice'>Бачок пуст.</span>")
		else
			var/obj/item/I = pick(contents)
			if(ishuman(user))
				user.put_in_hands(I)
			else
				I.forceMove(drop_location())
			to_chat(user, "<span class='notice'>Я достаю [I] из туалетного бачка...</span>")
			w_items -= I.w_class

/obj/structure/toilet/update_icon_state()
	icon_state = "toilet"

/obj/structure/toilet/deconstruct()
	if(!(flags_1 & NODECONSTRUCT_1))
		if(buildstacktype)
			new buildstacktype(loc,buildstackamount)
	..()

/obj/structure/toilet/attackby(obj/item/I, mob/living/user, params)
	add_fingerprint(user)
	if(I.tool_behaviour == TOOL_CROWBAR)
		to_chat(user, "<span class='notice'>Я начинаю [cistern ? "устанавливать крышку бачка на место" : "поднимать крышку с бачка"]...</span>")
		playsound(loc, 'sound/blank.ogg', 50, TRUE)
		if(I.use_tool(src, user, 30))
			user.visible_message("<span class='notice'>[user] [cistern ? "возвращает крышку бачка на место" : "поднимает крышку с бачка"]!</span>", "<span class='notice'>I [cistern ? "replace the lid on the cistern" : "lift the lid off the cistern"]!</span>", "<span class='hear'>I hear grinding porcelain.</span>")
			cistern = !cistern
			update_icon()
	else if(I.tool_behaviour == TOOL_WRENCH && !(flags_1&NODECONSTRUCT_1))
		I.play_tool_sound(src)
		deconstruct()
	else if(cistern)
		if(user.used_intent.type != INTENT_HARM)
			if(I.w_class > WEIGHT_CLASS_NORMAL)
				to_chat(user, "<span class='warning'>[I] не помещается!</span>")
				return
			if(w_items + I.w_class > WEIGHT_CLASS_HUGE)
				to_chat(user, "<span class='warning'>Бачок полон!</span>")
				return
			if(!user.transferItemToLoc(I, src))
				to_chat(user, "<span class='warning'>Кажется, [I] прилип к вашей руке, и его не получается положить в бачок!</span>")
				return
			w_items += I.w_class
			to_chat(user, "<span class='notice'>Я осторожно кладу [I] в бачок туалета.</span>")

	else if(istype(I, /obj/item/reagent_containers))
		if (!open)
			return
		var/obj/item/reagent_containers/RG = I
		RG.reagents.add_reagent(/datum/reagent/water/gross, min(RG.volume - RG.reagents.total_volume, RG.amount_per_transfer_from_this))
		to_chat(user, "<span class='notice'>Я наполняю [RG] из [src].</span>")
	else
		return ..()
