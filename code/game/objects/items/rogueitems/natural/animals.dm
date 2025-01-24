/obj/item/natural/hide
	name = "шкура"
	icon_state = "hide"
	desc = "Шкура одного из божьих созданий. Содрав изнанку, можно получить пригодную для работы кожу."
	w_class = WEIGHT_CLASS_SMALL
	resistance_flags = FLAMMABLE
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	sellprice = 20

/obj/item/natural/hide/cured
	name = "обработанная кожа"
	icon_state = "leather"
	desc = "Кусок шкуры, с которой была содрана мездра. Получившаяся кожа может быть использована в ремесле."
	sellprice = 7
	bundletype = /obj/item/natural/bundle/curred_hide

/obj/item/natural/bundle/curred_hide
	name = "связка обработанной кожи"
	desc = "Куча листов выделанной кожи, связанных вместе."
	icon_state = "leatherroll1"
	maxamount = 10
	spitoutmouth = FALSE
	stacktype = /obj/item/natural/hide/cured
	stackname = "полотен кожи"
	icon1 = "leatherroll1"
	icon1step = 5
	icon2 = "leatherroll2"
	icon2step = 10

/obj/item/natural/hide/cured/attack_right(mob/user)
	to_chat(user, span_warning("Я собираю [src]..."))
	if(move_after(user, 1 SECONDS, target = src))
		var/curredcount = 0
		for(var/obj/item/natural/hide/cured/F in get_turf(src))
			curredcount++
		while(curredcount > 0)
			if(curredcount == 1)
				new /obj/item/natural/hide/cured(get_turf(user))
				curredcount--
			else if(curredcount >= 2)
				var/obj/item/natural/bundle/curred_hide/B = new(get_turf(user))
				B.amount = clamp(curredcount, 2, 10)
				B.update_bundle()
				curredcount -= clamp(curredcount, 2, 10)
		for(var/obj/item/natural/hide/cured/F in get_turf(src))
			qdel(F)

/obj/item/natural/cured/essence
	name = "эссенция природы"
	icon_state = "wessence"
	desc = "Мистическая сущность, наполненная силой Дендора. Просто держа её в руках, переносишься в древние времена."
	resistance_flags = FLAMMABLE
	w_class = WEIGHT_CLASS_SMALL
	sellprice = 20

/obj/item/natural/fur
	name = "мех"
	icon_state = "wool1"
	desc = "Мех одного из божих созданий."
	force = 0
	throwforce = 0
	w_class = WEIGHT_CLASS_SMALL
	resistance_flags = FLAMMABLE
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	color = "#5c5243"
	sellprice = 40

//RTD make this a storage item and make clickign on animals with things put it in storage
/obj/item/natural/saddle
	name = "седло"
	desc = "Удобное сиденье для всадников. Крепится на спину ездового животного."
	icon_state = "saddle"
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK_L
	resistance_flags = FLAMMABLE
	gripped_intents = list(/datum/intent/use)
	force = 0
	throwforce = 0
	sellprice = 10
	twohands_required = TRUE

/obj/item/natural/saddle/attack(mob/living/target, mob/living/carbon/human/user)
	if(istype(target, /mob/living/simple_animal))
		testing("yea1")
		var/mob/living/simple_animal/S = target
		if(S.can_saddle && !S.ssaddle)
			testing("yea2")
			if(!target.has_buckled_mobs())
				user.visible_message(span_warning("[user] забрасывает седло на [target]..."))
				if(do_after(user, 40, target = target))
					S.name = input("Выберите имя для вашего нового ездового животного: ","Имя", S.name)
					playsound(loc, 'sound/foley/saddledismount.ogg', 100, FALSE)
					user.dropItemToGround(src)
					S.ssaddle = src
					src.forceMove(S)
					S.update_icon()
		return
	..()

/mob/living/simple_animal
	var/can_saddle = FALSE
	var/obj/item/ssaddle
	// A flat percentage bonus to our ability to detect sneaking people only. Use in lieu of giving mobs huge STAPER bonuses if you want them to be observant.
	var/simple_detect_bonus = 0
