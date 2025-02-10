/datum/migrant_role/fablefield/goliard
	name = "Fablefield Goliard"
	greet_text = "Много лет вы путешествуете по миру, оттачивая свое мастерство на ежегодном грандиозном фестивале сказок.\
	Вы - уважаемый ткач славных и доблестных историй, язык и остроумие которого так же остры, как и ваш клинок. В последнее время вы одержимы островом Энигма... \
	Какие фантастические приключения вы могли бы затеять здесь вместе со своими протеже?"
	outfit = /datum/outfit/job/roguetown/fablefield/goliard
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_SHUNNED_UP
	show_wanderer_examine = FALSE
	show_foreign_examine = TRUE

/datum/outfit/job/roguetown/fablefield/goliard
	allowed_patrons = list(/datum/patron/divine/xylix)

/datum/outfit/job/roguetown/fablefield/goliard/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/bardhat
	neck = /obj/item/storage/belt/rogue/pouch/coins/mid
	shoes = /obj/item/clothing/shoes/roguetown/armor
	pants = /obj/item/clothing/under/roguetown/tights/random
	shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt
	gloves = /obj/item/clothing/gloves/roguetown/fingerless
	belt = /obj/item/storage/belt/rogue/leather
	armor = /obj/item/clothing/suit/roguetown/armor/leather/vest
	cloak = /obj/item/clothing/cloak/half/red
	backl = /obj/item/storage/backpack/rogue/satchel
	backr = /obj/item/rogue/instrument/guitar
	beltl = /obj/item/rogueweapon/sword/rapier/dec
	beltr = /obj/item/rogueweapon/huntingknife/elvish
	backpack_contents = list(/obj/item/book/rogue/tales1, /obj/item/book/rogue/blackmountain, /obj/item/book/rogue/tales3)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/music, 6, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/holy, 2, TRUE) //Futureproofing, does nothing for now.
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
		H.change_stat("speed", 2)
		H.change_stat("perception", 2)
		H.change_stat("intelligence", 1)
		H.change_stat("endurance", 1)
	H.verbs |= /mob/living/carbon/human/proc/ventriloquate
	
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_EMPATH, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_GOODLOVER, TRAIT_GENERIC)

/datum/migrant_role/fablefield/troubadour
	name = "Fablefield Troubadour"
	greet_text = "На последнем грандиозном фестивале сказок в Фейблфилде вас вдохновил человек, который пел о драконах, фейри, богах и героях. \
	В этом году вы планируете стать героем своей собственной истории. Талантливый бард и мастерски владеющий клинком, вы следуете за своей музой,\
	возлагая на нее лишь самые смелые надежды, хотя пока Энигма - не совсем то, чего вы ожидали..."
	outfit = /datum/outfit/job/roguetown/fablefield/troubadour
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_SHUNNED_UP
	show_wanderer_examine = FALSE
	show_foreign_examine = TRUE

/datum/outfit/job/roguetown/fablefield/troubadour
	allowed_patrons = list(/datum/patron/divine/xylix)

/datum/outfit/job/roguetown/fablefield/troubadour/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/bardhat
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor
	shoes = /obj/item/clothing/shoes/roguetown/armor
	pants = /obj/item/clothing/under/roguetown/tights/random
	shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt
	gloves = /obj/item/clothing/gloves/roguetown/fingerless
	belt = /obj/item/storage/belt/rogue/leather
	armor = /obj/item/clothing/suit/roguetown/armor/leather/vest
	cloak = /obj/item/clothing/cloak/half/orange
	backl = /obj/item/storage/backpack/rogue/satchel
	backr = /obj/item/rogue/instrument/lute
	beltl = /obj/item/rogueweapon/sword/rapier
	beltr = /obj/item/rogueweapon/huntingknife/idagger/steel
	backpack_contents = list(/obj/item/book/rogue/nitebeast, /obj/item/flashlight/flare/torch/lantern, /obj/item/flint)
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/music, 5, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/swords, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/knives, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/holy, 1, TRUE) //Futureproofing, does nothing for now.
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/cooking, 1, TRUE)
		H.change_stat("perception", 2)
		H.change_stat("speed", 1)
		H.change_stat("intelligence", 1)
		H.change_stat("endurance", 1)
	
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_EMPATH, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_DODGEEXPERT, TRAIT_GENERIC)
	ADD_TRAIT(H, TRAIT_GOODLOVER, TRAIT_GENERIC)
