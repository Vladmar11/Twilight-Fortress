
/// WOOD

/datum/crafting_recipe/roguetown/turfs/wood
	skillcraft = /datum/skill/craft/carpentry
	verbage_simple = "строю"
	verbage = "строит"
	skill_level = 0
/datum/crafting_recipe/roguetown/turfs/wood/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue))
		return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/wood/floor
	name = "грубый деревянный пол - (1 доска)"
	result = /turf/open/floor/rogue/ruinedwood
	reqs = list(/obj/item/natural/wood/plank = 1)

/datum/crafting_recipe/roguetown/turfs/wood/floor
	name = "деревянный пол - (1 доска; УЧЕНИК)"
	result = /turf/open/floor/rogue/wood
	reqs = list(/obj/item/natural/wood/plank = 1)
	skill_level = 2

/datum/crafting_recipe/roguetown/turfs/wood/platform
	name = "деревянный помост - (2 доски; УМЕЛЕЦ)"
	result = /turf/open/floor/rogue/ruinedwood/platform
	reqs = list(/obj/item/natural/wood/plank = 2)
	skill_level = 3

/datum/crafting_recipe/roguetown/turfs/wood/woodplatform/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/transparent/openspace))
		if(!istype(T, /turf/open/water))
			return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/wood/wall
	name = "стена из бревен - (2 полена; УЧЕНИК)"
	result = /turf/closed/wall/mineral/rogue/wood
	reqs = list(/obj/item/grown/log/tree/small = 2)
	skill_level = 2

/datum/crafting_recipe/roguetown/turfs/wood/wall/alt
	name = "стена из досок - (2 доски; УЧЕНИК)"
	reqs = list(/obj/item/natural/wood/plank = 2)

/datum/crafting_recipe/roguetown/turfs/wood/fancy
	name = "украшенная деревянная стена - (2 доски; УМЕЛЕЦ)"
	result = /turf/closed/wall/mineral/rogue/decowood
	reqs = list(/obj/item/natural/wood/plank = 2)
	skill_level = 3

/datum/crafting_recipe/roguetown/turfs/wood/murderhole
	name = "деревянное окно - (2 полена; УЧЕНИК)"
	result = /turf/closed/wall/mineral/rogue/wood/window
	reqs = list(/obj/item/grown/log/tree/small = 2)
	skill_level = 2

/datum/crafting_recipe/roguetown/turfs/wood/murderhole/alt
	reqs = list(/obj/item/natural/wood/plank = 2)



/// STONE

/datum/crafting_recipe/roguetown/turfs/stone
	reqs = list(/obj/item/natural/stoneblock = 1)
	skillcraft = /datum/skill/craft/masonry
	verbage_simple = "строю"
	verbage = "строит"
/datum/crafting_recipe/roguetown/turfs/stone/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue))
		return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/stone/cobblerock
	name = "дорожка из камня - (1 камень)"
	result = /turf/open/floor/rogue/cobblerock
	reqs = list(/obj/item/natural/stone = 1)
	skill_level = 0
/datum/crafting_recipe/roguetown/turfs/stone/cobblerock/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue/dirt))
		return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/stone/cobble
	name = "пол из камня - (1 камень; НОВИЧОК)"
	result = /turf/open/floor/rogue/cobble
	reqs = list(/obj/item/natural/stone = 1)
	skill_level = 1

/datum/crafting_recipe/roguetown/turfs/stone/block
	name = "пол из каменного кирпича - (1 камень; НОВИЧОК)"
	result = /turf/open/floor/rogue/blocks
	skill_level = 1

/datum/crafting_recipe/roguetown/turfs/stone/newstone
	name = "пол из каменной плитки - (1 камень; УЧЕНИК)"
	result = /turf/open/floor/rogue/blocks/newstone/alt
	skill_level = 2

/datum/crafting_recipe/roguetown/turfs/stone/herringbone
	name = "пол из каменного паркета - (1 камень; УМЕЛЕЦ)"
	result = /turf/open/floor/rogue/herringbone
	skill_level = 3

/datum/crafting_recipe/roguetown/turfs/stone/hexstone
	name = "пол из каменных сот - (1 камень; ПРОФЕССИОНАЛ)"
	result = /turf/open/floor/rogue/hexstone
	skill_level = 4

/datum/crafting_recipe/roguetown/turfs/stone/platform
	name = "помост из каменных блоков - (2 каменных блока; УМЕЛЕЦ)"
	result = /turf/open/floor/rogue/blocks/platform
	reqs = list(/obj/item/natural/stoneblock = 2)
	skill_level = 3
