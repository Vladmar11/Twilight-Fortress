/obj/item/reagent_containers/food/snacks/grown
	icon = 'icons/roguetown/items/produce.dmi'
	dried_type = null
	resistance_flags = FLAMMABLE
	w_class = WEIGHT_CLASS_SMALL
	var/list/pipe_reagents = list()
	var/seed
	var/bitesize_mod = 0


/obj/item/reagent_containers/food/snacks/grown/Initialize(mapload)
	. = ..()
	if(!tastes)
		tastes = list("[name]" = 1)
	pixel_x = rand(-5, 5)
	pixel_y = rand(-5, 5)

/obj/item/reagent_containers/food/snacks/grown/attackby(obj/item/weapon, mob/user, params)
	if(weapon && isturf(loc))
		var/turf/location = get_turf(src)
		if(seed && (user.used_intent.blade_class == BCLASS_BLUNT) && (!user.used_intent.noaa))
			playsound(src,'sound/items/seedextract.ogg', 100, FALSE)
			if(prob(5))
				user.visible_message(span_warning("[user] не удалось извлечь семена."))
				qdel(src)
				return
			user.visible_message(span_info("[user] извлекает семена."))
			new seed(location)
			if(prob(90))
				new seed(location)
			if(prob(23))
				new seed(location)
			if(prob(6))
				new seed(location)
			qdel(src)
			return
		else
			return ..()
	return ..()

/obj/item/reagent_containers/food/snacks/grown/wheat
	seed = /obj/item/seeds/wheat
	name = "зерно пшеницы"
	desc = "Ударьте чем-нибудь твердым, чтобы получить семена. Перетрите на мельнице, чтобы сделать муку."
	icon = 'icons/roguetown/items/produce.dmi'
	icon_state = "wheat"
	gender = PLURAL
	filling_color = "#F0E68C"
	bitesize_mod = 2
	foodtype = GRAIN
	tastes = list("сырая пшеница" = 1)
	can_distill = TRUE
	distill_reagent = /datum/reagent/consumable/ethanol/beer
	distill_amt = 48
	grind_results = list(/datum/reagent/floure = 10)
	mill_result = /obj/item/reagent_containers/powder/flour

/obj/item/reagent_containers/food/snacks/grown/oat
	seed = /obj/item/seeds/wheat/oat
	name = "зерно овса"
	desc = "Ударьте чем-нибудь твердым, чтобы получить семена. Перетрите на мельнице, чтобы сделать муку."
	icon = 'icons/roguetown/items/produce.dmi'
	icon_state = "oat"
	gender = PLURAL
	filling_color = "#556B2F"
	bitesize_mod = 2
	foodtype = GRAIN
	tastes = list("сырой овес" = 1)
	can_distill = TRUE
	distill_reagent = /datum/reagent/consumable/ethanol/ale
	distill_amt = 24
	grind_results = list(/datum/reagent/floure = 10)
	mill_result = /obj/item/reagent_containers/powder/flour

/obj/item/reagent_containers/food/snacks/grown/rice
	seed = /obj/item/seeds/rice
	name = "зерна риса"
	desc = "Белые злаки, которые прибрежные жители перебраживают в отличную рисовую водку."
	icon = 'icons/roguetown/items/produce.dmi'
	icon_state = "rice"
	gender = PLURAL
	filling_color = "#f0f0f0"
	bitesize_mod = 2
	foodtype = GRAIN
	tastes = list("сырой рис" = 1)
	can_distill = TRUE
	distill_reagent = /datum/reagent/consumable/ethanol/sake
	distill_amt = 12
	grind_results = list(/datum/reagent/floure = 10)

/obj/item/reagent_containers/food/snacks/grown/apple
	seed = /obj/item/seeds/apple
	name = "яблоко"
	desc = "Яблоко в дэй - проживешь без лекарей. Годится в сидр и в начинку для сладких пирогов."
	icon_state = "apple"
	filling_color = "#FF4500"
	bitesize = 3
	foodtype = FRUIT
	tastes = list("apple" = 1)
	trash = /obj/item/trash/applecore
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/64x64/head.dmi'
	slot_flags = ITEM_SLOT_HEAD
	worn_x_dimension = 64
	list_reagents = list(/datum/reagent/consumable/nutriment = 3)
	worn_y_dimension = 64
	rotprocess = 20 MINUTES
	can_distill = TRUE
	distill_reagent = /datum/reagent/consumable/ethanol/beer/cider
	var/equippedloc = null
	var/list/bitten_names = list()

