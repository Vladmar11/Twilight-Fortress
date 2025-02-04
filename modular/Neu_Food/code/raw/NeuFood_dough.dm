/* * * * * * * * * * * **
 *						*
 *		 NeuFood		*	- Basically add water to powder, then more powder
 *		 (Snacks)		*
 *						*
 * * * * * * * * * * * **/



/*	.................   Dough   ................... */
/obj/item/reagent_containers/food/snacks/rogue/dough_base
	name = "незавершенное тесто"
	desc = "Проявив немного больше амбиций, вы победите. (Добавьте муку и замесите тесто)"
	icon_state = "dough_base"
	w_class = WEIGHT_CLASS_NORMAL
/obj/item/reagent_containers/food/snacks/rogue/dough_base/attackby(obj/item/I, mob/living/user, params)
	var/found_table = locate(/obj/structure/table) in (loc)
	if(user.mind)
		short_cooktime = (60 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*5))
		long_cooktime = (100 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*10))
	if(istype(I, /obj/item/reagent_containers/powder/flour))
		if(isturf(loc)&& (found_table))
			playsound(get_turf(user), 'modular/Neu_Food/sound/kneading.ogg', 100, TRUE, -1)
			to_chat(user, "<span class='notice'>Замешиваю больше муки...</span>")
			if(do_after(user,short_cooktime, target = src))
				user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
				new /obj/item/reagent_containers/food/snacks/rogue/dough(loc)
				qdel(I)
				qdel(src)
		else
			to_chat(user, "<span class='warning'>Сначала нужно положить [src] на стол.</span>")
	else
		return ..()	

/obj/item/reagent_containers/food/snacks/rogue/dough
	name = "тесто"
	desc = "Триумф всех пекарей. (Поместите в печь, чтобы испечь хлеб; добавьте масло, чтобы получилось сдобное тесто; разрежьте, чтобы получить кусочки теста; добавьте две изюминки, чтобы получился хлеб с изюмом; раскатайте, чтобы получить сырые галеты)"
	icon_state = "dough"
	slices_num = 2
	slice_batch = TRUE
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/doughslice
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/bread
	cooked_smell = /datum/pollutant/food/bread
	w_class = WEIGHT_CLASS_NORMAL
	slice_sound = TRUE 

/obj/item/reagent_containers/food/snacks/rogue/dough/attackby(obj/item/I, mob/living/user, params)
	var/found_table = locate(/obj/structure/table) in (loc)
	if(user.mind)
		short_cooktime = (60 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*5))
		long_cooktime = (100 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*10))
	if(istype(I, /obj/item/reagent_containers/food/snacks/butterslice))
		if(isturf(loc)&& (found_table))
			playsound(get_turf(user), 'modular/Neu_Food/sound/kneading_alt.ogg', 90, TRUE, -1)
			to_chat(user, "<span class='notice'>Замешиваю сливочное масло в тесто...</span>")
			if(do_after(user,long_cooktime, target = src))
				user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
				new /obj/item/reagent_containers/food/snacks/rogue/butterdough(loc)
				qdel(I)
				qdel(src)
		else
			to_chat(user, "<span class='warning'>Сначала нужно положить [src] на стол.</span>")
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/raisins))
		if(isturf(loc)&& (found_table))
			playsound(get_turf(user), 'modular/Neu_Food/sound/kneading.ogg', 100, TRUE, -1)
			to_chat(user, "<span class='notice'>Замешиваем сливочное масло в тесто...</span>")
			if(do_after(user,short_cooktime, target = src))
				user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
				new /obj/item/reagent_containers/food/snacks/rogue/rbread_half(loc)
				qdel(I)
				qdel(src)
		else
			to_chat(user, "<span class='warning'>Сначала нужно положить [src] на стол.</span>")
	if(istype(I, /obj/item/kitchen/rollingpin))
		if(isturf(loc)&& (found_table))
			playsound(get_turf(user), 'modular/Neu_Food/sound/rollingpin.ogg', 100, TRUE, -1)
			to_chat(user, "<span class='notice'>Раскатываю [src] на галеты.</span>")
			if(do_after(user,long_cooktime, target = src))
				user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
				new /obj/item/reagent_containers/food/snacks/rogue/foodbase/hardtack_raw(loc)
				qdel(src)
		else
			to_chat(user, "<span class='warning'>Сначала нужно положить [src] на стол.</span>")
	else
		return ..()	

/*	.................   Smalldough   ................... */
/obj/item/reagent_containers/food/snacks/rogue/doughslice
	name = "кусочек теста"
	icon_state = "doughslice"
	slices_num = 0
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/bun
	cooked_smell = /datum/pollutant/food/bun
	w_class = WEIGHT_CLASS_NORMAL
	tastes = list("теста" = 1)
