/* * * * * * * * * * * **
 *						*
 *		 NeuFood		*	- Defined as edible food that can be plated and usually needs rare tools or ingridients. Typically based on a snack but not necessarily
 *		 (Meals)		*
 *						*
 * * * * * * * * * * * **/



/*	..................   Pepper steak   ................... */
/obj/item/reagent_containers/food/snacks/rogue/peppersteak
	list_reagents = list(/datum/reagent/consumable/nutriment = MEAL_MEAGRE)
	tastes = list("теплого стейка" = 1, "черного перца" = 1)
	name = "стейк с перцем"
	desc = "Жареное мясо с щедрым слоем молотого перца для интенсивного вкуса."
	icon_state = "peppersteak"
	foodtype = MEAT
	warming = 5 MINUTES
	rotprocess = SHELFLIFE_DECENT
	eat_effect = /datum/status_effect/buff/foodbuff
	drop_sound = 'sound/foley/dropsound/gen_drop.ogg'
/obj/item/reagent_containers/food/snacks/rogue/peppersteak/plated
	icon_state = "peppersteak_plated"
	item_state = "plate_food"
	lefthand_file = 'modular/Neu_Food/icons/food_lefthand.dmi'
	righthand_file = 'modular/Neu_Food/icons/food_righthand.dmi'
	experimental_inhand = FALSE
	w_class = WEIGHT_CLASS_BULKY
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 2)
	trash = /obj/item/cooking/platter
	rotprocess = SHELFLIFE_LONG


/*	..................   Onion steak   ................... */
/obj/item/reagent_containers/food/snacks/rogue/onionsteak
	name = "стейк с луком"
	desc = "Жареное мясо, украшенное нежным жареным луком, в ароматном и пропитанном соками обоих ингредиентов аппетитном соусе."
	icon_state = "onionsteak"
	tastes = list("теплого стейка" = 1, "жареного лука" = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT+3)
	foodtype = MEAT
	warming = 5 MINUTES
	rotprocess = SHELFLIFE_DECENT
	eat_effect = /datum/status_effect/buff/foodbuff
	drop_sound = 'sound/foley/dropsound/gen_drop.ogg'
/obj/item/reagent_containers/food/snacks/rogue/onionsteak/plated
	icon_state = "onionsteak_plated"
	item_state = "plate_food"
	lefthand_file = 'modular/Neu_Food/icons/food_lefthand.dmi'
	righthand_file = 'modular/Neu_Food/icons/food_righthand.dmi'
	experimental_inhand = FALSE
	w_class = WEIGHT_CLASS_BULKY
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 2)
	trash = /obj/item/cooking/platter
	rotprocess =  SHELFLIFE_LONG


/*	.................   Wiener Cabbage   ................... */
/obj/item/reagent_containers/food/snacks/rogue/wienercabbage
	list_reagents = list(/datum/reagent/consumable/nutriment = MEAL_MEAGRE)
	tastes = list("пикантной колбаски" = 1, "тушеной капусты" = 1)
	name = "колбаска на капусте"
	desc = "Сытная и тяжелая еда — идеальный рацион для солдата в походе."
	icon_state = "wienercabbage"
	foodtype = VEGETABLES | MEAT
	warming = 3 MINUTES
	rotprocess = SHELFLIFE_LONG
	eat_effect = /datum/status_effect/buff/foodbuff
/obj/item/reagent_containers/food/snacks/rogue/wienercabbage/plated
	icon_state = "wienercabbage_plated"
	item_state = "plate_food"
	lefthand_file = 'modular/Neu_Food/icons/food_lefthand.dmi'
	righthand_file = 'modular/Neu_Food/icons/food_righthand.dmi'
	experimental_inhand = FALSE
	w_class = WEIGHT_CLASS_BULKY
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 2)
	trash = /obj/item/cooking/platter
	rotprocess = SHELFLIFE_EXTREME


/*	.................   Wiener & Fried potato   ................... */
/obj/item/reagent_containers/food/snacks/rogue/wienerpotato
	list_reagents = list(/datum/reagent/consumable/nutriment = MEAL_MEAGRE)
	tastes = list("пикантной колбаски" = 1, "жареного картофеля" = 1)
	name = "колбаска с картофелем"
	desc = "Плотное и питательное блюдо."
	icon_state = "wienerpotato"
	foodtype = VEGETABLES | MEAT
	warming = 3 MINUTES
	rotprocess = SHELFLIFE_LONG
	eat_effect = /datum/status_effect/buff/foodbuff
