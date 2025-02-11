/* * * * * * * * * * * **
 *						*
 *		 NeuFood		*
 *		 (Pies)		 	*
 *						*
 * * * * * * * * * * * **/



/*	........   Pie making   ................ */
/obj/item/reagent_containers/food/snacks/rogue/foodbase/piebottom
	name = "корзинка для пирога"
	desc = "Основа для чего-то фантастического..."
	icon_state = "piebottom"
	w_class = WEIGHT_CLASS_NORMAL
	eat_effect = /datum/status_effect/debuff/uncookedfood
	process_step = 1
	var/applepie
	var/fishy
	var/meaty
	var/potpie
	var/eggpie
	var/fatty
	var/cheesetato
	var/onionpie
	var/berrypie
	var/poisoning

/obj/item/reagent_containers/food/snacks/rogue/foodbase/piebottom/update_icon()
	. = ..()
	var/mutable_appearance/piebottom = mutable_appearance(icon, "pieuncooked")
	var/mutable_appearance/roofeat = mutable_appearance(icon, "meatpie_raw")
	var/mutable_appearance/roofish = mutable_appearance(icon, "fishpie_raw")
	if (process_step == 2 && applepie)
		var/mutable_appearance/apple1 = mutable_appearance(icon, "fill_apple1")
		add_overlay(apple1)
//	if (process_step == 2 && potpie)  TESTING DOING POTPIE ANOTHER WAY
//		var/mutable_appearance/pot1 = mutable_appearance(icon, "fill_egg1")
//		add_overlay(pot1)
	if (process_step == 2 && meaty)
		var/mutable_appearance/meat1 = mutable_appearance(icon, "fill_meat1")
		add_overlay(meat1)
	if (process_step == 2 && fishy)
		var/mutable_appearance/fish1 = mutable_appearance(icon, "fill_fish1")
		add_overlay(fish1)
	if (process_step == 2 && berrypie)
		var/mutable_appearance/berry1 = mutable_appearance(icon, "fill_berry1")
		add_overlay(berry1)
	if (process_step == 3 && applepie)
		var/mutable_appearance/apple2 = mutable_appearance(icon, "fill_apple2")
		add_overlay(apple2)
//	if (process_step == 3 && potpie)
//		var/mutable_appearance/pot2 = mutable_appearance(icon, "fill_egg2")
//		add_overlay(pot2)
	if (process_step == 3 && meaty)
		var/mutable_appearance/meat2 = mutable_appearance(icon, "fill_meat2")
		add_overlay(meat2)
	if (process_step == 3 && fishy)
		var/mutable_appearance/fish2 = mutable_appearance(icon, "fill_fish2")
		add_overlay(fish2)
	if (process_step == 3 && berrypie)
		var/mutable_appearance/berry2 = mutable_appearance(icon, "fill_berry2")
		add_overlay(berry2)
	if (process_step == 4 && applepie)
		var/mutable_appearance/apple3 = mutable_appearance(icon, "fill_apple3")
		add_overlay(apple3)
//	if (process_step == 4 && potpie)
//		var/mutable_appearance/pot3 = mutable_appearance(icon, "fill_egg3")
//		add_overlay(pot3)
	if (process_step == 4 && meaty)
		var/mutable_appearance/meat3 = mutable_appearance(icon, "fill_meat3")
		add_overlay(meat3)
	if (process_step == 4 && fishy)
		var/mutable_appearance/fish3 = mutable_appearance(icon, "fill_fish3")
		add_overlay(fish3)
	if (process_step == 4 && berrypie)
		var/mutable_appearance/berry3 = mutable_appearance(icon, "fill_berry3")
		add_overlay(berry3)
	else if (process_step == 5)
		cut_overlays()
		add_overlay(piebottom)
		if (fishy)
			cut_overlays()
			fishy = FALSE
			add_overlay(roofish)
		if (meaty)
			cut_overlays()
			meaty = FALSE
			add_overlay(roofeat)


