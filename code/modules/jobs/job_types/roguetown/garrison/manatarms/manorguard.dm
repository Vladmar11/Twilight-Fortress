/datum/job/roguetown/manorguard
	title = "Man at Arms"
	flag = MANATARMS
	department_flag = GARRISON
	faction = "Station"
	total_positions = 6
	spawn_positions = 6

	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_TOLERATED_UP
	tutorial = "Доказав свою преданность и способности, вы получили смысл жизни - защищать герцогскую семью и её двор в качестве лейб-гвардейца. \
				Вы непосредственно подчиняетесь своему капитану лейб-гвардии. Если вы регулярно проходите обучение боевым и осадным действиям, у вас есть небольшой шанс пережить правление герцога.\
				Умереть в составе лейб-гвардии Его Высочества - большая честь, маршал напоминает вам об этом каждую ночь."
	display_order = JDO_CASTLEGUARD
	whitelist_req = TRUE

	outfit = /datum/outfit/job/roguetown/manorguard
	give_bank_account = 22
	min_pq = 6
	max_pq = null
	subclass_cat_rolls = list(CTAG_MAA = 6)

	cmode_music = 'sound/music/combat_guard2.ogg'

/datum/job/roguetown/manorguard/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
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
			S.name = "man-at-arms jupon ([index])"
		H.advsetup = 1
		H.invisibility = INVISIBILITY_MAXIMUM
		H.become_blind("advsetup")

/datum/outfit/job/roguetown/manorguard/pre_equip(mob/living/carbon/human/H)
	..()
	cloak = /obj/item/clothing/cloak/stabard/surcoat/guard
	pants = /obj/item/clothing/under/roguetown/chainlegs
	gloves = /obj/item/clothing/gloves/roguetown/chain
	neck = /obj/item/clothing/neck/roguetown/chaincoif
	armor = /obj/item/clothing/suit/roguetown/armor/chainmail/hauberk
	shirt = /obj/item/clothing/suit/roguetown/armor/gambeson
	shoes = /obj/item/clothing/shoes/roguetown/armor
	belt = /obj/item/storage/belt/rogue/leather/black
	backr = /obj/item/storage/backpack/rogue/satchel/black
