/datum/job/roguetown/seelie
	title = "Town Seelie"
	flag = SEELIE
	department_flag = MERCENARIES
	faction = "Station"
	total_positions = 5
	spawn_positions = 5
	allowed_races = list(/datum/species/seelie,)
	allowed_ages = ALL_AGES_LIST
	tutorial = "Вы - фея, появившийся в окрестностях этого города недавно или очень давно. \
	Возможно, вы помогаете людям в их ремеслах и промыслах, а возможно, являетесь помехой, досаждающей городу. \
	В любом случае, ваша мириада таинственных заклинаний и способностей поможет вам в ваших начинаниях."
	outfit = /datum/outfit/job/roguetown/seelie
	display_order = JDO_SEELIE
	min_pq = 20
	max_pq = null
	give_bank_account = FALSE

/datum/outfit/job/roguetown/seelie/pre_equip(mob/living/carbon/human/H)
	..()
	head = /obj/item/clothing/head/roguetown/roguehood/mage
	shoes = /obj/item/clothing/shoes/roguetown/simpleshoes
	pants = /obj/item/clothing/under/roguetown/tights/random
	shirt = /obj/item/clothing/suit/roguetown/shirt/shortshirt
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/mage
	belt = /obj/item/storage/belt/rogue/leather/rope
	beltl = /obj/item/rogueweapon/huntingknife
	backl = /obj/item/storage/backpack/rogue/satchel
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, pick(0,1), TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/treatment, pick(0,1), TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing , 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/magic/arcane, 3, TRUE)
		H.mind.AddSpell(new SPELL_SEELIE_DUST)
		H.mind.AddSpell(new SPELL_SUMMON_RAT)
		H.mind.AddSpell(new SPELL_SEELIE_KISS)
		H.mind.AddSpell(new SPELL_SPLASH)
		H.mind.AddSpell(new SPELL_ROUSTAME)
		H.mind.AddSpell(new SPELL_ANIMATE_OBJECT)
		H.mind.AddSpell(new SPELL_PUSH_SPELL)