/obj/item/reagent_containers/food/snacks/rogue/foodbase/piebottom/attackby(obj/item/I, mob/living/user, params)
	if(user.mind)
		short_cooktime = (60 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*5))
		long_cooktime = (100 - ((user.mind.get_skill_level(/datum/skill/craft/cooking))*10))
	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/meat/mince/fish))
		if (process_step > 4)
			return
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 30, TRUE, -1)
		if(process_step == 1 && do_after(user,short_cooktime, target = src))
			user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
			to_chat(user, "<span class='notice'>Начинаю делать рыбный пирог...</span>")
			name = "незавершенный рыбный пирог"
			process_step += 1
			fishy = TRUE
			update_icon()
			qdel(I)
			return
		if(fishy && process_step == 2 && do_after(user,short_cooktime, target = src))
			user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
			to_chat(user, "<span class='notice'>Добавляю начинку в рыбный пирог. Нужно больше.</span>")
			process_step += 1
			update_icon()
			qdel(I)
			return
		if(fishy && process_step == 3 && do_after(user,short_cooktime, target = src))
			user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
			to_chat(user, "<span class='notice'>Наполняю рыбный пирог до краев. Не хватает крышки из теста.</span>")
			process_step += 1
			update_icon()
			qdel(I)
			return

	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/meat/mince/beef))
		if (process_step > 4)
			return
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 30, TRUE, -1)
		if(process_step == 1 && do_after(user,short_cooktime, target = src))
			user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
			to_chat(user, "<span class='notice'>Начинаю делать мясной пирог...</span>")
			name = "незавершенный мясной пирог"
			process_step += 1
			meaty = TRUE
			update_icon()
			qdel(I)
			return
		if(meaty && process_step == 2 && do_after(user,short_cooktime, target = src))
			user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
			to_chat(user, "<span class='notice'>Добавляю начинку в мясной пирог. Нужно больше.</span>")
			process_step += 1
			update_icon()
			qdel(I)
			return
		if(meaty && process_step == 3 && do_after(user,short_cooktime, target = src))
			user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
			to_chat(user, "<span class='notice'>Наполняю мясной пирог до краев. Не хватает крышки из теста.</span>")
			process_step += 1
			update_icon()
			qdel(I)
			return

	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/cheddarwedge) || istype(I, /obj/item/reagent_containers/food/snacks/rogue/veg/potato_sliced)  || istype(I, /obj/item/reagent_containers/food/snacks/rogue/cheese) )
		if (process_step > 4)
			return
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 30, TRUE, -1)
		if(process_step == 1 && do_after(user,short_cooktime, target = src))
			user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
			to_chat(user, "<span class='notice'>Начинаю делать сытный пирог...</span>")
			name = "незавершенный сытный пирог"
			process_step += 1
			cheesetato = TRUE
			var/mutable_appearance/pot1 = mutable_appearance(icon, "fill_pot1")
			add_overlay(pot1)
			qdel(I)
			return
		if(cheesetato && process_step == 2 && do_after(user,short_cooktime, target = src))
			user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
			to_chat(user, "<span class='notice'>Добавляю начинку в сытный пирог. Нужно больше.</span>")
			process_step += 1
			var/mutable_appearance/pot2 = mutable_appearance(icon, "fill_pot2")
			add_overlay(pot2)
			qdel(I)
			return
		if(cheesetato && process_step == 3 && do_after(user,short_cooktime, target = src))
			user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
			to_chat(user, "<span class='notice'>Наполняю сытный пирог до краев. Не хватает крышки из теста.</span>")
			process_step += 1
			var/mutable_appearance/pot3 = mutable_appearance(icon, "fill_pot3")
			add_overlay(pot3)
			qdel(I)
			return

	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/veg/onion_sliced) || istype(I, /obj/item/reagent_containers/food/snacks/rogue/preserved/onion_fried) )
		if (process_step > 4)
			return
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 30, TRUE, -1)
		if(process_step == 1 && do_after(user,short_cooktime, target = src))
			user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
			to_chat(user, "<span class='notice'>Начинаю делать луковый пирог...</span>")
			name = "незавершенный луковый пирог"
			process_step += 1
			onionpie = TRUE
			var/mutable_appearance/pot1 = mutable_appearance(icon, "fill_pot1")
			add_overlay(pot1)
			qdel(I)
			return
		if(onionpie && process_step == 2 && do_after(user,short_cooktime, target = src))
			user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
			to_chat(user, "<span class='notice'>Добавляю начинку в луковый пирог. Нужно больше.</span>")
			process_step += 1
			var/mutable_appearance/pot2 = mutable_appearance(icon, "fill_pot2")
			add_overlay(pot2)
			qdel(I)
			return
		if(onionpie && process_step == 3 && do_after(user,short_cooktime, target = src))
			user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
			to_chat(user, "<span class='notice'>Наполняю луковый пирог до краев. Не хватает крышки из теста.</span>")
			process_step += 1
			var/mutable_appearance/pot3 = mutable_appearance(icon, "fill_pot3")
			add_overlay(pot3)
			qdel(I)
			return

	if(istype(I, /obj/item/reagent_containers/food/snacks/egg) )
		if (process_step > 4)
			return
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 30, TRUE, -1)
		if(process_step == 1 && do_after(user,short_cooktime, target = src))
			user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
			to_chat(user, "<span class='notice'>Начинаю делать яичный пирог...</span>")
			name = "незавершенный яичный пирог"
			process_step += 1
			eggpie = TRUE
			var/mutable_appearance/egg1 = mutable_appearance(icon, "fill_egg1")
			add_overlay(egg1)
			qdel(I)
			return
		if(eggpie && process_step == 2 && do_after(user,short_cooktime, target = src))
			user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
			to_chat(user, "<span class='notice'>Добавляю начинку в яичный пирог. Нужно больше.</span>")
			process_step += 1
			var/mutable_appearance/egg2 = mutable_appearance(icon, "fill_egg2")
			add_overlay(egg2)
			qdel(I)
			return
		if(eggpie && process_step == 3 && do_after(user,short_cooktime, target = src))
			user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
			to_chat(user, "<span class='notice'>Наполняю яичный пирог до краев. Не хватает крышки из теста.</span>")
			process_step += 1
			var/mutable_appearance/egg3 = mutable_appearance(icon, "fill_egg3")
			add_overlay(egg3)
			qdel(I)
			return

	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/meat/bacon) || istype(I, /obj/item/reagent_containers/food/snacks/rogue/meat/mince/poultry) || istype(I, /obj/item/reagent_containers/food/snacks/fat) )
		if (process_step > 4)
			return
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 30, TRUE, -1)
		if(process_step == 1 && do_after(user,short_cooktime, target = src))
			user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
			to_chat(user, "<span class='notice'>Начинаю делать жирный пирог...</span>")
			name = "незавершенный жирный пирог"
			process_step += 1
			fatty = TRUE
			var/mutable_appearance/animal1 = mutable_appearance(icon, "fill_fish1")
			add_overlay(animal1)
			qdel(I)
			return
		if(fatty && process_step == 2 && do_after(user,short_cooktime, target = src))
			user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
			to_chat(user, "<span class='notice'>Добавляю начинку в жирный пирог. Нужно больше.</span>")
			process_step += 1
			var/mutable_appearance/animal2 = mutable_appearance(icon, "fill_fish2")
			add_overlay(animal2)
			qdel(I)
			return
		if(fatty && process_step == 3 && do_after(user,short_cooktime, target = src))
			user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
			to_chat(user, "<span class='notice'>Наполняю жирный пирог до краев. Не хватает крышки из теста.</span>")
			process_step += 1
			var/mutable_appearance/animal3 = mutable_appearance(icon, "fill_fish3")
			add_overlay(animal3)
			qdel(I)
			return


		var/mutable_appearance/animal1 = mutable_appearance(icon, "fill_fish1")
		add_overlay(animal1)




	if(istype(I, /obj/item/reagent_containers/food/snacks/grown/apple))
		if (process_step > 4)
			return
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 30, TRUE, -1)
		if(process_step == 1 && do_after(user,short_cooktime, target = src))
			user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
			to_chat(user, "<span class='notice'>Начинаю делать яблочный пирог...</span>")
			name = "незавершенный яблочный пирог"
			process_step += 1
			applepie = TRUE
			update_icon()
			qdel(I)
			return
		if(applepie && process_step == 2 && do_after(user,short_cooktime, target = src))
			user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
			to_chat(user, "<span class='notice'>Добавляю начинку в яблочный пирог. Нужно больше.</span>")
			process_step += 1
			update_icon()
			qdel(I)
			return
		if(applepie && process_step == 3 && do_after(user,short_cooktime, target = src))
			user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
			to_chat(user, "<span class='notice'>Наполняю яблочный пирог до краев. Не хватает крышки из теста.</span>")
			process_step += 1
			update_icon()
			qdel(I)
			return

	if(istype(I, /obj/item/reagent_containers/food/snacks/grown/berries/rogue/poison))
		if (process_step > 4)
			return
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 30, TRUE, -1)
		if(process_step == 1 && do_after(user,short_cooktime, target = src))
			user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
			to_chat(user, "<span class='notice'>Начинаю делать ягодный пирог...</span>")
			name = "незавершенный ягодный пирог"
			process_step += 1
			berrypie = TRUE
			poisoning = TRUE	
			update_icon()
			qdel(I)
			return
		if(berrypie && process_step == 2 && do_after(user,short_cooktime, target = src))
			user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
			to_chat(user, "<span class='notice'>Добавляю начинку в ягодный пирог. Нужно больше.</span>")
			process_step += 1
			poisoning = TRUE	
			update_icon()
			qdel(I)
			return
		if(berrypie && process_step == 3 && do_after(user,short_cooktime, target = src))
			user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
			to_chat(user, "<span class='notice'>Наполняю ягодный пирог до краев. Не хватает крышки из теста.</span>")
			process_step += 1
			poisoning = TRUE	
			update_icon()
			qdel(I)
			return	
	
	else if(istype(I, /obj/item/reagent_containers/food/snacks/grown/berries/rogue))
		if (process_step > 4)
			return
		playsound(get_turf(user), 'sound/foley/dropsound/food_drop.ogg', 30, TRUE, -1)
		if(process_step == 1 && do_after(user,short_cooktime, target = src))
			user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
			to_chat(user, "<span class='notice'>Начинаю делать ягодный пирог...</span>")
			name = "незавершенный ягодный пирог"
			process_step += 1
			berrypie = TRUE
			update_icon()
			qdel(I)
			return
		if(berrypie && process_step == 2 && do_after(user,short_cooktime, target = src))
			user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
			to_chat(user, "<span class='notice'>Добавляю начинку в ягодный пирог. Нужно больше.</span>")
			process_step += 1
			update_icon()
			qdel(I)
			return
		if(berrypie && process_step == 3 && do_after(user,short_cooktime, target = src))
			user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
			to_chat(user, "<span class='notice'>Наполняю ягодный пирог до краев. Не хватает крышки из теста.</span>")
			process_step += 1
			update_icon()
			qdel(I)
			return	

	if(istype(I, /obj/item/reagent_containers/food/snacks/rogue/piedough))
		playsound(get_turf(user), 'sound/foley/dropsound/gen_drop.ogg', 30, TRUE, -1)
		if(fishy && process_step == 4 && do_after(user,short_cooktime, target = src))
			user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
			name = "сырой рыбный пирог"
			icon_state = "fishpie_raw"
			cooked_type = /obj/item/reagent_containers/food/snacks/rogue/pie/cooked/meat/fish
			cooked_smell = /datum/pollutant/food/fish_pie
			filling_color = "#d44197"
			process_step += 1
			update_icon()
			qdel(I)
		if(meaty && process_step == 4 && do_after(user,short_cooktime, target = src))
			user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
			name = "сырой мясной пирог"
			icon_state = "meatpie_raw"
			cooked_type = /obj/item/reagent_containers/food/snacks/rogue/pie/cooked/meat/meat
			cooked_smell = /datum/pollutant/food/meat_pie
			filling_color = "#b43628"
			process_step += 1
			update_icon()
			qdel(I)
		if(potpie && process_step == 4 && do_after(user,short_cooktime, target = src))
			user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
			name = "сырой деревенский пирог"
			filling_color = "#755430"
			cooked_type = /obj/item/reagent_containers/food/snacks/rogue/pie/cooked/pot
			cooked_smell = /datum/pollutant/food/pot_pie
			process_step += 1
			update_icon()
			qdel(I)
		if(eggpie && process_step == 4 && do_after(user,short_cooktime, target = src))
			user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
			name = "сырой яичный пирог"
			filling_color = "#755430"
			cooked_type = /obj/item/reagent_containers/food/snacks/rogue/pie/cooked/egg
			cooked_smell = /datum/pollutant/food/pot_pie
			process_step += 1
			update_icon()
			qdel(I)
		if(cheesetato && process_step == 4 && do_after(user,short_cooktime, target = src))
			user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
			name = "сырой сытный пирог"
			filling_color = "#755430"
			cooked_type = /obj/item/reagent_containers/food/snacks/rogue/pie/cooked/cheesetato
			cooked_smell = /datum/pollutant/food/pot_pie
			process_step += 1
			update_icon()
			qdel(I)
		if(fatty && process_step == 4 && do_after(user,short_cooktime, target = src))
			user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
			name = "сырой жирный пирог"
			filling_color = "#755430"
			cooked_type = /obj/item/reagent_containers/food/snacks/rogue/pie/cooked/fatty
			cooked_smell = /datum/pollutant/food/pot_pie
			process_step += 1
			update_icon()
			qdel(I)
		if(onionpie && process_step == 4 && do_after(user,short_cooktime, target = src))
			user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
			name = "сырой луковый пирог"
			filling_color = "#755430"
			cooked_type = /obj/item/reagent_containers/food/snacks/rogue/pie/cooked/onion
			cooked_smell = /datum/pollutant/food/pot_pie
			process_step += 1
			update_icon()
			qdel(I)
		if(applepie && process_step == 4 && do_after(user,short_cooktime, target = src))
			user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
			name = "сырой яблочный пирог"
			cooked_type = /obj/item/reagent_containers/food/snacks/rogue/pie/cooked/apple
			cooked_smell = /datum/pollutant/food/apple_pie
			process_step += 1
			update_icon()
			qdel(I)
		if(berrypie && process_step == 4 && do_after(user,short_cooktime, target = src))
			user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
			name = "сырой ягодный пирог"
			filling_color = "#4a62cf"
			cooked_type = /obj/item/reagent_containers/food/snacks/rogue/pie/cooked/berry
			cooked_smell = /datum/pollutant/food/berry_pie
			process_step += 1
			update_icon()
			qdel(I)
		if(poisoning && process_step == 4 && do_after(user,short_cooktime, target = src))
			user.mind.add_sleep_experience(/datum/skill/craft/cooking, user.STAINT * 0.8)
			name = "сырой ягодный пирог"
			filling_color = "#4a62cf"
			cooked_type = /obj/item/reagent_containers/food/snacks/rogue/pie/cooked/poison
			cooked_smell = /datum/pollutant/food/berry_pie
			process_step += 1
			update_icon()
			qdel(I)
	else
		return ..()
	return ..()


