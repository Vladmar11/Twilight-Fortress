/obj/item/clothing/suit/roguetown/armor/plate/half/iron/goblin
	name = "полулаты гоблинов"
	icon_state = "plate_armor_item"
	item_state = "plate_armor"
	icon = 'icons/roguetown/mob/monster/goblins.dmi'
	smeltresult = /obj/item/ingot/iron
	allowed_race = GOBLIN_RACE_TYPES
	body_parts_covered = CHEST|GROIN|ARMS|LEGS|VITALS
	sellprice = 0

/obj/item/clothing/suit/roguetown/armor/leather/goblin
	name = "кожаная броня гоблинов"
	icon_state = "leather_armor_item"
	item_state = "leather_armor"
	icon = 'icons/roguetown/mob/monster/goblins.dmi'
	body_parts_covered = CHEST|GROIN|ARMS|VITALS
	allowed_race = GOBLIN_RACE_TYPES
	sellprice = 0

/obj/item/clothing/suit/roguetown/armor/leather/hide/goblin
	name = "обноски гоблинов"
	icon_state = "cloth_armor"
	item_state = "cloth_armor"
	icon = 'icons/roguetown/mob/monster/goblins.dmi'
	allowed_race = GOBLIN_RACE_TYPES
	armor = null
	sellprice = 0

/obj/item/clothing/head/roguetown/helmet/leather/goblin
	name = "кожаный шлем гоблинов"
	icon_state = "leather_helm_item"
	item_state = "leather_helm"
	icon = 'icons/roguetown/mob/monster/goblins.dmi'
	allowed_race = GOBLIN_RACE_TYPES
	sellprice = 0

/obj/item/clothing/head/roguetown/helmet/goblin
	name = "латный шлем гоблинов"
	icon_state = "plate_helm_item"
	item_state = "plate_helm"
	icon = 'icons/roguetown/mob/monster/goblins.dmi'
	allowed_race = GOBLIN_RACE_TYPES
	body_parts_covered = HEAD|EARS|HAIR|EYES
	sellprice = 0
	smeltresult = /obj/item/ingot/iron
