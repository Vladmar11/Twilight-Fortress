/obj/item/soap
	name = "мыло"
	desc = ""
	gender = PLURAL
	icon = 'icons/obj/items_and_weapons.dmi'
	icon_state = "soap"
	lefthand_file = 'icons/mob/inhands/equipment/custodial_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/equipment/custodial_righthand.dmi'
	w_class = WEIGHT_CLASS_TINY
	item_flags = NOBLUDGEON
	throwforce = 0
	throw_speed = 1
	throw_range = 7
	grind_results = list(/datum/reagent/lye = 10)
	var/cleanspeed = 35 //slower than mop
	force_string = "robust... against germs"
	var/uses = 100

/obj/item/soap/examine(mob/user)
	. = ..()
	var/max_uses = initial(uses)
	var/msg = "Выглядит совершенно новым."
	if(uses != max_uses)
		var/percentage_left = uses / max_uses
		switch(percentage_left)
			if(0 to 0.15)
				msg = "От того куска, что был раньше, осталось совсем немного, и ты не уверен, что его хватит надолго."
			if(0.15 to 0.30)
				msg = "Мыло значительно растворилось, но от него все еще есть какая-то польза."
			if(0.30 to 0.50)
				msg = "Его расцвет уже миновал, хотя оно по-прежнему хорошо намывает."
			if(0.50 to 0.75)
				msg = "Брусок стал немного меньше, чем был раньше, но определенно продержится еще какое-то время."
			else
				msg = "Им пользовались нечасто, и оно все еще довольно свежее."
	. += "<span class='notice'>[msg]</span>"

/obj/item/soap/proc/decreaseUses(mob/user)
	uses--
	if(uses <= 0)
		to_chat(user, span_warning("[src] рассыпается на мелкие кусочки!"))
		qdel(src)

/obj/item/soap/afterattack(atom/target, mob/user, proximity)
	. = ..()
	if(!proximity || !check_allowed_items(target))
		return
	//I couldn't feasibly  fix the overlay bugs caused by cleaning items we are wearing.
	//So this is a workaround. This also makes more sense from an IC standpoint. ~Carn
	if(user.client && ((target in user.client.screen) && !user.is_holding(target)))
		to_chat(user, span_warning("Мне нужно снять [target.name], прежде чем я смогу это почистить!"))
	else if(istype(target, /obj/effect/decal/cleanable))
		user.visible_message(span_notice("[user] начинает вычищать [target.name] с помощью [src]."), span_warning("Я начинаю вычищать [target.name] с помощью [src]..."))
		if(do_after(user, src.cleanspeed, target = target))
			to_chat(user, span_notice("Я очищаю [target.name] от загрязнений."))
			qdel(target)
			decreaseUses(user)

	else if(ishuman(target) && user.zone_selected == BODY_ZONE_PRECISE_MOUTH)
		var/mob/living/carbon/human/H = user
		user.visible_message(span_warning("[user] вымывает рот [target] с помощью [src.name]!"), span_notice("Я вымываю рот [target] с помощью [src.name]!")) //washes mouth out with soap sounds better than 'the soap' here			if(user.zone_selected == "mouth")
		H.lip_style = null //removes lipstick
		H.update_body()
		decreaseUses(user)
		return
	else if(istype(target, /obj/structure/roguewindow))
		user.visible_message(span_notice("[user] начинает мыть [target.name] с помощью [src]..."), span_notice("Я начинаю мыть [target.name] с помощью [src]..."))
		if(do_after(user, src.cleanspeed, target = target))
			to_chat(user, span_notice("Я отмываю [target.name]."))
			target.remove_atom_colour(WASHABLE_COLOUR_PRIORITY)
			target.set_opacity(initial(target.opacity))
			decreaseUses(user)
	else
		user.visible_message(span_notice("[user] начинает чистить [target.name] с помощью [src]..."), span_notice("Я начинаю чистить [target.name] с помощью [src]..."))
		if(do_after(user, src.cleanspeed, target = target))
			to_chat(user, span_notice("Я очищаю [target.name]."))
			for(var/obj/effect/decal/cleanable/C in target)
				qdel(C)
			target.remove_atom_colour(WASHABLE_COLOUR_PRIORITY)
			SEND_SIGNAL(target, COMSIG_COMPONENT_CLEAN_ACT, CLEAN_MEDIUM)
			decreaseUses(user)
	return
