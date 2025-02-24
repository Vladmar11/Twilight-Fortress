//NOT using the existing /obj/machinery/door type, since that has some complications on its own, mainly based on its
//machineryness
/proc/lockid_to_lockpick_difficulty(lockid)
	if(!lockid)
		return 5
	switch(lockid)
		if("vault")
			return 1
		if("lord")
			return 1
		if("manor")
			return 2
		if("guest")
			return 2
		if("butler")
			return 3
		if("dungeon")
			return 2
		if("garrison")
			return 2
		if("forrestgarrison")
			return 2
		if("soilson")
			return 4
		if("warehouse")
			return 3
		if("sheriff")
			return 3
		if("merchant")
			return 2
		if("shop")
			return 5
		if("tavern")
			return 5
		if("roomi")
			return 6
		if("roomii")
			return 6
		if("roomiii")
			return 6
		if("roomiv")
			return 6
		if("roomv")
			return 6
		if("roomvi")
			return 6
		if("medroomi")
			return 5
		if("medroomii")
			return 5
		if("medroomiii")
			return 5
		if("medroomiv")
			return 5
		if("medroomv")
			return 5
		if("medroomvi")
			return 5
		if("luxroomi")
			return 3
		if("luxroomi")
			return 3
		if("luxroomii")
			return 3
		if("luxroomiii")
			return 3
		if("luxroomiv")
			return 3
		if("luxroomv")
			return 3
		if("luxroomvi")
			return 3
		if("blacksmith")
			return 3
		if("butcher")
			return 3
		if("walls")
			return 2
		if("priest")
			return 3
		if("hpriest")
			return 2
		if("tower")
			return 3
		if("mage")
			return 2
		if("artificer")
			return 4
		if("confession")
			return 1
		if("hand")
			return 1
		if("steward")
			return 2
		if("doctor")
			return 3
		else
			return 5

/obj/structure/mineral_door
	name = "metal door"
	density = TRUE
	anchored = TRUE
	opacity = TRUE
	layer = CLOSED_DOOR_LAYER

	icon = 'icons/obj/doors/mineral_doors.dmi'
	icon_state = "metal"
	max_integrity = 1000
	integrity_failure = 0.5
	armor = list("blunt" = 10, "slash" = 5, "stab" = 7, "bullet" = 0, "laser" = 0, "energy" = 100, "bomb" = 10, "bio" = 100, "rad" = 100, "fire" = 50, "acid" = 50)
	CanAtmosPass = ATMOS_PASS_DENSITY
	rad_flags = RAD_PROTECT_CONTENTS | RAD_NO_CONTAMINATE
	rad_insulation = RAD_MEDIUM_INSULATION

	var/ridethrough = FALSE

	var/door_opened = FALSE //if it's open or not.
	var/isSwitchingStates = FALSE //don't try to change stats if we're already opening

	var/close_delay = -1 //-1 if does not auto close.
	var/openSound = 'sound/blank.ogg'
	var/closeSound = 'sound/blank.ogg'

	var/sheetAmount = 7 //how much we drop when deconstructed

	var/windowed = FALSE
	var/base_state = null

	locked = FALSE
	var/last_bump = null
	var/brokenstate = 0
	var/keylock = FALSE
	lockhash = 0
	lockid = null
	var/lockbroken = 0
	var/lockdiff = 0 //how hard it is to pick the lock of a door
	var/locksound = 'sound/foley/doors/woodlock.ogg'
	var/unlocksound = 'sound/foley/doors/woodlock.ogg'
	var/rattlesound = 'sound/foley/doors/lockrattle.ogg'
	var/masterkey = TRUE //if masterkey can open this regardless
	var/kickthresh = 15
	var/swing_closed = TRUE

	/// Whether to grant a resident_key
	var/grant_resident_key = FALSE
	var/resident_key_amount = 1
	/// The type of a key the resident will get
	var/resident_key_type
	/// The required role of the resident
	var/resident_role
	/// The requied subclass of the resident
	var/resident_subclass

	damage_deflection = 10
	leanable = TRUE

	var/repairable = FALSE
	var/repair_state = 0
	var/obj/item/repair_cost_first = null
	var/obj/item/repair_cost_second = null	
	var/repair_skill = null
	var/mob/last_bumper = null

