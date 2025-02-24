/datum/subclass/sawbones // doctor class. like the Refugee, but more evil
	name = "Sawbones"
	tutorial = "Это был несчастный случай! Ваш пациент все равно не использовал свою вторую почку. \
	После досадного «недоразумения» с городом и вашей врачебной практикой вы теперь занимаетесь медициной в бегах со своими новыми коллегами. \
	Бизнес еще никогда не был таким успешным!"
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_ALL_KINDS
	outfit = /datum/outfit/job/roguetown/bandit/sawbones
	category_tags = list(CTAG_BANDIT)
	cmode_music = 'sound/music/combat_bandit2.ogg'
	maximum_possible_slots = 1

/datum/outfit/job/roguetown/bandit/sawbones/pre_equip(mob/living/carbon/human/H)
	..()
	mask = /obj/item/clothing/mask/rogue/facemask/steel
	head = /obj/item/clothing/head/roguetown/nightman
	armor = /obj/item/clothing/suit/roguetown/armor/leather/vest
	shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt
	belt = /obj/item/storage/belt/rogue/leather
	beltr = /obj/item/rogueweapon/huntingknife/cleaver /// proper self defense an tree aquiring
	pants = /obj/item/clothing/under/roguetown/trou
	shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
	backl = /obj/item/storage/backpack/rogue/backpack
	backr = /obj/item/bedroll // field surgery
	backpack_contents = list(/obj/item/storage/fancy/skit = 1, /obj/item/storage/fancy/ifak = 1, /obj/item/reagent_containers/glass/alembic = 1, /obj/item/rope/chain = 1, /obj/item/natural/cloth = 1) // tie and gag zombies
	H.mind.adjust_skillrank(/datum/skill/combat/knives, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/crafting, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/craft/carpentry, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/labor/lumberjacking, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE) //needed for getting into hideout
	H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 1, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/sewing, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/labor/farming, 2, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/athletics, 3, TRUE)
	H.mind.adjust_skillrank(/datum/skill/misc/treatment, 4, TRUE)	//in line with town physicians and can now revive
	H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
	ADD_TRAIT(H, TRAIT_MEDIUMARMOR, TRAIT_GENERIC) //Given for consistencysake as the idol still provides scalemail.
	ADD_TRAIT(H, TRAIT_NOSTINK, TRAIT_GENERIC) // Vital for any surgical role dealing in potentially decaying bodies.
	H.change_stat("strength", 2)
	H.change_stat("intelligence", 3)
	H.change_stat("speed", 1)
	H.change_stat("fortune", 1)
	if(H.age == AGE_OLD)
		H.change_stat("speed", -1)
		H.change_stat("intelligence", 1)
		H.change_stat("perception", 1)
	H.mind.AddSpell(new SPELL_DIAGNOSE_SECULAR)
	H.mind.AddSpell(new SPELL_DOCHEAL)
	H.mind.AddSpell(new SPELL_STABLE)
	H.mind.AddSpell(new SPELL_PURGE)
	H.mind.AddSpell(new SPELL_DEBRIDE)
	H.mind.AddSpell(new SPELL_CPR)
	H.ambushable = FALSE
