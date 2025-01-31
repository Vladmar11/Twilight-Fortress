/datum/job/roguetown/clerk
	title = "Clerk"
	flag = CLERK
	department_flag = YOUNGFOLK
	faction = "Station"
	total_positions = 1
	spawn_positions = 1

	allowed_races = RACES_SHUNNED_UP
	allowed_sexes = list(MALE, FEMALE)
	allowed_ages = list(AGE_ADULT)
	subclass_cat_rolls = list(CTAG_CLERK = 20)

	tutorial = "Вы получили привилегию служить клерком в офисе казначея. \
	Вы помогаете казначею во всем, что ему нужно, и узнаете, как монеты обеспечивают движение и процветание города."

	display_order = JDO_CLERK
	give_bank_account = TRUE
	min_pq = 0 // increased from -10 since do we really want to allow shitters and griefers to control all the money in the town?
	max_pq = null

/datum/job/roguetown/clerk/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(L)
		var/mob/living/carbon/human/H = L
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")

/datum/subclass/clerk/apprentice
	name = "Noble Apprentice"
	tutorial = "Вы родились в благородной семье, и как только вы выросли, ваши родители решили отдать вас в ученики к казначею. \
	Это ваше призвание, и со временем вы займете место своего хозяина, но пока вы должны следовать приказам и урокам казначея."
	outfit = /datum/outfit/job/roguetown/clerk/apprentice
	category_tags = list(CTAG_CLERK)

/datum/outfit/job/roguetown/clerk/apprentice/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.gender == MALE)
		shirt = /obj/item/clothing/suit/roguetown/shirt/tunic/noblecoat
		pants = /obj/item/clothing/under/roguetown/tights
	if(H.gender == FEMALE)
		shirt = /obj/item/clothing/suit/roguetown/shirt/dress/nobledress/green
		pants = /obj/item/clothing/under/roguetown/tights/stockings/white
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/treatment, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
		H.change_stat("strength", -1)
		H.change_stat("intelligence", 2)
		H.change_stat("fortune", 1)
	ADD_TRAIT(H, TRAIT_SEEPRICES, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)

/datum/subclass/clerk/assistant
	name = "Ignoble Assistant"
	tutorial = "Вы могли бы уже умереть от голода, но, к счастью, казначей заметил ваши способности и сделал вам предложение, которое изменило вашу жизнь. \
	Это редкий случай, когда простолюдин удостаивается великой чести быть подмастерьем в монетном деле. Не разочаруйте своего хозяина."
	outfit = /datum/outfit/job/roguetown/clerk/assistant
	category_tags = list(CTAG_CLERK)

/datum/outfit/job/roguetown/clerk/assistant/pre_equip(mob/living/carbon/human/H)
	..()
	if(H.gender == MALE)
		shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/fancy
		pants = /obj/item/clothing/under/roguetown/tights
	if(H.gender == FEMALE)
		shirt = /obj/item/clothing/suit/roguetown/shirt/dress/nobledress/green
		pants = /obj/item/clothing/under/roguetown/tights/stockings/white
	shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
	belt = /obj/item/storage/belt/rogue/leather
	beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
	beltl = /obj/item/storage/keyring/steward
	backr = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger = 1)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/treatment, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
		H.change_stat("strength", -1)
		H.change_stat("speed", 1)
		H.change_stat("intelligence", 1)
		H.change_stat("fortune", 1)
	ADD_TRAIT(H, TRAIT_SEEPRICES, TRAIT_GENERIC)

/datum/subclass/clerk/thug
	name = "Thug"
	tutorial = "Ты заслужил свое положение не усердием, а силой. Но не думай, что грубая сила сделает тебя лучше, чем просто бандит."
	outfit = /datum/outfit/job/roguetown/clerk/thug
	category_tags = list(CTAG_CLERK)

/datum/outfit/job/roguetown/clerk/thug/pre_equip(mob/living/carbon/human/H)
	..()
	shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt/random
	pants = /obj/item/clothing/under/roguetown/trou/leather
	shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
	belt = /obj/item/storage/belt/rogue/leather
	beltr = /obj/item/storage/belt/rogue/pouch/coins/poor
	beltl = /obj/item/storage/keyring/steward
	backr = /obj/item/storage/backpack/rogue/satchel
	backpack_contents = list(/obj/item/rogueweapon/huntingknife/idagger = 1)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/treatment, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
		H.change_stat("strength", 1)
		H.change_stat("constitution", 1)
		H.change_stat("endurance", 1)
		H.change_stat("intelligence", -1)
		H.change_stat("speed", -1)
	ADD_TRAIT(H, TRAIT_SEEPRICES_SHITTY, TRAIT_GENERIC)