/obj/structure/mineral_door/proc/try_award_resident_key(mob/user)
	if(!grant_resident_key)
		return FALSE
	if(!lockid)
		return FALSE
	if(!ishuman(user))
		return FALSE
	var/mob/living/carbon/human/human = user
	if(human.received_resident_key)
		return FALSE
	if(resident_role)
		var/datum/job/job = SSjob.name_occupations[human.job]
		if(job.type != resident_role)
			return FALSE
	if(resident_subclass)
		if(!human.advjob)
			return FALSE
		var/datum/subclass/subclass = SSrole_class_handler.get_subclass_by_name(human.advjob)
		if(!subclass)
			return FALSE
		if(subclass.type != resident_subclass)
			return FALSE
	var/alert = alert(user, "Это мой дом?", "Дом", "Да", "Нет")
	if(alert != "Да")
		return
	if(!grant_resident_key)
		return
	var/spare_key = alert(user, "У меня есть еще один запасной ключ?", "Мой дом", "Да", "Нет")
	if(!grant_resident_key)
		return
	if(spare_key == "Да")
		resident_key_amount = 2
	else
		resident_key_amount = 1
	for(var/i in 1 to resident_key_amount)
		var/obj/item/key/key
		if(resident_key_type)
			key = new resident_key_type(get_turf(human))
		else
			key = new /obj/item/key(get_turf(human))
		key.lockid = lockid
		key.lockhash = lockhash
		human.put_in_hands(key)
	human.received_resident_key = TRUE
	grant_resident_key = FALSE
	if(resident_key_amount > 1)
		to_chat(human, span_notice("Они лежат там же, где я их оставил..."))
	else
		to_chat(human, span_notice("Он лежит там же, где я его оставил..."))
	return TRUE

/obj/structure/mineral_door/onkick(mob/user)
	if(isSwitchingStates)
		return
	if(door_opened)
		playsound(src, 'sound/combat/hits/onwood/woodimpact (1).ogg', 100)
		user.visible_message(span_warning("[user] захлопывает [src] пинком!"), \
			span_notice("Я захлопываю [src] пинком!"))
		force_closed()
	else
		if(locked)
			if(isliving(user))
				var/mob/living/L = user
				if(L.STASTR >= initial(kickthresh))
					kickthresh--
				if((prob(L.STASTR * 0.5) || kickthresh == 0) && (L.STASTR >= initial(kickthresh)))
					playsound(src, 'sound/combat/hits/onwood/woodimpact (1).ogg', 100)
					user.visible_message(span_warning("[user] выбивает [src] ногой!"), \
						span_notice("Я выбиваю [src] ногой!"))
					locked = 0
					force_open()
				else
					playsound(src, 'sound/combat/hits/onwood/woodimpact (1).ogg', 100)
					user.visible_message(span_warning("[user] пинает [src]!"), \
						span_notice("Я пинаю [src]!"))
			//try to kick open, destroy lock
		else
			playsound(src, 'sound/combat/hits/onwood/woodimpact (1).ogg', 100)
			user.visible_message(span_warning("[user] распахивает [src] ногой!"), \
				span_notice("Я распахиваю [src] ногой!"))
			force_open()

/obj/structure/mineral_door/proc/force_open()
	isSwitchingStates = TRUE
	if(!windowed)
		set_opacity(FALSE)
	density = FALSE
	door_opened = TRUE
	layer = OPEN_DOOR_LAYER
	air_update_turf(1)
	update_icon()
	isSwitchingStates = FALSE

	if(close_delay != -1)
		addtimer(CALLBACK(src, PROC_REF(Close)), close_delay)
	SEND_SIGNAL(src, COMSIG_DOOR_OPEN, src)

/obj/structure/mineral_door/proc/force_closed()
	isSwitchingStates = TRUE
	if(!windowed)
		set_opacity(TRUE)
	density = TRUE
	door_opened = FALSE
	layer = CLOSED_DOOR_LAYER
	air_update_turf(1)
	update_icon()
	isSwitchingStates = FALSE
	SEND_SIGNAL(src, COMSIG_DOOR_CLOSED, src)

/obj/structure/mineral_door/Initialize()
	. = ..()
	if(!base_state)
		base_state = icon_state
	air_update_turf(TRUE)
	if(grant_resident_key && !lockid)
		lockid = "random_lock_id_[rand(1,9999999)]" // I know, not foolproof
	if(lockhash)
		GLOB.lockhashes += lockhash
	else if(keylock)
		AddElement(/datum/element/lockpickable, list(/obj/item/lockpick), list(/obj/item/lockpick), lockid_to_lockpick_difficulty(lockid))
		if(lockid)
			if(GLOB.lockids[lockid])
				lockhash = GLOB.lockids[lockid]
			else
				lockhash = rand(1000,9999)
				while(lockhash in GLOB.lockhashes)
					lockhash = rand(1000,9999)
				GLOB.lockhashes += lockhash
				GLOB.lockids[lockid] = lockhash
		else
			lockhash = rand(1000,9999)
			while(lockhash in GLOB.lockhashes)
				lockhash = rand(1000,9999)
			GLOB.lockhashes += lockhash