/*	........   Pie templates   ................ */
/obj/item/reagent_containers/food/snacks/rogue/pie
	name = "pie"
	desc = ""
	color = "#e7e2df"	
	dropshrink = 0.8
	var/stunning = FALSE

/obj/item/reagent_containers/food/snacks/rogue/pie/cooked
	icon_state = "pie"
	list_reagents = list(/datum/reagent/consumable/nutriment = MEAL_FILLING)
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/pieslice
	slices_num = 5
	slice_batch = TRUE
	warming = 10 MINUTES
	eat_effect = null
	foodtype = GRAIN | DAIRY
	chopping_sound = TRUE
	eat_effect = /datum/status_effect/buff/foodbuff
	dropshrink = 0.8

/obj/item/reagent_containers/food/snacks/rogue/pie/throw_impact(atom/hit_atom, datum/thrownthing/throwingdatum)
	. = ..()
	if(!.) //if we're not being caught
		splat(hit_atom)

/obj/item/reagent_containers/food/snacks/rogue/pie/proc/splat(atom/movable/hit_atom)
	if(isliving(loc)) //someone caught us!
		return
	var/turf/T = get_turf(hit_atom)
	new/obj/effect/decal/cleanable/food/pie_smudge(T)
	if(reagents && reagents.total_volume)
		reagents.reaction(hit_atom, TOUCH)
	if(isliving(hit_atom))
		var/mob/living/L = hit_atom
		if(stunning)
			L.Paralyze(20) //splat!
		L.adjust_blurriness(1)
		L.visible_message("<span class='warning'>[L] получил [src] в лицо!</span>", "<span class='danger'>В меня прилетел [src]!</span>")
	if(is_type_in_typecache(hit_atom, GLOB.creamable))
		hit_atom.AddComponent(/datum/component/creamed, src)
	qdel(src)