/obj/item/reagent_containers/food/snacks/rogue/doughslice/attackby(obj/item/I, mob/living/user, params)
	var/found_table = locate(/obj/structure/table) in (loc)
	if(user.mind)
		short_cooktime = (60 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*5))
		long_cooktime = (100 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*10))
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/cheese))
		if(isturf(loc)&& (found_table))
			playsound(get_turf(user), 'modular/Neu_Food/sound/kneading_alt.ogg', 90, TRUE, -1)
			to_chat(user, "<span class='notice'>Добавляю свежий сыр...</span>")
			if(do_after(user,short_cooktime, target = src))
				user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
				new /obj/item/reagent_containers/food/snacks/rogue/foodbase/cheesebun_raw(loc)
				qdel(I)
				qdel(src)
		else
			to_chat(user, "<span class='warning'>Сначала нужно положить [src] на стол.</span>")
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/doughslice))
		if(isturf(loc)&& (found_table))
			playsound(get_turf(user), 'modular/Neu_Food/sound/kneading.ogg', 100, TRUE, -1)
			to_chat(user, "<span class='notice'>Объединяю тесто...</span>")
			if(do_after(user,short_cooktime, target = src))
				user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
				new /obj/item/reagent_containers/food/snacks/rogue/dough(loc)
				qdel(I)
				qdel(src)
		else
			to_chat(user, "<span class='warning'>Сначала нужно положить [src] на стол.</span>")
	else
		return ..()

/*	.................   Butterdough   ................... */
/obj/item/reagent_containers/food/snacks/rogue/butterdough
	name = "сдобное тесто"
	desc = "Что такое триумф по сравнению с наследием? (Нарежьте, чтобы начать печь пирог; добавьте яйцо, чтобы замесить тесто для торта)"
	icon_state = "butterdough"
	color = "#feffc1"
	slices_num = 2
	slice_batch = TRUE
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/butterdoughslice
	w_class = WEIGHT_CLASS_NORMAL
	slice_sound = TRUE 
	
/obj/item/reagent_containers/food/snacks/rogue/butterdough/attackby(obj/item/I, mob/living/user, params)
	var/found_table = locate(/obj/structure/table) in (loc)
	if(user.mind)
		short_cooktime = (60 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*5))
		long_cooktime = (100 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*10))
	if(istype(I, /obj/item/reagent_containers/food/snacks/egg))
		if(isturf(loc)&& (found_table))
			playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 40, TRUE, -1)
			to_chat(user, "<span class='notice'>Вмешиваем яйцо в тесто и формируем из него торт...</span>")
			playsound(get_turf(user), 'modular/Neu_Food/sound/eggbreak.ogg', 100, TRUE, -1)
			if(do_after(user,long_cooktime, target = src))
				user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
				new /obj/item/reagent_containers/food/snacks/rogue/cake_base(loc)
				qdel(I)
				qdel(src)
		else
			to_chat(user, "<span class='warning'>Сначала нужно положить [src] на стол.</span>")
	else
		return ..()

/*	.................   Butterdough piece   ................... */
/obj/item/reagent_containers/food/snacks/rogue/butterdoughslice
	name = "кусок сдобного теста"
	desc = "Кусочек родословной, чтобы создать линии истории. (Поместите в духовку, чтобы приготовить выпечку; раскатайте, чтобы приготовить тесто для пирога; поместите один пласт теста для пирога в духовку, чтобы сделать корзинку для пирога; обжарьте, чтобы приготовить жареный хлеб; раскатайте, чтобы приготовить пирожок)"
	icon_state = "butterdoughslice"
	color = "#feffc1"
	slices_num = 0
	fried_type = /obj/item/reagent_containers/food/snacks/rogue/frybread
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/pastry
	cooked_smell = /datum/pollutant/food/pastry
	w_class = WEIGHT_CLASS_NORMAL