/obj/item/reagent_containers/food/snacks/grown/apple/On_Consume(mob/living/eater)
	..()
	if(ishuman(eater))
		var/mob/living/carbon/human/H = eater
		if(!(H.real_name in bitten_names))
			bitten_names += H.real_name

/obj/item/reagent_containers/food/snacks/grown/apple/blockproj(mob/living/carbon/human/H)
	testing("APPLEHITBEGIN")
	if(prob(98))
		H.visible_message(span_notice("Яблоко слетает с головы [H], приняв удар на себя!"))
		H.dropItemToGround(H.head)
		return 1
	else
		H.dropItemToGround(H.head)
		return 0

/obj/item/reagent_containers/food/snacks/grown/apple/equipped(mob/M)
	..()
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(H.head == src)
			testing("equipped applz")
			equippedloc = H.loc
			START_PROCESSING(SSobj, src)

/obj/item/reagent_containers/food/snacks/grown/apple/process()
	. = ..()
	if(ishuman(loc))
		var/mob/living/carbon/human/H = loc
		if(H.head == src)
			if(equippedloc != H.loc)
				H.dropItemToGround(H.head)

/obj/item/reagent_containers/food/snacks/grown/berries/rogue
	seed = /obj/item/seeds/berryrogue
	name = "ягода"
	desc = "Гроздь очень аппетитно выглядящих ягод. Интересно, каковы они на вкус?"
	icon_state = "berries"
	tastes = list("ягода" = 1)
	bitesize = 5
	list_reagents = list(/datum/reagent/consumable/nutriment = 3)
	dropshrink = 0.75
	var/color_index = "good"
	can_distill = TRUE
	distill_reagent = /datum/reagent/consumable/ethanol/beer/wine
	rotprocess = 15 MINUTES
	mill_result = /obj/item/reagent_containers/powder/alch/berry

/obj/item/reagent_containers/food/snacks/grown/berries/rogue/Initialize()
	if(GLOB.berrycolors[color_index])
		filling_color = GLOB.berrycolors[color_index]
	else
		var/newcolor = pick(BERRYCOLORS)
		if(newcolor in GLOB.berrycolors)
			GLOB.berrycolors[color_index] = pick(BERRYCOLORS)
		else
			GLOB.berrycolors[color_index] = newcolor
		filling_color = GLOB.berrycolors[color_index]
	. = ..()
	update_icon()

/obj/item/reagent_containers/food/snacks/grown/berries/rogue/On_Consume(mob/living/eater)
	..()
	update_icon()

/obj/item/reagent_containers/food/snacks/grown/berries/rogue/update_icon()
	cut_overlays()
	var/used_state = "berriesc5"
	if(bitecount == 1)
		used_state = "berriesc4"
	if(bitecount == 2)
		used_state = "berriesc3"
	if(bitecount == 3)
		used_state = "berriesc2"
	if(bitecount == 4)
		used_state = "berriesc1"
	var/image/item_overlay = image(icon, used_state)
	item_overlay.color = filling_color
	add_overlay(item_overlay)

/obj/item/reagent_containers/food/snacks/grown/berries/rogue/poison
	seed = /obj/item/seeds/berryrogue/poison
	icon_state = "berries"
	tastes = list("ягода" = 1)
	list_reagents = list(/datum/reagent/berrypoison = 5, /datum/reagent/consumable/nutriment = 3)
	grind_results = list(/datum/reagent/berrypoison = 5)
	color_index = "bad"
	mill_result = /obj/item/reagent_containers/powder/alch/berryp

/obj/item/reagent_containers/food/snacks/grown/rogue/sweetleaf
	seed = /obj/item/seeds/sweetleaf
	name = "болотная трава"
	desc = "Трава, при курении выделяющая кислый и туманистый дым. Известна своими очищающими свойствами."
	icon_state = "sweetleaf"
	filling_color = "#008000"
	bitesize_mod = 1
	foodtype = VEGETABLES
	list_reagents = list(/datum/reagent/consumable/nutriment = 1, /datum/reagent/berrypoison = 5)
	tastes = list("сладость" = 1, "горечь" = 1)
	eat_effect = /datum/status_effect/debuff/badmeal
	rotprocess = 60 MINUTES

