/datum/plant_def
	abstract_type = /datum/plant_def
	/// Name of the plant
	var/name = "Some plant"
	/// Description of the plant
	var/desc = "Sure is a plant."
	var/icon
	var/icon_state
	/// Loot the plant will yield for uprooting it
	var/list/uproot_loot
	/// Time in ticks the plant will require to mature, before starting to make produce
	var/maturation_time = 6 MINUTES
	/// Time in ticks the plant will require to make produce
	var/produce_time = 3 MINUTES
	/// Typepath of produce to make on harvest
	var/produce_type
	/// Amount of minimum produce to make on harvest
	var/produce_amount_min = 2
	/// Amount of maximum produce to make on harvest
	var/produce_amount_max = 3
	/// How much nutrition will the plant require to mature fully
	var/maturation_nutrition = 30
	/// How much nutrition will the plant require to make produce
	var/produce_nutrition = 20
	/// If not perennial, the plant will uproot itself upon harvesting first produce
	var/perennial = FALSE
	/// Whether the plant is immune to weeds and will naturally deal with them
	var/weed_immune = FALSE
	/// The rate at which the plant drains water, if zero then it'll be able to live without water
	var/water_drain_rate = 2 / (1 MINUTES)
	/// Color all seeds of this plant def will have, randomised on init
	var/seed_color
	/// Whether the plant can grow underground
	var/can_grow_underground = FALSE

/datum/plant_def/New()
	. = ..()
	var/static/list/random_colors = list("#fffbf7", "#f3c877", "#5e533e", "#db7f62", "#f39945")
	seed_color = pick(random_colors)

/datum/plant_def/wheat
	name = "стебли пшеницы"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "wheat"
	produce_type = /obj/item/natural/chaff/wheat
	produce_amount_min = 3
	produce_amount_max = 4
	uproot_loot = list(/obj/item/natural/fibers, /obj/item/natural/fibers)
	maturation_nutrition = 30
	produce_nutrition = 20
	maturation_time = 5 MINUTES
	produce_time = 2 MINUTES

/datum/plant_def/oat
	name = "стебли овса"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "oat"
	produce_type = /obj/item/natural/chaff/oat
	produce_amount_min = 3
	produce_amount_max = 4
	uproot_loot = list(/obj/item/natural/fibers, /obj/item/natural/fibers)
	maturation_nutrition = 30
	produce_nutrition = 20
	maturation_time = 5 MINUTES
	produce_time = 2 MINUTES

/datum/plant_def/rice
	name = "стебли риса"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "rice"
	produce_type = /obj/item/natural/chaff/rice
	produce_amount_min = 3
	produce_amount_max = 4
	uproot_loot = list(/obj/item/natural/fibers, /obj/item/natural/fibers)
	maturation_nutrition = 30
	produce_nutrition = 20
	maturation_time = 5 MINUTES
	produce_time = 2 MINUTES

/datum/plant_def/apple
	name = "яблоня"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "apple"
	produce_type = /obj/item/reagent_containers/food/snacks/grown/apple
	uproot_loot = list(/obj/item/grown/log/tree/small)
	perennial = TRUE
	produce_amount_min = 2
	produce_amount_max = 3
	maturation_nutrition = 60
	produce_nutrition =  30
	maturation_time = 6 MINUTES
	produce_time = 3 MINUTES

/datum/plant_def/pipeweed
	name = "табак"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "tobacco"
	produce_type = /obj/item/reagent_containers/food/snacks/grown/rogue/pipeweed

/datum/plant_def/sweetleaf
	name = "болотная трава"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "weed"
	produce_type = /obj/item/reagent_containers/food/snacks/grown/rogue/sweetleaf

/datum/plant_def/berry
	name = "ягодный куст"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "berry"
	produce_type = /obj/item/reagent_containers/food/snacks/grown/berries/rogue
	uproot_loot = list(/obj/item/grown/log/tree/small)
	perennial = TRUE
	produce_amount_min = 2
	produce_amount_max = 3
	maturation_nutrition = 60
	produce_nutrition =  30
	maturation_time = 6 MINUTES
	produce_time = 3 MINUTES