/obj/item/reagent_containers/food/snacks/rogue/pie/CheckParts(list/parts_list)
	..()
	for(var/obj/item/reagent_containers/food/snacks/M in parts_list)
		filling_color = M.filling_color
		update_snack_overlays(M)
		color = M.filling_color
		if(M.reagents)
			M.reagents.remove_reagent(/datum/reagent/consumable/nutriment, M.reagents.total_volume)
			M.reagents.trans_to(src, M.reagents.total_volume)
		qdel(M)

/obj/item/reagent_containers/food/snacks/rogue/pieslice
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT)
	tastes = list("пирога" = 1)
	name = "кусок пирога"
	desc = "Кусочек "
	icon_state = "slice"
	filling_color = "#FFFFFF"
	foodtype = GRAIN | DAIRY
	warming = 5 MINUTES
	bitesize = 3
	eat_effect = /datum/status_effect/buff/foodbuff
	color = "#e7e2df"
	rotprocess = SHELFLIFE_LONG

// -------------- MEAT PIE -----------------
/obj/item/reagent_containers/food/snacks/rogue/pie/cooked/meat // bae item
	name = "мясной пирог"
	desc = "Богатый животными белками пирог с плотной начинкой."
	eat_effect = /datum/status_effect/buff/foodbuff
	foodtype = GRAIN | DAIRY | MEAT

