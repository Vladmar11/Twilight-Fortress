/obj/effect/proc_holder/spell/targeted/create_seed
	name = "Чудо создания семян"
	range = -1
	overlay_state = "blesscrop"
	releasedrain = 30
	charge_max = 10 SECONDS
	req_items = list(
		/obj/item/clothing/neck/roguetown/psicross/dendor,
		/obj/item/clothing/mask/rogue/briar_mask,
	)
	cast_without_targets = TRUE
	sound = 'sound/magic/churn.ogg'
	associated_skill = /datum/skill/magic/druidic
	miracle = TRUE
	devotion_cost = 5

/obj/effect/proc_holder/spell/targeted/create_seed/proc/get_seeds_dict()
	var/list/allowed_seeds = list()

	allowed_seeds["Болотник"] = /obj/item/seeds/sweetleaf
	allowed_seeds["Дымолист"] = /obj/item/seeds/pipeweed
	allowed_seeds["Капуста"] = /obj/item/seeds/cabbage
	allowed_seeds["Картофель"] = /obj/item/seeds/potato
	allowed_seeds["Лук"] = /obj/item/seeds/onion
	allowed_seeds["Овес"] = /obj/item/seeds/wheat/oat
	allowed_seeds["Пшеница"] = /obj/item/seeds/wheat
	allowed_seeds["Яблоня"] = /obj/item/seeds/apple
	allowed_seeds["Ягодный куст (ядовитый)"] = /obj/item/seeds/berryrogue/poison
	allowed_seeds["Ягодный куст"] = /obj/item/seeds/berryrogue

	return allowed_seeds

/obj/effect/proc_holder/spell/targeted/create_seed/cast(list/targets, mob/user = usr)
	. = ..()

	var/list/seeds_dict = get_seeds_dict()

	var/selected_option = input(
		user,
		"Семена какого растения ты хочешь сделать?",
		"Создание семян"
	) as null | anything in seeds_dict

	if(!selected_option)
		revert_cast()
		return FALSE

	var/obj/item/seeds/seed_to_create = seeds_dict[selected_option]
	user.put_in_hands(new seed_to_create(get_turf(user)))
	return TRUE
