/* * * * * * * * * * * **
 *						*
 *		 NeuFood		*	- Defined as edible food that can't be plated and ideally can be made in rough conditions, generally less nutritious
 *		 (Snacks)		*
 *						*
 * * * * * * * * * * * **/


/*	.............   Frysteak   ................ */
/obj/item/reagent_containers/food/snacks/rogue/meat/steak/fried
	eat_effect = null
	slices_num = 0
	name = "стейк"
	desc = "Кусок мяса зверя, обжаренный до идеальной средней прожарки. (Подавайте как есть или добавьте перец либо жареный лук; используйте с солью, чтобы приготовить солонину)"
	icon_state = "frysteak"
	bonus_reagents = list(/datum/reagent/consumable/nutriment = MEATSLAB_NUTRITION)
	rotprocess = SHELFLIFE_DECENT
	tastes = list("теплого стейка" = 1)

/obj/item/reagent_containers/food/snacks/rogue/meat/steak/fried/attackby(obj/item/I, mob/living/user, params)
	var/obj/item/reagent_containers/peppermill/mill = I
	if (!isturf(src.loc) || \
		!(locate(/obj/structure/table) in src.loc) && \
		!(locate(/obj/structure/table/optable) in src.loc) && \
		!(locate(/obj/item/storage/tray) in src.loc))
		to_chat(user, "<span class='warning'>Мне необходимо использовать стол.</span>")
		return FALSE
	if(user.mind)
		short_cooktime = (60 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*5))
		long_cooktime = (100 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*10))
	if(istype(mill))
		if(!mill.reagents.has_reagent(/datum/reagent/consumable/blackpepper, 1))
			to_chat(user, "Не хватает черного перца, чтобы что-нибудь приготовить.")
			return TRUE
		mill.icon_state = "peppermill_grind"
		to_chat(user, "Вы начинаете натирать стейк черным перцем...")
		playsound(get_turf(user), 'modular/Neu_Food/sound/peppermill.ogg', 100, TRUE, -1)
		if(do_after(user,long_cooktime, target = src))
			if(!mill.reagents.has_reagent(/datum/reagent/consumable/blackpepper, 1))
				to_chat(user, "Не хватает черного перца, чтобы что-нибудь приготовить.")
				return TRUE
			user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
			mill.reagents.remove_reagent(/datum/reagent/consumable/blackpepper, 1)
			new /obj/item/reagent_containers/food/snacks/rogue/peppersteak(loc)
			qdel(src)
		else
			to_chat(user, "<span class='warning'>Нужно положить [src] на стол, чтобы втереть специи.</span>")

	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/preserved/onion_fried))
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 40, TRUE, -1)
		to_chat(user, "<span class='notice'>Добавляю луковые кольца...</span>")
		if(do_after(user,short_cooktime, target = src))
			user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
			new /obj/item/reagent_containers/food/snacks/rogue/onionsteak(loc)
			qdel(I)
			qdel(src)


/*	.............   Grenzelbun   ................ */
/obj/item/reagent_containers/food/snacks/rogue/bun_grenz
	list_reagents = list(/datum/reagent/consumable/nutriment = SAUSAGE_NUTRITION+SMALLDOUGH_NUTRITION)
	tastes = list("пикантной колбаски" = 1, "румяной булки" = 1)
	name = "грензельдог"
	desc = "Первоначально эльфийская кухня, состоящая из мяса и хлеба смертных рас - классическая сосиска в булочке, теперь по улучшенному рецепту. Основная еда кухни Грензельхофта."
	icon_state = "grenzbun"
	foodtype = GRAIN | MEAT
	warming = 5 MINUTES
	bitesize = 4
	rotprocess = SHELFLIFE_LONG
	eat_effect = /datum/status_effect/buff/foodbuff

/obj/item/reagent_containers/food/snacks/rogue/bun_grenz/plated
	icon_state = "grenzbun_plated"
	item_state = "plate_food"
	lefthand_file = 'modular/Neu_Food/icons/food_lefthand.dmi'
	righthand_file = 'modular/Neu_Food/icons/food_righthand.dmi'
	experimental_inhand = FALSE
	w_class = WEIGHT_CLASS_BULKY
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 2)
	trash = /obj/item/cooking/platter
	rotprocess = SHELFLIFE_EXTREME


/*	.............   Fried Cackleberry   ................ */
/obj/item/reagent_containers/food/snacks/rogue/friedegg
	trash = null
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT)
	tastes = list("жареного яйца" = 1)
	name = "яичница"
	desc = "Любимое блюдо Астратанцев."
	icon_state = "friedegg"
	foodtype = MEAT
	warming = 5 MINUTES
	rotprocess = SHELFLIFE_DECENT

/obj/item/reagent_containers/food/snacks/rogue/friedegg/attackby(obj/item/I, mob/living/user, params)
	var/found_table = locate(/obj/structure/table) in (loc)
	if(user.mind)
		short_cooktime = (60 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*5))
		long_cooktime = (100 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*10))
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/friedegg))
		if(isturf(loc)&& (found_table))
			playsound(get_turf(user), 'sound/foley/dropsound/gen_drop.ogg', 30, TRUE, -1)
			if(do_after(user,short_cooktime, target = src))
				user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
				new /obj/item/reagent_containers/food/snacks/rogue/friedegg/two(loc)
				qdel(I)
				qdel(src)
	else
		return ..()


