// NOVICE//


/datum/crafting_recipe/roguetown/sewing/lowcut_shirt
	name = "топик - (2 ткань, волокно; НОВИЧОК)"
	result = list(/obj/item/clothing/suit/roguetown/shirt/undershirt/lowcut)
	reqs = list(
		/obj/item/natural/cloth = 2,
		/obj/item/natural/fibers = 1,)
	skill_level = 1

/datum/crafting_recipe/roguetown/sewing/dendorrobe
	name = "венок Дендора - (2 волокно, 1 шип; NOVICE)"
	result = list(/obj/item/clothing/head/roguetown/padded/briarthorns)
	reqs = list(/obj/item/natural/thorn = 1, 
				/obj/item/natural/fibers = 2,)
	skill_level = 1

//APPRENTICE//

/datum/crafting_recipe/roguetown/sewing/shortskirt
	name = "обычная юбка - (2 ткань, 1 волокно; УЧЕНИК)"
	result = list(/obj/item/clothing/under/roguetown/shortskirt)
	reqs = list(
		/obj/item/natural/cloth = 2,
		/obj/item/natural/fibers = 1,)
	skill_level = 2

//JOURNEYYMAN//

/datum/crafting_recipe/roguetown/sewing/artificer
	name = "рубашка ремесленника - (3 ткань, 2 волокно; УМЕЛЕЦ)"
	result = list(/obj/item/clothing/suit/roguetown/shirt/undershirt/artificer)
	reqs = list(
		/obj/item/natural/cloth = 3,
		/obj/item/natural/fibers = 2,)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/duelhat
	name = "duelist's hat - (2 кожи, 1 волокно, 1 перо; JOURNEYMAN)"
	result = list(/obj/item/clothing/head/roguetown/duelhat)
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/fibers = 1,
				/obj/item/natural/feather = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/brimmedhat
	name = "brimmed hat - (2 кожи, 1 волокно; JOURNEYMAN)"
	result = list(/obj/item/clothing/head/roguetown/redmoonsosalbrimmed)
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/fibers = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/abyssortemplartabard
	name = "табард рыцаря Абиссора - (3 ткани, 1 волокно; УМЕЛЕЦ)"
	result = list(/obj/item/clothing/cloak/abyssortabard)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/abyssorhood
	name = "капюшон Абиссора - (2 ткани, 1 шелк; УМЕЛЕЦ)"
	result = list(/obj/item/clothing/head/roguetown/roguehood/abyssor)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/silk = 1)
	skill_level = 3
	sellprice = 25

//EXPERT//

/datum/crafting_recipe/roguetown/sewing/abyssorrobe
	name = "одеяние Абиссора - (3 ткани, 1 шелк; ПРОФЕССИОНАЛ)"
	result = list(/obj/item/clothing/suit/roguetown/shirt/robe/abyssor)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/silk = 1)
	skill_level = 4
	sellprice = 25

/datum/crafting_recipe/roguetown/sewing/noblecoat
	name = "элегантное одеяние - (4 ткань, 1 волокно, 3 шёлк; ПРОФЕССИОНАЛ)"
	result = list(/obj/item/clothing/suit/roguetown/shirt/tunic/noblecoat)
	reqs = list(
		/obj/item/natural/cloth = 4,
		/obj/item/natural/fibers = 1,
		/obj/item/natural/silk = 3,)
	skill_level = 4

/datum/crafting_recipe/roguetown/sewing/fancyshirt
	name = "элегантная туника - (2 ткань, 1 волокно, 1 шёлк; ПРОФЕССИОНАЛ)"
	result = list(/obj/item/clothing/suit/roguetown/shirt/undershirt/fancy)
	reqs = list(
		/obj/item/natural/cloth = 2,
		/obj/item/natural/fibers = 1,
		/obj/item/natural/silk = 1,)
	skill_level = 4

//MASTER//

/datum/crafting_recipe/roguetown/sewing/exoticsilkbra
	name = "экзотичный шелковый топ - (3 шёлк, 1 золотое кольцо; МАСТЕР)"
	result = list (/obj/item/clothing/suit/roguetown/shirt/exoticsilkbra)
	reqs = list(/obj/item/natural/silk = 3,
				/obj/item/clothing/ring/gold = 1)
	skill_level = 5
	sellprice = 150

/datum/crafting_recipe/roguetown/sewing/exoticsilkmask
	name = "экзотичная шелковая маска - (1 шёлк, 1 золотое кольцо; МАСТЕР)"
	result = list (/obj/item/clothing/mask/rogue/exoticsilkmask)
	reqs = list(/obj/item/natural/silk = 1,
				/obj/item/clothing/ring/gold = 1)
	skill_level = 5
	sellprice = 100

/datum/crafting_recipe/roguetown/sewing/exoticsilkbelt
	name = "экзотичный шелковый пояс - (2 шёлк, 1 золотое кольцо; МАСТЕР)"
	result = list (/obj/item/storage/belt/rogue/leather/exoticsilkbelt)
	reqs = list(/obj/item/natural/silk = 2,
				/obj/item/clothing/ring/gold = 1)
	skill_level = 5
	sellprice = 130

/datum/crafting_recipe/roguetown/sewing/goldanklet
	name = "экзотичные ножные браслеты - (2 шёлк, 1 золотое кольцо; МАСТЕР)"
	result = list (/obj/item/clothing/shoes/roguetown/goldanklets)
	reqs = list(/obj/item/natural/silk = 2,
				/obj/item/clothing/ring/gold = 1)
	skill_level = 5
	sellprice = 100

