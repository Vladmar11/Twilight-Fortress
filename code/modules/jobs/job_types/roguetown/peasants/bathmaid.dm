/datum/job/roguetown/nightmaiden
	title = "Prostitute"
	f_title = "Prostitute"
	flag = WENCH
	department_flag = PEASANTS
	faction = "Station"
	total_positions = 5
	spawn_positions = 5

	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_VERY_SHUNNED_UP
	allowed_ages = list(AGE_ADULT, AGE_MIDDLEAGED)

	tutorial = "Продавая свое тело, как кусок мяса в мясной лавке, лишая себя достоинства и обращаясь как с товаром, вы остаетесь послушным своему сутенёру. \
	Каждый день вы боретесь за выживание в мире, который не предлагает вам ничего, кроме презрения."

	outfit = /datum/outfit/job/roguetown/nightmaiden
	display_order = JDO_WENCH
	give_bank_account = TRUE
	can_random = FALSE
	min_pq = 2
	max_pq = null

/datum/outfit/job/roguetown/nightmaiden/pre_equip(mob/living/carbon/human/H)
	..()
	shoes = /obj/item/clothing/shoes/roguetown/shortboots
	neck = /obj/item/storage/belt/rogue/pouch/coins/poor
	r_hand = /obj/item/soap/bath
	l_hand = /obj/item/rogue/instrument/harp
	if(H.gender == MALE)
		pants =	/obj/item/clothing/under/roguetown/loincloth
		belt =	/obj/item/storage/belt/rogue/leather/cloth
	else
		mask = /obj/item/clothing/mask/rogue/exoticsilkmask
		shirt = /obj/item/clothing/suit/roguetown/shirt/exoticsilkbra
		pants =	/obj/item/clothing/under/roguetown/tights/stockings/fishnet/random
		belt =	/obj/item/storage/belt/rogue/leather/exoticsilkbelt
		shoes = /obj/item/clothing/shoes/roguetown/goldanklets

	beltr = /obj/item/storage/keyring/nightman
	if(H.mind)
		H.mind.adjust_skillrank(/datum/skill/misc/sneaking, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/stealing, 3, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/swimming, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/athletics, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/music, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/riding, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/treatment, 2, TRUE)
		H.mind.adjust_skillrank(/datum/skill/combat/whipsflails, 1, TRUE)
		H.mind.adjust_skillrank(/datum/skill/misc/lockpicking, 1, TRUE) // Don't go picking any COCKS around here or we're going to have a real problem.
		H.change_stat("constitution", 1)
		H.change_stat("endurance", 2)
	ADD_TRAIT(H, TRAIT_GOODLOVER, TRAIT_GENERIC)

// Washing Implements

/obj/item/soap/bath
	name = "травяное мыло"
	desc = "Мыло, приготовленное из различных трав."
	uses = 10

/obj/item/soap/bath/attack(mob/target, mob/user)
	var/turf/bathspot = get_turf(target)
	if(!istype(bathspot, /turf/open/water/bath))
		to_chat(user, span_warning("Моющийся должен быть в купели!"))
		return
	if(istype(target, /mob/living/carbon/human))
		visible_message(span_info("[user] начинает чистить тело [target] с помощью [src]."))
		if(do_after(user, 50))
			if(HAS_TRAIT(user, TRAIT_GOODLOVER))
				visible_message(span_info("[user] умело очищает и ласкает кожу [target] с помощью [src]."))
				to_chat(target, span_love("Я чувствую невероятную легкость и чистоту!"))
				SEND_SIGNAL(target, COMSIG_ADD_MOOD_EVENT, "bathcleaned", /datum/mood_event/bathcleaned)
			else
				visible_message(span_info("[user] старается изо всех сил вычистить [target] с помощью [src]."))
				to_chat(target, span_warning("Ай! Это больно!"))
			uses -= 1
			if(uses == 0)
				qdel(src)