/obj/item/reagent_containers/food/snacks/rogue/pie/cooked/meat/meat
	icon_state = "meatpie"
	tastes = list("сочное мясо и хрустящее тесто" = 1)
	filling_color = "#b43628"

// -------------- FISH PIE -----------------
/obj/item/reagent_containers/food/snacks/rogue/pie/cooked/meat/fish
	name = "рыбный пирог"
	icon_state = "fishpie"
	tastes = list("запеченная рыба и хрустящее тесто" = 1)
	filling_color = "#d44197"


// -------------- POT PIE -----------------
/obj/item/reagent_containers/food/snacks/rogue/pie/cooked/pot
	name = "деревенский пирог"
	desc = "В начинке смешано все вкусное, что нашлось в закромах. Попробуйте сами"
	list_reagents = list(/datum/reagent/consumable/nutriment = MEAL_GOOD)
	tastes = list("сочная начинка и хрустящее тесто" = 1)
	filling_color = "#755430"
	foodtype = GRAIN | DAIRY | MEAT

// -------------- BERRY PIE -----------------
/obj/item/reagent_containers/food/snacks/rogue/pie/cooked/berry
	name = "ягодный пирог"
	desc = ""
	list_reagents = list(/datum/reagent/consumable/nutriment = MEAL_GOOD)
	slices_num = 4
	tastes = list("хрустящее тесто" = 1, "сладкие ягоды" = 1)
	filling_color = "#4a62cf"

