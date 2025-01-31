
/datum/crafting_recipe/roguetown/structure
	req_table = FALSE
	craftsound = 'sound/foley/Building-01.ogg'

/datum/crafting_recipe/roguetown/structure/TurfCheck(mob/user, turf/T)
	if(istype(T,/turf/open/transparent/openspace))
		return FALSE
	if(istype(T, /turf/open/water))
		return FALSE
	return ..()

/datum/crafting_recipe/roguetown/structure/pillory
	name = "позорный столб - (1 полено, 1 слиток железа; APPRENTICE)"
	result = /obj/structure/pillory/double/custom
	reqs = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/ingot/iron = 1,)
	verbage_simple = "строю"
	verbage = "строит"
	skillcraft = /datum/skill/craft/carpentry
	skill_level = 2

/datum/crafting_recipe/roguetown/structure/handcart
	name = "тележка - (3 полена, 1 веревка)"
	result = /obj/structure/handcart
	reqs = list(/obj/item/grown/log/tree/small = 3,
				/obj/item/rope = 1)
	verbage_simple = "собираю"
	verbage = "собирает"

/datum/crafting_recipe/roguetown/structure/noose
	name = "петля - (1 веревка)"
	result = /obj/structure/noose
	reqs = list(/obj/item/rope = 1)
	verbage = "завязываю"
	craftsound = 'sound/foley/noose_idle.ogg'
	ontile = TRUE

/datum/crafting_recipe/roguetown/structure/noose/TurfCheck(mob/user, turf/T)
	var/turf/checking = get_step_multiz(T, UP)
	if(!checking)
		return FALSE
	if(!isopenturf(checking))
		return FALSE
	if(istype(checking,/turf/open/transparent/openspace))
		return FALSE
	return TRUE

/datum/crafting_recipe/roguetown/structure/psycrss
	name = "деревянный крест - (1 полено, 3 колышка)"
	result = /obj/structure/fluff/psycross/crafted
	reqs = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/grown/log/tree/stake = 3)
	verbage_simple = "устанавливаю"
	verbage = "устанавливает"

/datum/crafting_recipe/roguetown/structure/stonepsycrss
	name = "каменный крест - (2 камня)"
	result = /obj/structure/fluff/psycross
	reqs = list(/obj/item/natural/stone = 2)
	verbage_simple = "устанавливаю"
	verbage = "устанавливает"

/datum/crafting_recipe/roguetown/structure/swing_door
	name = "распашная дверь - (2 полена; NOVICE)"
	result = /obj/structure/mineral_door/swing_door
	reqs = list(/obj/item/grown/log/tree/small = 2)
	verbage_simple = "устанавливаю"
	verbage = "устанавливает"
	skillcraft = /datum/skill/craft/carpentry

/datum/crafting_recipe/roguetown/structure/door
	name = "деревянная дверь - (2 полена; NOVICE)"
	result = /obj/structure/mineral_door/wood
	reqs = list(/obj/item/grown/log/tree/small = 2)
	verbage_simple = "устанавливаю"
	verbage = "устанавливает"
	skillcraft = /datum/skill/craft/carpentry

/datum/crafting_recipe/roguetown/structure/stonedoor
	name = "каменная дверь - (2 камня; NOVICE)"
	result = /obj/structure/mineral_door/wood/donjon/stone
	reqs = list(/obj/item/natural/stone = 2)
	verbage_simple = "строю"
	verbage = "строит"
	skillcraft = /datum/skill/craft/masonry

/datum/crafting_recipe/roguetown/structure/doorbolt
	name = "дверь c засовом - (2 полена, 1 палка; APPRENTICE)"
	result = /obj/structure/mineral_door/wood/deadbolt
	reqs = list(/obj/item/grown/log/tree/small = 2,
				/obj/item/grown/log/tree/stick = 1)
	verbage_simple = "устанавливаю"
	verbage = "устанавливает"
	skillcraft = /datum/skill/craft/carpentry
	skill_level = 2