/*	.............   Twin fried cackleberries   ................ */
/obj/item/reagent_containers/food/snacks/rogue/friedegg/two
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_CHUNKY)
	tastes = list("жареного яйца" = 1)
	name = "большая яичницы"
	desc = "Больше желтков, больше удовольствия."
	icon_state = "seggs"

/obj/item/reagent_containers/food/snacks/rogue/friedegg/two/attackby(obj/item/I, mob/living/user, params)
	var/found_table = locate(/obj/structure/table) in (loc)
	if(user.mind)
		short_cooktime = (60 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*5))
		long_cooktime = (100 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*10))
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/cheddarwedge))
		if(isturf(loc)&& (found_table))
			playsound(get_turf(user), 'sound/foley/dropsound/gen_drop.ogg', 30, TRUE, -1)
			if(do_after(user,long_cooktime, target = src))
				user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
				new /obj/item/reagent_containers/food/snacks/rogue/friedegg/tiberian(loc)
				qdel(I)
				qdel(src)
	else
		return ..()


/*	.............   Frybird   ................ */
/obj/item/reagent_containers/food/snacks/rogue/meat/poultry/cutlet/fried
	eat_effect = null
	slices_num = 0
	name = "жареная птица"
	desc = "Мясо птицы, зажаренное на сковороде до идеальной хрустящей корочки."
	icon_state = "frybird"
	tastes = list("жареной птицы" = 1)
	fried_type = null
	bonus_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT)
	rotprocess = SHELFLIFE_DECENT

/obj/item/reagent_containers/food/snacks/rogue/meat/poultry/cutlet/fried/attackby(obj/item/I, mob/living/user, params)
	var/found_table = locate(/obj/structure/table) in (loc)
	if(user.mind)
		short_cooktime = (60 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*5))
		long_cooktime = (100 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*10))
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/preserved/potato_baked))
		if(isturf(loc)&& (found_table))
			playsound(get_turf(user), 'sound/foley/dropsound/gen_drop.ogg', 30, TRUE, -1)
			if(do_after(user,short_cooktime, target = src))
				user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
				new /obj/item/reagent_containers/food/snacks/rogue/frybirdtato(loc)
				qdel(I)
				qdel(src)
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/preserved/potato_fried))
		if(isturf(loc)&& (found_table))
			playsound(get_turf(user), 'sound/foley/dropsound/gen_drop.ogg', 30, TRUE, -1)
			if(do_after(user,short_cooktime, target = src))
				user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
				new /obj/item/reagent_containers/food/snacks/rogue/frybirdtato(loc)
				qdel(I)
				qdel(src)
	else
		return ..()


/*	.............   Crispy bacon   ................ */
/obj/item/reagent_containers/food/snacks/rogue/meat/bacon/fried
	eat_effect = null
	name = "жареный бекон"
	desc = "Перспективы кабанчика на старость."
	icon_state = "friedbacon"
	tastes = list("жирного мяса" = 1)
	bonus_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT)
	rotprocess = SHELFLIFE_DECENT


/*	.............   Fryspider   ................ */
/obj/item/reagent_containers/food/snacks/rogue/meat/spider/fried
	name = "печеное паучье мясо"
	desc = "Паучья ножка, побритая и обжаренная."
	icon_state = "friedspider"
	tastes = list("жгучего мяса" = 1)
	eat_effect = null
	bonus_reagents = list(/datum/reagent/consumable/nutriment = SNACK_POOR)
	rotprocess = SHELFLIFE_DECENT


/*	.............   Sausage & Wiener   ................ */
/obj/item/reagent_containers/food/snacks/rogue/meat/sausage/cooked
	eat_effect = null
	name = "жареная колбаска"
	desc = "Вкусное мясо, уплотненное в кишечной оболочке."
	icon_state = "wiener"
	tastes = list("мясной колбаски" = 1)
	fried_type = null
	bonus_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT)
	rotprocess = SHELFLIFE_EXTREME

/obj/item/reagent_containers/food/snacks/rogue/meat/sausage/cooked/wiener // wiener meant to be made from beef or maybe mince + bacon, luxury sausage, not implemented yet
	name = "жареная сосиска"


/*	.............   Cooked cabbage   ................ */
/obj/item/reagent_containers/food/snacks/rogue/preserved/cabbage_fried
	name = "тушеная капуста"
	icon_state = "cabbage_fried"
	desc = "Радость крестьянина."
	bitesize = 2
	list_reagents = list(/datum/reagent/consumable/nutriment = 2)
	tastes = list("теплой капусты" = 1)
	rotprocess = SHELFLIFE_LONG
