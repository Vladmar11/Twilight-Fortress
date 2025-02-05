/datum/subclass/ronin
	name = "Ronin"
	tutorial = "Вы - ронин, странник и свободный воин из Изумы, потерявший покровительство своего сюзерена, либо не сумевший уберечь его от смерти, \
				но оставшийся верным служению. Только от вас зависит ваша судьба: попробуйте вернуть себе честь, либо присягните новому \
				сюзерену, либо опуститесь еще ниже."

	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	category_tags = list(CTAG_REFUGEE)

	maximum_possible_slots = 10

	outfit = /datum/outfit/job/roguetown/refugee/ronin


/datum/outfit/job/roguetown/refugee/ronin
	allowed_patrons = list(/datum/patron/divine/abyssor)

/datum/outfit/job/roguetown/refugee/ronin/pre_equip(mob/living/carbon/human/H)
	..()
	H.adjust_blindness(-3)
	var/classes = list("Uchigatana", "Ono")
	var/classchoice = input("Choose your archetypes", "Available archetypes") as anything in classes

	switch(classchoice)

		if("Uchigatana")
			H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/axes, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/treatment, 1, TRUE)
			pants = /obj/item/clothing/under/roguetown/izuma/ceramic/light
			shoes = /obj/item/clothing/shoes/roguetown/boots/armor/light/kusaritabi
			belt = /obj/item/storage/belt/rogue/leather
			neck = /obj/item/storage/belt/rogue/pouch/coins/poor
			shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/tatami
			armor = /obj/item/clothing/suit/roguetown/armor/leather/vest/izuma
			head = /obj/item/clothing/head/roguetown/tengai/gasa
			backl = /obj/item/storage/backpack/rogue/satchel
			backr = /obj/item/rogueweapon/sword/uchigatana
			beltl = /obj/item/rogueweapon/huntingknife
			beltr = /obj/item/rogueweapon/sword/short/wakizashi
			H.change_stat("strength", 2)
			H.change_stat("endurance", 2)
			H.change_stat("constitution", 1)
			H.change_stat("speed", 1)
			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)

		if("Ono")
			H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/axes, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
			H.mind.adjust_skillrank(/datum/skill/misc/treatment, 1, TRUE)
			pants = /obj/item/clothing/under/roguetown/izuma/ceramic/light
			shoes = /obj/item/clothing/shoes/roguetown/boots/armor/light/kusaritabi
			belt = /obj/item/storage/belt/rogue/leather
			neck = /obj/item/storage/belt/rogue/pouch/coins/poor
			shirt = /obj/item/clothing/suit/roguetown/armor/chainmail/tatami
			armor = /obj/item/clothing/suit/roguetown/armor/leather/vest/izuma
			head = /obj/item/clothing/head/roguetown/tengai/gasa
			backl = /obj/item/storage/backpack/rogue/satchel
			backr = /obj/item/rogueweapon/shield/tower/abyssaltower
			beltl = /obj/item/rogueweapon/huntingknife
			beltr = /obj/item/rogueweapon/battle/ono
			H.change_stat("strength", 2)
			H.change_stat("endurance", 2)
			H.change_stat("constitution", 1)
			H.change_stat("speed", 1)
			ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)

	H.set_blindness(0)