/datum/crafting_recipe/roguetown/structure/fancydoor
	name = "изысканная дверь - (2 полена; JOURNEYMAN)"
	result = /obj/structure/mineral_door/wood/fancywood
	reqs = list(/obj/item/grown/log/tree/small = 2)
	verbage_simple = "устанавливаю"
	verbage = "устанавливает"
	skillcraft = /datum/skill/craft/carpentry
	skill_level = 3

/datum/crafting_recipe/roguetown/structure/barrel
	name = "деревянная бочка - (1 полено; NOVICE)"
	result = /obj/structure/fermenting_barrel/crafted
	reqs = list(/obj/item/grown/log/tree/small = 1)
	verbage_simple = "собираю"
	verbage = "собирает"
	skillcraft = /datum/skill/craft/carpentry

/obj/structure/fermenting_barrel/crafted
	sellprice = 6

/datum/crafting_recipe/roguetown/roguebin
	name = "деревянная бадья - (2 полена)"
	result = /obj/item/roguebin
	reqs = list(/obj/item/grown/log/tree/small = 2)
	verbage_simple = "собираю"
	verbage = "собирает"
	skillcraft = /datum/skill/craft/carpentry
	skill_level = 0

/datum/crafting_recipe/roguetown/structure/chair
	name = "стул из дерева - (1 полено; NOVICE)"
	result = /obj/item/chair/rogue/crafted
	reqs = list(/obj/item/grown/log/tree/small = 1)
	verbage_simple = "собираю"
	verbage = "собирает"
	skillcraft = /datum/skill/craft/carpentry

/obj/item/chair/rogue/crafted
	sellprice = 6

/datum/crafting_recipe/roguetown/structure/fancychair
	name = "роскошный стул - (1 полено, 1 шелк; NOVICE)"
	result = /obj/item/chair/rogue/fancy/crafted
	reqs = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/natural/silk = 1)
	verbage_simple = "собираю"
	verbage = "собирает"
	skillcraft = /datum/skill/craft/carpentry

/obj/item/chair/rogue/fancy/crafted
	sellprice = 12

/datum/crafting_recipe/roguetown/structure/stool
	name = "табурет из дерева - (1 полено; NOVICE)"
	result = /obj/item/chair/stool/bar/rogue/crafted
	reqs = list(/obj/item/grown/log/tree/small = 1)
	skillcraft = /datum/skill/craft/carpentry
	verbage_simple = "собираю"
	verbage = "собирает"

/obj/item/chair/stool/bar/rogue/crafted
	sellprice = 6

/datum/crafting_recipe/roguetown/structure/anvil
	name = "наковальня - (1 слиток железа; NOVICE)"
	result = /obj/machinery/anvil
	reqs = list(/obj/item/ingot/iron = 1)
	skillcraft = /datum/skill/craft/blacksmithing
	verbage_simple = "кую"
	verbage = "кует"

/datum/crafting_recipe/roguetown/structure/smelter
	name = "каменная плавильня - (4 камня, 1 уголь)"
	result = /obj/machinery/light/rogue/smelter
	reqs = list(/obj/item/natural/stone = 4,
			/obj/item/rogueore/coal = 1)
	verbage_simple = "строю"
	verbage = "строит"
	craftsound = null

/datum/crafting_recipe/roguetown/structure/greatsmelter
	name = "большая плавильня - (1 Загадка Стали, 2 слитка железа, 1 уголь; APPRENTICE)"
	result = /obj/machinery/light/rogue/smelter/great
	reqs = list(/obj/item/ingot/iron = 2,
				/obj/item/riddleofsteel = 1,
				/obj/item/rogueore/coal = 1)
	verbage_simple = "строю"
	verbage = "строит"
	craftsound = null
	skill_level = 2

/datum/crafting_recipe/roguetown/structure/forge
	name = "каменный горн - (4 камня, 1 уголь)"
	result = /obj/machinery/light/rogue/forge
	reqs = list(/obj/item/natural/stone = 4,
				/obj/item/rogueore/coal = 1)
	verbage_simple = "строю"
	verbage = "строит"
	craftsound = null

