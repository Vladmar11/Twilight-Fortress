/datum/crafting_recipe/roguetown/alchemy
	req_table = FALSE
	tools = list(/obj/item/reagent_containers/glass/alembic)
	verbage_simple = "замешиваю"
	verbage = "замешивает"
	skillcraft = /datum/skill/misc/treatment
	subtype_reqs = TRUE

/datum/crafting_recipe/roguetown/alchemy/thermometer
	name = "термоскоп - (1 бутылка, 1.7oz ртути; APPRENTICE)"
	result = list(/obj/item/thermometer)
	reqs = list(/obj/item/reagent_containers/glass/bottle = 1, /datum/reagent/mercury = 5)
	skill_level = 2

/datum/crafting_recipe/roguetown/alchemy/bbomb
	name = "бутылочная бомба - (1 бутылка, 2 пепла, 1 уголь, 1 ткань; APPRENTICE)"
	result = list(/obj/item/bomb)
	reqs = list(/obj/item/reagent_containers/glass/bottle = 1, /obj/item/ash = 2, /obj/item/rogueore/coal = 1, /obj/item/natural/cloth = 1)
	skill_level = 2