/obj/structure/mineral_door/Move()
	var/turf/T = loc
	. = ..()
	move_update_air(T)

/obj/structure/mineral_door/Bumped(atom/movable/AM)
	..()
	if(door_opened)
		return
	if(world.time < last_bump+20)
		return
	last_bump = world.time
	if(ismob(AM))
		var/mob/user = AM
		if(HAS_TRAIT(user, TRAIT_BASHDOORS))
			if(locked)
				user.visible_message(span_warning("[user] врезается в [src]!"))
				take_damage(200, "brute", "blunt", 1)
			else
				playsound(src, 'sound/combat/hits/onwood/woodimpact (1).ogg', 100)
				force_open()
				user.visible_message(span_warning("[user] прорывается через [src]!"))
			return
		if(locked)
			if(istype(user.get_active_held_item(), /obj/item/key) || istype(user.get_active_held_item(), /obj/item/storage/keyring))
				src.attackby(user.get_active_held_item(), user, TRUE)
				return
			rattle()
			return
		if(TryToSwitchState(AM))
			if(swing_closed)
				if(isliving(AM))
					var/mob/living/M = AM
					if(M.m_intent == MOVE_INTENT_SNEAK)
						addtimer(CALLBACK(src, PROC_REF(Close), TRUE), 25)
					else
						addtimer(CALLBACK(src, PROC_REF(Close), FALSE), 25)


/obj/structure/mineral_door/attack_paw(mob/user)
	return attack_hand(user)

/obj/structure/mineral_door/attack_hand(mob/user)
	. = ..()
	if(.)
		return
	if(brokenstate)
		return
	if(isSwitchingStates)
		return
	if(try_award_resident_key(user))
		return
	if(locked)
		if( user.used_intent.type == /datum/intent/unarmed/claw )
			user.changeNext_move(CLICK_CD_MELEE)
			to_chat(user, "<span class='warning'>Мертвец скребется когтями в дверь!</span>")
			take_damage(40, "brute", "melee", 1)
			return
		if(isliving(user))
			var/mob/living/L = user
			if(L.m_intent == MOVE_INTENT_SNEAK)
				to_chat(user, span_warning("Эта дверь заперта."))
				return
		if(world.time >= last_bump+20)
			last_bump = world.time
			playsound(src, 'sound/foley/doors/knocking.ogg', 100)
			user.visible_message(span_warning("[user] стучит в [src]."), \
				span_notice("Я стучу в [src]."))
		return
	return TryToSwitchState(user)

/obj/structure/mineral_door/CanPass(atom/movable/mover, turf/target)
	if(istype(mover, /obj/effect/beam))
		return !opacity
	return !density

/obj/structure/mineral_door/proc/TryToSwitchState(atom/user)
	if(isSwitchingStates || !anchored)
		return
	if(isliving(user))
		var/mob/living/M = user
		if(world.time - M.last_bumped <= 60)
			return //NOTE do we really need that?
		if(M.client)
			if(iscarbon(M))
				var/mob/living/carbon/C = M
				if(!C.handcuffed)
					if(C.m_intent == MOVE_INTENT_SNEAK)
						SwitchState(TRUE)
					else
						SwitchState()
			else
				SwitchState()
	return TRUE

/obj/structure/mineral_door/proc/SwitchState(silent = FALSE)
	if(door_opened)
		Close(silent)
	else
		Open(silent)

/obj/structure/mineral_door/proc/Open(silent = FALSE)
	isSwitchingStates = TRUE
	if(!silent)
		playsound(src, openSound, 100)
	if(!windowed)
		set_opacity(FALSE)
	flick("[base_state]opening",src)
	sleep(10)
	density = FALSE
	door_opened = TRUE
	layer = OPEN_DOOR_LAYER
	air_update_turf(1)
	update_icon()
	isSwitchingStates = FALSE

	if(close_delay != -1)
		addtimer(CALLBACK(src, PROC_REF(Close)), close_delay)
	SEND_SIGNAL(src, COMSIG_DOOR_OPEN, src)

