/obj/item/clothing/neck/roguetown/chaincoif/karuta_zukin
	name = "карута цукин"
	desc = "Защитный капюшон, состоящий из прямоугольных пластин, пришитых к тканевой основе, обеспечивает более надежную защиту, оставаясь при этом гибким."
	icon_state = "karuta_zukin"
	item_state = "karuta_zukin"
	icon = 'modular_twilight/icons/roguetown/clothing/neck.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/neck.dmi'
	adjustable = CAN_CADJUST

/obj/item/clothing/neck/roguetown/chaincoif/karuta_zukin/random/Initialize()
	color = pick("#a32121", "#8747b1", "#3d3a36", "#414143", "#685542", "#428138", "#264d26", "#537bc6", "#b5b004", "#249589", "#ffffff", "#bd6606", "#962e5c")
	..()

/obj/item/clothing/neck/roguetown/chaincoif/karuta_zukin/military/Initialize()
	color = pick("#3d3a36", "#685542", "#264d26")
	..()

/obj/item/clothing/neck/roguetown/chaincoif/karuta_zukin/kabukimono
	color = "#9b874f"

/obj/item/clothing/neck/roguetown/chaincoif/karuta_zukin/AdjustClothes(mob/user)
	if(loc == user)
		if(adjustable == CAN_CADJUST)
			adjustable = CADJUSTED
			if(toggle_icon_state)
				icon_state = "[initial(icon_state)]_t"
			flags_inv = null
			body_parts_covered = NECK
			if(ishuman(user))
				var/mob/living/carbon/H = user
				H.update_inv_neck()
				H.update_inv_head()
		else if(adjustable == CADJUSTED)
			ResetAdjust(user)
			flags_inv = HIDEEARS|HIDEHAIR
			if(user)
				if(ishuman(user))
					var/mob/living/carbon/H = user
					H.update_inv_neck()
					H.update_inv_head()

/obj/item/clothing/neck/roguetown/chaincoif/iron/kusari_zukin
	name = "железный кусари цукин"
	desc = "Капюшон из клепаных железных колец, обычно надеваемый под кабуто или вместе с ним. \
	Защищает от порезов и рассечений, но не может так же эффективно отражать тупой урон."
	icon_state = "kusari_zukin"
	icon = 'modular_twilight/icons/roguetown/clothing/neck.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/neck.dmi'

/obj/item/clothing/neck/roguetown/psycross/silver/abyssanctum
	name = "амулет абиссанктум"
	desc = "Не отчаивайся в бездонных глубинах, ибо там, где меркнет свет, высекаются корабли могущества, как Абиссор и Псайдон ведут своих."
	icon = 'modular_twilight/icons/roguetown/clothing/neck.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/neck.dmi'
	icon_state = "abyssanctum"
	resistance_flags = FIRE_PROOF
	slot_flags = ITEM_SLOT_NECK|ITEM_SLOT_HIP|ITEM_SLOT_WRISTS

/obj/item/clothing/neck/roguetown/mercmedal/toweryakko
	name = "компрессор душ"
	desc = "Металлическое устройство из наследия Башни-Якко, использовавшееся для вечного заточения душ преступников и демонов. \
	Некогда страшная сила исчезла, когда моральное разложение Башни-Якко привело к их позору в глазах императора. "
	icon = 'modular_twilight/icons/roguetown/clothing/neck.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/neck.dmi'
	icon_state = "soul_compressor"

/obj/item/clothing/neck/roguetown/mercmedal/kabukimaru
	name = "бусины хихироканэ"
	desc = "Хихироканэ, или «Мифрил», - светящийся редкий металл, добываемый из бездонных глубин, где давление враждебно для большинства живых существ. \
	Изумианцы хранят ключ к его тайне, секрет, который гномы хотели бы заполучить любой ценой."
	icon = 'modular_twilight/icons/roguetown/clothing/neck.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/neck.dmi'
	icon_state = "mythrilbeads"
