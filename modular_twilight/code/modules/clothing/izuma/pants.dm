/obj/item/clothing/under/roguetown/chainlegs/iron/haidate_tatami
	name = "хайдатэ татами"
	desc = "Эластичная защита бедер с вшитыми в ткань чешуйками. Идеально подходит для ловкости во время боя."
	gender = PLURAL
	icon = 'modular_twilight/icons/roguetown/clothing/pants.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/pants.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_pants.dmi'
	icon_state = "haidate_tatami"
	item_state = "haidate_tatami"
	alternate_worn_layer = SHOESLEEVE_LAYER

/obj/item/clothing/under/roguetown/chainlegs/sendan
	name = "хайдатэ сендан"
	desc = "Сегментированная броня бедра с перекрывающимися пластинами позволяет участвовать в длительном бою, не создавая проблем с подвижностью."
	icon_state = "haidate_sendan"
	icon = 'modular_twilight/icons/roguetown/clothing/pants.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/pants.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_pants.dmi'
	alternate_worn_layer = SHOESLEEVE_LAYER

/obj/item/clothing/under/roguetown/platelegs/yoroihakama
	name = "йоройхакама"
	desc = "Хакама с экстремальным усилением пластин, с выступающими пластинами, защищающими бедра, и множеством сцепленных стальных пластин под тканью."
	gender = PLURAL
	icon = 'modular_twilight/icons/roguetown/clothing/pants.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/pants.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_pants.dmi'
	icon_state = "yoroihakama"
	item_state = "yoroihakama"
	alternate_worn_layer = SHOESLEEVE_LAYER

/obj/item/clothing/under/roguetown/izuma/yoroihakama/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

/obj/item/clothing/under/roguetown/trou/tobi
	name = "штаны тоби"
	desc = "Мешковатые брюки изуминского дизайна. Подходят для тех, кто работает в поле и избегает верховой езды."
	icon_state = "tobi"
	item_state = "tobi"
	icon = 'modular_twilight/icons/roguetown/clothing/pants.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/pants.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_pants.dmi'

/obj/item/clothing/under/roguetown/trou/tobi/random/Initialize()
	color = RANDOM_COLOUR
	..()

/obj/item/clothing/under/roguetown/trou/tobi/thunder
	name = "thunder tobi pants"
	color = CLOTHING_BLUE

/obj/item/clothing/under/roguetown/trou/tobi/storm
	name = "storm tobi pants"
	color = CLOTHING_PURPLE

/obj/item/clothing/under/roguetown/trou/tobi/ocean
	name = "ocean tobi pants"
	color = CLOTHING_MAJENTA

/obj/item/clothing/under/roguetown/trou/tobi/island
	name = "island tobi pants"
	color = CLOTHING_GREEN

/obj/item/clothing/under/roguetown/trou/tobi/dark
	color = CLOTHING_BLACK

/obj/item/clothing/under/roguetown/trou/tobi/kabukimono
	color = CLOTHING_WHITE

/obj/item/clothing/under/roguetown/trou/tobi/dragonslayer
	desc = "Baggy pants of abyssariad design. This one is coated in asbestos, and may be just as dangerous."
	color = "#3d4681"
	armor = list("melee" = 20, "bullet" = 0, "laser" = 75,"energy" = 75, "bomb" = 75, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/under/roguetown/trou/leather/fur
	name = "толстый тоби"
	icon_state = "furpants"
	desc = "Тоби, сделанный из зверей Дендора, чтобы последователи Абиссора могли его использовать."
	icon = 'modular_twilight/icons/roguetown/clothing/pants.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/pants.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_pants.dmi'

/obj/item/clothing/under/roguetown/trou/leather/fur/random/Initialize()
	color = RANDOM_COLOUR
	..()

/obj/item/clothing/under/roguetown/trou/leather/fur/dragonslayer
	resistance_flags = FIRE_PROOF | ACID_PROOF

/obj/item/clothing/under/roguetown/tights/hakama
	name = "хакама"
	icon_state = "hakama"
	alternate_worn_layer = SHOESLEEVE_LAYER
	desc = "Подходит для культистов на Туманных Островах, в которых большие боевые юбки не вредят их мужественности, в отличие от хрупкого имперского аналога."
	icon = 'modular_twilight/icons/roguetown/clothing/pants.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/pants.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_pants.dmi'

/obj/item/clothing/under/roguetown/tights/hakama/random/Initialize()
	color = RANDOM_COLOUR
	..()

/obj/item/clothing/under/roguetown/tights/hakama/eidolon
	color = CLOTHING_BLUE

/obj/item/clothing/under/roguetown/trou/leather/shinobizubon
	name = "шиноби зубон"
	desc = "Традиционные эластичные штаны со свободной посадкой на ногах с подвязками из прочной кожи под тканью и на лодыжках для предотвращения заеданий и шума."
	gender = PLURAL
	icon = 'modular_twilight/icons/roguetown/clothing/pants.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/pants.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_pants.dmi'
	icon_state = "shinobizubon"
	item_state = "shinobizubon"
	blocksound = SOFTHIT
	blade_dulling = DULLING_BASHCHOP
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	color = "#6a6896"

/obj/item/clothing/under/roguetown/izuma/ceramic
	name = "поножи марадера"
	desc = "Bone chausses chiseled into a mimicry of shells, equal to a lamellar of mollusk shells, so it better absorb and disperse impact."
	gender = PLURAL
	icon = 'modular_twilight/icons/roguetown/clothing/pants.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/pants.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_pants.dmi'
	icon_state = "marauder_leg"
	item_state = "marauder_leg"
	sewrepair = FALSE
	armor = list("melee" = 60, "bullet" = 60, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	max_integrity = 200
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT)
	armor_class = ARMOR_CLASS_MEDIUM
	body_parts_covered = GROIN|LEGS|FEET
	blocksound = PLATEHIT
	var/do_sound = FALSE
	drop_sound = 'sound/foley/dropsound/armor_drop.ogg'
	anvilrepair = /datum/skill/craft/blacksmithing
	alternate_worn_layer = SHOESLEEVE_LAYER

/obj/item/clothing/under/roguetown/platelegs/weepershanwenkai
	name = "нижняя половина шанвенкай"
	desc = "Нижняя часть доспеха шанвенкай, реликвия Изумы для высокопоставленных людей. \
	Обычно изготавливались из бронзы, но в нынешнюю эпоху стали изготавливаться из высококачественной стали."
	icon = 'modular_twilight/icons/roguetown/clothing/pants.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/pants.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_pants.dmi'
	icon_state = "weepershanwenkai"
	item_state = "weepershanwenkai"
	gender = PLURAL
	alternate_worn_layer = SHOESLEEVE_LAYER

/obj/item/clothing/under/roguetown/izuma/ceramic/light
	name = "ivory leg plates"
	desc = "The leg protection proper for Undine warriors."
	icon = 'modular_twilight/icons/roguetown/clothing/pants.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/pants.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_pants.dmi'
	max_integrity = 100
	armor = list("melee" = 40, "bullet" = 40, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CHOP, BCLASS_BLUNT)
	body_parts_covered = LEGS|FEET
	gender = PLURAL
	icon_state = "ivory_legs"
	item_state = "ivory_legs"

/obj/item/clothing/under/roguetown/izuma/tribal
	name = "tribal lowerhalf"
	desc = "piece of clothings usually used by Undine tribesmen of all genders."
	icon_state = "tribalcloth"
	icon = 'modular_twilight/icons/roguetown/clothing/pants.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/pants.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_pants.dmi'