/obj/structure/mineral_door/proc/Close(silent = FALSE, autobump = FALSE)
	if(isSwitchingStates || !door_opened)
		return
	var/turf/T = get_turf(src)
	for(var/mob/living/L in T)
		return
	isSwitchingStates = TRUE
	if(!silent)
		playsound(src, closeSound, 100)
	flick("[base_state]closing",src)
	sleep(10)
	density = TRUE
	if(!windowed)
		set_opacity(TRUE)
	door_opened = FALSE
	layer = initial(layer)
	air_update_turf(1)
	update_icon()
	isSwitchingStates = FALSE
	SEND_SIGNAL(src, COMSIG_DOOR_CLOSED, src)
	if(autobump && src.Adjacent(last_bumper))
		if(istype(last_bumper.get_active_held_item(), /obj/item/key) || istype(last_bumper.get_active_held_item(), /obj/item/storage/keyring))
			src.attack_right(last_bumper)
	last_bumper = null

/obj/structure/mineral_door/update_icon()
	icon_state = "[base_state][door_opened ? "open":""]"


/obj/structure/mineral_door/examine(mob/user)	
	. = ..()
	if(repairable)
		var/obj/cast_repair_cost_first = repair_cost_first
		var/obj/cast_repair_cost_second = repair_cost_second
		if((repair_state == 0) && (obj_integrity < max_integrity))
			. += span_notice("Можно отремонтировать, используя [initial(cast_repair_cost_first.name)].")
			if(brokenstate)
				. += span_notice("Для полного ремонта понадобится еще один [initial(cast_repair_cost_second.name)].")
		if(repair_state == 1)
			. += span_notice("Для полного ремонта понадобится еще один [initial(cast_repair_cost_second.name)].")
	


/obj/structure/mineral_door/proc/rattle()
	playsound(src, rattlesound, 100)
	var/oldx = pixel_x
	animate(src, pixel_x = oldx+1, time = 0.5)
	animate(pixel_x = oldx-1, time = 0.5)
	animate(pixel_x = oldx, time = 0.5)

/obj/structure/mineral_door/attackby(obj/item/I, mob/user, autobump = FALSE)
	user.changeNext_move(CLICK_CD_FAST)
	if(istype(I, /obj/item/key) || istype(I, /obj/item/storage/keyring))
		if(!locked)
			to_chat(user, span_warning("Не поворачивается в эту сторону. Попробуйте повернуть налево."))
			rattle()
			return
		if(autobump == TRUE) //Attackby passes UI coordinate onclick stuff, so forcing check to TRUE
			trykeylock(I, user, autobump)
			return
		else
			trykeylock(I, user)
			return
	if(repairable && (user.mind.get_skill_level(repair_skill) > 0) && ((istype(I, repair_cost_first)) || (istype(I, repair_cost_second)))) // At least 1 skill level needed
		repairdoor(I,user)
	else
		return ..()

/obj/structure/mineral_door/proc/repairdoor(obj/item/I, mob/user)
	if(brokenstate)				
		switch(repair_state)
			if(0)					
				if(istype(I, repair_cost_first))
					user.visible_message(span_notice("[user] начинает ремонтировать [src]."), \
					span_notice("Я начинаю ремонтировать [src]."))
					playsound(user, 'sound/misc/wood_saw.ogg', 100, TRUE)
					if(do_after(user, (300 / user.mind.get_skill_level(repair_skill)), target = src)) // 1 skill = 30 secs, 2 skill = 15 secs etc.
						qdel(I)
						playsound(user, 'sound/misc/wood_saw.ogg', 100, TRUE)
						repair_state = 1
						var/obj/cast_repair_cost_second = repair_cost_second
						to_chat(user, span_notice("Для полного ремонта понадобится еще один [initial(cast_repair_cost_second.name)]."))				
			if(1)
				if(istype(I, repair_cost_second))
					user.visible_message(span_notice("[user] начинает ремонтировать [src]."), \
					span_notice("Я начинаю ремонтировать [src]."))
					playsound(user, 'sound/misc/wood_saw.ogg', 100, TRUE)
					if(do_after(user, (300 / user.mind.get_skill_level(repair_skill)), target = src)) // 1 skill = 30 secs, 2 skill = 15 secs etc.	
						qdel(I)	
						playsound(user, 'sound/misc/wood_saw.ogg', 100, TRUE)	
						icon_state = "[base_state]"
						density = TRUE
						opacity = TRUE
						brokenstate = FALSE
						obj_broken = FALSE
						obj_integrity = max_integrity
						repair_state = 0								
						user.visible_message(span_notice("[user] успешно ремонтирует [src]."), \
						span_notice("Я успешно ремонтирую [src]."))												
	else
		if(obj_integrity < max_integrity && istype(I, repair_cost_first))
			to_chat(user, span_warning("[obj_integrity]"))	
			user.visible_message(span_notice("[user] starts repairing [src]."), \
			span_notice("Я начинаю ремонтировать [src]."))
			playsound(user, 'sound/misc/wood_saw.ogg', 100, TRUE)
			if(do_after(user, (300 / user.mind.get_skill_level(repair_skill)), target = src)) // 1 skill = 30 secs, 2 skill = 15 secs etc.
				qdel(I)
				playsound(user, 'sound/misc/wood_saw.ogg', 100, TRUE)
				obj_integrity = obj_integrity + (max_integrity/2)					
				if(obj_integrity > max_integrity)
					obj_integrity = max_integrity
				user.visible_message(span_notice("[user] успешно ремонтирую [src]."), \
				span_notice("Я успешно ремонтирую [src]."))		