// Dough + rolling pin on table = flat dough. RT got some similar proc for this.
/obj/item/reagent_containers/food/snacks/rogue/butterdoughslice/attackby(obj/item/I, mob/living/user, params)
	var/found_table = locate(/obj/structure/table) in (loc)
	if(user.mind)
		short_cooktime = (60 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*5))
		long_cooktime = (100 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*10))
	if(istype(I, /obj/item/kitchen/rollingpin))
		if(isturf(loc)&& (found_table))
			playsound(get_turf(user), 'modular/Neu_Food/sound/rollingpin.ogg', 100, TRUE, -1)	
			to_chat(user, "<span class='notice'>Раскатываю [src]...</span>")
			if(do_after(user,short_cooktime, target = src))
				user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
				new /obj/item/reagent_containers/food/snacks/rogue/piedough(loc)
				qdel(src)
		else
			to_chat(user, "<span class='warning'>Сначала нужно положить [src] на стол.</span>")
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/raisins))
		if(isturf(loc)&& (found_table))
			playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 40, TRUE, -1)
			to_chat(user, "<span class='notice'>Добавляю изюм в тесто...</span>")
			if(do_after(user,short_cooktime, target = src))
				user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
				new /obj/item/reagent_containers/food/snacks/rogue/foodbase/biscuit_raw(loc)
				qdel(I)
				qdel(src)
		else
			to_chat(user, "<span class='warning'>Сначала нужно положить [src] на стол.</span>")
	if(I.get_sharpness())
		if(!isdwarf(user))
			to_chat(user, "<span class='warning'>У вас не хватает знаний о дварфийской выпечке!</span>")
			return
		else
			if(isturf(loc)&& (found_table))
				playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 40, TRUE, -1)
				to_chat(user, "<span class='notice'>Нарезаю тесто полосками и делаю крендель....</span>")
				if(do_after(user,short_cooktime, target = src))
					user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
					new /obj/item/reagent_containers/food/snacks/rogue/foodbase/prezzel_raw(loc)
					qdel(src)
			else
				to_chat(user, "<span class='warning'>Сначала нужно положить [src] на стол.</span>")
	else
		..()

/*	.................   Piedough   ................... */
/obj/item/reagent_containers/food/snacks/rogue/piedough
	name = "тесто для пирога"
	desc = "Начало великих свершений. (Испеките, чтобы получилась корзинка для пирога; добавьте фарш, ягоды или яйца, чтобы получился пирог!)"
	icon_state = "piedough"
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/foodbase/piebottom
	cooked_smell = /datum/pollutant/food/pie_base
	w_class = WEIGHT_CLASS_NORMAL
/obj/item/reagent_containers/food/snacks/rogue/piedough/attackby(obj/item/I, mob/living/user, params)
	if(user.mind)
		short_cooktime = (60 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*5))
		long_cooktime = (100 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*10))
	// if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/truffles))
	// 	playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 50, TRUE, -1)
	// 	to_chat(user, "<span class='notice'>Making a handpie...</span>")
	// 	if(do_after(user,short_cooktime, target = src))
	// 		var/obj/item/reagent_containers/food/snacks/rogue/foodbase/handpieraw/mushroom/handpie= new(get_turf(user))
	// 		user.put_in_hands(handpie)
	// 		qdel(I)
	// 		qdel(src)
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/meat/mince))
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 50, TRUE, -1)
		to_chat(user, "<span class='notice'>Делаю пирожок...</span>")
		if(do_after(user,short_cooktime, target = src))
			user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
			var/obj/item/reagent_containers/food/snacks/rogue/foodbase/handpieraw/mince/handpie= new(get_turf(user))
			user.put_in_hands(handpie)
			qdel(I)
			qdel(src)
	if(istype(I, /obj/item/reagent_containers/food/snacks/grown/berries/rogue/poison))
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 50, TRUE, -1)
		to_chat(user, "<span class='notice'>Делаю пирожок...</span>")
		if(do_after(user,short_cooktime, target = src))
			user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
			var/obj/item/reagent_containers/food/snacks/rogue/foodbase/handpieraw/poison/handpie= new(get_turf(user))
			user.put_in_hands(handpie)
			qdel(I)
			qdel(src)
	else if(istype(I, /obj/item/reagent_containers/food/snacks/grown/berries/rogue))
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 50, TRUE, -1)
		to_chat(user, "<span class='notice'>Делаю пирожок...</span>")
		if(do_after(user,short_cooktime, target = src))
			user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
			var/obj/item/reagent_containers/food/snacks/rogue/foodbase/handpieraw/berry/handpie= new(get_turf(user))
			user.put_in_hands(handpie)
			qdel(I)
			qdel(src)
	else
		return ..()


/*	.................   Hardtack   ................... */
/obj/item/reagent_containers/food/snacks/rogue/foodbase/hardtack_raw
	name = "сырые галеты"
	desc = "Густые, мягкие, неприемлемые."
	icon_state = "raw_tack"
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/foodbase/hardtack_raw/cooked
	w_class = WEIGHT_CLASS_NORMAL
	eat_effect = null

/obj/item/reagent_containers/food/snacks/rogue/foodbase/hardtack_raw/cooked
	name = "галеты"
	desc = "Очень, очень твердые и сухие."
	icon_state = "tack6"
	list_reagents = list(/datum/reagent/consumable/nutriment = DOUGH_NUTRITION)
	w_class = WEIGHT_CLASS_NORMAL
	tastes = list("полбы" = 1)
	bitesize = 6
	rotprocess = null