/datum/crafting_recipe/roguetown/structure/treatingfurnace
	name = "печь для термообработки - (4 камня, 2 слитка железа, 1 уголь; APPRENTICE)"
	result = /obj/structure/treating_furnace
	reqs = list(/obj/item/natural/stone = 4,
				/obj/item/ingot/steel = 2,
				/obj/item/rogueore/coal = 1)
	verbage_simple = "строю"
	verbage = "строит"
	craftsound = null
	skillcraft = /datum/skill/craft/blacksmithing
	skill_level = 2

/datum/crafting_recipe/roguetown/structure/sharpwheel
	name = "точильный круг - (1 слиток железа, 1 камень; NOVICE)"
	result = /obj/structure/fluff/grindwheel
	reqs = list(/obj/item/ingot/iron = 1,
				/obj/item/natural/stone = 1)
	skillcraft = /datum/skill/craft/blacksmithing
	verbage_simple = "строю"
	verbage = "строит"
	craftsound = null

/datum/crafting_recipe/roguetown/structure/art_table
	name = "стол изобретателя - (1 доска; NOVICE)"
	result = /obj/machinery/artificer_table
	reqs = list(/obj/item/natural/wood/plank = 1)
	skillcraft = /datum/skill/craft/engineering
	verbage_simple = "создаю"
	verbage = "создает"

/datum/crafting_recipe/roguetown/structure/loom
	name = "ткацкий станок - (2 полена, 2 палки, 2 волокна; APPRENTICE)"
	result = /obj/machinery/loom
	reqs = list(/obj/item/grown/log/tree/small = 2,
				/obj/item/grown/log/tree/stick = 2,
				/obj/item/natural/fibers = 2)
	verbage_simple = "собираю"
	verbage = "собирает"
	skill_level = 2

/datum/crafting_recipe/roguetown/structure/dye_bin
	name = "красильная бочка - (1 полено)"
	result = /obj/structure/dye_bin
	reqs = list(
		/obj/item/grown/log/tree/small = 1,
	)
	verbage_simple = "делаю"
	verbage = "делает"
	skill_level = 0
/*
/datum/crafting_recipe/roguetown/structure/stairs
	name = "stairs (up)"
	result = /obj/structure/stairs
	reqs = list(/obj/item/grown/log/tree/small = 1)

	verbage = "constructs"
	craftsound = 'sound/foley/Building-01.ogg'
	ontile = TRUE

/datum/crafting_recipe/roguetown/structure/stairs/TurfCheck(mob/user, turf/T)
	var/turf/checking = get_step_multiz(T, UP)
	if(!checking)
		return FALSE
	if(!istype(checking,/turf/open/transparent/openspace))
		return FALSE
	checking = get_step(checking, user.dir)
	if(!checking)
		return FALSE
	if(!isopenturf(checking))
		return FALSE
	if(istype(checking,/turf/open/transparent/openspace))
		return FALSE
	for(var/obj/structure/S in checking)
		if(istype(S, /obj/structure/stairs))
			return FALSE
		if(S.density)
			return FALSE
	return TRUE
*/
/datum/crafting_recipe/roguetown/structure/stairsd
	name = "ступени из дерева (вниз) - (2 полена; APPRENTICE)"
	result = /obj/structure/stairs/d
	reqs = list(/obj/item/grown/log/tree/small = 2)
	skillcraft = /datum/skill/craft/carpentry
	skill_level = 2
	verbage_simple = "строю"
	verbage = "строит"
	ontile = TRUE

/datum/crafting_recipe/roguetown/structure/stairsd/TurfCheck(mob/user, turf/T)
	var/turf/checking = get_step(T, user.dir)
	if(!checking)
		return FALSE
	if(!istype(checking,/turf/open/transparent/openspace))
		return FALSE
	checking = get_step_multiz(checking, DOWN)
	if(!checking)
		return FALSE
	if(!isopenturf(checking))
		return FALSE
	if(istype(checking,/turf/open/transparent/openspace))
		return FALSE
	for(var/obj/structure/S in checking)
		if(istype(S, /obj/structure/stairs))
			return FALSE
		if(S.density)
			return FALSE
	return TRUE