/obj/structure/mineral_door/attack_right(mob/user)
	user.changeNext_move(CLICK_CD_FAST)
	var/obj/item = user.get_active_held_item()
	if(istype(item, /obj/item/key) || istype(item, /obj/item/storage/keyring))
		if(locked)
			to_chat(user, span_warning("Не поворачивается в эту сторону. Попробуйте повернуть налево."))
			rattle()
			return
		trykeylock(item, user)
	else
		return ..()

/obj/structure/mineral_door/proc/trykeylock(obj/item/I, mob/user, autobump = FALSE)
	if(door_opened || isSwitchingStates)
		return
	if(!keylock)
		return
	if(lockbroken)
		to_chat(user, span_warning("Замок на этой двери сломан."))
	user.changeNext_move(CLICK_CD_MELEE)
	if(istype(I,/obj/item/storage/keyring))
		var/obj/item/storage/keyring/R = I
		if(!R.contents.len)
			return
		var/list/keysy = shuffle(R.contents.Copy())
		for(var/obj/item/key/K in keysy)
			if(user.cmode)
				if(!do_after(user, 10, TRUE, src))
					break
			if(K.lockhash == lockhash)
				lock_toggle(user)
				if(autobump && !locked)
					src.Open()
					addtimer(CALLBACK(src, PROC_REF(Close), FALSE, TRUE), 25)
					src.last_bumper = user
				return
			else
				if(user.cmode)
					rattle()
		to_chat(user, span_warning("Ни один из ключей на моей связке не подходит к этой двери."))
		rattle()
		return
	else
		var/obj/item/key/K = I
		if(K.lockhash == lockhash || istype(K, /obj/item/key/lord))
			lock_toggle(user)
			if(autobump)
				src.Open()
				addtimer(CALLBACK(src, PROC_REF(Close), FALSE, TRUE), 25)
				src.last_bumper = user
			return
		else
			to_chat(user, span_warning("Это не тот ключ, который подходит к этой двери."))
			rattle()
		return

/obj/structure/mineral_door/proc/trypicklock(obj/item/I, mob/user)
	if(door_opened || isSwitchingStates)
		to_chat(user, "<span class='warning'>Его нельзя взломать, пока он открыт.</span>")
		return
	if(!keylock)
		return
	if(lockbroken)
		to_chat(user, "<span class='warning'>Замок на этой двери сломан.</span>")
		user.changeNext_move(CLICK_CD_MELEE)
	else
		var/lockprogress = 0
		var/locktreshold = 100 + (lockdiff * 20)

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
		pickchance -= lockdiff * 10
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
					lock_toggle(user)
					break
				else
					continue
			else
				playsound(loc, 'sound/items/pickbad.ogg', 40, TRUE)
				I.take_damage(1, BRUTE, "blunt")
				to_chat(user, span_warning("Звяк."))
				continue
		return

/obj/structure/mineral_door/proc/lock_toggle(mob/user)
	if(isSwitchingStates || door_opened)
		return
	if(locked)
		user.visible_message(span_warning("[user] открывает [src]."), \
			span_notice("Я открываю [src]."))
		playsound(src, unlocksound, 100)
		locked = 0
	else
		user.visible_message(span_warning("[user] закрывает [src]."), \
			span_notice("Я закрываю [src]."))
		playsound(src, locksound, 100)
		locked = 1

/obj/structure/mineral_door/setAnchored(anchorvalue) //called in default_unfasten_wrench() chain
	. = ..()
	set_opacity(anchored ? !door_opened : FALSE)
	air_update_turf(TRUE)

/obj/structure/mineral_door/wrench_act(mob/living/user, obj/item/I)
	..()
	default_unfasten_wrench(user, I, 40)
	return TRUE