/obj/item/reagent_containers/food/snacks/rogue/foodbase/hardtack_raw/cooked/On_Consume(mob/living/eater)
	..()
	if(bitecount == 1)
		icon_state = "tack5"
	if(bitecount == 2)
		icon_state = "tack4"
	if(bitecount == 3)
		icon_state = "tack3"
	if(bitecount == 4)
		icon_state = "tack2"
	if(bitecount == 5)
		icon_state = "tack1"
	else
		icon_state = "tack6"


/*	.................   Bread   ................... */
/obj/item/reagent_containers/food/snacks/rogue/bread
	name = "буханка хлеба"
	desc = "Один из основных продуктов питания в мире. С упадком магии, утрата заклинаний для примножения хлеба привела к массовому голоду в Гримории. (Нарежьте!)"
	icon_state = "loaf6"
	slices_num = 6
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/breadslice
	list_reagents = list(/datum/reagent/consumable/nutriment = DOUGH_NUTRITION)
	w_class = WEIGHT_CLASS_NORMAL
	tastes = list("хлеба" = 1)
	slice_batch = FALSE
	slice_sound = TRUE 
	rotprocess = SHELFLIFE_EXTREME

/obj/item/reagent_containers/food/snacks/rogue/bread/update_icon()
	if(slices_num)
		icon_state = "loaf[slices_num]"
	else
		icon_state = "loaf_slice"

/obj/item/reagent_containers/food/snacks/rogue/bread/On_Consume(mob/living/eater)
	..()
	if(slices_num)
		if(bitecount == 1)
			slices_num = 5
		if(bitecount == 2)
			slices_num = 4
		if(bitecount == 3)
			slices_num = 3
		if(bitecount == 4)
			slices_num = 2
		if(bitecount == 5)
			changefood(slice_path, eater)

/*	.................   Breadslice & Toast   ................... */
/obj/item/reagent_containers/food/snacks/rogue/breadslice
	name = "кусок хлеба"
	desc = "Немного утешения, чтобы начать свое блюдо. (Подавайте как есть или добавьте яичницу, сыр, масло или кусочек сала; поместите в печь, чтобы поджарить.)"
	icon_state = "loaf_slice"
	w_class = WEIGHT_CLASS_NORMAL
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/breadslice/toast
	cooked_smell = /datum/pollutant/food/toast
	bitesize = 2
	rotprocess = SHELFLIFE_LONG
	dropshrink = 0.8
/obj/item/reagent_containers/food/snacks/rogue/breadslice/attackby(obj/item/I, mob/living/user, params)
	if(user.mind)
		short_cooktime = (60 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*5))
		long_cooktime = (100 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*10))
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/meat/salami/slice))
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 50, TRUE, -1)
		if(do_after(user,short_cooktime, target = src))
			user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
			var/obj/item/reagent_containers/food/snacks/rogue/sandwich/salami/sammich= new(get_turf(user))
			user.put_in_hands(sammich)
			qdel(I)
			qdel(src)
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/cheddarslice))
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 50, TRUE, -1)
		if(do_after(user,short_cooktime, target = src))
			user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
			var/obj/item/reagent_containers/food/snacks/rogue/sandwich/cheese/sammich= new(get_turf(user))
			user.put_in_hands(sammich)
			qdel(I)
			qdel(src)
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/friedegg))
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 50, TRUE, -1)
		if(do_after(user,short_cooktime, target = src))
			user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
			var/obj/item/reagent_containers/food/snacks/rogue/sandwich/egg/sammich= new(get_turf(user))
			user.put_in_hands(sammich)
			qdel(I)
			qdel(src)
	if(istype(I, /obj/item/reagent_containers/food/snacks/fat/salo/slice))
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 50, TRUE, -1)
		if(do_after(user,short_cooktime, target = src))
			user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
			var/obj/item/reagent_containers/food/snacks/rogue/sandwich/salo/sammich= new(get_turf(user))
			user.put_in_hands(sammich)
			qdel(I)
			qdel(src)
	else
		return ..()

//this is a child so we can be used in sammies
/obj/item/reagent_containers/food/snacks/rogue/breadslice/toast
	name = "тост"
	icon_state = "toast"
	tastes = list("хрустящего хлеба" = 1)
	cooked_type = null
	bitesize = 2
	rotprocess = null
