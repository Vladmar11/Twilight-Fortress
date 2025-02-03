/datum/job/roguetown/squire
	title = "Squire"
	flag = SQUIRE
	department_flag = YOUNGFOLK
	faction = "Station"
	total_positions = 3
	spawn_positions = 3
	allowed_races = RACES_SHUNNED_UP
	allowed_sexes = list(MALE, FEMALE)
	allowed_ages = list(AGE_ADULT)
	subclass_cat_rolls = list(CTAG_SQUIRE = 20)

	tutorial = "Мама и папа говорили, что ты станешь кем-то, у них были для тебя лучшие пожелания, чем жизнь крестьянина. \
	Вместе с друзьями ты отрабатывал азы в поле, сражаясь на мечах с палками, гоняясь за кроликами и помогая по дому поднимать тяжелые мешки с зерном. \
	Рыцарь заметил твой потенциал и взял тебя к себе в личные подопечные. Когда-нибудь ты станешь кем-то."

	outfit = /datum/outfit/job/roguetown/squire
	display_order = JDO_SQUIRE
	give_bank_account = TRUE
	min_pq = -5 //squires aren't great but they can do some damage
	max_pq = null

/datum/job/roguetown/squire/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(ishuman(L))
		var/mob/living/carbon/human/H = L
		if(istype(H.cloak, /obj/item/clothing/cloak/stabard/surcoat/guard))
			var/obj/item/clothing/S = H.cloak
			var/index = findtext(H.real_name, " ")
			if(index)
				index = copytext(H.real_name, 1,index)
			if(!index)
				index = H.real_name
			S.name = "squire jupon ([index])"
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")

/datum/outfit/job/roguetown/squire/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/helmet/sallet
	pants = /obj/item/clothing/under/roguetown/tights
	armor = /obj/item/clothing/suit/roguetown/armor/chainmail
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
	cloak = /obj/item/clothing/cloak/stabard/surcoat/guard
	shoes = /obj/item/clothing/shoes/roguetown/armor
	belt = /obj/item/storage/belt/rogue/leather
	beltl = /obj/item/storage/keyring/squire
	beltr = /obj/item/rogueweapon/sword/short
	backr = /obj/item/storage/backpack/rogue/satchel/black
	backpack_contents = list(/obj/item/rope/chain = 1)

/datum/subclass/squire/Page
	name = "Page"
	tutorial = "Рожденный в дворянстве, вы еще не стали настоящим рыцарем. Однако боги улыбаются вам, и в конце концов именно вам понадобится оруженосец. \
	Загадка, малыш, кто лучше: благородный оруженосец или ничем не примечательный человек?"
	outfit = /datum/outfit/job/roguetown/squire/page
	category_tags = list(CTAG_SQUIRE)
	maximum_possible_slots = 2

/datum/outfit/job/roguetown/squire/page/pre_equip(mob/living/carbon/human/H)
	..()
	neck = /obj/item/storage/belt/rogue/pouch/coins/mid
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/stealing, 1, TRUE)
		H.change_stat("strength", 1)
		H.change_stat("perception", 1)
		H.change_stat("constitution", 1)
		H.change_stat("speed", 1)
		H.change_stat("intelligence", 1)
		H.change_stat("endurance", 1)
	ADD_TRAIT(H, TRAIT_NOBLE, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)

/datum/subclass/squire/recruit
	name = "Recruit"
	tutorial = "Вы только что поступили на службу, но еще не готовы самостоятельно служить своему лорду. Рыцарь позаботится о твоем обучении, как и ты позаботишься о нем. \
	Благодаря своему усердию, вы превосходите многих своих сородичей в бою."
	outfit = /datum/outfit/job/roguetown/squire/recruit
	category_tags = list(CTAG_SQUIRE)
	maximum_possible_slots = 2

/datum/outfit/job/roguetown/squire/recruit/pre_equip(mob/living/carbon/human/H)
	..()
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/firearms, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/stealing, 1, TRUE)
		H.change_stat("strength", 1)
		H.change_stat("perception", 1)
		H.change_stat("constitution", 1)
		H.change_stat("speed", 1)
		H.change_stat("endurance", 1)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)

/datum/subclass/squire/levy
	name = "Levy"
	tutorial = "Вы должны были жить жизнью скромного фермера, но у жизни были другие планы на вас. Отнятый у родителей, ты вступил в ряды ополчения. \
	Никто не знает, как далеко ты мог зайти со своим простонародным образованием, живя среди дворян и опытных воинов. Но ополчение в деревне многому тебя научили."
	outfit = /datum/outfit/job/roguetown/squire/levy
	category_tags = list(CTAG_SQUIRE)
	maximum_possible_slots = 2

/datum/outfit/job/roguetown/squire/levy/pre_equip(mob/living/carbon/human/H)
	..()
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/crossbows, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, pick(1,2), TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sewing, pick(1,2), TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, pick(1,2), TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/stealing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/bows, 1, TRUE)
		if(prob(25))
			H.mind.adjust_skillrank(/datum/skill/labor/farming, 1, TRUE)
		if(prob(25))
			H.mind.adjust_skillrank(/datum/skill/craft/carpentry, 1, TRUE)
		if(prob(25))
			H.mind.adjust_skillrank(/datum/skill/labor/mining, 1, TRUE)
		if(prob(25))
			H.mind.adjust_skillrank(/datum/skill/craft/masonry, 1, TRUE)
		if(prob(25))
			H.mind.adjust_skillrank(/datum/skill/craft/hunting, 1, TRUE)
		if(prob(25))
			H.mind.adjust_skillrank(/datum/skill/labor/fishing, 1, TRUE)

		H.change_stat("strength", 1)
		H.change_stat("perception", 1)
		H.change_stat("constitution", 1)
		H.change_stat("speed", 1)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_SEEDKNOW, TRAIT_GENERIC)