/datum/crafting_recipe/roguetown/structure/stonestairsd
	name = "ступени из камня (вниз) - (2 камня; APPRENTICE)"
	result = /obj/structure/stairs/stone/d
	reqs = list(/obj/item/natural/stone = 2)
	skillcraft = /datum/skill/craft/masonry
	skill_level = 2
	verbage_simple = "строю"
	verbage = "строит"
	ontile = TRUE

/datum/crafting_recipe/roguetown/structure/stonestairsd/TurfCheck(mob/user, turf/T)
	var/turf/checking = get_step(T, user.dir)
	if(!checking)
		return FALSE
	if(!istype(checking,/turf/open/transparent/openspace))
		return FALSE
	checking = get_step_multiz(checking, DOWN)
	if(!checking)
		return FALSE
	if(!isopenturf(checking))
		return FALSE
	if(istype(checking,/turf/open/transparent/openspace))
		return FALSE
	for(var/obj/structure/S in checking)
		if(istype(S, /obj/structure/stairs))
			return FALSE
		if(S.density)
			return FALSE
	return TRUE

/datum/crafting_recipe/roguetown/structure/railing
	name = "перила - (2 палки; NOVICE)"
	result = /obj/structure/fluff/railing/wood
	reqs = list(/obj/item/grown/log/tree/stick = 2)
	ontile = TRUE
	verbage_simple = "строю"
	verbage = "строит"
	skillcraft = /datum/skill/craft/carpentry
	buildsame = TRUE

/datum/crafting_recipe/roguetown/structure/fence
	name = "частокол - (2 колышка)"
	result = /obj/structure/fluff/railing/fence
	reqs = list(/obj/item/grown/log/tree/stake = 2)
	ontile = TRUE
	verbage_simple = "ставлю"
	verbage = "ставит"
	buildsame = TRUE

/datum/crafting_recipe/roguetown/structure/headstake
	name = "голова на колу - (1 голова, 1 кол)"
	result = /obj/structure/fluff/headstake	
	reqs = list(/obj/item/grown/log/tree/stake = 1,
				/obj/item/bodypart/head = 1)
	parts = list(/obj/item/bodypart/head = 1,
			/obj/item/grown/log/tree/stake = 1)
	verbage_simple = "ставлю"
	verbage = "ставит"
	skill_level = 0
	

/datum/crafting_recipe/roguetown/structure/fencealt
	name = "частокол - (1 полено)"
	result = list(/obj/structure/fluff/railing/fence,
				/obj/item/grown/log/tree/stick)
	reqs = list(/obj/item/grown/log/tree/small = 1)
	ontile = TRUE
	verbage_simple = "ставлю"
	verbage = "ставит"
	buildsame = TRUE

/datum/crafting_recipe/roguetown/structure/rack
	name = "стойка - (3 палки)"
	result = /obj/structure/rack/rogue
	reqs = list(/obj/item/grown/log/tree/stick = 3)
	verbage_simple = "собираю"
	verbage = "собирает"
	skill_level = 0

/datum/crafting_recipe/roguetown/structure/chest
	name = "сундук - (1 полено, 1 палка)"
	result = /obj/structure/closet/crate/chest/crafted
	reqs = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/grown/log/tree/stick = 1)
	verbage_simple = "собираю"
	verbage = "собирает"
	skillcraft = /datum/skill/craft/carpentry
	skill_level = 0

/obj/structure/closet/crate/chest/crafted
	keylock = FALSE
	sellprice = 6

/datum/crafting_recipe/roguetown/structure/closet
	name = "шкаф - (2 полена)"
	result = /obj/structure/closet/crate/roguecloset
	reqs = list(/obj/item/grown/log/tree/small = 2)
	verbage_simple = "собираю"
	verbage = "собирает"
	skillcraft = /datum/skill/craft/carpentry

/datum/crafting_recipe/roguetown/structure/coffin
	name = "деревянный гроб - (2 полена; NOVICE)"
	result = /obj/structure/closet/crate/coffin
	reqs = list(/obj/item/grown/log/tree/small = 2)
	verbage_simple = "сколачиваю"
	verbage = "сколачивает"
	skillcraft = /datum/skill/craft/carpentry
	skill_level = 1