/obj/item/reagent_containers/food/snacks/rogue/wienerpotato/attackby(obj/item/I, mob/living/user, params)
	var/found_table = locate(/obj/structure/table) in (loc)
	if(!experimental_inhand)
		return
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/preserved/onion_fried))
		if(isturf(loc)&& (found_table))
			playsound(get_turf(user), 'sound/foley/dropsound/gen_drop.ogg', 30, TRUE, -1)
			if(do_after(user,3 SECONDS, target = src))
				user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
				new /obj/item/reagent_containers/food/snacks/rogue/wienerpotatonions(loc)
				qdel(I)
				qdel(src)
	else
		return ..()
/obj/item/reagent_containers/food/snacks/rogue/wienerpotato/plated
	icon_state = "wienerpotato_plated"
	item_state = "plate_food"
	lefthand_file = 'modular/Neu_Food/icons/food_lefthand.dmi'
	righthand_file = 'modular/Neu_Food/icons/food_righthand.dmi'
	experimental_inhand = FALSE
	w_class = WEIGHT_CLASS_BULKY
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 2)
	trash = /obj/item/cooking/platter
	rotprocess = SHELFLIFE_EXTREME
/obj/item/reagent_containers/food/snacks/rogue/wienerpotato/plated/attackby(obj/item/I, mob/living/user, params)
	var/found_table = locate(/obj/structure/table) in (loc)
	if(!experimental_inhand)
		return
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/preserved/onion_fried))
		if(isturf(loc)&& (found_table))
			playsound(get_turf(user), 'sound/foley/dropsound/gen_drop.ogg', 30, TRUE, -1)
			if(do_after(user,3 SECONDS, target = src))
				user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
				new /obj/item/reagent_containers/food/snacks/rogue/wienerpotatonions/plated(loc)
				qdel(I)
				qdel(src)
	else
		return ..()

/*	.................   Wiener & Fried onions   ................... */
/obj/item/reagent_containers/food/snacks/rogue/wieneronions
	list_reagents = list(/datum/reagent/consumable/nutriment = MEAL_MEAGRE)
	tastes = list("пикантной колбаски" = 1, "жареного лука" = 1)
	name = "колбаска с луком"
	desc = "Крепкое и ароматное блюдо."
	icon_state = "wieneronions"
	foodtype = VEGETABLES | MEAT
	warming = 3 MINUTES
	rotprocess = SHELFLIFE_LONG
	eat_effect = /datum/status_effect/buff/foodbuff
/obj/item/reagent_containers/food/snacks/rogue/wieneronions/attackby(obj/item/I, mob/living/user, params)
	var/found_table = locate(/obj/structure/table) in (loc)
	if(!experimental_inhand)
		return
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/preserved/potato_baked))
		if(isturf(loc)&& (found_table))
			playsound(get_turf(user), 'sound/foley/dropsound/gen_drop.ogg', 30, TRUE, -1)
			if(do_after(user,3 SECONDS, target = src))
				user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
				new /obj/item/reagent_containers/food/snacks/rogue/wienerpotatonions(loc)
				qdel(I)
				qdel(src)
	else
		return ..()
/obj/item/reagent_containers/food/snacks/rogue/wieneronions/plated
	icon_state = "wieneronions_plated"
	item_state = "plate_food"
	lefthand_file = 'modular/Neu_Food/icons/food_lefthand.dmi'
	righthand_file = 'modular/Neu_Food/icons/food_righthand.dmi'
	experimental_inhand = FALSE
	w_class = WEIGHT_CLASS_BULKY
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 2)
	trash = /obj/item/cooking/platter
	rotprocess = SHELFLIFE_EXTREME
/obj/item/reagent_containers/food/snacks/rogue/wieneronions/plated/attackby(obj/item/I, mob/living/user, params)
	var/found_table = locate(/obj/structure/table) in (loc)
	if(!experimental_inhand)
		return
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/preserved/potato_baked))
		if(isturf(loc)&& (found_table))
			playsound(get_turf(user), 'sound/foley/dropsound/gen_drop.ogg', 30, TRUE, -1)
			if(do_after(user,3 SECONDS, target = src))
				user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
				new /obj/item/reagent_containers/food/snacks/rogue/wienerpotatonions/plated(loc)
				qdel(I)
				qdel(src)
	else
		return ..()


/*	.................   Wiener & potato & onions   ................... */
/obj/item/reagent_containers/food/snacks/rogue/wienerpotatonions
	list_reagents = list(/datum/reagent/consumable/nutriment = MEAL_MEAGRE)
	tastes = list("пикантной колбаски" = 1, "жареного картофеля" = 1, "жареного лука" = 1)
	name = "колбаска с овощами"
	desc = "Плотное и питательное блюдо."
	icon_state = "wpotonion"
	foodtype = VEGETABLES | MEAT
	warming = 3 MINUTES
	rotprocess = SHELFLIFE_DECENT
	eat_effect = /datum/status_effect/buff/foodbuff
