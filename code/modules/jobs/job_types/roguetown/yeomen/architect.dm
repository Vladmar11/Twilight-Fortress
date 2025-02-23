/datum/job/roguetown/architect
	title = "Architect"
	tutorial = "В камне заключены древние тайны, о которых ваше кредо знало с тех пор, как человек стал строить на земле. \
	Вы гордитесь своей работой, и только благодаря вам это место не разваливается."
	flag = ARCHITECT
	department_flag = COURTIERS
	faction = "Station"
	total_positions = 1
	spawn_positions = 1
	allowed_races = RACES_SHUNNED_UP
	allowed_ages = ALL_AGES_LIST

	outfit = /datum/outfit/job/roguetown/architect
	display_order = JDO_ARCHITECT
	min_pq = 12
	max_pq = null
	give_bank_account = 25

/datum/outfit/job/roguetown/architect/pre_equip(mob/living/carbon/human/H)         ///////////// fuck being a dumb virgin
	..()
	head = /obj/item/clothing/head/roguetown/helmet/leather/minershelm
	mask = /obj/item/clothing/mask/rogue/goggles
	neck = /obj/item/powderflask
	armor = /obj/item/clothing/suit/roguetown/shirt/tunic/noblecoat
	shirt = /obj/item/clothing/suit/roguetown/shirt/undershirt/artificer
	wrists = /obj/item/storage/keyring/architect
	backr = /obj/item/gun/ballistic/firearm/blunderbuss
	backl = /obj/item/rogueweapon/pick/drill
	belt = /obj/item/storage/belt/rogue/leather/plaquesilver
	beltr = /obj/item/storage/belt/rogue/pouch/coins/mid
	beltl = /obj/item/ammo_holder/bullet/grapeshot
	pants = /obj/item/clothing/under/roguetown/tights/black
	shoes = /obj/item/clothing/shoes/roguetown/armor

	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/labor/mining, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/maces, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/firearms, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/wrestling, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/unarmed, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/carpentry, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/masonry, 4, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/crafting, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/engineering, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/labor/lumberjacking, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/craft/blacksmithing, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/climbing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/reading, 4, TRUE)

		H.change_stat("strength", 1)
		H.change_stat("intelligence", 2)
		H.change_stat("constitution", 1)
		H.change_stat("speed", -1)
		H.change_stat("endurance", 1)



