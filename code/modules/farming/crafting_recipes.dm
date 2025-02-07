/datum/crafting_recipe/roguetown/structure/composter
	name = "компостер (1 полено)"
	result = /obj/structure/composter
	reqs = list(/obj/item/grown/log/tree/small = 1)
	verbage_simple = "строю"
	verbage = "строит"
	skill_level = 0
	time = 2 SECONDS

/datum/crafting_recipe/roguetown/wheatflour
	name = "мука (пшеница)"
	result = /obj/item/reagent_containers/powder/flour
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/wheat = 1)
	structurecraft = /obj/structure/fluff/millstone
	verbage_simple = "перемалываю"
	verbage = "перемалывает"
	skill_level = -2
	time = 3

/datum/crafting_recipe/roguetown/oatflour
	name = "мука (овес)"
	result = /obj/item/reagent_containers/powder/flour
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/oat = 1)
	structurecraft = /obj/structure/fluff/millstone
	verbage_simple = "перемалываю"
	verbage = "перемалывает"
	skill_level = -2
	time = 3

/datum/crafting_recipe/roguetown/structure/plough
	name = "плуг (2 полена, 1 слиток железа)"
	result = /obj/structure/plough
	reqs = list(/obj/item/grown/log/tree/small = 2, /obj/item/ingot/iron = 1)
	verbage_simple = "собираю"
	verbage = "собирает"
	skillcraft = /datum/skill/craft/carpentry
	time = 4 SECONDS

/datum/crafting_recipe/roguetown/dryleaf
	name = "сушеная болотная трава"
	result = /obj/item/reagent_containers/food/snacks/grown/rogue/sweetleafdry
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/rogue/sweetleaf = 1)
	structurecraft = /obj/machinery/tanningrack
	time = 2 SECONDS
	verbage_simple = "сушу"
	verbage = "сушит"
	craftsound = null
	skillcraft = null

/datum/crafting_recipe/roguetown/sigsweet
	name = "папироса из болотной травы"
	result = /obj/item/clothing/mask/cigarette/rollie/cannabis
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/rogue/sweetleafdry = 1,
				/obj/item/paper/scroll = 1)
	req_table = TRUE
	time = 10 SECONDS
	verbage_simple = "скручиваю"
	verbage = "скручивает"
	skill_level = 0

/datum/crafting_recipe/roguetown/dryweed
	name = "сушеный лист табака"
	result = /obj/item/reagent_containers/food/snacks/grown/rogue/pipeweeddry
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/rogue/pipeweed = 1)
	structurecraft = /obj/machinery/tanningrack
	time = 2 SECONDS
	verbage_simple = "сушу"
	verbage = "сушит"
	craftsound = null
	skillcraft = null

/datum/crafting_recipe/roguetown/sigdry
	name = "папироса из табака"
	result = /obj/item/clothing/mask/cigarette/rollie/nicotine
	reqs = list(/obj/item/reagent_containers/food/snacks/grown/rogue/pipeweeddry = 1,
				/obj/item/paper/scroll = 1)
	req_table = TRUE
	time = 10 SECONDS
	verbage_simple = "скручиваю"
	verbage = "скручивает"
	skill_level = 0