/obj/item/reagent_containers/food/snacks/grown/rogue/pipeweed
	seed = /obj/item/seeds/pipeweed
	name = "лист табака"
	desc = "Используется повсеместно как отличное курительное растение."
	icon_state = "pipeweed"
	filling_color = "#008000"
	bitesize_mod = 1
	foodtype = VEGETABLES
	tastes = list("сладость" = 1, "горечь" = 1)
	list_reagents = list(/datum/reagent/drug/nicotine = 2, /datum/reagent/consumable/nutriment = 1, /datum/reagent/berrypoison = 5)
	grind_results = list(/datum/reagent/drug/nicotine = 5)
	eat_effect = /datum/status_effect/debuff/badmeal
	rotprocess = 60 MINUTES

/obj/item/reagent_containers/food/snacks/grown/rogue/pipeweeddry
	seed = null
	name = "лист табака"
	desc = "Высушенный лист, пригодный для заполнения трубки."
	icon_state = "pipeweedd"
	dry = TRUE
	pipe_reagents = list(/datum/reagent/drug/nicotine = 30)
	eat_effect = /datum/status_effect/debuff/badmeal
	list_reagents = list(/datum/reagent/drug/nicotine = 5, /datum/reagent/consumable/nutriment = 1)
	grind_results = list(/datum/reagent/drug/nicotine = 10)
	mill_result = /obj/item/reagent_containers/powder/alch/pipe

/obj/item/reagent_containers/food/snacks/grown/rogue/sweetleafdry
	seed = null
	name = "болотная трава"
	desc = "Высушенные стебли болотной травы, пригодные для алхимиии или же курения."
	icon_state = "sweetleafd"
	dry = TRUE
	pipe_reagents = list(/datum/reagent/drug/space_drugs = 30)
	list_reagents = list(/datum/reagent/drug/space_drugs = 2,/datum/reagent/consumable/nutriment = 1)
	grind_results = list(/datum/reagent/drug/space_drugs = 5)
	eat_effect = /datum/status_effect/debuff/badmeal
	mill_result = /obj/item/reagent_containers/powder/alch/swamp

/obj/item/reagent_containers/food/snacks/grown/cabbage
	name = "капуста"
	desc = "Плотный кочан, пригодный в пищу и даже не поеденный вредителями."
	seed = /obj/item/seeds/cabbage
	icon_state = "cabbage"
	tastes = list("капуста" = 1)
	filling_color = "#88c8a0"
	bitesize = 3
	foodtype = VEGETABLES
	rotprocess = 15 MINUTES
	list_reagents = list(/datum/reagent/consumable/nutriment = 2)

/obj/item/reagent_containers/food/snacks/grown/pear
	name = "груша"
	desc = "Изысканный плод, из которого делают лучшие сидры во всей Гримории."
	seed = /obj/item/seeds/pear
	icon_state = "pear"
	tastes = list("груша" = 1)
	filling_color = "#9ff35f"
	bitesize = 3
	foodtype = FRUIT
	rotprocess = 20 MINUTES
	list_reagents = list(/datum/reagent/consumable/nutriment = 3)
	trash = /obj/item/trash/pearcore
	can_distill = TRUE
	distill_reagent = /datum/reagent/consumable/ethanol/beer/cider

/obj/item/reagent_containers/food/snacks/grown/cherry
	name = "вишня"
	desc = "Сладкая заморская ягода, из которой готовят изысканные десерты."
	seed = /obj/item/seeds/cherry
	icon_state = "cherry"
	tastes = list("вишня" = 1)
	filling_color = "#b90019"
	bitesize = 3
	foodtype = FRUIT
	rotprocess = 20 MINUTES
	list_reagents = list(/datum/reagent/consumable/nutriment = 3)
	grind_results = list(/datum/reagent/consumable/cherryjelly = 3)

/obj/item/reagent_containers/food/snacks/grown/olive
	name = "оливка"
	desc = "Чуть горьковатый маслянистый плод с косточкой."
	seed = /obj/item/seeds/olive
	icon_state = "olive"
	tastes = list("оливка" = 1)
	filling_color = "#a4c74b"
	bitesize = 3
	foodtype = FRUIT
	rotprocess = 20 MINUTES
	list_reagents = list(/datum/reagent/consumable/nutriment = 2)

/obj/item/reagent_containers/food/snacks/grown/nut
	name = "скальный орех"
	desc = "Твердый, как камень, даже без скорлупы."
	seed = /obj/item/seeds/nut
	icon_state = "nut"
	tastes = list("орешек" = 1)
	filling_color = "#6b4d18"
	bitesize = 3
	foodtype = FRUIT
	list_reagents = list(/datum/reagent/consumable/nutriment = 4)