/obj/structure/closet/crate/roguecloset/crafted
	sellprice = 6

/datum/crafting_recipe/roguetown/structure/campfire
	name = "костер - (2 палки)"
	result = /obj/machinery/light/rogue/campfire
	reqs = list(/obj/item/grown/log/tree/stick = 2)
	verbage_simple = "строю"
	verbage = "строит"
	skill_level = 0

/datum/crafting_recipe/roguetown/structure/densefire
	name = "большой костер - (2 палки, 2 камня)"
	result = /obj/machinery/light/rogue/campfire/densefire
	reqs = list(/obj/item/grown/log/tree/stick = 2,
				/obj/item/natural/stone = 2)
	verbage_simple = "строю"
	verbage = "строит"

/datum/crafting_recipe/roguetown/structure/cookpit
	name = "очаг - (3 камня, 1 палка)"
	result = /obj/machinery/light/rogue/hearth
	reqs = list(/obj/item/grown/log/tree/stick = 1,
				/obj/item/natural/stone = 3)
	verbage_simple = "строю"
	verbage = "строит"

/datum/crafting_recipe/roguetown/structure/brazier
	name = "жаровня из пня - (1 пень, 1 уголь)"
	result = /obj/machinery/light/rogue/firebowl/stump
	reqs = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/rogueore/coal = 1)
	verbage_simple = "собираю"
	verbage = "собирает"

/datum/crafting_recipe/roguetown/structure/standing
	name = "напольный факел - (1 камень, 1 уголь)"
	result = /obj/machinery/light/rogue/firebowl/standing
	reqs = list(/obj/item/natural/stone = 1,
				/obj/item/rogueore/coal = 1)
	verbage_simple = "собираю"
	verbage = "собирает"

/datum/crafting_recipe/roguetown/structure/oven
	name = "каменная печь - (3 камня, 1 полено; NOVICE)"
	result = /obj/machinery/light/rogue/oven
	reqs = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/natural/stone = 3)
	verbage_simple = "строю"
	verbage = "строит"
	skillcraft = /datum/skill/craft/masonry
	wallcraft = TRUE

/datum/crafting_recipe/roguetown/structure/dryingrack
	name = "сушилка - (3 палки)"
	result = /obj/machinery/tanningrack
	reqs = list(/obj/item/grown/log/tree/stick = 3)
	verbage_simple = "строю"
	verbage = "строит"

/datum/crafting_recipe/roguetown/structure/bed
	name = "кровать - (1 полено, 1 волокно)"
	result = /obj/structure/bed/rogue/shit
	reqs = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/natural/fibers = 1)
	verbage_simple = "собираю"
	verbage = "собирает"

/datum/crafting_recipe/roguetown/structure/nicebed
	name = "хорошая кровать - (2 полена, 1 ткань; APPRENTICE)"
	result = /obj/structure/bed/rogue/inn
	reqs = list(/obj/item/grown/log/tree/small = 2,
				/obj/item/natural/cloth = 1)
	tools = list(/obj/item/needle)
	verbage_simple = "собираю"
	verbage = "собирает"
	skillcraft = /datum/skill/craft/carpentry
	skill_level = 2
	
