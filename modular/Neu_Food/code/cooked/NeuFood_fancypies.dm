//Overwrite for using with slices
// -------------- MEAT PIE -----------------
/obj/item/reagent_containers/food/snacks/rogue/pie/cooked/meat/meat
	icon_state = "meatpie"
	tastes = list("сочного мяса и хрустящего теста" = 1)
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/pieslice/meat
	filling_color = "#b43628"

/obj/item/reagent_containers/food/snacks/rogue/pieslice/meat
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT)
	tastes = list("сочного мяса" = 1, "хрустящего теста" = 1)
	name = "кусок мясного пирога"
	desc = "Кусочек пирога с мясной начинкой. Объедение!"
	icon_state = "slice"
	filling_color = "#b43628"
	foodtype = GRAIN | DAIRY | MEAT
	warming = 5 MINUTES
	bitesize = 3
	eat_effect = /datum/status_effect/buff/foodbuff
	color = "#e7e2df"
	rotprocess = SHELFLIFE_LONG

// -------------- FISH PIE -----------------
/obj/item/reagent_containers/food/snacks/rogue/pie/cooked/meat/fish
	name = "рыбный пирог"
	icon_state = "fishpie"
	tastes = list("запеченной рыбы и хрустящего теста" = 1)
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/pieslice/fish
	filling_color = "#d44197"

/obj/item/reagent_containers/food/snacks/rogue/pieslice/fish
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT)
	tastes = list("запеченой рыбы" = 1, "хрустящего теста" = 1)
	name = "кусок рыбного пирога"
	desc = "Кусочек пирога с начинкой из рыбного фарша. Настоящий дар Абиссора!"
	icon_state = "slice"
	filling_color = "#d44197"
	foodtype = GRAIN | DAIRY | MEAT
	warming = 5 MINUTES
	bitesize = 3
	eat_effect = /datum/status_effect/buff/foodbuff
	color = "#e7e2df"
	rotprocess = SHELFLIFE_LONG


// -------------- EGG PIE -----------------
/obj/item/reagent_containers/food/snacks/rogue/pie/cooked/egg
	name = "яичный пирог"
	desc = "Простой пирог с начинкой из свежих яиц. Как будто омлет в тесте."
	list_reagents = list(/datum/reagent/consumable/nutriment = MEAL_GOOD)
	tastes = list("печеного яйца и хрустящего теста" = 1)
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/pieslice/egg
	filling_color = "#caac8b"
	foodtype = GRAIN | DAIRY | MEAT

/obj/item/reagent_containers/food/snacks/rogue/pieslice/egg
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT)
	tastes = list("печеного яйца" = 1, "хрустящего теста" = 1)
	name = "кусок яичного пирога"
	desc = "Кусочек пирога с запеченным яйцом. Для тех, кому не к лицу есть простую яичницу."
	icon_state = "slice"
	filling_color = "#caac8b"
	foodtype = GRAIN | DAIRY | MEAT
	warming = 5 MINUTES
	bitesize = 3
	eat_effect = /datum/status_effect/buff/foodbuff
	color = "#e7e2df"
	rotprocess = SHELFLIFE_LONG


// -------------- CHEESE&TATOS PIE -----------------
/obj/item/reagent_containers/food/snacks/rogue/pie/cooked/cheesetato
	name = "сытный пирог"
	desc = "Плотный пирог, который обычно начиняют картофелем и сыром в разных пропорциях."
	list_reagents = list(/datum/reagent/consumable/nutriment = MEAL_GOOD)
	tastes = list("пряной начинки и хрустящего теста" = 1)
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/pieslice/cheesetato
	filling_color = "#b48e3a"
	foodtype = GRAIN | DAIRY | VEGETABLES

/obj/item/reagent_containers/food/snacks/rogue/pieslice/cheesetato
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT)
	tastes = list("пряной начинки" = 1, "хрустящего теста" = 1)
	name = "кусок сытного пирога"
	desc = "Кусочек пирога, с очень густой и плотной начинкой. Даст энергию на весь день."
	icon_state = "slice"
	filling_color = "#b48e3a"
	foodtype = GRAIN | DAIRY | VEGETABLES
	warming = 5 MINUTES
	bitesize = 3
	eat_effect = /datum/status_effect/buff/foodbuff
	color = "#e7e2df"
	rotprocess = SHELFLIFE_LONG

// -------------- FATTY PIE -----------------
/obj/item/reagent_containers/food/snacks/rogue/pie/cooked/fatty
	name = "жирный пирог"
	desc = "Скворчащий пирог, который готовят из кусочков жира с добавлением мяса жирной птицы."
	list_reagents = list(/datum/reagent/consumable/nutriment = MEAL_GOOD)
	tastes = list("сочащегося жира и хрустящего теста" = 1)
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/pieslice/fatty
	filling_color = "#8b775f"
	foodtype = GRAIN | DAIRY | MEAT