/obj/item/reagent_containers/food/snacks/grown/tomato
	name = "томат"
	desc = "Свежий, мягкий и очень сочный."
	seed = /obj/item/seeds/tomato
	icon_state = "tomato"
	tastes = list("томат" = 1)
	filling_color = "#e4532b"
	bitesize = 3
	foodtype = FRUIT
	rotprocess = 20 MINUTES
	list_reagents = list(/datum/reagent/consumable/nutriment = 2, /datum/reagent/consumable/tomatojuice = 3)
	grind_results = list(/datum/reagent/consumable/tomatojuice = 6)
	slices_num = 5
	slice_batch = TRUE
	//slice_path = /obj/item/reagent_containers/food/snacks/rogue/tomatoslice

/obj/item/reagent_containers/food/snacks/grown/onion
	name = "репчатый лук"
	desc = "Он заставит вас плакать по-другому."
	seed = /obj/item/seeds/onion
	icon_state = "onion"
	tastes = list("лук" = 1)
	filling_color = "#fdfaca"
	bitesize = 3
	foodtype = VEGETABLES
	list_reagents = list(/datum/reagent/consumable/nutriment = 2, /datum/reagent/consumable/tearjuice = 3)
	grind_results = list(/datum/reagent/consumable/tearjuice = 6)
	slices_num = 5
	slice_batch = TRUE
	//slice_path = /obj/item/reagent_containers/food/snacks/rogue/onionslice

/obj/item/reagent_containers/food/snacks/grown/garlic
	name = "чеснок"
	desc = "Последнее средство защиты от орды вампиров."
	seed = /obj/item/seeds/garlic
	icon_state = "garlic"
	tastes = list("чеснок" = 1)
	filling_color = "#fff2c6"
	bitesize = 3
	foodtype = VEGETABLES
	list_reagents = list(/datum/reagent/consumable/nutriment = 2, /datum/reagent/consumable/garlic = 3)
	grind_results = list(/datum/reagent/consumable/garlic = 6)

/obj/item/reagent_containers/food/snacks/grown/carrot
	name = "морковь"
	desc = "Полезна для глаз, даже если остался только один."
	seed = /obj/item/seeds/carrot
	icon_state = "carrot"
	tastes = list("морковь" = 1)
	filling_color = "#d57916"
	bitesize = 3
	foodtype = VEGETABLES
	rotprocess = 40 MINUTES
	list_reagents = list(/datum/reagent/consumable/nutriment = 2, /datum/reagent/medicine/oculine = 1)
	grind_results = list(/datum/reagent/medicine/oculine = 3)

/obj/item/reagent_containers/food/snacks/grown/potato
	name = "картофель"
	desc = "Вкусно и сытно накормит как голодных горожан, так и отдыхающую знать."
	seed = /obj/item/seeds/potato
	icon_state = "potato"
	tastes = list("картофель" = 1)
	filling_color = "#d8d8b6"
	bitesize = 3
	foodtype = VEGETABLES
	rotprocess = 50 MINUTES
	list_reagents = list(/datum/reagent/consumable/nutriment = 3)
	can_distill = TRUE
	distill_reagent = /datum/reagent/consumable/ethanol/vodka
	distill_amt = 12

/obj/item/reagent_containers/food/snacks/grown/eggplant
	name = "баклажан"
	desc = "Это вам не кабачок."
	seed = /obj/item/seeds/eggplant
	icon_state = "eggplant"
	tastes = list("баклажан" = 1)
	filling_color = "#b6ab70"
	bitesize = 3
	foodtype = FRUIT
	rotprocess = 20 MINUTES
	list_reagents = list(/datum/reagent/consumable/nutriment = 3)

/obj/item/reagent_containers/food/snacks/grown/bean
	name = "фасоль"
	desc = "Из неё получается густой и наваристый суп."
	seed = /obj/item/seeds/bean
	icon_state = "bean"
	tastes = list("фасоль" = 1)
	filling_color = "#4b360e"
	bitesize = 3
	foodtype = FRUIT
	rotprocess = 50 MINUTES
	list_reagents = list(/datum/reagent/consumable/nutriment = 3)

/obj/item/reagent_containers/food/snacks/grown/radish
	seed = /obj/item/seeds/radish
	name = "редька"
	desc = "Используется в пищу и в народной медицине. Горькая на вкус."
	icon_state = "radish"
	filling_color = "#d4689e"
	bitesize = 3
	foodtype = VEGETABLES
	tastes = list("radish" = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = 2)
	rotprocess = 15 MINUTES