// -------------- POISON PIE -----------------
/obj/item/reagent_containers/food/snacks/rogue/pie/cooked/poison
	name = "ягодный пирог"
	slices_num = 4
	list_reagents = list(/datum/reagent/consumable/nutriment = MEAL_GOOD, /datum/reagent/berrypoison = 12)
	tastes = list("хрустящее тесто" = 1, "горькие ягоды" =1)
	filling_color = "#4a62cf"

// -------------- APPLE PIE -----------------
/obj/item/reagent_containers/food/snacks/rogue/pie/cooked/apple
	name = "яблочный пирог"
	desc = ""
	slices_num = 4
	list_reagents = list(/datum/reagent/consumable/nutriment = MEAL_GOOD)
	tastes = list("печеные яблоки и хрустящее сливочное тесто" = 1)


// -------------- HANDPIE (dwarven pie on the go, good shelflife until bitten, made from pie dough and mince, truffles or jacksberries) -----------------
/obj/item/reagent_containers/food/snacks/rogue/foodbase/handpieraw
	name = "сырой пирожок"
	desc = "Дворфы едят небольшие пироги, которые на их диалекте называются пирожками. Пригоршня еды, которая выдержит испытание временем."
	icon_state = "handpie_raw"
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/handpie
	fried_type = /obj/item/reagent_containers/food/snacks/rogue/handpie
	cooked_smell = /datum/pollutant/food/pie_base
	w_class = WEIGHT_CLASS_NORMAL
	dropshrink = 0.8

