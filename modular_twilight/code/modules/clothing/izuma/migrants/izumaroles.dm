//All the items in this folder and its subdirectories are licensed under a proprietary agreement between client: [Vladmar] and artist: [SayonaraEcho].

//Redistribution, reproduction, or modification of these assets is prohibited without express permission from both licensors. 
//These assets are for use solely within this project and may not be extracted or repurposed for other projects or commercial use.

/datum/migrant_role/izumawave/samurai
	name = "samurai"
	outfit = /datum/outfit/job/roguetown/izumawave/samurai
	allowed_races = RACES_TOLERATED_UP
	grant_lit_torch = TRUE
	show_wanderer_examine = FALSE
	show_foreign_examine = FALSE
	greet_text = "Вы - самурай, который потерпел кораблекрушение с командой. Собравшись с духом, вы отправляетесь в поисках поселения, чтобы вам оказали помощь. \
    Ведомый своим аколитом Абиссора, вы ищете славу даже в этом богом забытом месте. Вы глубоко чтите свои традиции, культуру и воинскую честь."

/datum/outfit/job/roguetown/izumawave/samurai
	allowed_patrons = list(/datum/patron/divine/abyssor)

/datum/outfit/job/roguetown/izumawave/samurai/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/helmet/heavy/myrmidon
	gloves = /obj/item/clothing/gloves/roguetown/plate/lamellaetekko
	pants = /obj/item/clothing/under/roguetown/platelegs/weepershanwenkai 
	cloak = /obj/item/clothing/cloak/stabard/haramaki
	neck = /obj/item/clothing/neck/roguetown/chaincoif/iron/kusari_zukin
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson/light/hitatare/eidolon
	armor = /obj/item/clothing/suit/roguetown/armor/rare/myrmidon
	shoes = /obj/item/clothing/shoes/roguetown/boots/jikatabi/dragontabi
	beltr = /obj/item/rogueweapon/mace/goden/kanabo
	beltl = /obj/item/flashlight/flare/torch/lantern
	wrists = /obj/item/clothing/wrists/roguetown/bracers/kote
	belt = /obj/item/storage/belt/rogue/leather/steel
	backr = /obj/item/storage/backpack/rogue/satchel
	backl = /obj/item/rogueweapon/sword/long/greatsword/odachi
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 4, TRUE)
		H.change_stat("strength", 3)
		H.change_stat("perception", 1)
		H.change_stat("intelligence", 2)
		H.change_stat("constitution", 2)
		H.change_stat("endurance", 2)
		H.change_stat("speed", -1)
		H.cmode_music = 'modular_twilight/sound/izuma/combat/combat_emperor.ogg'
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOSEGRAB, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)

/datum/migrant_role/izumawave/acigaruwave
	name = "Ashigaru"
	allowed_races = RACES_TOLERATED_UP
	grant_lit_torch = TRUE
	show_wanderer_examine = FALSE
	show_foreign_examine = FALSE
	outfit = /datum/outfit/job/roguetown/izumawave/acigaruwave
	greet_text = "Вы - асигару, который потерпел кораблекрушение с командой. Собравшись с духом, вы отправляетесь в поисках поселения, чтобы вам оказали помощь. \
    Вы глубоко чтите свои традиции, культуру и воинскую честь. Позор и неисполнение приказов самурая влечет сэппуку."

/datum/outfit/job/roguetown/izumawave/acigaruwave
	allowed_patrons = list(/datum/patron/divine/abyssor)

