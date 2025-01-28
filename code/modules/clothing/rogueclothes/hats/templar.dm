/obj/item/clothing/head/roguetown/helmet/heavy/templar
	emote_environment = 3
	adjustable = CAN_CADJUST
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	body_parts_covered = HEAD|EARS|HAIR|NOSE|EYES|MOUTH
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	block2add = FOV_BEHIND
	armor = list("blunt" = 90, "slash" = 100, "stab" = 80, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)

/obj/item/clothing/head/roguetown/helmet/heavy/templar/astrata
	name = "астратанский шлем"
	desc = "Шлем, который обычно носят тамплиеры на службе Астрате. Свет первенца всегда будет сиять внутри его гребня."
	icon_state = "astratahelm"
	item_state = "astratahelm"

/obj/item/clothing/head/roguetown/helmet/heavy/templar/astrata/alt
	desc = "Этот благословенный шлем излучает позолоченное золото и посеребренный металл — яркие цвета астратанского крестоносца."
	icon_state = "astratahelm_alt"
	item_state = "astratahelm_alt"
	adjustable = CANT_CADJUST

/obj/item/clothing/head/roguetown/helmet/heavy/templar/necra
	name = "некранский шлем"
	desc = "Шлем, который обычно носят тамплиеры на службе Некре. Пусть его скелетные черты напомнят вам о единственном, что гарантировано в жизни. Вы умрете."
	icon_state = "necrahelm"
	item_state = "necrahelm"

/obj/item/clothing/head/roguetown/helmet/heavy/templar/necra/alt
	desc = "Самый темный из черных, этот шлем с капюшоном напоминает голову палача, вселяя в тех, кто смотрит на него, страх того, что они тоже могут вскоре столкнуться с подругой Некрой."
	icon_state = "necrahelm_alt"
	item_state = "necrahelm_alt"
	adjustable = CANT_CADJUST

/obj/item/clothing/head/roguetown/helmet/heavy/templar/malum
	name = "маллумитский шлем"
	desc = "Выкованный в угольно-черном цвете, этот шлем украшен символом клинка на забрале, всегда напоминая своему владельцу о могущественном взгляде Малума."
	icon_state = "malumhelm"
	item_state = "malumhelm"
	adjustable = CANT_CADJUST

/obj/item/clothing/head/roguetown/helmet/heavy/templar/noc
	name = "ноктианский шлем"
	desc = "Шлем, который обычно носят тамплиеры на службе Нок. Без ночи не может быть дня, без Нок не может быть света в темный час."
	icon_state = "nochelm"
	item_state = "nochelm"

/obj/item/clothing/head/roguetown/helmet/heavy/templar/dendor
	name = "дендоритский шлем"
	desc = "Шлем, который обычно носят тамплиеры на службе Дендору. Его выступы почти напоминают ветки. Укоренитесь в земле, и вас никому на сдвинуть."
	icon_state = "dendorhelm"
	item_state = "dendorhelm"
	adjustable = CANT_CADJUST

/obj/item/clothing/head/roguetown/helmet/heavy/templar/ravox
	name = "равоксианский шлем"
	desc = "Салад, который обычно носят тамплиеры на службе у Равокса. Он напоминает сильно украшенный салат с козырьком."
	icon_state = "ravoxhelm"
	item_state = "ravoxhelm"

/obj/item/clothing/head/roguetown/helmet/sallet/eoran
	name = "эоранский шлем"
	desc = "Шлем, выкованный в стиле, типичном для прихожан Эорана. Простой, но практичный защитный предмет. На нем лежит несколько лавров из цветов и других ярких украшений, за которыми следуют несколько символов и стандартов главы пользователя, достижения или даже наказания."
	icon_state = "eorahelm"
	item_state = "eorahelm"

/obj/item/clothing/head/roguetown/helmet/heavy/templar/AdjustClothes(mob/user)
	playsound(user, "sound/items/visor.ogg", 100, TRUE, -1)

	if(adjustable == CAN_CADJUST)
		adjustable = CADJUSTED
		icon_state = "[initial(icon_state)]_raised"
		body_parts_covered = HEAD|HAIR|EARS
		flags_inv = HIDEEARS|HIDEHAIR
		flags_cover = null
		if(ishuman(user))
			var/mob/living/carbon/H = user
			H.update_inv_head()
		block2add = FOV_DEFAULT
	else if(adjustable == CADJUSTED)
		ResetAdjust(user)

	if(user)
		if(ishuman(user))
			var/mob/living/carbon/H = user
			H.update_inv_head()
	user.update_fov_angles()
