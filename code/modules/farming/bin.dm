/obj/item/roguebin
	name = "деревянная бадья"
	desc = "Бадья, мусорная корзина, ящик... Выбор безграничен."
	icon = 'icons/roguetown/misc/structure.dmi'
	icon_state = "washbin1"
	var/base_state
	density = TRUE
	opacity = FALSE
	anchored = FALSE
	max_integrity = 300
	w_class = WEIGHT_CLASS_GIGANTIC
	var/kover = FALSE
	drag_slowdown = 2
	throw_speed = 1
	throw_range = 1
	blade_dulling = DULLING_BASHCHOP
	obj_flags = CAN_BE_HIT

/obj/item/roguebin/weather_trigger(W)
	if(W==/datum/weather/rain)
		START_PROCESSING(SSweather,src)

/obj/item/roguebin/Initialize()
	if(!base_state)
		create_reagents(600, DRAINABLE | AMOUNT_VISIBLE | REFILLABLE)
		icon_state = "washbin[rand(1,2)]"
		base_state = icon_state
	AddComponent(/datum/component/storage/concrete/roguetown/bin)
	. = ..()
	pixel_x = 0
	pixel_y = 0
	update_icon()

/obj/item/roguebin/Destroy()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	if(STR)
		var/list/things = STR.contents()
		for(var/obj/item/I in things)
			STR.remove_from_storage(I, get_turf(src))
	return ..()


/obj/item/roguebin/update_icon()
	if(kover)
		icon_state = "[base_state]over"
	else
		icon_state = "[base_state]"
	cut_overlays()
	if(reagents)
		if(reagents.total_volume)
			var/mutable_appearance/filling = mutable_appearance('icons/roguetown/misc/structure.dmi', "liquid2")
			filling.color = mix_color_from_reagents(reagents.reagent_list)
			filling.alpha = mix_alpha_from_reagents(reagents.reagent_list)
			add_overlay(filling)

/obj/item/roguebin/onkick(mob/user)
	if(isliving(user))
		var/mob/living/L = user
		if(kover)
			playsound(src, 'sound/combat/hits/onwood/woodimpact (1).ogg', 100)
			user.visible_message(span_warning("[user] пинает [src]!"), \
				span_warning("Я пинаю [src]!"))
			return
		if(prob(L.STASTR * 8))
			playsound(src, 'sound/combat/hits/onwood/woodimpact (1).ogg', 100)
			user.visible_message(span_warning("[user] опрокидывает [src]!"), \
				span_warning("Я опрокидываю [src]!"))
			kover = TRUE
			chem_splash(loc, 2, list(reagents))
			var/datum/component/storage/STR = GetComponent(/datum/component/storage)
			if(STR)
				var/list/things = STR.contents()
				for(var/obj/item/I in things)
					STR.remove_from_storage(I, get_turf(src))
			update_icon()
		else
			playsound(src, 'sound/combat/hits/onwood/woodimpact (1).ogg', 100)
			user.visible_message(span_warning("[user] пинает [src]!"), \
				span_warning("Я пинаю [src]!"))

/obj/item/roguebin/attack_hand(mob/user)
	var/datum/component/storage/CP = GetComponent(/datum/component/storage)
	if(CP)
		CP.rmb_show(user)
		return TRUE