/obj/item/reagent_containers/food/snacks/rogue/breadslice/toast/attackby(obj/item/I, mob/living/user, params)
	if(user.mind)
		short_cooktime = (60 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*5))
		long_cooktime = (100 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*10))
	if(istype(I, /obj/item/reagent_containers/food/snacks/butterslice))
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 50, TRUE, -1)
		if(do_after(user,short_cooktime, target = src))
			user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
			var/obj/item/reagent_containers/food/snacks/rogue/breadslice/toast/buttered/sammich= new(get_turf(user))
			user.put_in_hands(sammich)
			qdel(I)
			qdel(src)
	else
		return ..()

/obj/item/reagent_containers/food/snacks/rogue/breadslice/toast/buttered
	name = "тост с маслом"
	icon_state = "toast_butter"
	tastes = list("масла" = 1, "хлеба" = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT)

// -------------- BREAD WITH FOOD ON IT (not american sandwich) -----------------
/obj/item/reagent_containers/food/snacks/rogue/sandwich
	desc = "Восхитительный кусочек рая."
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_NUTRITIOUS)
	rotprocess = 30 MINUTES
	eat_effect = /datum/status_effect/buff/foodbuff
/obj/item/reagent_containers/food/snacks/rogue/sandwich/salami
	tastes = list("салями" = 1,"хлеба" = 1)
	name = "хлеб с салями"
	icon_state = "bread_salami"
	foodtype = GRAIN | MEAT
/obj/item/reagent_containers/food/snacks/rogue/sandwich/cheese
	tastes = list("сыра" = 1,"хлеба" = 1)
	name = "хлеб с сыром"
	icon_state = "bread_cheese"
	foodtype = GRAIN | DAIRY
/obj/item/reagent_containers/food/snacks/rogue/sandwich/egg
	tastes = list("жареного яйца" = 1,"хлеба" = 1)
	name = "хлеб с яйцом"
	icon_state = "bread_egg"
	foodtype = GRAIN | MEAT
/obj/item/reagent_containers/food/snacks/rogue/sandwich/salo
	tastes = list("соленого жира" = 1,"хлеба" = 1)
	name = "хлеб с салом"
	icon_state = "bread_salo"
	foodtype = GRAIN | MEAT



/*	.................   Bread bun   ................... */
/obj/item/reagent_containers/food/snacks/rogue/bun
	name = "булочка"
	desc = "Маленькая, причудливая и полностью съедобная. (Подавайте, как есть, или добавьте колбаску, чтобы приготовить догролл)"
	icon_state = "bun"
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT)
	w_class = WEIGHT_CLASS_NORMAL
	tastes = list("хлеба" = 1)
	bitesize = 2
	rotprocess = SHELFLIFE_EXTREME
/obj/item/reagent_containers/food/snacks/rogue/bun/attackby(obj/item/I, mob/living/user, params)
	if(user.mind)
		short_cooktime = (60 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*5))
		long_cooktime = (100 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*10))
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/meat/sausage/cooked))
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 50, TRUE, -1)
		to_chat(user, "<span class='notice'>Заворачиваю сосиску в тесто...</span>")
		if(do_after(user,short_cooktime, target = src))
			user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
			var/obj/item/reagent_containers/food/snacks/rogue/bun_grenz/hotdog= new(get_turf(user))
			user.put_in_hands(hotdog)
			qdel(I)
			qdel(src)
	else
		return ..()


/*	.................   Cheese bun   ................... */
/obj/item/reagent_containers/food/snacks/rogue/foodbase/cheesebun_raw
	name = "сырая сырная булочка"
	desc = "Маленькая, причудливая и полностью съедобная."
	icon_state = "cheesebun_raw"
	color = "#ecce61"
	tastes = list("теста с сыром" = 1)
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/cheesebun
	cooked_smell = /datum/pollutant/food/cheese_bun
	list_reagents = list(/datum/reagent/consumable/nutriment = 4)
	w_class = WEIGHT_CLASS_NORMAL
	foodtype = GRAIN | DAIRY

/obj/item/reagent_containers/food/snacks/rogue/cheesebun
	name = "булочка со свежим сыром"
	desc = "Угощение грензельхофтской кухни"
	icon_state = "cheesebun"
	list_reagents = list(/datum/reagent/consumable/nutriment = SMALLDOUGH_NUTRITION+FRESHCHEESE_NUTRITION)
	w_class = WEIGHT_CLASS_NORMAL
	tastes = list("хрустящего хлеба" = 1, "сливочного сыра" = 1)
	foodtype = GRAIN | DAIRY
	bitesize = 2
	rotprocess = SHELFLIFE_DECENT

/obj/item/reagent_containers/food/snacks/rogue/frybread
	name = "жареный хлеб"
	desc = "Лепешка, обжаренная на сильном огне со сливочным маслом, чтобы она стала хрустящей снаружи. Основа эльфийской кухни."
	icon_state = "frybread"
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT)
	tastes = list("хрустящего хлеба с мякишем" = 1)
	w_class = WEIGHT_CLASS_NORMAL
	bitesize = 3
	eat_effect = /datum/status_effect/buff/foodbuff