/datum/plant_def/berry_poison
	name = "ягодный куст"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "berry"
	produce_type = /obj/item/reagent_containers/food/snacks/grown/berries/rogue/poison
	uproot_loot = list(/obj/item/grown/log/tree/small)
	perennial = TRUE


/datum/plant_def/cabbage
	name = "грядка капусты"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "cabbage"
	produce_type = /obj/item/reagent_containers/food/snacks/grown/cabbage/rogue
	produce_amount_min = 2
	produce_amount_max = 4
	maturation_nutrition = 25
	produce_nutrition =  15
	maturation_time = 4 MINUTES
	produce_time = 2 MINUTES

/datum/plant_def/pear
	name = "груша"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "pear"
	produce_type = /obj/item/reagent_containers/food/snacks/grown/pear
	uproot_loot = list(/obj/item/grown/log/tree/small)
	perennial = TRUE
	maturation_nutrition = 60
	produce_nutrition =  30
	maturation_time = 6 MINUTES
	produce_time = 3 MINUTES

/datum/plant_def/cherry
	name = "вишня"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "cherry"
	produce_type = /obj/item/reagent_containers/food/snacks/grown/cherry
	uproot_loot = list(/obj/item/grown/log/tree/small)
	perennial = TRUE
	maturation_nutrition = 60
	produce_nutrition =  30
	maturation_time = 6 MINUTES
	produce_time = 3 MINUTES

/datum/plant_def/olive
	name = "оливковое дерево"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "olive"
	produce_type = /obj/item/reagent_containers/food/snacks/grown/olive
	uproot_loot = list(/obj/item/grown/log/tree/small)
	perennial = TRUE
	maturation_nutrition = 60
	produce_nutrition =  30
	maturation_time = 6 MINUTES
	produce_time = 3 MINUTES

/datum/plant_def/nut
	name = "скалистый орешник"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "nuts"
	produce_type = /obj/item/reagent_containers/food/snacks/grown/nut
	uproot_loot = list(/obj/item/grown/log/tree/small)
	perennial = TRUE
	produce_amount_max = 3
	maturation_nutrition = 60
	produce_nutrition =  35
	maturation_time = 6 MINUTES
	produce_time = 3 MINUTES
	water_drain_rate = 1 / (2 MINUTES)

/datum/plant_def/tomato
	name = "куст томата"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "tomato"
	produce_type = /obj/item/reagent_containers/food/snacks/grown/tomato
	perennial = TRUE
	maturation_nutrition = 60
	produce_nutrition =  30
	maturation_time = 6 MINUTES
	produce_time = 3 MINUTES

/datum/plant_def/onion
	name = "грядка лука"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "onion"
	produce_type = /obj/item/reagent_containers/food/snacks/grown/onion/rogue
	produce_amount_min = 2
	produce_amount_max = 4
	maturation_nutrition = 25
	produce_nutrition =  15
	maturation_time = 4 MINUTES
	produce_time = 2 MINUTES

/datum/plant_def/garlic
	name = "грядка чеснока"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "garlic"
	produce_type = /obj/item/reagent_containers/food/snacks/grown/garlic
	maturation_nutrition = 25
	produce_nutrition =  15
	maturation_time = 4 MINUTES
	produce_time = 2 MINUTES

/datum/plant_def/carrot
	name = "грядка моркови"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "carrot"
	produce_type = /obj/item/reagent_containers/food/snacks/grown/carrot
	produce_amount_min = 2
	produce_amount_max = 4
	maturation_nutrition = 25
	produce_nutrition =  15
	maturation_time = 4 MINUTES
	produce_time = 2 MINUTES

/datum/plant_def/potato
	name = "картофельный куст"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "potato"
	produce_type = /obj/item/reagent_containers/food/snacks/grown/potato/rogue
	produce_amount_min = 2
	produce_amount_max = 4
	maturation_nutrition = 25
	produce_nutrition =  15
	maturation_time = 4 MINUTES
	produce_time = 2 MINUTES