/obj/structure/mineral_door/obj_break(damage_flag, mapload)
	if(!brokenstate)
		icon_state = "[base_state]br"
		density = FALSE
		opacity = FALSE
		brokenstate = TRUE
	..()

/obj/structure/mineral_door/OnCrafted(dirin, user)
	. = ..()
	keylock = FALSE
	GLOB.lockhashes.Remove(lockhash)
	lockhash = 0

/////////////////////// TOOL OVERRIDES ///////////////////////


/obj/structure/mineral_door/proc/pickaxe_door(mob/living/user, obj/item/I) //override if the door isn't supposed to be a minable mineral.
	return/*
	if(!istype(user))
		return
	if(I.tool_behaviour != TOOL_MINING)
		return
	. = TRUE
	to_chat(user, span_notice("I start digging [src]..."))
	if(I.use_tool(src, user, 40, volume=50))
		to_chat(user, span_notice("I finish digging."))
		deconstruct(TRUE)*/

/obj/structure/mineral_door/welder_act(mob/living/user, obj/item/I) //override if the door is supposed to be flammable.
	..()
	. = TRUE
	if(anchored)
		to_chat(user, span_warning("[src] все еще прочно прикреплена к земле!"))
		return

	user.visible_message(span_notice("[user] пытается разрезать [src] на части!"), span_notice("Я пытаюсь разрезать [src] на части."))
	if(!I.use_tool(src, user, 60, 5, 50))
		to_chat(user, span_warning("мне не удалось разрезать [src]!"))
		return

	user.visible_message(span_notice("[user] разрезает [src] на части!"), span_notice("Я разрезаю [src] на части!"))
	deconstruct(TRUE)

/obj/structure/mineral_door/proc/crowbar_door(mob/living/user, obj/item/I) //if the door is flammable, call this in crowbar_act() so we can still decon it
	. = TRUE
	if(anchored)
		to_chat(user, span_warning("[src] все еще прочно прикреплена к земле!"))
		return

	user.visible_message(span_notice("[user] пытается разобрать [src]!"), span_notice("Я пытаюсь разобрать [src]."))
	if(!I.use_tool(src, user, 60, volume = 50))
		to_chat(user, span_warning("Мне не удалось разобрать [src]!"))
		return

	user.visible_message(span_notice("[user] разбирает [src], вырывая из неё куски!"), span_notice("Я разбираю [src]!"))
	deconstruct(TRUE)

//ROGUEDOOR

/obj/structure/mineral_door/wood
	name = "дверь"
	desc = ""
	icon_state = "woodhandle"
	openSound = 'sound/foley/doors/creak.ogg'
	closeSound = 'sound/foley/doors/shut.ogg'
	resistance_flags = FLAMMABLE
	max_integrity = 1000
	damage_deflection = 12
	layer = ABOVE_MOB_LAYER
	keylock = TRUE
	icon = 'icons/roguetown/misc/doors.dmi'
	blade_dulling = DULLING_BASHCHOP
	break_sound = 'sound/combat/hits/onwood/destroywalldoor.ogg'
	attacked_sound = list('sound/combat/hits/onwood/woodimpact (1).ogg','sound/combat/hits/onwood/woodimpact (2).ogg')
	var/over_state = "woodover"
	repairable = TRUE
	repair_cost_first = /obj/item/grown/log/tree/small
	repair_cost_second = /obj/item/grown/log/tree/small	
	repair_skill = /datum/skill/craft/carpentry
	metalizer_result = /obj/structure/mineral_door/wood/donjon

/obj/structure/mineral_door/wood/Initialize()
	if(icon_state =="woodhandle")
		if(icon_state != "wcv")
			if(prob(10))
				icon_state = "wcg"
			else if(prob(10))
				icon_state = "wcr"
	if(over_state)
		add_overlay(mutable_appearance(icon, "[over_state]", ABOVE_MOB_LAYER))
	. = ..()

/obj/structure/mineral_door/wood/blue
	icon_state = "wcb"
/obj/structure/mineral_door/wood/red
	icon_state = "wcr"
/obj/structure/mineral_door/wood/violet
	icon_state = "wcv"


/obj/structure/mineral_door/wood/pickaxe_door(mob/living/user, obj/item/I)
	return

/obj/structure/mineral_door/wood/welder_act(mob/living/user, obj/item/I)
	return

/obj/structure/mineral_door/wood/crowbar_act(mob/living/user, obj/item/I)
	return crowbar_door(user, I)

/obj/structure/mineral_door/wood/attackby(obj/item/I, mob/living/user)
	return ..()