/datum/outfit/job/roguetown/izumawave/acigaruwave/pre_equip(mob/living/carbon/human/H)
	..()
	mask = /obj/item/clothing/mask/rogue/izuma/menpo/facemask/colourable/oni
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather/khudagach
	belt = /obj/item/storage/belt/rogue/leather/black
	beltr = /obj/item/rogueweapon/sword/short/wakizashi
	neck = /obj/item/clothing/neck/roguetown/chaincoif/iron/kusari_zukin 
	shirt = /obj/item/clothing/suit/roguetown/shirt/tunic/kimono 
	head = /obj/item/clothing/head/roguetown/zurarikabutonew 
	armor = /obj/item/clothing/suit/roguetown/armor/brigandine/oyoroi/oyoroigusoku 
	pants = /obj/item/clothing/under/roguetown/chainlegs/sendan 
	shoes = /obj/item/clothing/shoes/roguetown/boots/armor/light/kusaritabi 
	gloves = /obj/item/clothing/gloves/roguetown/fingerless/yugake 
	backr = /obj/item/storage/backpack/rogue/satchel

	var/weapons = list("hankyu bow", "tachi", "naginata", "kanabo") 
	var/weaponschoice = input("Choose your weapon", "Available weapons") as anything in weapons

	switch(weaponschoice)

		if("naginata")
			r_hand = /obj/item/rogueweapon/halberd/bardiche/naginata
			H.mind.adjust_skillrank(/datum/skill/combat/polearms, 1, TRUE)
		if("hankyu bow")
			backl = /obj/item/gun/ballistic/revolver/grenadelauncher/bow/hankyu
			beltl = /obj/item/ammo_holder/quiver/arrows
			H.mind.adjust_skillrank(/datum/skill/combat/bows, 1, TRUE)
		if("tachi")
			backl = /obj/item/rogueweapon/sword/long/tachi 
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
		if("kanabo")
			backl = /obj/item/rogueweapon/mace/goden/kanabo
			H.mind.adjust_skillrank(/datum/skill/combat/maces, 1, TRUE)
		else
			backl = /obj/item/rogueweapon/sword/long/tachi 
			H.mind.adjust_skillrank(/datum/skill/combat/swords, 1, TRUE)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.change_stat("strength", 2)
		H.change_stat("endurance", 2)
		H.change_stat("constitution", 1)
		H.change_stat("perception", 2)
		H.change_stat("speed", 3)
		H.cmode_music = 'modular_twilight/sound/izuma/combat/combat_traditional.ogg'
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)

/datum/migrant_role/izumawave/acolyte
	name = "Acolyte"
	allowed_races = RACES_TOLERATED_UP
	grant_lit_torch = TRUE
	show_wanderer_examine = FALSE
	show_foreign_examine = FALSE
	greet_text = "Вы - аколит Абиссора, который потерпел кораблекрушение с командой. Собравшись с духом, вы отправляетесь в поисках поселения, чтобы вам оказали помощь. \
    Абиссор направляет вас, а вы указываете путь самураю."

/datum/outfit/job/roguetown/izumawave/acolyte
	allowed_patrons = list(/datum/patron/divine/abyssor)

/datum/outfit/job/roguetown/izumawave/acolyte/pre_equip(mob/living/carbon/human/H)
	..()
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt
	shoes = /obj/item/clothing/shoes/roguetown/sandals
	pants = /obj/item/clothing/under/roguetown/tights
	neck = /obj/item/clothing/neck/roguetown/psicross/abyssor
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/abyssor
	head = /obj/item/clothing/head/roguetown/roguehood/abyssor 
	backr = /obj/item/storage/backpack/rogue/satchel
	belt = /obj/item/storage/belt/rogue/leather/rope

	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/treatment, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/holy, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
		if(H.age == AGE_OLD)
			H.mind.adjust_skillrank(/datum/skill/magic/holy, 1, TRUE)
		H.change_stat("intelligence", 1)
		H.change_stat("endurance", 1)
		H.change_stat("perception", -1)
		H.cmode_music = 'modular_twilight/sound/izuma/combat/combat_traditional.ogg'
	
	var/datum/devotion/C = new /datum/devotion(H, H.patron)
	C.grant_spells(H)
	H.verbs += list(/mob/living/carbon/human/proc/devotionreport, /mob/living/carbon/human/proc/clericpray)

/datum/outfit/job/roguetown/izumawave/acolyte/post_equip(mob/living/carbon/human/H)
	..()
	H.virginity = TRUE

/datum/migrant_role/izumawave/acolyte/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		var/prev_real_name = H.real_name
		var/prev_name = H.name
		var/title = "Brother"
		if(H.gender == FEMALE)
			title = "Sister"
		H.real_name = "[title] [prev_real_name]"
		H.name = "[title] [prev_name]"
