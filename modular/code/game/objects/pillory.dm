#define PILLORY_HEAD_OFFSET      2 // How much we need to move the player to center their head

/obj/structure/pillory
	name = "позорный столб"
	desc = "Удерживает преступников на месте!"
	icon_state = "pillory_single"
	icon = 'modular/icons/obj/pillory.dmi'
	can_buckle = TRUE
	max_buckled_mobs = 1
	buckle_lying = 0
	buckle_prevents_pull = TRUE
	anchored = TRUE
	density = TRUE
	layer = ABOVE_ALL_MOB_LAYER
	plane = GAME_PLANE_UPPER
	var/latched = FALSE
	locked = FALSE
	var/base_icon = "pillory_single"
	var/list/accepted_id = list()
	var/keylock = TRUE

/obj/structure/pillory/double/custom
	keylock = FALSE

/obj/structure/pillory/double
	icon_state = "pillory_double"
	base_icon = "pillory_double"

/obj/structure/pillory/reinforced
	icon_state = "pillory_reinforced"
	base_icon = "pillory_reinforced"

/obj/structure/pillory/town_square
	accepted_id = list("keep_dungeon", "keep_barracks", "town_dungeon", "town_barracks", "bog_dungeon", "bog_barracks", "church")

/obj/structure/pillory/reinforced/keep_dungeon
	accepted_id = list("keep_dungeon")

/obj/structure/pillory/reinforced/town_dungeon
	accepted_id = list("town_dungeon")

/obj/structure/pillory/reinforced/bog_dungeon
	accepted_id = list("bog_dungeon")


/obj/structure/pillory/Initialize()
	LAZYINITLIST(buckled_mobs)
	. = ..()

/obj/structure/pillory/examine(mob/user)
	. = ..()

	var/msg = "Колодки [latched ? "защелкнуты" : "не защелкнуты"] и [locked ? "закрыты на замок." : "не закрыты."]<br/>"
	. += msg

/obj/structure/pillory/attack_right(mob/living/user)
	. = ..()
	if(!buckled_mobs.len)
		to_chat(user, span_warning("Какой смысл запирать колодки, если внутри никого нет?"))
		return
	if(user in buckled_mobs)
		to_chat(user, span_warning("Не могу дотянуться до защелки!"))
		return
	if(locked)
		to_chat(usr, span_warning("Сперва нужно отпереть замок!"))
		return
	togglelatch(user)
	
/obj/structure/pillory/attackby(obj/item/P, mob/user, params)
	if(istype(P, /obj/item/customlock/finished))
		var/obj/item/customlock/finished/K = P
		if(keylock)
			to_chat(user, span_warning("На [src] уже установлен замок."))
		else
			keylock = TRUE
			accepted_id = list(K.lockhash)
			to_chat(user, span_notice("Вы вешаете [K] на [P]."))
			qdel(P)
		return
	if(user in buckled_mobs)
		to_chat(user, span_warning("Я не могу добраться до замка!"))
		return
	if(!latched && keylock)
		to_chat(user, span_warning("Колодки не заперты!"))
		return
	if(istype(P, /obj/item/key))
		var/obj/item/key/K = P
		if (!keylock)
			to_chat(user, span_warning("На [src] нет замка."))
			return
		if(K.lockid in accepted_id)
			togglelock(user)
			return
		else
			to_chat(user, span_warning("Ключ не подходит."))
			playsound(src, 'sound/foley/doors/lockrattle.ogg', 100)
			return
	if(istype(P, /obj/item/storage/keyring))
		var/obj/item/storage/keyring/K = P
		for(var/obj/item/key/KE in K.contents)
			if(KE.lockid in accepted_id)
				togglelock(user)
				return
	if(istype(P, /obj/item/lockpick))
		trypicklock(P, user)
		return

