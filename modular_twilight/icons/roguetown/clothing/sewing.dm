/datum/crafting_recipe/roguetown/sewing/lowcut_shirt
	name = "топик - (2 ткань, волокно; NOVICE)"
	result = list(/obj/item/clothing/suit/roguetown/shirt/undershirt/lowcut)
	reqs = list(
		/obj/item/natural/cloth = 2,
		/obj/item/natural/fibers = 1,)
	skill_level = 1

/datum/crafting_recipe/roguetown/sewing/shortskirt
	name = "обычная юбка - (2 ткань, 1 волокно; APPRENTICE)"
	result = list(/obj/item/clothing/under/roguetown/shortskirt)
	reqs = list(
		/obj/item/natural/cloth = 2,
		/obj/item/natural/fibers = 1,)
	skill_level = 2

/datum/crafting_recipe/roguetown/sewing/artificer
	name = "рубашка ремесленника - (3 ткань, 2 волокно; JOURNEYMAN)"
	result = list(/obj/item/clothing/suit/roguetown/shirt/undershirt/artificer)
	reqs = list(
		/obj/item/natural/cloth = 3,
		/obj/item/natural/fibers = 2,)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/noblecoat
	name = "элегантное одеяние - (4 ткань, 1 волокно, 3 шёлк; EXPERT)"
	result = list(/obj/item/clothing/suit/roguetown/shirt/tunic/noblecoat)
	reqs = list(
		/obj/item/natural/cloth = 4,
		/obj/item/natural/fibers = 1,
		/obj/item/natural/silk = 3,)
	skill_level = 4

/datum/crafting_recipe/roguetown/sewing/fancyshirt
	name = "элегантная туника - (2 ткань, 1 волокно, 1 шёлк; EXPERT)"
	result = list(/obj/item/clothing/suit/roguetown/shirt/undershirt/fancy)
	reqs = list(
		/obj/item/natural/cloth = 2,
		/obj/item/natural/fibers = 1,
		/obj/item/natural/silk = 1,)
	skill_level = 4

/datum/crafting_recipe/roguetown/sewing/exoticsilkbra
	name = "exotic silk bra - (3 шёлк, 1 золотое кольцо; MASTER)"
	result = list (/obj/item/clothing/suit/roguetown/shirt/exoticsilkbra)
	reqs = list(/obj/item/natural/silk = 3,
				/obj/item/clothing/ring/gold = 1)
	skill_level = 5
	sellprice = 150

/datum/crafting_recipe/roguetown/sewing/exoticsilkmask
	name = "exotic silk mask - (1 шёлк, 1 золотое кольцо; MASTER)"
	result = list (/obj/item/clothing/mask/rogue/exoticsilkmask)
	reqs = list(/obj/item/natural/silk = 1,
				/obj/item/clothing/ring/gold = 1)
	skill_level = 5
	sellprice = 100

/datum/crafting_recipe/roguetown/sewing/exoticsilkbelt
	name = "exotic silk belt - (2 шёлк, 1 золотое кольцо; MASTER)"
	result = list (/obj/item/storage/belt/rogue/leather/exoticsilkbelt)
	reqs = list(/obj/item/natural/silk = 2,
				/obj/item/clothing/ring/gold = 1)
	skill_level = 5
	sellprice = 130

/datum/crafting_recipe/roguetown/sewing/goldanklet
	name = "exotic silk anklets - (2 шёлк, 1 золотое кольцо; MASTER)"
	result = list (/obj/item/clothing/shoes/roguetown/goldanklets)
	reqs = list(/obj/item/natural/silk = 2,
				/obj/item/clothing/ring/gold = 1)
	skill_level = 5
	sellprice = 100