/obj/item/reagent_containers/food/snacks/rogue/wienerpotatonions/plated
	icon_state = "wpotonion_plated"
	item_state = "plate_food"
	lefthand_file = 'modular/Neu_Food/icons/food_lefthand.dmi'
	righthand_file = 'modular/Neu_Food/icons/food_righthand.dmi'
	experimental_inhand = FALSE
	w_class = WEIGHT_CLASS_BULKY
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 2)
	trash = /obj/item/cooking/platter
	rotprocess = SHELFLIFE_LONG

/*	.................   Frybird & Tato   ................... */
/obj/item/reagent_containers/food/snacks/rogue/frybirdtato
	list_reagents = list(/datum/reagent/consumable/nutriment = MEAL_MEAGRE)
	tastes = list("печеной птицы" = 1, "жареного картофеля" = 1)
	name = "птица с картофелем"
	desc = "Сытное, уютное и насыщенное – предположительно, любимое блюдо Равокса при смертной жизни."
	icon_state = "frybirdtato"
	foodtype = VEGETABLES | MEAT
	warming = 3 MINUTES
	rotprocess = SHELFLIFE_DECENT
	eat_effect = /datum/status_effect/buff/foodbuff
/obj/item/reagent_containers/food/snacks/rogue/frybirdtato/plated
	icon_state = "frybirdtato_plated"
	item_state = "plate_food"
	lefthand_file = 'modular/Neu_Food/icons/food_lefthand.dmi'
	righthand_file = 'modular/Neu_Food/icons/food_righthand.dmi'
	experimental_inhand = FALSE
	w_class = WEIGHT_CLASS_BULKY
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 2)
	trash = /obj/item/cooking/platter
	rotprocess = SHELFLIFE_LONG


/*	.................   Valerian Omelette   ................... */
/obj/item/reagent_containers/food/snacks/rogue/friedegg/tiberian
	list_reagents = list(/datum/reagent/consumable/nutriment = MEAL_MEAGRE)
	tastes = list("жареного яйца" = 1, "сыра" = 1)
	name = "валерианский омлет"
	desc = "Жареное яйцо на подушке из полурасплавленного сыра, блюдо из далеких стран."
	icon_state = "omelette"
	eat_effect = /datum/status_effect/buff/foodbuff
	rotprocess = SHELFLIFE_DECENT
/obj/item/reagent_containers/food/snacks/rogue/friedegg/tiberian/plated
	icon_state = "omelette_plated"
	item_state = "plate_food"
	lefthand_file = 'modular/Neu_Food/icons/food_lefthand.dmi'
	righthand_file = 'modular/Neu_Food/icons/food_righthand.dmi'
	experimental_inhand = FALSE
	w_class = WEIGHT_CLASS_BULKY
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 2)
	trash = /obj/item/cooking/platter
	rotprocess = SHELFLIFE_LONG

/*	.................   Plated fryfish   ................... */
/obj/item/reagent_containers/food/snacks/rogue/fryfish/carp/plated
	desc = "Подарок Абиссора. Обязательно съешьте глаза!"
	icon_state = "carpcooked_plated"
	item_state = "plate_food"
	lefthand_file = 'modular/Neu_Food/icons/food_lefthand.dmi'
	righthand_file = 'modular/Neu_Food/icons/food_righthand.dmi'
	experimental_inhand = FALSE
	w_class = WEIGHT_CLASS_BULKY
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 2)
	trash = /obj/item/cooking/platter
	rotprocess = SHELFLIFE_LONG

/obj/item/reagent_containers/food/snacks/rogue/fryfish/clownfish/plated
	desc = "Подарок Абиссора. Обязательно съешьте глаза!"
	icon_state = "clownfishcooked_plated"
	item_state = "plate_food"
	lefthand_file = 'modular/Neu_Food/icons/food_lefthand.dmi'
	righthand_file = 'modular/Neu_Food/icons/food_righthand.dmi'
	experimental_inhand = FALSE
	w_class = WEIGHT_CLASS_BULKY
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 2)
	trash = /obj/item/cooking/platter
	rotprocess = SHELFLIFE_LONG

/obj/item/reagent_containers/food/snacks/rogue/fryfish/angler/plated
	desc = "Подарок Абиссора. Обязательно съешьте глаза!"
	icon_state = "anglercooked_plated"
	item_state = "plate_food"
	lefthand_file = 'modular/Neu_Food/icons/food_lefthand.dmi'
	righthand_file = 'modular/Neu_Food/icons/food_righthand.dmi'
	experimental_inhand = FALSE
	w_class = WEIGHT_CLASS_BULKY
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 2)
	trash = /obj/item/cooking/platter
	rotprocess = SHELFLIFE_LONG