/datum/crafting_recipe/roguetown/turfs/stone/platform/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/transparent/openspace))
		if(!istype(T, /turf/open/water))
			return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/stone/wall
	name = "каменная стена - (2 камня; УЧЕНИК)"
	result = /turf/closed/wall/mineral/rogue/stone
	reqs = list(/obj/item/natural/stone = 2)
	skill_level = 2

/datum/crafting_recipe/roguetown/turfs/stone/brick
	name = "кирпичная стена - (2 каменных блока; УМЕЛЕЦ)"
	result = /turf/closed/wall/mineral/rogue/stonebrick
	reqs = list(/obj/item/natural/stoneblock = 2)
	skill_level = 3

/datum/crafting_recipe/roguetown/turfs/stone/decorated
	name = "украшенная каменная стена - (2 каменных блока; УМЕЛЕЦ)"
	result = /turf/closed/wall/mineral/rogue/decostone
	reqs = list(/obj/item/natural/stoneblock = 2)
	skill_level = 3

/datum/crafting_recipe/roguetown/turfs/stone/craft
	name = "стена из каменной кладки - (3 каменных блока; ПРОФЕССИОНАЛ)"
	result = /turf/closed/wall/mineral/rogue/craftstone
	reqs = list(/obj/item/natural/stoneblock = 3)
	skillcraft = /datum/skill/craft/masonry
	verbage_simple = "выкладываю"
	verbage = "выкладывает"
	skill_level = 4

/datum/crafting_recipe/roguetown/turfs/stone/window
	name = "каменное окно - (2 каменных блока; УЧЕНИК)"
	result = /turf/closed/wall/mineral/rogue/stone/window
	reqs = list(/obj/item/natural/stoneblock = 2)
	skill_level = 2


/// TWIG AND TENT

/datum/crafting_recipe/roguetown/turfs/twig
	name = "пол из прутьев - (2 палки)"
	result = /turf/open/floor/rogue/twig
	reqs = list(/obj/item/grown/log/tree/stick = 2)
	skillcraft = /datum/skill/craft/crafting
	verbage_simple = "укладываю"
	verbage = "укладывает"
	skill_level = 0

/datum/crafting_recipe/roguetown/turfs/twig/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue/dirt))
		if(!istype(T, /turf/open/floor/rogue/grass))
			return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/twigplatform
	name = "помост из прутьев - (3 палки, 1 веревка; УЧЕНИК)"
	result = /turf/open/floor/rogue/twig/platform
	reqs = list(/obj/item/grown/log/tree/stick = 3,
				/obj/item/rope = 1)
	skillcraft = /datum/skill/craft/crafting
	verbage_simple = "собираю"
	verbage = "собирает"
	skill_level = 2

/datum/crafting_recipe/roguetown/turfs/twigplatform/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/transparent/openspace))
		return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/tentwall
	name = "стена палатки - (1 палка, 1 ткань; НОВИЧОК)"
	result = /turf/closed/wall/mineral/rogue/tent
	reqs = list(/obj/item/grown/log/tree/stick = 1,
				/obj/item/natural/cloth = 1)
	skillcraft = /datum/skill/craft/crafting
	verbage_simple = "ставлю"
	verbage = "ставит"
	skill_level = 1

/datum/crafting_recipe/roguetown/turfs/tentwall/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue))
		return
	return TRUE

/datum/crafting_recipe/roguetown/turfs/tentdoor
	name = "дверь палатки - (1 палка, 1 ткань)"
	result = /obj/structure/roguetent
	reqs = list(/obj/item/grown/log/tree/stick = 1,
				/obj/item/natural/cloth = 1)
	skillcraft = /datum/skill/craft/crafting
	verbage_simple = "ставлю"
	verbage = "ставит"
	skill_level = 1

/datum/crafting_recipe/roguetown/turfs/tentdoor/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue))
		return
	return ..()


/// DURT
/datum/crafting_recipe/roguetown/turfs/nrich
	name = "участок обогащенной почвы - (1 волокно, 1 пепел, 2 комка грязи; УЧЕНИК)"
	result = /turf/open/floor/rogue/dirt/nrich
	reqs = list(/obj/item/ash = 1,
				/obj/item/natural/fibers = 1,
				/obj/item/natural/dirtclod = 2)
	skillcraft = /datum/skill/labor/farming
	verbage_simple = "создаю"
	verbage = "создает"
	skill_level = 2

/datum/crafting_recipe/roguetown/turfs/nrich/TurfCheck(mob/user, turf/T)
	if(isclosedturf(T))
		return
	if(!istype(T, /turf/open/floor/rogue))
		return
	return TRUE

