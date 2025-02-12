/obj/item/seeds
	name = "семена"
	icon = 'icons/obj/hydroponics/seeds.dmi'
	icon_state = "seed"
	w_class = WEIGHT_CLASS_TINY
	resistance_flags = FLAMMABLE
	possible_item_intents = list(/datum/intent/use)
	var/plant_def_type
	var/seed_identity = "какие-то странные семена"

// WARNING!! Some seeds were removed from soilsons because their produce wasn't being used in New Cooking! Please give them the seeds back if this changes!!

/obj/item/seeds/Initialize()
	. = ..()
	if(plant_def_type)
		var/datum/plant_def/def = GLOB.plant_defs[plant_def_type]
		color = def.seed_color

/obj/item/seeds/Crossed(mob/living/L)
	. = ..()
	// Chance to destroy the seed as it's being stepped on
	if(prob(35) && istype(L))
		qdel(src)

/obj/item/seeds/examine(mob/user)
	. = ..()
	var/show_real_identity = FALSE
	if(isliving(user))
		var/mob/living/living = user
		// Seed knowers, know the seeds (druids and such)
		if(HAS_TRAIT(living, TRAIT_SEEDKNOW))
			show_real_identity = TRUE
		// Journeyman farmers know them too
		else if(living.mind.get_skill_level(/datum/skill/labor/farming) >= 2)
			show_real_identity = TRUE
	else
		show_real_identity = TRUE
	if(show_real_identity)
		. += span_info("Я думаю, что это [seed_identity]")

/obj/item/seeds/attack_turf(turf/T, mob/living/user)
	var/obj/structure/soil/soil = get_soil_on_turf(T)
	if(soil)
		try_plant_seed(user, soil)
		return
	else if(istype(T, /turf/open/floor/rogue/dirt))
		to_chat(user, span_notice("Я копаю ямку для семян..."))
		if(do_after(user, get_farming_do_time(user, 10 SECONDS), target = src))
			apply_farming_fatigue(user, 30)
			soil = get_soil_on_turf(T)
			if(!soil)
				soil = new /obj/structure/soil(T)
		return
	. = ..()

/obj/item/seeds/proc/try_plant_seed(mob/living/user, obj/structure/soil/soil)
	if(soil.plant)
		to_chat(user, span_warning("В [soil] уже что-то высажено!"))
		return
	if(!plant_def_type)
		return
	to_chat(user, span_notice("Я сажаю [src] в [soil]."))
	soil.insert_plant(GLOB.plant_defs[plant_def_type])
	qdel(src)

/obj/item/seeds/wheat
	seed_identity = "семена пшеницы"
	plant_def_type = /datum/plant_def/wheat

/obj/item/seeds/wheat/oat
	seed_identity = "семена овса"
	plant_def_type = /datum/plant_def/oat

/obj/item/seeds/apple
	seed_identity = "семена яблони"
	plant_def_type = /datum/plant_def/apple

/obj/item/seeds/pipeweed
	seed_identity = "семена табака"
	plant_def_type = /datum/plant_def/pipeweed

/obj/item/seeds/sweetleaf
	seed_identity = "семена болотной травы"
	plant_def_type = /datum/plant_def/sweetleaf

/obj/item/seeds/berryrogue
	seed_identity = "семена ягодного куста"
	plant_def_type = /datum/plant_def/berry

/obj/item/seeds/berryrogue/poison
	seed_identity = "семена ягодного куста"
	plant_def_type = /datum/plant_def/berry_poison

/obj/item/seeds/cabbage
	seed_identity = "семена капусты"
	plant_def_type = /datum/plant_def/cabbage

/obj/item/seeds/pear
	seed_identity = "семена грушевого дерева"
	plant_def_type = /datum/plant_def/pear

/obj/item/seeds/cherry
	seed_identity = "семена вишневого дерева"
	plant_def_type = /datum/plant_def/cherry

/obj/item/seeds/olive
	seed_identity = "семена оливкового дерева"
	plant_def_type = /datum/plant_def/olive

/obj/item/seeds/nut
	seed_identity = "семена скалистого орешника"
	plant_def_type = /datum/plant_def/nut

/obj/item/seeds/tomato
	seed_identity = "семена томатов"
	plant_def_type = /datum/plant_def/tomato

/obj/item/seeds/onion
	seed_identity = "семена репчатого лука"
	plant_def_type = /datum/plant_def/onion

/obj/item/seeds/garlic
	seed_identity = "семена чеснока"
	plant_def_type = /datum/plant_def/garlic

/obj/item/seeds/carrot
	seed_identity = "семена моркови"
	plant_def_type = /datum/plant_def/carrot

/obj/item/seeds/potato
	seed_identity = "семенной картофель"
	plant_def_type = /datum/plant_def/potato

/obj/item/seeds/eggplant
	seed_identity = "семена баклажана"
	plant_def_type = /datum/plant_def/eggplant

/obj/item/seeds/bean
	seed_identity = "семена бобов"
	plant_def_type = /datum/plant_def/bean

/obj/item/seeds/radish
	seed_identity = "семена редьки"
	plant_def_type = /datum/plant_def/radish

/obj/item/seeds/beet
	seed_identity = "семена сахарной свеклы"
	plant_def_type = /datum/plant_def/beet

/obj/item/seeds/bellpepper
	seed_identity = "семена перца тифлинга"
	plant_def_type = /datum/plant_def/bellpepper

/obj/item/seeds/peas
	seed_identity = "семена гороха"
	plant_def_type = /datum/plant_def/peas

/obj/item/seeds/rice
	seed_identity = "семена риса"
	plant_def_type = /datum/plant_def/rice

/obj/item/seeds/cucumber
	seed_identity = "семена огурца"
	plant_def_type = /datum/plant_def/cucumber

/obj/item/seeds/tea
	seed_identity = "семена чайного дерева"
	plant_def_type = /datum/plant_def/tea

/obj/item/seeds/mycelium
	name = "грибные споры"
	icon_state = "mycelium"

/obj/item/seeds/mycelium/plumphelmet
	seed_identity = "споры толстошляпника"
	plant_def_type = /datum/plant_def/plumphelmet

/obj/item/seeds/mycelium/trippy
	seed_identity = "споры синего гриба"
	plant_def_type = /datum/plant_def/trippy

/obj/item/seeds/mycelium/amanita
	seed_identity = "споры красного гриба"
	plant_def_type = /datum/plant_def/amanita