/obj/item/reagent_containers/food/snacks/grown/beet
	seed = /obj/item/seeds/beet
	name = "сахарная свекла"
	desc = "Повара знают, что её можно перетереть в самый настоящий сахар."
	icon_state = "beet"
	filling_color = "#ededed"
	bitesize = 3
	foodtype = VEGETABLES|SUGAR
	tastes = list("sugar" = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = 2, /datum/reagent/consumable/sugar = 3)
	grind_results = list(/datum/reagent/consumable/sugar = 6)
	mill_result = /obj/item/reagent_containers/powder/sugar
	rotprocess = 15 MINUTES

/obj/item/reagent_containers/food/snacks/grown/bellpepper
	seed = /obj/item/seeds/bellpepper
	name = "перец тифлинга"
	desc = "Настолько острый, что передает жар самой Преисподней."
	icon_state = "bellpepper"
	filling_color = "#d13f05"
	bitesize = 3
	foodtype = FRUIT
	tastes = list("адский жар" = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = 2, /datum/reagent/consumable/capsaicin = 3)
	grind_results = list(/datum/reagent/consumable/capsaicin = 6)
	rotprocess = 25 MINUTES

/obj/item/reagent_containers/food/snacks/grown/peas
	seed = /obj/item/seeds/peas
	name = "горох"
	desc = "Зеленый горошек используется крестьянами для загущения их стряпни."
	icon_state = "peas"
	filling_color = "#6ba432"
	bitesize = 3
	foodtype = FRUIT
	tastes = list("кашица" = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = 2)
	rotprocess = 25 MINUTES

/obj/item/reagent_containers/food/snacks/grown/cucumber
	seed = /obj/item/seeds/cucumber
	name = "огурец"
	desc = "Длинный и продолговатый овощ."
	icon_state = "cucumber"
	filling_color = "#c2daab"
	bitesize = 3
	foodtype = FRUIT
	tastes = list("огурец" = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = 3)
	rotprocess = 20 MINUTES
	fishloot = list(/obj/item/reagent_containers/food/snacks/fish/shrimp = 10)

/obj/item/reagent_containers/food/snacks/grown/tea
	seed = /obj/item/seeds/tea
	name = "чайный лист"
	desc = "На материке дворяне любят пить напиток из заваренных в кипятке чайных листьев."
	icon_state = "tea"
	filling_color = "#19300f"
	bitesize = 5
	foodtype = null
	tastes = list("горечь" = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = 2, /datum/reagent/toxin/teapowder = 3)
	grind_results = list(/datum/reagent/toxin/teapowder = 6)
	rotprocess = 20 MINUTES

/obj/item/reagent_containers/food/snacks/grown/plumphelmet
	seed = /obj/item/seeds/mycelium/plumphelmet
	name = "толстошляпник"
	desc = "Гриб с мясистой шляпкой, который горцы используют для приготовления особого вина."
	icon_state = "plumphelmet"
	filling_color = "#d0abda"
	bitesize = 3
	foodtype = VEGETABLES
	tastes = list("высокогорье" = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = 3)
	can_distill = TRUE
	distill_reagent = /datum/reagent/consumable/ethanol/beer/mushroomwine
	rotprocess = 60 MINUTES

/obj/item/reagent_containers/food/snacks/grown/trippy
	seed = /obj/item/seeds/mycelium/trippy
	name = "странный синий гриб"
	desc = "Голова кружится от одного его запаха..."
	icon_state = "trippy"
	filling_color = "#abd4da"
	bitesize = 3
	foodtype = GROSS
	tastes = list("краски" = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/drug/space_drugs = 3)
	grind_results = list(/datum/reagent/drug/space_drugs = 6)

/obj/item/reagent_containers/food/snacks/grown/amanita
	seed = /obj/item/seeds/mycelium/amanita
	name = "странный красный гриб"
	desc = "Яркая шляпка делает его непохожим на остальные грибы."
	icon_state = "amanita"
	filling_color = "#daabab"
	bitesize = 3
	foodtype = GROSS
	tastes = list("немота" = 1)
	list_reagents = list(/datum/reagent/consumable/nutriment = 3, /datum/reagent/toxin/amanitin = 3)
	grind_results = list(/datum/reagent/toxin/amanitin = 6)