/*	.................   Pastry   ................... */
/obj/item/reagent_containers/food/snacks/rogue/pastry
	name = "выпечка"
	desc = "Популярна среди детей и любителей сладкого."
	icon_state = "pastry"
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT)
	tastes = list("хрустящего сдобного теста" = 1)
	w_class = WEIGHT_CLASS_NORMAL
	bitesize = 3
	rotprocess = SHELFLIFE_EXTREME
	eat_effect = /datum/status_effect/buff/foodbuff

/*	.................   Sweetroll   ................... */

/obj/item/reagent_containers/food/snacks/rogue/sweetroll
	name = "сладкий рулет"
	desc = ""
	icon = 'icons/roguetown/items/food.dmi'
	icon_state = "sweetroll"
	dropshrink = 0.75
	list_reagents = list(/datum/reagent/consumable/nutriment = 10)
	w_class = WEIGHT_CLASS_NORMAL
	tastes = list("хрустящего теста" = 1, "сахарной глазури" = 1)
	foodtype = SUGAR
	rotprocess = SHELFLIFE_EXTREME
	eat_effect = /datum/status_effect/buff/foodbuff

/obj/item/reagent_containers/food/snacks/rogue/pastry/attackby(obj/item/I, mob/living/user, params)
	var/found_table = locate(/obj/structure/table) in (loc)
	if(user.mind)
		short_cooktime = (60 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*5))
		long_cooktime = (100 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*10))
	if(istype(I, /obj/item/reagent_containers/powder/sugar))
		if(isturf(loc)&& (found_table))
			playsound(get_turf(user), 'modular/Neu_Food/sound/kneading.ogg', 100, TRUE, -1)
			to_chat(user, "<span class='notice'>Добавляю сахар...</span>")
			if(do_after(user,short_cooktime, target = src))
				user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
				new /obj/item/reagent_containers/food/snacks/rogue/sweetroll(loc)
				qdel(I)
				qdel(src)
		else
			to_chat(user, "<span class='warning'>Сначала нужно положить [src] на стол.</span>")
	else
		return ..()	

/*	.................   Biscuit   ................... */
/obj/item/reagent_containers/food/snacks/rogue/foodbase/biscuit_raw
	name = "сырое печенье с изюмом"
	icon_state = "biscuit_raw"
	color = "#ecce61"
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/biscuit
	cooked_smell = /datum/pollutant/food/biscuit
	tastes = list("теста с изюмом" = 1)
	w_class = WEIGHT_CLASS_NORMAL
	eat_effect = null

/obj/item/reagent_containers/food/snacks/rogue/biscuit
	name = "печенье с изюмом"
	desc = "Угощение для такой несчастной собаки, как ты."
	icon_state = "biscuit"
	filling_color = "#F0E68C"
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT+SNACK_POOR)
	w_class = WEIGHT_CLASS_NORMAL
	bitesize = 3
	tastes = list("хрустящего теста" = 1, "изюма" = 1)
	eat_effect = /datum/status_effect/buff/foodbuff


/*	.................   Prezzel   ................... */
/obj/item/reagent_containers/food/snacks/rogue/foodbase/prezzel_raw
	name = "сырой крендель"
	icon_state = "prezzel_raw"
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/prezzel
	cooked_smell = /datum/pollutant/food/prezzel
	tastes = list("теста" = 1)
	w_class = WEIGHT_CLASS_NORMAL
	eat_effect = null

/obj/item/reagent_containers/food/snacks/rogue/prezzel
	name = "крендель"
	desc = "Следующая лучшая вещь после нарезанного хлеба. Обычно такое готовят дворфы."
	icon_state = "prezzel"
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT)
	tastes = list("хрустящего теста" = 1)
	w_class = WEIGHT_CLASS_NORMAL
	bitesize = 3
	eat_effect = /datum/status_effect/buff/foodbuff


/*	.................   Raisin bread   ................... */
/obj/item/reagent_containers/food/snacks/rogue/rbread_half
	name = "тесто с изюмом"
	desc = "Добавьте еще изюма!"
	icon_state = "dough_raisin"
	list_reagents = list(/datum/reagent/consumable/nutriment = 1)
	tastes = list("теста с изюмом" = 1)
	w_class = WEIGHT_CLASS_NORMAL
	rotprocess = 30 MINUTES