/datum/plant_def/eggplant
	name = "куст баклажана"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "eggplant"
	produce_type = /obj/item/reagent_containers/food/snacks/grown/eggplant
	perennial = TRUE
	maturation_nutrition = 60
	produce_nutrition =  30
	maturation_time = 6 MINUTES
	produce_time = 3 MINUTES

/datum/plant_def/bean
	name = "стебель фасоли"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "bean"
	produce_type = /obj/item/reagent_containers/food/snacks/grown/bean
	maturation_nutrition = 40
	produce_nutrition =  20
	maturation_time = 5 MINUTES
	produce_time = 2.5 MINUTES

/datum/plant_def/radish
	name = "грядка редьки"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "radish"
	produce_type = /obj/item/reagent_containers/food/snacks/grown/radish
	produce_amount_min = 2
	produce_amount_max = 4
	maturation_nutrition = 25
	produce_nutrition =  15
	maturation_time = 4 MINUTES
	produce_time = 2 MINUTES

/datum/plant_def/beet
	name = "свекольная грядка"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "beet"
	produce_type = /obj/item/reagent_containers/food/snacks/grown/beet
	produce_amount_min = 2
	produce_amount_max = 4
	maturation_nutrition = 25
	produce_nutrition =  15
	maturation_time = 4 MINUTES
	produce_time = 2 MINUTES

/datum/plant_def/bellpepper
	name = "куст перца тифлингв"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "bellpepper"
	produce_type = /obj/item/reagent_containers/food/snacks/grown/bellpepper
	perennial = TRUE
	maturation_nutrition = 60
	produce_nutrition =  30
	maturation_time = 6 MINUTES
	produce_time = 3 MINUTES

/datum/plant_def/peas
	name = "стебель гороха"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "peas"
	produce_type = /obj/item/reagent_containers/food/snacks/grown/peas
	maturation_nutrition = 40
	produce_nutrition =  20
	maturation_time = 5 MINUTES
	produce_time = 2.5 MINUTES

/datum/plant_def/cucumber
	name = "огуречная лоза"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "cucumber"
	produce_type = /obj/item/reagent_containers/food/snacks/grown/cucumber
	perennial = TRUE
	maturation_nutrition = 60
	produce_nutrition =  30
	maturation_time = 6 MINUTES
	produce_time = 3 MINUTES

/datum/plant_def/tea
	name = "чайный куст"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "tea"
	produce_type = /obj/item/reagent_containers/food/snacks/grown/tea
	perennial = TRUE
	maturation_nutrition = 60
	produce_nutrition =  30
	maturation_time = 6 MINUTES
	produce_time = 3 MINUTES

/datum/plant_def/plumphelmet
	name = "грядка толстошляпника"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "plump"
	produce_type = /obj/item/reagent_containers/food/snacks/grown/plumphelmet
	produce_amount_min = 2
	produce_amount_max = 4
	maturation_nutrition = 25
	produce_nutrition =  15
	maturation_time = 4 MINUTES
	produce_time = 2 MINUTES
	weed_immune = TRUE
	can_grow_underground = TRUE

/datum/plant_def/trippy
	name = "грядка с синими грибами"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "trippy"
	produce_type = /obj/item/reagent_containers/food/snacks/grown/trippy
	produce_amount_min = 2
	produce_amount_max = 4
	maturation_nutrition = 25
	produce_nutrition =  15
	maturation_time = 4 MINUTES
	produce_time = 2 MINUTES
	weed_immune = TRUE
	can_grow_underground = TRUE

/datum/plant_def/amanita
	name = "грядка с красными грибами"
	icon = 'icons/roguetown/misc/crops.dmi'
	icon_state = "amanita"
	produce_type = /obj/item/reagent_containers/food/snacks/grown/amanita
	produce_amount_min = 2
	produce_amount_max = 4
	maturation_nutrition = 25
	produce_nutrition =  15
	maturation_time = 4 MINUTES
	produce_time = 2 MINUTES
	weed_immune = TRUE
	can_grow_underground = TRUE
