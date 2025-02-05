/datum/subclass/horosha
	name = "Horosha"
	tutorial = "Ваша жизнь - это сплошные лишения и труд, по необходимости или по собственному желанию. Когда вы бежали с Изумы в поисках лучшей жизни,\
                вы осознали, что в этом мире бывают другие способы выжить." 

	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	category_tags = list(CTAG_REFUGEE)

	maximum_possible_slots = 10

	outfit = /datum/outfit/job/roguetown/refugee/horosha


/datum/outfit/job/roguetown/refugee/horosha
	allowed_patrons = list(/datum/patron/divine/abyssor)

/datum/outfit/job/roguetown/refugee/horosha/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_blindness(-3)
	var/classes = list("Bard", "Heimin", "Geisha")
	var/classchoice = input("Choose your archetypes", "Available archetypes") as anything in classes

	switch(classchoice)

		if("Bard")
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/stealing, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/treatment, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/music, 4, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/lockpicking, 1, TRUE)
			head = /obj/item/clothing/head/roguetown/bardhat/bloodhunter
			pants = /obj/item/clothing/under/roguetown/tights/random
			gloves = /obj/item/clothing/gloves/roguetown/fingerless/yugake
			belt = /obj/item/storage/belt/rogue/leather
			armor = /obj/item/clothing/suit/roguetown/shirt/robe/shrinekeeper
			backl = /obj/item/storage/backpack/rogue/satchel
			beltl = /obj/item/ammo_holder/bomb/smokebombs
			beltr = /obj/item/rogueweapon/huntingknife/idagger
			head = /obj/item/clothing/head/roguetown/bardhat //with this hat, they will get all the pussy(or dick depending on preference(or both ig))
			neck = /obj/item/storage/belt/rogue/pouch/coins/poor
			shoes = /obj/item/clothing/shoes/roguetown/boots/jikatabi
			backr = /obj/item/rogue/instrument/shamisen
			H.change_stat("intelligence", 2)
			H.change_stat("perception", 2)
			H.change_stat("speed", 2)
			ADD_TRAIT(H, TRAIT_EMPATH, TRAIT_GENERIC)

		if("Heimin")
			armor = /obj/item/clothing/suit/roguetown/shirt/tunic/kamishimo
			belt = /obj/item/storage/belt/rogue/leather/rope
			beltl = /obj/item/rogueweapon/sickle
			beltr = /obj/item/rogueweapon/stoneaxe/woodcut
			backl = /obj/item/storage/backpack/rogue/backpack
			backpack_contents = list(/obj/item/seeds/wheat = 1, /obj/item/seeds/apple = 1, /obj/item/ash = 2, /obj/item/rogueweapon/handsaw = 1)
			backr = /obj/item/fishingrod
			pants = /obj/item/clothing/under/roguetown/trou/tobi
			shoes = /obj/item/clothing/shoes/roguetown/boots/jikatabi

			H.mind.adjust_skillrank(/datum/skill/combat/axes, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/polearms, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/carpentry, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/masonry, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/labor/farming, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/treatment, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/labor/lumberjacking, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/labor/fishing, 3, TRUE)

			H.change_stat("strength", 1)
			H.change_stat("endurance", 1)
			H.change_stat("constitution", 1)
			H.change_stat("speed", 1)

		if("Geisha")
			H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/stealing, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/riding, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/treatment, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/sewing, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/craft/cooking, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/music, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
			shoes = /obj/item/clothing/shoes/roguetown/sandals/geta
			neck = /obj/item/storage/belt/rogue/pouch/coins/poor
			r_hand = /obj/item/soap/bath
			armor = /obj/item/clothing/suit/roguetown/shirt/robe/bath
			pants =	/obj/item/clothing/under/roguetown/tights/stockings/fishnet/white
			belt =	/obj/item/storage/belt/rogue/leather/cloth
			H.change_stat("constitution", 1)
			H.change_stat("endurance", 3)
			ADD_TRAIT(H, TRAIT_GOODLOVER, TRAIT_GENERIC)

	H.set_blindness(0)