/obj/item/reagent_containers/food/snacks/rogue/fryfish/eel/plated
	desc = "Подарок Абиссора. Обязательно съешьте глаза!"
	icon_state = "eelcooked_plated"
	item_state = "plate_food"
	lefthand_file = 'modular/Neu_Food/icons/food_lefthand.dmi'
	righthand_file = 'modular/Neu_Food/icons/food_righthand.dmi'
	experimental_inhand = FALSE
	w_class = WEIGHT_CLASS_BULKY
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 2)
	trash = /obj/item/cooking/platter
	rotprocess = SHELFLIFE_LONG


/*	.................   Chicken roast   ................... */
/obj/item/reagent_containers/food/snacks/rogue/meat/poultry/baked
	desc = "Пухлая птица, запеченная до идеальной температуры и хрустящей кожицы."
	eat_effect = null
	slices_num = 0
	name = "запеченая птица"
	icon_state = "roastchicken"
	tastes = list("вкусного мяса птицы" = 1)
	cooked_type = null
	bonus_reagents = list(/datum/reagent/consumable/nutriment = MEAL_MEAGRE)
	rotprocess = SHELFLIFE_DECENT
/obj/item/reagent_containers/food/snacks/rogue/meat/poultry/baked/attackby(obj/item/I, mob/living/user, params)
	var/obj/item/reagent_containers/peppermill/mill = I
	if (!isturf(src.loc) || \
		!(locate(/obj/structure/table) in src.loc) && \
		!(locate(/obj/structure/table/optable) in src.loc) && \
		(locate(/obj/item/storage/tray) in src.loc))
		to_chat(user, "<span class='warning'>Мне необходимо использовать стол.</span>")
		return FALSE
	if(istype(mill))
		if(!mill.reagents.has_reagent(/datum/reagent/consumable/blackpepper, 1))
			to_chat(user, "Не хватает черного перца, чтобы что-нибудь приготовить.")
			return TRUE
		mill.icon_state = "peppermill_grind"
		to_chat(user, "Вы начинаете натирать запеченую птицу черным перцем.")
		playsound(get_turf(user), 'modular/Neu_Food/sound/peppermill.ogg', 100, TRUE, -1)
		if(do_after(user,3 SECONDS, target = src))
			if(!mill.reagents.has_reagent(/datum/reagent/consumable/blackpepper, 1))
				to_chat(user, "Не хватает черного перца, чтобы что-нибудь приготовить.")
				return TRUE
			mill.reagents.remove_reagent(/datum/reagent/consumable/blackpepper, 1)
			user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
			new /obj/item/reagent_containers/food/snacks/rogue/meat/poultry/baked/spiced(loc)
			qdel(src)

	else
		to_chat(user, "<span class='warning'>Нужно положить [src] на стол, чтобы втереть специи.</span>")
/obj/item/reagent_containers/food/snacks/rogue/meat/poultry/baked/spiced
	desc = "Пухлая птица, зажаренная до совершенства и приправленная пряностями. Божественный вкус!"
	eat_effect = /datum/status_effect/buff/foodbuff
	name = "spiced bird-roast"
	color = "#ffc0c0"
	tastes = list("вкусного мяса птицы" = 1, "черного перца" = 1)
/obj/item/reagent_containers/food/snacks/rogue/meat/poultry/baked/plated
	icon_state = "roastchicken_plated"
	item_state = "plate_food"
	lefthand_file = 'modular/Neu_Food/icons/food_lefthand.dmi'
	righthand_file = 'modular/Neu_Food/icons/food_righthand.dmi'
	experimental_inhand = FALSE
	w_class = WEIGHT_CLASS_BULKY
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 2)
	trash = /obj/item/cooking/platter
	rotprocess = SHELFLIFE_LONG


/*	.................   Cooked rat   ................... */
/obj/item/reagent_containers/food/snacks/rogue/friedrat/plated
	desc = "Праздник нищего."
	icon_state = "cookedrat_plated"
	item_state = "plate_food"
	tastes = list("крысятины" = 1, "бедности" = 1)
	lefthand_file = 'modular/Neu_Food/icons/food_lefthand.dmi'
	righthand_file = 'modular/Neu_Food/icons/food_righthand.dmi'
	experimental_inhand = FALSE
	w_class = WEIGHT_CLASS_BULKY
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 2)
	trash = /obj/item/cooking/platter
	rotprocess = SHELFLIFE_LONG