/obj/structure/mineral_door/wood/fire_act(added, maxstacks)
	testing("added [added]")
	if(!added)
		return FALSE
	if(added < 10)
		return FALSE
	..()

/obj/structure/mineral_door/swing_door
	name = "распашная дверь"
	desc = "Эта дверь открывается в обе стороны."
	icon_state = "woodhandle"
	openSound = 'sound/foley/doors/creak.ogg'
	closeSound = 'sound/foley/doors/shut.ogg'
	resistance_flags = FLAMMABLE
	max_integrity = 500
	damage_deflection = 12
	layer = ABOVE_MOB_LAYER
	opacity = FALSE
	windowed = TRUE
	keylock = FALSE
	icon = 'icons/roguetown/misc/doors.dmi'
	icon_state = "swing"
	blade_dulling = DULLING_BASHCHOP
	break_sound = 'sound/combat/hits/onwood/destroywalldoor.ogg'
	attacked_sound = list('sound/combat/hits/onwood/woodimpact (1).ogg','sound/combat/hits/onwood/woodimpact (2).ogg')
	repairable = TRUE
	repair_cost_first = /obj/item/grown/log/tree/small
	repair_cost_second = /obj/item/grown/log/tree/small	
	repair_skill = /datum/skill/craft/carpentry

/obj/structure/mineral_door/wood/window
	opacity = FALSE
	icon_state = "woodwindow"
	windowed = TRUE
	desc = ""
	over_state = "woodwindowopen"
	metalizer_result = null

/obj/structure/mineral_door/wood/fancywood
	icon_state = "fancy_wood"
	desc = ""
	over_state = "fancy_woodopen"
	metalizer_result = null

/obj/structure/mineral_door/wood/deadbolt
	desc = "На этой двери есть засов."
	icon_state = "wooddir"
	base_state = "wood"
	var/lockdir
	keylock = FALSE
	max_integrity = 1000
	over_state = "woodopen"
	kickthresh = 10
	openSound = 'sound/foley/doors/shittyopen.ogg'
	closeSound = 'sound/foley/doors/shittyclose.ogg'

/obj/structure/mineral_door/wood/deadbolt/OnCrafted(dirin)
	dir = turn(dirin, 180)
	lockdir = dir

/obj/structure/mineral_door/wood/deadbolt/Initialize()
	. = ..()
	lockdir = dir
	icon_state = base_state

/obj/structure/mineral_door/wood/deadbolt/attack_right(mob/user)
	..()
	if(door_opened || isSwitchingStates)
		return
	if(lockbroken)
		to_chat(user, span_warning("Замок на этой двери сломан."))
		return
	if(brokenstate)
		to_chat(user, span_warning("От этой двери мало что осталось."))
		return
	if(get_dir(src,user) == lockdir)
		lock_toggle(user)
	else
		to_chat(user, span_warning("Дверь не запирается с этой стороны."))

/obj/structure/mineral_door/wood/donjon
	desc = "Тяжелая дверь со смотровым окошком."
	icon_state = "donjondir"
	base_state = "donjon"
	keylock = TRUE
	max_integrity = 2000
	over_state = "dunjonopen"
	var/viewportdir
	kickthresh = 15
	locksound = 'sound/foley/doors/lockmetal.ogg'
	unlocksound = 'sound/foley/doors/lockmetal.ogg'
	rattlesound = 'sound/foley/doors/lockrattlemetal.ogg'
	attacked_sound = list("sound/combat/hits/onmetal/metalimpact (1).ogg", "sound/combat/hits/onmetal/metalimpact (2).ogg")		
	repair_cost_second = /obj/item/ingot/iron
	repair_skill = /datum/skill/craft/carpentry
	metalizer_result = null
	smeltresult = /obj/item/ingot/iron

/obj/structure/mineral_door/wood/donjon/stone
	desc = "каменная дверь"
	icon_state = "stone"
	base_state = "stone"
	keylock = TRUE
	max_integrity = 1500
	over_state = "stoneopen"
	attacked_sound = list('sound/combat/hits/onwood/woodimpact (1).ogg','sound/combat/hits/onwood/woodimpact (2).ogg')	
	repair_cost_first = /obj/item/natural/stone
	repair_cost_second = /obj/item/natural/stone
	repair_skill = /datum/skill/craft/masonry
	smeltresult = null

/obj/structure/mineral_door/wood/donjon/stone/view_toggle(mob/user)
	return

/obj/structure/mineral_door/wood/donjon/Initialize()
	viewportdir = dir
	icon_state = base_state
	. = ..()

