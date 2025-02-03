/* * * * * * * * * * * **
 *						*
 *		 NeuFood		*
 *		(Veggies)		*
 *						*
 * * * * * * * * * * * **/


/*	..................   Onions   ................... */
/obj/item/reagent_containers/food/snacks/grown/onion/rogue
	desc = "Замечательный многослойный овощ обладающий широкой вкусовой палитрой"
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/veg/onion_sliced
	tastes = list("лук" = 1)
	chopping_sound = TRUE
	dropshrink = 0.8

/obj/item/reagent_containers/food/snacks/rogue/veg/onion_sliced
	name = "нарезанный лук"
	icon_state = "onion_sliced"
	slices_num = 3
	fried_type = /obj/item/reagent_containers/food/snacks/rogue/preserved/onion_fried
	cooked_smell = /datum/pollutant/food/fried_onion
	can_distill = TRUE
	distill_amt = 6

/*	..................   Cabbage   ................... */
/obj/item/reagent_containers/food/snacks/grown/cabbage/rogue
	desc = "Овощ с плотными листьями, хрустящий и спелый. Символ эльфийского процветания."
	slices_num = 3
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/veg/cabbage_sliced
	dropshrink = 0.7
	chopping_sound = TRUE

/obj/item/reagent_containers/food/snacks/rogue/veg/cabbage_sliced
	name = "нашинкованная капуста"
	icon_state = "cabbage_sliced"
	fried_type = /obj/item/reagent_containers/food/snacks/rogue/preserved/cabbage_fried
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/preserved/cabbage_fried
	cooked_smell = /datum/pollutant/food/fried_cabbage


/*	..................   Potato   ................... */
/obj/item/reagent_containers/food/snacks/grown/potato/rogue
	desc = "Крупные клубни, которые любят все. Олицетворение дворфийского роста."
	eat_effect = null
	slices_num = 3
	slice_path = /obj/item/reagent_containers/food/snacks/rogue/veg/potato_sliced
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/preserved/potato_baked
	tastes = list("potato" = 1)
	chopping_sound = TRUE

/obj/item/reagent_containers/food/snacks/rogue/veg/potato_sliced
	name = "ломтики картофеля"
	icon_state = "potato_sliced"
	fried_type = /obj/item/reagent_containers/food/snacks/rogue/preserved/potato_fried
	cooked_type = /obj/item/reagent_containers/food/snacks/rogue/preserved/potato_fried
	cooked_smell = /datum/pollutant/food/baked_potato
	can_distill = TRUE
	distill_amt = 8