/obj/item/reagent_containers/food/snacks/rogue/foodbase/handpieraw/mushroom
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_POOR)
	w_class = WEIGHT_CLASS_NORMAL
	foodtype = GRAIN | VEGETABLES
	tastes = list("грибов в тесте" = 1)

/obj/item/reagent_containers/food/snacks/rogue/foodbase/handpieraw/mince
	w_class = WEIGHT_CLASS_NORMAL
	foodtype = GRAIN | MEAT
	tastes = list("мяса в тесте" = 1)

/obj/item/reagent_containers/food/snacks/rogue/foodbase/handpieraw/berry
	w_class = WEIGHT_CLASS_NORMAL
	foodtype = GRAIN | FRUIT
	tastes = list("сладких ягод в тесте" = 1)

/obj/item/reagent_containers/food/snacks/rogue/foodbase/handpieraw/poison
	list_reagents = list(/datum/reagent/berrypoison = 5)
	w_class = WEIGHT_CLASS_NORMAL
	foodtype = GRAIN | FRUIT
	tastes = list("горьких ягод в тесте" = 1)

/obj/item/reagent_containers/food/snacks/rogue/handpie
	name = "пирожок"
	desc = "Дворфы едят небольшие пироги, которые на их диалекте называются пирожками. Пригоршня еды, которая выдержит испытание временем."
	icon_state = "handpie"
	eat_effect = /datum/status_effect/buff/foodbuff
	bitesize = 4
	list_reagents = list(/datum/reagent/consumable/nutriment = BUTTERDOUGHSLICE_NUTRITION+MINCE_NUTRITION, /datum/reagent/medicine/omnizine = 5) // donkpocket
	tastes = list("хрустящего теста" = 1)
	rotprocess = null
	dropshrink = 0.8

/obj/item/reagent_containers/food/snacks/rogue/handpie/On_Consume(mob/living/eater)
	..()
	icon_state = "handpie[bitecount]"
	if(bitecount == 1)
		rotprocess = SHELFLIFE_DECENT
		addtimer(CALLBACK(src, PROC_REF(begin_rotting)), 20, TIMER_CLIENT_TIME) // 
