/datum/subclass/manorguard/veteran
	name = "Retinue Veteran"
	tutorial = "Вы - ветеран дружины Герцога, проживший много лет и проливший много крови за Рокхилл. Выгравированный меч на вашем поясе - свидетельство вашей службы и подарок от самого капитана лейб-гвардии. Защищайте герцогство, защищайте своих товарищей, и, возможно, однажды вы сможете уйти в отставку..."
	outfit = /datum/outfit/job/roguetown/manorguard/veteran
	min_pq = 8
	category_tags = list(CTAG_MAA)
	allowed_ages = list(AGE_OLD)
	maximum_possible_slots = 2

/datum/outfit/job/roguetown/manorguard/veteran/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/helmet/sallet/visored
	beltl = /obj/item/rogueweapon/sword/decorated
	r_hand = /obj/item/rogueweapon/halberd
	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger/steel/special = 1, /obj/item/rope/chain = 1, /obj/item/storage/keyring/man_at_arms = 1, /obj/item/signal_horn = 1, /obj/item/natural/cloth = 1)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/polearms, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 1, TRUE)
		H.change_stat("strength", 3)
		H.change_stat("perception", 1)
		H.change_stat("constitution", 1)
		H.change_stat("endurance", 1)
	H.verbs |= /mob/proc/haltyell
	ADD_TRAIT(H, TRAIT_HEAVYARMOR, TRAIT_GENERIC)