/obj/item/reagent_containers/food/snacks/rogue/pieslice/fatty
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT)
	tastes = list("сочащегося жира" = 1, "хрустящего теста" = 1)
	name = "кусок жирного пирога"
	desc = "Кусочек пирога с очень жирной начинкой. Вы чувствуете, как ваш желудок молит о пощаде."
	icon_state = "slice"
	filling_color = "#8b775f"
	foodtype = GRAIN | DAIRY | MEAT
	warming = 5 MINUTES
	bitesize = 3
	eat_effect = /datum/status_effect/buff/foodbuff
	color = "#e7e2df"
	rotprocess = SHELFLIFE_LONG

// -------------- ONION PIE -----------------
/obj/item/reagent_containers/food/snacks/rogue/pie/cooked/onion
	name = "луковый пирог"
	desc = "Ароматный пряный пирог с луком, простая закуска городских рабочих."
	list_reagents = list(/datum/reagent/consumable/nutriment = MEAL_GOOD)
	tastes = list("тушеного лука и хрустящего теста" = 1)
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/pieslice/onion
	foodtype = GRAIN | DAIRY | VEGETABLES

/obj/item/reagent_containers/food/snacks/rogue/pieslice/onion
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT)
	tastes = list("тушеного лука" = 1, "хрустящего теста" = 1)
	name = "кусок лукового пирога"
	desc = "Кусочек пирога с мягкой начинкой из тушеного лука. Обладает очень пряным вкусом."
	icon_state = "slice"
	filling_color = "#a0907d"
	foodtype = GRAIN | DAIRY | VEGETABLES
	warming = 5 MINUTES
	bitesize = 3
	eat_effect = /datum/status_effect/buff/foodbuff
	color = "#e7e2df"
	rotprocess = SHELFLIFE_LONG

// -------------- BERRY PIE -----------------
/obj/item/reagent_containers/food/snacks/rogue/pie/cooked/berry
	name = "ягодный пирог"
	desc = "Сладкий ягодный пирог, который готовят на праздники и к пиру."
	list_reagents = list(/datum/reagent/consumable/nutriment = MEAL_GOOD)
	slices_num = 4
	tastes = list("сладких ягод" = 1, "хрустящего теста" = 1)
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/pieslice/berry
	filling_color = "#4a62cf"
	foodtype = GRAIN | DAIRY | FRUIT

/obj/item/reagent_containers/food/snacks/rogue/pieslice/berry
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT)
	tastes = list("сладких ягод" = 1, "хрустящего теста" = 1)
	name = "кусок ягодного пирога"
	desc = "Кусочек пирога со сладкой ягодной начинкой. Прекрасное угощение!"
	icon_state = "slice"
	filling_color = "#4a62cf"
	foodtype = GRAIN | DAIRY | FRUIT
	warming = 5 MINUTES
	bitesize = 3
	eat_effect = /datum/status_effect/buff/foodbuff
	color = "#e7e2df"
	rotprocess = SHELFLIFE_LONG

// -------------- POISON PIE -----------------
/obj/item/reagent_containers/food/snacks/rogue/pie/cooked/poison
	name = "ягодный пирог"
	desc = "Сладкий ягодный пирог, который готовят на праздники и к пиру."
	slices_num = 4
	list_reagents = list(/datum/reagent/consumable/nutriment = MEAL_GOOD, /datum/reagent/berrypoison = 12)
	tastes = list("горьких ягод" = 1, "хрустящего теста" = 1)
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/pieslice/poison
	filling_color = "#4a62cf"
	foodtype = GRAIN | DAIRY | FRUIT

/obj/item/reagent_containers/food/snacks/rogue/pieslice/poison
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT, /datum/reagent/berrypoison = 3)
	tastes = list("горьких ягод" = 1, "хрустящего теста" = 1)
	name = "кусок ягодного пирога"
	desc = "Кусочек пирога со сладкой ягодной начинкой. Прекрасное угощение!"
	icon_state = "slice"
	filling_color = "#4a62cf"
	foodtype = GRAIN | DAIRY | FRUIT
	warming = 5 MINUTES
	bitesize = 3
	eat_effect = /datum/status_effect/buff/foodbuff
	color = "#e7e2df"
	rotprocess = SHELFLIFE_LONG

// -------------- APPLE PIE -----------------
/obj/item/reagent_containers/food/snacks/rogue/pie/cooked/apple
	name = "яблочный пирог"
	desc = "Сладкий пирог с начинкой из рубленных яблок. По слухам, его запах приманивает лис."
	slices_num = 4
	foodtype = GRAIN | DAIRY | FRUIT
	list_reagents = list(/datum/reagent/consumable/nutriment = MEAL_GOOD)
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/pieslice/apple
	tastes = list("печеных яблок и хрустящего теста" = 1)

/obj/item/reagent_containers/food/snacks/rogue/pieslice/apple
	list_reagents = list(/datum/reagent/consumable/nutriment = SNACK_DECENT)
	tastes = list("печеных яблок" = 1, "хрустящего теста" = 1)
	name = "кусок яблочного пирога"
	desc = "Кусочек пирога с яблочными дольками. Выглядит бесподобно!"
	icon_state = "slice"
	filling_color = "#FFFFFF"
	foodtype = GRAIN | DAIRY | FRUIT
	warming = 5 MINUTES
	bitesize = 3
	eat_effect = /datum/status_effect/buff/foodbuff
	color = "#e7e2df"
	rotprocess = SHELFLIFE_LONG