/obj/structure/pillory/proc/trypicklock(obj/item/I, mob/user)
	if(!latched)
		to_chat(user, "<span class='warning'>Раскрытые колодки нельзя вскрыть отмычкой.</span>")
		return
	if(!keylock)
		return
	else
		var/lockprogress = 0
		var/locktreshold = 100

		var/mob/living/L = user

		var/pickskill = user.mind.get_skill_level(/datum/skill/misc/lockpicking)
		var/perbonus = L.STAPER/2
		var/luckbonus = L.STALUC/4
		var/picktime = 70
		var/pickchance = 35
		var/moveup = 10

		picktime -= (pickskill * 10)
		picktime = clamp(picktime, 10, 70)

		moveup += (pickskill * 3)
		moveup = clamp(moveup, 10, 30)

		pickchance += pickskill * 10
		pickchance += perbonus
		pickchance += luckbonus
		pickchance = clamp(pickchance, 1, 95)

		while(!QDELETED(I) &&(lockprogress < locktreshold))
			if(!do_after(user, picktime, target = src))
				break
			if(prob(pickchance))
				lockprogress += moveup
				playsound(src.loc, pick('sound/items/pickgood1.ogg','sound/items/pickgood2.ogg'), 5, TRUE)
				to_chat(user, "<span class='warning'>Щёлк...</span>")
				if(L.mind)
					var/amt2raise = L.STAINT
					var/boon = L.STALUC/4
					L.mind.add_sleep_experience(/datum/skill/misc/lockpicking, amt2raise + boon)
				if(lockprogress >= locktreshold)
					to_chat(user, "<span class='deadsay'>Запирающий механизм поддается.</span>")
					togglelock(user)
					break
				else
					continue
			else
				playsound(loc, 'sound/items/pickbad.ogg', 40, TRUE)
				I.take_damage(1)
				to_chat(user, "<span class='warning'>Треск.</span>")
				continue
		return

/obj/structure/pillory/proc/togglelatch(mob/living/user, silent)
	user.changeNext_move(CLICK_CD_MELEE)
	if(latched)
		user.visible_message(span_warning("[user] расщелкивает колодки на [src]."), \
			span_notice("Я защелкиваю колодки на [src]."))
		playsound(src, 'sound/foley/doors/lock.ogg', 100)
		latched = FALSE
	else
		user.visible_message(span_warning("[user] защелкивает [src]."), \
			span_notice("Я защелкиваю колодки на [src]."))
		playsound(src, 'sound/foley/doors/lock.ogg', 100)
		latched = TRUE

/obj/structure/pillory/proc/togglelock(mob/living/user, silent)
	user.changeNext_move(CLICK_CD_MELEE)
	if (!latched)
		to_chat(user, span_warning("Колодки на [src] не защелкнулись!"))
	if(locked)
		user.visible_message(span_warning("[user] открывает замок на [src]."), \
			span_notice("Я открываю замок на [src]."))
		playsound(src, 'sound/foley/doors/lock.ogg', 100)
		locked = FALSE
	else
		user.visible_message(span_warning("[user] закрывает [src] на замок."), \
			span_notice("Я закрываю [src] на замок."))
		playsound(src, 'sound/foley/doors/lock.ogg', 100)
		locked = TRUE

/obj/structure/pillory/buckle_mob(mob/living/M, force = FALSE, check_loc = TRUE)
	if (!anchored)
		return FALSE

	if(locked)
		to_chat(usr, span_warning("Сперва нужно открыть замок!"))
		return FALSE

	if ((!istype(M, /mob/living/carbon/human)) || HAS_TRAIT(M, TRAIT_TINY))
		to_chat(usr, span_warning("Не похоже, что [M.p_they()] влезет сюда так, как задумано!"))
		return FALSE // Can't hold non-humanoids

	for(var/obj/item/grabbing/G in M.grabbedby)
		if(G.grab_state == 1)
			return ..(M, force, FALSE)
	to_chat(usr, span_warning("Мне нужно схватить сильнее, чтобы поставить жертву к позорному столбу."))
	return FALSE

/obj/structure/pillory/post_buckle_mob(mob/living/M)
	if (!istype(M, /mob/living/carbon/human))
		return

	var/mob/living/carbon/human/H = M

	if (H.dna)
		if (H.dna.species)
			var/datum/species/S = H.dna.species

			if (istype(S))
				//H.cut_overlays()
				H.update_body_parts_head_only()
				switch(H.dna.species.name)
					if ("Dwarf", "Dwarf", "Kobold", "Goblin", "Verminvolk")
						H.set_mob_offsets("bed_buckle", _x = 0, _y = PILLORY_HEAD_OFFSET)
				icon_state = "[base_icon]-over"
				update_icon()
				H.setDir(SOUTH) //Makes the person always face south, in case someone constructed the pillory on the wrong direction
			else
				unbuckle_all_mobs()
		else
			unbuckle_all_mobs()
	else
		unbuckle_all_mobs()

	..()

/obj/structure/pillory/post_unbuckle_mob(mob/living/M)
	//M.regenerate_icons()
	M.reset_offsets("bed_buckle")
	icon_state = "[base_icon]"
	update_icon()
	..()

/obj/structure/pillory/unbuckle_mob(mob/living/user)
	if(latched)
		if(user.STASTR >= 18)
			if(do_after(user, 25))
				user.visible_message(span_warning("[user] с силой выламывает колодки на [src]!"))
				locked = FALSE
				latched = FALSE
				..()
		else
			to_chat(usr, span_warning("Сперва нужно открыть защелку!"))
			return FALSE
	else
		..()

	..()

#undef PILLORY_HEAD_OFFSET