/obj/item/reagent_containers/food/snacks/rogue/rbread_half/attackby(obj/item/I, mob/living/user, params)
	var/found_table = locate(/obj/structure/table) in (loc)
	if(user.mind)
		short_cooktime = (60 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*5))
		long_cooktime = (100 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*10))
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/raisins))
		if(isturf(loc)&& (found_table))
			playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 40, TRUE, -1)
			to_chat(user, "<span class='notice'>Добавляю оставшийся изюм и взбиваю тесто для выпечки.</span>")
			if(do_after(user,short_cooktime, target = src))
				user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
				new /obj/item/reagent_containers/food/snacks/rogue/rbreaduncooked(loc)
				qdel(I)
				qdel(src)
		else
			to_chat(user, "<span class='warning'>Сначала нужно положить [src] на стол.</span>")
	else
		return ..()	

/obj/item/reagent_containers/food/snacks/rogue/rbreaduncooked
	name = "сырой хлеб с изюмом"
	icon_state = "raisinbreaduncooked"
	slices_num = 0
	tastes = list("теста с изюмом" = 1)
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/raisinbread
	list_reagents = list(/datum/reagent/consumable/nutriment = 1)
	w_class = WEIGHT_CLASS_NORMAL
	rotprocess = 30 MINUTES

/obj/item/reagent_containers/food/snacks/rogue/raisinbread
	name = "хлеб с изюмом"
	desc = "Хлеб со сладким изюмом. Станет прекрасным дополнением к любому блюду."
	icon_state = "raisinbread6"
	slices_num = 6
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/raisinbreadslice
	list_reagents = list(/datum/reagent/consumable/nutriment = MEAL_AVERAGE)
	w_class = WEIGHT_CLASS_NORMAL
	tastes = list("сладкого хлеба" = 1, "изюма" = 1)
	slice_batch = FALSE
	slice_sound = TRUE 
	rotprocess = SHELFLIFE_EXTREME
	eat_effect = /datum/status_effect/buff/foodbuff

/obj/item/reagent_containers/food/snacks/rogue/raisinbread/update_icon()
	if(slices_num)
		icon_state = "raisinbread[slices_num]"
	else
		icon_state = "raisinbread_slice"

/obj/item/reagent_containers/food/snacks/rogue/raisinbread/On_Consume(mob/living/eater)
	..()
	if(slices_num)
		if(bitecount == 1)
			slices_num = 5
		if(bitecount == 2)
			slices_num = 4
		if(bitecount == 3)
			slices_num = 3
		if(bitecount == 4)
			slices_num = 2
		if(bitecount == 5)
			changefood(slice_path, eater)

/obj/item/reagent_containers/food/snacks/rogue/raisinbreadslice
	name = "кусок хлеба с изюмом"
	icon_state = "raisinbread_slice"
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT-1)
	w_class = WEIGHT_CLASS_NORMAL
	cooked_type = null
	tastes = list("сладкого хлеба" = 1, "изюма" = 1)
	bitesize = 2
	rotprocess = SHELFLIFE_LONG
	eat_effect = /datum/status_effect/buff/foodbuff
	dropshrink = 0.8

/*	.................   Cake   ................... */
/obj/item/reagent_containers/food/snacks/rogue/cake_base
	name = "основа для торта"
	desc = "С помощью этой сладости вы заставите их воспевать. (Добавьте свежий сыр или мед и запеките!)"
	icon_state = "cake"
	tastes = list("сдобного теста" = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = 1)
	w_class = WEIGHT_CLASS_NORMAL
	foodtype = GRAIN | DAIRY
	rotprocess = SHELFLIFE_LONG
/obj/item/reagent_containers/food/snacks/rogue/cake_base/attackby(obj/item/I, mob/living/user, params)
	var/found_table = locate(/obj/structure/table) in (loc)
	if(user.mind)
		short_cooktime = (60 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*5))
		long_cooktime = (100 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*10))
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/cheese))
		if(isturf(loc)&& (found_table))
			playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 40, TRUE, -1)
			to_chat(user, "<span class='notice'>Выкладываю свежий сыр на торт...</span>")
			if(do_after(user,long_cooktime, target = src))
				user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
				new /obj/item/reagent_containers/food/snacks/rogue/ccakeuncooked(loc)
				qdel(I)
				qdel(src)
		else
			to_chat(user, "<span class='warning'>Сначала нужно положить [src] на стол.</span>")
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/honey))
		if(isturf(loc)&& (found_table))
			playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 40, TRUE, -1)
			to_chat(user, "<span class='notice'>Обмазываю торт восхитительным паучьим медом...</span>")
			if(do_after(user,long_cooktime, target = src))
				user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
				new /obj/item/reagent_containers/food/snacks/rogue/hcakeuncooked(loc)
				qdel(I)
				qdel(src)
		else
			to_chat(user, "<span class='warning'>Сначала нужно положить [src] на стол.</span>")
	else
		return ..()	