/datum/crafting_recipe/roguetown/structure/doublebed
	name = "двуспальная кровать - (4 полена, 2 ткани, 1 волокно; JOURNEYMAN)"
	result = /obj/structure/bed/rogue/inn/wooldouble
	reqs = list(/obj/item/grown/log/tree/small = 4,
				/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	tools = list(/obj/item/needle)
	verbage_simple = "собираю"
	verbage = "собирает"
	skillcraft = /datum/skill/craft/carpentry
	skill_level = 3

/datum/crafting_recipe/roguetown/structure/nicedoublebed
	name = "хорошая двуспальная кровать - (4 полена, 2 ткани, 2 шелка; EXPERT)"
	result = /obj/structure/bed/rogue/inn/double
	reqs = list(/obj/item/grown/log/tree/small = 4,
				/obj/item/natural/cloth = 2,
				/obj/item/natural/silk = 2)
	tools = list(/obj/item/needle, /obj/item/rogueweapon/hammer)
	verbage_simple = "собираю"
	verbage = "собирает"
	skillcraft = /datum/skill/craft/carpentry
	skill_level = 4

/datum/crafting_recipe/roguetown/structure/table
	name = "стол из дерева - (1 полено; NOVICE)"
	result = /obj/structure/table/wood/crafted
	reqs = list(/obj/item/grown/log/tree/small = 1)
	verbage_simple = "собираю"
	verbage = "собирает"
	skillcraft = /datum/skill/craft/carpentry

/datum/crafting_recipe/roguetown/structure/stonetable
	name = "стол из камня - (1 камень; NOVICE)"
	result = /obj/structure/table/church
	reqs = list(/obj/item/natural/stone = 1)
	verbage_simple = "строю"
	verbage = "строит"
	skillcraft = /datum/skill/craft/masonry

/datum/crafting_recipe/roguetown/structure/millstone
	name = "ручная мельница - (3 камня)"
	result = /obj/structure/fluff/millstone
	reqs = list(/obj/item/natural/stone = 3)
	verbage_simple = "собираю"
	verbage = "собирает"
	craftsound = null
	wallcraft = TRUE
	skillcraft = /datum/skill/craft/masonry
	skill_level = 0

/datum/crafting_recipe/roguetown/structure/grindstone
	name = "перетирающие жернова - (3 камня, NOVICE)"
	result = /obj/structure/fluff/grindstone
	reqs = list(/obj/item/natural/stone = 3)
	verbage_simple = "собираю"
	verbage = "собирает"
	craftsound = null
	wallcraft = TRUE
	skillcraft = /datum/skill/craft/masonry

/datum/crafting_recipe/roguetown/structure/lever
	name = "рычаг - (1 бронзовая шестерня; NOVICE)"
	result = /obj/structure/lever
	reqs = list(/obj/item/roguegear/bronze = 1)
	verbage_simple = "конструирую"
	verbage = "конструирует"
	skillcraft = /datum/skill/craft/engineering

/datum/crafting_recipe/roguetown/structure/trapdoor
	name = "люк - (1 бронзовая шестерня, 1 полено; APPRENTICE)"
	result = /obj/structure/floordoor
	reqs = list(/obj/item/grown/log/tree/small = 1,
					/obj/item/roguegear/bronze = 1)
	verbage_simple = "конструирует"
	verbage = "конструирую"
	skillcraft = /datum/skill/craft/engineering
	skill_level = 2

/datum/crafting_recipe/roguetown/structure/trapdoor/TurfCheck(mob/user, turf/T)
	if(istype(T,/turf/open/transparent/openspace))
		return TRUE
	if(istype(T,/turf/open/lava))
		return FALSE
	return ..()

/datum/crafting_recipe/roguetown/structure/sign
	name = "табличка - (1 полено; NOVICE)"
	result = /obj/structure/fluff/customsign
	reqs = list(/obj/item/grown/log/tree/small = 1)
	verbage_simple = "собираю"
	verbage = "собирает"
	skillcraft = /datum/skill/craft/carpentry
	skill_level = 1

/datum/crafting_recipe/roguetown/structure/dummy
	name = "тренировочный манекен - (1 полено, 1 палка, 1 волокно; NOVICE)"
	result = /obj/structure/fluff/statue/tdummy
	reqs = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/grown/log/tree/stick = 1,
				/obj/item/natural/fibers = 1)
	verbage_simple = "собираю"
	verbage = "собирает"
	skillcraft = /datum/skill/craft/carpentry
	skill_level = 1

/datum/crafting_recipe/roguetown/structure/display_stand
	name = "витринный стенд - (1 полено, 3 палки; APPRENTICE)"
	result = /obj/structure/mannequin
	reqs = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/grown/log/tree/stick = 3)
	verbage_simple = "собираю"
	verbage = "собирает"
	craftsound = 'sound/foley/Building-01.ogg'
	skillcraft = /datum/skill/craft/carpentry
	skill_level = 2

