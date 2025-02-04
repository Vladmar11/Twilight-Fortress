/datum/subclass/acigaru
	name = "Ashigaru"
	tutorial = "Путь воина для асигару священный кодекс, они искреннее чтят свои традиции, честь и достоинство как истинного воина Изумы. \
	Асигару в Рокхилле являются добровольными солдатами Сёгуната Изума, которые были отправлены для межкультурного обмена и получения прибыли с местных лордов за наём. \
	Если асигару не сможет выполнить поручение своего заказчика или опозорится публично - он совершает самоубийство посредством вспарывание живота клинком, \
	чтобы доказать чистоту своих действий."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_TOLERATED_UP
	allowed_patrons = list(/datum/patron/divine/abyssor)
	outfit = /datum/outfit/job/roguetown/mercenary/acigaru
	maximum_possible_slots = 9
	min_pq = 15
	torch = FALSE
	cmode_music = 'modular_twilight/sound/izuma/combat/combat_traditional.ogg'
	category_tags = list(CTAG_MERCENARY)

/datum/outfit/job/roguetown/mercenary/acigaru/pre_equip(mob/living/carbon/human/H)
	..()
	mask = /obj/item/clothing/mask/rogue/izuma/menpo/facemask/colourable/oni
	wrists = /obj/item/clothing/wrists/roguetown/bracers/leather/khudagach
	belt = /obj/item/storage/belt/rogue/leather/black
	beltr = /obj/item/rogueweapon/sword/short/wakizashi
	neck = /obj/item/clothing/neck/roguetown/chaincoif/iron/kusari_zukin //
	shirt = /obj/item/clothing/suit/roguetown/shirt/tunic/kimono //
	head = /obj/item/clothing/head/roguetown/zurarikabutonew //
	armor = /obj/item/clothing/suit/roguetown/armor/brigandine/oyoroi/oyoroigusoku //
	pants = /obj/item/clothing/under/roguetown/chainlegs/sendan //
	shoes = /obj/item/clothing/shoes/roguetown/boots/armor/light/kusaritabi //
	gloves = /obj/item/clothing/gloves/roguetown/fingerless/yugake //
	backr = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(/obj/item/storage/keyring/mercenary = 1 , /obj/item/storage/belt/rogue/pouch/coins/poor = 1)

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
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