/obj/item/reagent_containers/food/snacks/rogue/preserved/cabbage_fried/attackby(obj/item/I, mob/living/user, params)
	var/found_table = locate(/obj/structure/table) in (loc)
	if(user.mind)
		short_cooktime = (60 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*5))
		long_cooktime = (100 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*10))
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/meat/sausage/cooked))
		if(isturf(loc)&& (found_table))
			playsound(get_turf(user), 'sound/foley/dropsound/gen_drop.ogg', 30, TRUE, -1)
			if(do_after(user,short_cooktime, target = src))
				user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
				new /obj/item/reagent_containers/food/snacks/rogue/wienercabbage(loc)
				qdel(I)
				qdel(src)
	else
		return ..()


/*	.............   Baked potato   ................ */
/obj/item/reagent_containers/food/snacks/rogue/preserved/potato_baked
	name = "печеный картофель"
	desc = "Любимое блюдо дворфов и снаряд для игры в горячую картошку."
	icon_state = "potato_baked"
	tastes = list("мягкого картофеля")
	bitesize = 4
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT)
	rotprocess = SHELFLIFE_LONG

/obj/item/reagent_containers/food/snacks/rogue/preserved/potato_baked/attackby(obj/item/I, mob/living/user, params)
	var/found_table = locate(/obj/structure/table) in (loc)
	if(user.mind)
		short_cooktime = (60 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*5))
		long_cooktime = (100 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*10))
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/meat/sausage/cooked))
		if(isturf(loc)&& (found_table))
			playsound(get_turf(user), 'sound/foley/dropsound/gen_drop.ogg', 30, TRUE, -1)
			to_chat(user, "Готовлю порцию колбаски с картофелем...")
			if(do_after(user,short_cooktime, target = src))
				user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
				new /obj/item/reagent_containers/food/snacks/rogue/wienerpotato(loc)
				qdel(I)
				qdel(src)
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/meat/poultry/cutlet/fried))
		if(isturf(loc)&& (found_table))
			playsound(get_turf(user), 'sound/foley/dropsound/gen_drop.ogg', 30, TRUE, -1)
			to_chat(user, "Готовлю порцию птицы с картофелем...")
			if(do_after(user,short_cooktime, target = src))
				user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
				new /obj/item/reagent_containers/food/snacks/rogue/frybirdtato(loc)
				qdel(I)
				qdel(src)
	else
		return ..()
	

/*	.............   Fried onions   ................ */
/obj/item/reagent_containers/food/snacks/rogue/preserved/onion_fried
	name = "луковые кольца"
	desc = "Ломтики лука, обжаренные до вкусных колец."
	icon_state = "onion_fried"
	bitesize = 2
	list_reagents = list(/datum/reagent/consumable/nutriment = 2)
	tastes = list("пикантного лука" = 1, "слёз" = 1)
	rotprocess = SHELFLIFE_DECENT
/obj/item/reagent_containers/food/snacks/rogue/preserved/onion_fried/attackby(obj/item/I, mob/living/user, params)
	var/found_table = locate(/obj/structure/table) in (loc)
	if(user.mind)
		short_cooktime = (60 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*5))
		long_cooktime = (100 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*10))
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/meat/sausage/cooked))
		if(isturf(loc)&& (found_table))
			playsound(get_turf(user), 'sound/foley/dropsound/gen_drop.ogg', 30, TRUE, -1)
			to_chat(user, "Готовлю порцию колбаски с луковыми кольцами...")
			if(do_after(user,short_cooktime, target = src))
				user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
				new /obj/item/reagent_containers/food/snacks/rogue/wieneronions(loc)
				qdel(I)
				qdel(src)
	else
		return ..()

/*	.............   Fried potato   ................ */
/obj/item/reagent_containers/food/snacks/rogue/preserved/potato_fried
	name = "жареный картофель"
	desc = "Хорошо прожаренные картофельные кусочки."
	icon_state = "potato_fried"
	bitesize = 2
	list_reagents = list(/datum/reagent/consumable/nutriment = 2)
	tastes = list("картофеля с корочкой" = 1)
	rotprocess = SHELFLIFE_LONG
	
/obj/item/reagent_containers/food/snacks/rogue/preserved/potato_fried/attackby(obj/item/I, mob/living/user, params)
	var/found_table = locate(/obj/structure/table) in (loc)
	if(user.mind)
		short_cooktime = (60 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*5))
		long_cooktime = (100 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*10))
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/meat/sausage/cooked))
		if(isturf(loc)&& (found_table))
			playsound(get_turf(user), 'sound/foley/dropsound/gen_drop.ogg', 30, TRUE, -1)
			to_chat(user, "Готовлю порцию колбаски с картофельными ломтиками...")
			if(do_after(user,short_cooktime, target = src))
				user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
				new /obj/item/reagent_containers/food/snacks/rogue/wienerpotato(loc)
				qdel(I)
				qdel(src)
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/meat/poultry/cutlet/fried))
		if(isturf(loc)&& (found_table))
			playsound(get_turf(user), 'sound/foley/dropsound/gen_drop.ogg', 30, TRUE, -1)
			to_chat(user, "Готовлю порцию птицы с картофельными ломтиками...")
			if(do_after(user,short_cooktime, target = src))
				user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
				new /obj/item/reagent_containers/food/snacks/rogue/frybirdtato(loc)
				qdel(I)
				qdel(src)
	else
		return ..()