/obj/structure/mineral_door/wood/donjon/attack_right(mob/user)
	if(user.get_active_held_item())
		..()
		return
	if(door_opened || isSwitchingStates)
		return
	if(brokenstate)
		to_chat(user, span_warning("От этой двери мало что осталось."))
		return
	if(get_dir(src,user) == viewportdir)
		view_toggle(user)
	else
		to_chat(user, span_warning("Смотровое окно находится по другую сторону двери."))
		return

/obj/structure/mineral_door/wood/donjon/proc/view_toggle(mob/user)
	if(door_opened)
		return
	if(opacity)
		to_chat(user, span_info("Я открываю смотровое окно."))
		opacity = FALSE
		playsound(src, 'sound/foley/doors/windowup.ogg', 100, FALSE)
	else
		to_chat(user, span_info("Я закрываю смотровое окно."))
		opacity = TRUE
		playsound(src, 'sound/foley/doors/windowup.ogg', 100, FALSE)


/obj/structure/mineral_door/bars
	name = "калитка"
	desc = ""
	icon_state = "bars"
	openSound = 'sound/foley/doors/ironopen.ogg'
	closeSound = 'sound/foley/doors/ironclose.ogg'
	resistance_flags = null
	max_integrity = 2000
	damage_deflection = 15
	layer = ABOVE_MOB_LAYER
	keylock = TRUE
	icon = 'icons/roguetown/misc/doors.dmi'
	blade_dulling = DULLING_BASH
	opacity = FALSE
	windowed = TRUE
	keylock = TRUE
	locksound = 'sound/foley/doors/lock.ogg'
	unlocksound = 'sound/foley/doors/unlock.ogg'
	rattlesound = 'sound/foley/doors/lockrattlemetal.ogg'
	attacked_sound = list("sound/combat/hits/onmetal/metalimpact (1).ogg", "sound/combat/hits/onmetal/metalimpact (2).ogg")
	ridethrough = TRUE
	swing_closed = FALSE
	repairable = TRUE
	repair_cost_first = /obj/item/ingot/iron
	repair_cost_second = /obj/item/ingot/iron
	repair_skill = /datum/skill/craft/blacksmithing

/obj/structure/mineral_door/barsold
	name = "iron door"
	desc = ""
	icon_state = "barsold"

/obj/structure/mineral_door/bars/Initialize()
	. = ..()
	add_overlay(mutable_appearance(icon, "barsopen", ABOVE_MOB_LAYER))


/obj/structure/mineral_door/bars/onkick(mob/user)
	user.visible_message(span_warning("[user] распахивает [src] ногой!"))
	return

/obj/structure/mineral_door/wood/towner
	locked = TRUE
	keylock = TRUE
	grant_resident_key = TRUE
	resident_key_type = /obj/item/key/townie
	resident_role = /datum/job/roguetown/towner
	lockid = null //Will be randomized

/obj/structure/mineral_door/wood/towner/generic

/obj/structure/mineral_door/wood/towner/generic/two_keys
	resident_key_amount = 2

/obj/structure/mineral_door/wood/towner/blacksmith
	resident_subclass = /datum/subclass/blacksmith
	lockid = "towner_blacksmith"

/obj/structure/mineral_door/wood/towner/hunter
	resident_subclass = /datum/subclass/hunter
	lockid = "towner_hunter"

/obj/structure/mineral_door/wood/towner/miner
	resident_subclass = /datum/subclass/miner
	lockid = "towner_miner"

/obj/structure/mineral_door/wood/towner/farmer
	resident_subclass = /datum/subclass/farmer
	lockid = "towner_farmer"

/obj/structure/mineral_door/wood/towner/towndoctor
	resident_subclass = /datum/subclass/towndoctor
	lockid = "towner_towndoctor"

/obj/structure/mineral_door/wood/towner/woodcutter
	resident_subclass = /datum/subclass/woodcutter
	lockid = "towner_woodcutter"

/obj/structure/mineral_door/wood/towner/fisher
	resident_subclass = /datum/subclass/fisher
	lockid = "towner_fisher"

/obj/structure/mineral_door/wood/deadbolt/shutter
	name = "легкие ставни"
	desc = "Защелка должна быть с внутренней стороны."
	icon_state = "serving"
	base_state = "serving"
	max_integrity = 250
	over_state = "servingopen"
	openSound = 'modular/Neu_Food/sound/blindsopen.ogg'
	closeSound = 'modular/Neu_Food/sound/blindsclose.ogg'
	dir = NORTH
	locked = TRUE
