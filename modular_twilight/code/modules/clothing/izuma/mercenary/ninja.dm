//All the items in this folder and its subdirectories are licensed under a proprietary agreement between client: [Vladmar] and artist: [SayonaraEcho].

//Redistribution, reproduction, or modification of these assets is prohibited without express permission from both licensors. 
//These assets are for use solely within this project and may not be extracted or repurposed for other projects or commercial use.

/datum/subclass/shinobii
	name = "Shinobi"
	tutorial = "Лазутчики, наёмные убийцы, шпионы, разведчики из Сёгуната Изума. \
	Шиноби славятся тем, что владеют ниндзюцу и заработали себе репутацию по всему миру за успешные диверсионные скрытные операции в Грензельхофте.\
	Они довольно преданные, но за приличную сумму."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_TOLERATED_UP
	outfit = /datum/outfit/job/roguetown/mercenary/shinobii
	maximum_possible_slots = 9
	min_pq = 15
	torch = FALSE
	cmode_music = 'modular_twilight/sound/izuma/combat/combat_shinobi.ogg'
	category_tags = list(CTAG_MERCENARY)

/datum/outfit/job/roguetown/mercenary/shinobii
	allowed_patrons = list(/datum/patron/divine/abyssor)

/datum/outfit/job/roguetown/mercenary/shinobii/pre_equip(mob/living/carbon/human/H)
	..()
	mask = /obj/item/clothing/mask/rogue/izuma/eyeband/black
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather/khudagach
	belt = /obj/item/storage/belt/rogue/leather/black
	beltl = /obj/item/ammo_holder/shuriken/shurikens
	beltr = /obj/item/ammo_holder/bomb/smokebombs
	neck = /obj/item/clothing/neck/roguetown/leather/black
	shirt = /obj/item/clothing/suit/roguetown/shirt/looseshirt
	head = /obj/item/clothing/head/roguetown/shinobi_zukin
	armor = /obj/item/clothing/suit/roguetown/armor/leather/hide/shozoku
	pants = /obj/item/clothing/under/roguetown/trou/leather/shinobizubon
	shoes = /obj/item/clothing/shoes/roguetown/boots/jikatabi/shinobi
	gloves = /obj/item/clothing/gloves/roguetown/shadow
	backl = /obj/item/storage/backpack/rogue/satchel/black

	var/weapons = list("kusarigama & sai", "ninjato & kunai") 
	var/weaponschoice = input("Choose your weapon", "Available weapons") as anything in weapons

	switch(weaponschoice)
		if("kusarigama & sai")
			backr = /obj/item/rogueweapon/flail/kusarigama
			backpack_contents = list(/obj/item/rogueweapon/huntingknife/sai = 2, /obj/item/storage/keyring/mercenary = 1, /obj/item/storage/belt/rogue/pouch/coins/poor = 1, /obj/item/rogueweapon/tetsubishi = 3)
			H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
			H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 3, TRUE)
		if("ninjato & kunai")
			backr = /obj/item/rogueweapon/sword/short/ninjato
			backpack_contents = list(/obj/item/rogueweapon/huntingknife/kunai, /obj/item/storage/keyring/mercenary = 1, /obj/item/storage/belt/rogue/pouch/coins/poor = 1, /obj/item/rogueweapon/tetsubishi = 3)
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)

	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/stealing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/lockpicking, 3, TRUE)
		H.change_stat("strength", 1)
		H.change_stat("endurance", 3)
		H.change_stat("perception", 3)
		H.change_stat("speed", 4)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