// -------------- SPIDER-HONEY CAKE (Zybantu) -----------------
/obj/item/reagent_containers/food/snacks/rogue/hcakeuncooked
	name = "сырой торт"
	icon_state = "honeycakeuncook"
	slices_num = 0
	tastes = list("сдобного теста" = 1, "меда" = 1)
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/hcake
	cooked_smell = /datum/pollutant/food/honey_cake
	list_reagents = list(/datum/reagent/consumable/nutriment = 1)
	w_class = WEIGHT_CLASS_NORMAL
	foodtype = GRAIN | DAIRY | SUGAR
	rotprocess = SHELFLIFE_DECENT

/obj/item/reagent_containers/food/snacks/rogue/hcake
	name = "йский торт"
	desc = "Торт, глазированный медом в знаменитом стиле Зибантийской империи. Восхитительное сладкое лакомство."
	icon_state = "honeycake"
	slices_num = 8
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/hcakeslice
	list_reagents = list(/datum/reagent/consumable/nutriment = 48)
	w_class = WEIGHT_CLASS_NORMAL
	tastes = list("нежного бисквита" = 1, "вкусной медовой глазури" = 1)
	foodtype = GRAIN | DAIRY | SUGAR
	slice_batch = TRUE
	slice_sound = TRUE 
	rotprocess = SHELFLIFE_LONG
	eat_effect = /datum/status_effect/buff/foodbuff
	bitesize = 16

/obj/item/reagent_containers/food/snacks/rogue/hcakeslice
	name = "кусок зибантийского торта"
	icon_state = "honeycakeslice"
	slices_num = 0
	tastes = list("нежного бисквита" = 1, "вкусной медовой глазури" = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT)
	w_class = WEIGHT_CLASS_NORMAL
	cooked_type = null
	foodtype = GRAIN | DAIRY | SUGAR
	bitesize = 3
	eat_effect = /datum/status_effect/buff/foodbuff
	rotprocess = SHELFLIFE_LONG
/obj/item/reagent_containers/food/snacks/rogue/hcakeslice/plated
	icon_state = "honeycakeslice_plated"
	rotprocess = SHELFLIFE_EXTREME
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 1)
	trash = /obj/item/cooking/platter

// -------------- CHEESECAKE -----------------

/obj/item/reagent_containers/food/snacks/rogue/ccakeuncooked
	name = "сырой чизкейк"
	icon_state = "cheesecakeuncook"
	slices_num = 0
	tastes = list("сдобного теста" = 1, "сыра" = 1)
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/ccake
	cooked_smell = /datum/pollutant/food/cheese_cake
	list_reagents = list(/datum/reagent/consumable/nutriment = 1)
	foodtype = GRAIN | DAIRY | SUGAR
	w_class = WEIGHT_CLASS_NORMAL
	rotprocess = SHELFLIFE_DECENT

/obj/item/reagent_containers/food/snacks/rogue/ccake
	name = "чизкейк"
	desc = "Лучшее изобретение человечества."
	icon_state = "cheesecake"
	slices_num = 8
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/ccakeslice
	list_reagents = list(/datum/reagent/consumable/nutriment = 48)
	w_class = WEIGHT_CLASS_NORMAL
	tastes = list("нежного бисквита" = 1, "кремовой сырной глазури" = 1)
	foodtype = GRAIN | DAIRY | SUGAR
	slice_batch = TRUE
	slice_sound = TRUE 
	rotprocess = SHELFLIFE_LONG
	eat_effect = /datum/status_effect/buff/foodbuff
	bitesize = 16

/obj/item/reagent_containers/food/snacks/rogue/ccakeslice
	name = "кусок чизкейка"
	icon_state = "cheesecake_slice"
	slices_num = 0
	tastes = list("нежного бисквита" = 1, "кремовой сырной глазури" = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT)
	w_class = WEIGHT_CLASS_NORMAL
	cooked_type = null
	foodtype = GRAIN | DAIRY | SUGAR
	bitesize = 2
	eat_effect = /datum/status_effect/buff/foodbuff
	rotprocess = SHELFLIFE_LONG
/obj/item/reagent_containers/food/snacks/rogue/ccakeslice/plated
	icon_state = "cheesecake_slice_plated"
	rotprocess = SHELFLIFE_EXTREME
	bonus_reagents = list(/datum/reagent/consumable/nutriment = 1)
	trash = /obj/item/cooking/platter

/* maybe split up spider honey cake WIP
	desc = "A cake glazed with spider-honey, a favorite dish among the Dark Elf nobility in Grimoria. Symbol of authority, a delicious residue covers the sweet cake which causes playful stinging and numbness in the mouth."
*/