/obj/item/roguebin/attack_right(mob/user)
	. = ..()
	if(.)
		return
	if(kover)
		if(kover)
			user.visible_message(span_notice("[user] поднимает [src]..."), \
				span_notice("Я поднимаю [src]..."))
			if(do_after(user, 30, target = src))
				kover = FALSE
				update_icon()
			return
	else
		if(!reagents || !reagents.maximum_volume)
			return
		if(isliving(user))
			var/mob/living/L = user
			if(L.stat != CONSCIOUS)
				return
			var/removereg = /datum/reagent/water
			if(!reagents.has_reagent(/datum/reagent/water, 5))
				removereg = /datum/reagent/water/gross
				if(!reagents.has_reagent(/datum/reagent/water/gross, 5))
					to_chat(user, span_warning("Нет воды, чтобы отстирать эти пятна."))
					return
			reagents.remove_reagent(removereg, 5)
			var/list/wash = list('sound/foley/waterwash (1).ogg','sound/foley/waterwash (2).ogg')
			playsound(user, pick_n_take(wash), 100, FALSE)
			var/item2wash = user.get_active_held_item()
			if(!item2wash)
				user.visible_message(span_info("[user] умывается в [src], как может."))
				if(do_after(L, 30, target = src))
					wash_atom(user, CLEAN_STRONG)
					playsound(user, pick(wash), 100, FALSE)
			else
				user.visible_message(span_info("[user] моет [item2wash] в [src]."))
				if(do_after(L, 30, target = src))
					wash_atom(item2wash, CLEAN_STRONG)
					playsound(user, pick(wash), 100, FALSE)
			var/datum/reagent/water_to_dirty = reagents.has_reagent(/datum/reagent/water, 5)
			if(water_to_dirty)
				var/amount_to_dirty = water_to_dirty.volume
				if(amount_to_dirty)
					reagents.remove_reagent(/datum/reagent/water, amount_to_dirty)
					reagents.add_reagent(/datum/reagent/water/gross, amount_to_dirty)
			return

//We need to use this or the object will be put in storage instead of attacking it
/obj/item/roguebin/StorageBlock(obj/item/I, mob/user)
	if(user.used_intent)
		if(user.used_intent.type in list(/datum/intent/fill,/datum/intent/pour,/datum/intent/splash))
			return TRUE
	if(istype(I, /obj/item/rogueweapon/tongs))
		var/obj/item/rogueweapon/tongs/T = I
		if(T.hingot && istype(T.hingot))
			return TRUE
	return FALSE

/obj/item/roguebin/attackby(obj/item/I, mob/user, params)
	if(!reagents || !reagents.maximum_volume) //trash
		return ..()
	if(istype(I, /obj/item/rogueweapon/tongs))
		var/obj/item/rogueweapon/tongs/T = I
		if(T.hingot && istype(T.hingot))
			var/removereg = /datum/reagent/water
			if(!reagents.has_reagent(/datum/reagent/water, 5))
				removereg = /datum/reagent/water/gross
				if(!reagents.has_reagent(/datum/reagent/water/gross, 5))
					to_chat(user, span_warning("Нужно больше воды для остужения металла."))
					return
			if(!T.hingot.currecipe)
				to_chat(user, span_warning("Ха?"))
				return
			if(T.hingot.currecipe.progress != 100)
				to_chat(user, span_warning("Изделие еще не готово."))
				return
			if(!T.hott)
				to_chat(user, span_warning("Мне нужно нагреть заготовку, чтобы закалить металл."))
				return
			var/used_turf = user.loc
			if(!isturf(used_turf))
				used_turf = get_turf(src)
			var/datum/anvil_recipe/R = T.hingot.currecipe
			if(islist(R.created_item))
				var/list/L = R.created_item
				for(var/IT in L)
					new IT(used_turf)
			else
				new R.created_item(used_turf)
			playsound(src,pick('sound/items/quench_barrel1.ogg','sound/items/quench_barrel2.ogg'), 100, FALSE)
			QDEL_NULL(T.hingot)
			T.update_icon()
			reagents.remove_reagent(removereg, 5)
			var/datum/reagent/water_to_dirty = reagents.has_reagent(/datum/reagent/water, 5)
			if(water_to_dirty)
				var/amount_to_dirty = water_to_dirty.volume
				if(amount_to_dirty)
					reagents.remove_reagent(/datum/reagent/water, amount_to_dirty)
					reagents.add_reagent(/datum/reagent/water/gross, amount_to_dirty)
			update_icon()
			return
	. = ..()

/obj/item/roguebin/trash
	name = "мусорный бак"
	desc = "Бельмо на глазу, призванное сделать мир чище."
	icon_state = "trashbin"
	base_state = "trashbin"

/obj/item/roguebin/trash/StorageBlock(obj/item/I, mob/user)
	return FALSE
