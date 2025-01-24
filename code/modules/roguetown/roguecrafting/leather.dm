
/datum/crafting_recipe/roguetown/hunting
	tools = list(/obj/item/rogueweapon/huntingknife)
	skillcraft = /datum/skill/craft/hunting

//Survival type crafting belongs here!
//It no longer requires a structure

/datum/crafting_recipe/roguetown/hunting/cloak
	name = "кожаный плащ - (2 кожи)"
	result = /obj/item/clothing/cloak/raincloak/brown
	reqs = list(/obj/item/natural/hide/cured = 2)

/datum/crafting_recipe/roguetown/hunting/belt
	name = "кожаный пояс - (1 кожа)"
	result = /obj/item/storage/belt/rogue/leather
	reqs = list(/obj/item/natural/hide/cured = 1)

/datum/crafting_recipe/roguetown/hunting/gloves
	name = "кожаные перчатки - (1 кожа)"
	result = list(/obj/item/clothing/gloves/roguetown/leather)
	reqs = list(/obj/item/natural/hide/cured = 1)

/datum/crafting_recipe/roguetown/hunting/lcollar
	name = "кожаный ошейник - (1 кожа)"
	result = list(/obj/item/clothing/neck/roguetown/collar/leather)
	reqs = list(/obj/item/natural/hide/cured = 1)

/datum/crafting_recipe/roguetown/hunting/lleash
	name = "кожаный поводок - (1 кожа)"
	result = list(/obj/item/leash/leather)
	reqs = list(/obj/item/natural/hide/cured = 1)

/datum/crafting_recipe/roguetown/hunting/bracers
	name = "кожаные наручи - (1 кожа)"
	result = list(/obj/item/clothing/wrists/roguetown/bracers/leather)
	reqs = list(/obj/item/natural/hide/cured = 1)

/datum/crafting_recipe/roguetown/hunting/pants
	name = "кожаные брюки - (2 кожи)"
	result = list(/obj/item/clothing/under/roguetown/trou/leather)
	reqs = list(/obj/item/natural/hide/cured = 2)

/datum/crafting_recipe/roguetown/hunting/boots
	name = "кожаные ботинки - (1 кожа)"
	result = /obj/item/clothing/shoes/roguetown/armor/leather
	reqs = list(/obj/item/natural/hide/cured = 1)

/datum/crafting_recipe/roguetown/hunting/helmet
	name = "кожаный шлем - (1 кожа)"
	result = /obj/item/clothing/head/roguetown/helmet/leather
	reqs = list(/obj/item/natural/hide/cured = 1)

/datum/crafting_recipe/roguetown/hunting/armor
	name = "кожаная броня - (2 кожи)"
	result = /obj/item/clothing/suit/roguetown/armor/leather
	reqs = list(/obj/item/natural/hide/cured = 2)

/datum/crafting_recipe/roguetown/hunting/pouch
	name = "кожаный кошель - (1 кожа)"
	result = list(/obj/item/storage/belt/rogue/pouch)
	reqs = list(/obj/item/natural/hide/cured = 1)
	sellprice = 6

/datum/crafting_recipe/roguetown/hunting/satchel
	name = "кожаная сумка - (2 кожи, 1 волокно)"
	result = list(/obj/item/storage/backpack/rogue/satchel)
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/fibers = 1)
	sellprice = 13

/datum/crafting_recipe/roguetown/hunting/backpack
	name = "кожаный рюкзак - (3 кожи, 1 волокно)"
	result = /obj/item/storage/backpack/rogue/backpack
	reqs = list(/obj/item/natural/hide/cured = 3,
				/obj/item/natural/fibers = 1)
	sellprice = 27

/datum/crafting_recipe/roguetown/hunting/waterskin
	name = "бурдюк для воды - (1 кожа, 2 волокна)"
	result = /obj/item/reagent_containers/glass/bottle/waterskin
	reqs = list(/obj/item/natural/hide/cured = 1,
				/obj/item/natural/fibers = 2)
	sellprice = 15

/datum/crafting_recipe/roguetown/hunting/powderflask
	name = "пороховница - (1 кожа, 2 волокна, 1 пепел)"
	result = /obj/item/powderflask
	reqs = list(/obj/item/natural/hide/cured = 1,
				/obj/item/natural/fibers = 2,
				/datum/reagent/alch/syrum_ash = 15)
	sellprice = 15

/datum/crafting_recipe/roguetown/hunting/quiver
	name = "колчан - (2 кожи, 2 волокна)"
	result = /obj/item/ammo_holder/quiver
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/fibers = 2)
	sellprice = 28

/datum/crafting_recipe/roguetown/hunting/bulletpouch
	name = "мешочек для пуль - (2 кожи, 2 волокна)"
	result = /obj/item/ammo_holder/bullet
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/fibers = 2)
	sellprice = 28

/datum/crafting_recipe/roguetown/hunting/saddle
	name = "седло - (2 кожи)"
	result = /obj/item/natural/saddle
	reqs = list(/obj/item/natural/hide/cured = 2)
	sellprice = 26

/datum/crafting_recipe/roguetown/hunting/whip
	name = "кожаный хлыст - (2 кожи, 1 камень)"
	result = /obj/item/rogueweapon/whip
	reqs = list(/obj/item/natural/hide/cured = 2,/obj/item/natural/stone = 1)
	sellprice = 28

/datum/crafting_recipe/roguetown/hunting/drum
	name = "барабан - (1 кожа, 1 полено)"
	result = /obj/item/rogue/instrument/drum
	reqs = list(/obj/item/natural/hide/cured = 1,/obj/item/grown/log/tree/small = 1)
	sellprice = 5

/datum/crafting_recipe/roguetown/hunting/bedroll
	name = "охотничий спальный мешок - (2 кожи, 2 ткани, 1 веревка)"
	result = /obj/item/bedroll
	reqs = list(/obj/item/natural/hide/cured = 2, /obj/item/natural/cloth = 2, /obj/item/rope = 1)
	sellprice = 50