/datum/crafting_recipe/roguetown/structure/mannequin
	name = "мужской манекен - (1 слиток железа, 1 полено, 1 ткань; APPRENTICE)"
	result = /obj/structure/mannequin/male
	reqs = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/natural/cloth = 1,
				/obj/item/ingot/iron = 1)
	verbage_simple = "собираю"
	verbage = "собирает"
	craftsound = 'sound/foley/Building-01.ogg'
	skillcraft = /datum/skill/craft/carpentry
	skill_level = 2

/datum/crafting_recipe/roguetown/structure/mannequin_f
	name = "женский манекен - (1 слиток железа, 1 полено, 1 ткань; APPRENTICE)"
	result = /obj/structure/mannequin/male/female
	reqs = list(/obj/item/grown/log/tree/small = 1,
				/obj/item/natural/cloth = 1,
				/obj/item/ingot/iron = 1)
	verbage_simple = "собираю"
	verbage = "собирает"
	craftsound = 'sound/foley/Building-01.ogg'
	skillcraft = /datum/skill/craft/carpentry
	skill_level = 2

/datum/crafting_recipe/roguetown/structure/passage
	name = "проходные ворота - (1 слиток железа, 1 бронзовая шестерня; APPRENTICE)"
	result = /obj/structure/bars/passage
	reqs = list(/obj/item/ingot/iron = 1,
					/obj/item/roguegear/bronze = 1)
	verbage_simple = "конструирую"
	verbage = "конструирует"
	skillcraft = /datum/skill/craft/engineering
	skill_level = 2

/datum/crafting_recipe/roguetown/structure/passage/TurfCheck(mob/user, turf/T)
	if(istype(T,/turf/open/transparent/openspace))
		return FALSE
	if(istype(T,/turf/open/lava))
		return FALSE
	if(istype(T,/turf/open/water))
		return FALSE
	return ..()

/datum/crafting_recipe/roguetown/structure/wallladder
	name = "настенная лестница - (1 полено; APPRENTICE)"
	result = /obj/structure/wallladder
	reqs = list(/obj/item/grown/log/tree/small = 1)
	verbage_simple = "строю"
	verbage = "строит"
	skillcraft = /datum/skill/craft/carpentry
	wallcraft = TRUE
	skill_level = 2

/datum/crafting_recipe/roguetown/structure/torchholder
	name = "держатель для факела - (2 камня)"
	result = /obj/machinery/light/rogue/torchholder
	reqs = list(/obj/item/natural/stone = 2)
	verbage_simple = "строю"
	verbage = "строит"
	skillcraft = /datum/skill/craft/masonry
	wallcraft = TRUE
	skill_level = 0

/datum/crafting_recipe/roguetown/structure/wallcandle
	name = "настенные свечи - (1 свеча, 1 камень)"
	result = /obj/machinery/light/rogue/wallfire/candle
	reqs = list(/obj/item/natural/stone = 1, /obj/item/candle/yellow = 1)
	verbage_simple = "ставлю"
	verbage = "ставит"
	skillcraft = /datum/skill/craft/masonry
	wallcraft = TRUE
	skill_level = 0

/datum/crafting_recipe/roguetown/structure/stonewalldeco
	name = "каменная отделка стены - (1 камень; APPRENTICE)"
	result = /obj/structure/fluff/walldeco/stone
	reqs = list(/obj/item/natural/stone = 1)
	verbage_simple = "создаю"
	verbage = "создает"
	skillcraft = /datum/skill/craft/masonry
	wallcraft = TRUE
	skill_level = 2

/datum/crafting_recipe/roguetown/structure/statue
	name = "статуя - (3 камня; JOURNEYMAN)"
	result = /obj/structure/fluff/statue/femalestatue //TODO: Add sculpting
	reqs = list(/obj/item/natural/stone = 3)
	verbage_simple = "создаю"
	verbage = "создает"
	skillcraft = /datum/skill/craft/masonry
	skill_level = 3
