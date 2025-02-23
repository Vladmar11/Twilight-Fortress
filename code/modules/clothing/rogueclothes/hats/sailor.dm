/obj/item/clothing/head/roguetown/helmet/tricorn
	slot_flags = ITEM_SLOT_HEAD
	name = "шляпа-треуголка"
	desc = "Кожаная шляпа треугольной формы, особо популярная среди мореходов."
	body_parts_covered = HEAD|HAIR|EARS|NOSE
	icon_state = "tricorn"
	armor = list("blunt" = 47, "slash" = 27, "stab" = 37, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_BLUNT, BCLASS_TWIST)
	anvilrepair = null
	smeltresult = null
	sewrepair = TRUE
	blocksound = SOFTHIT

/obj/item/clothing/head/roguetown/helmet/tricorn/skull
	icon_state = "tricorn_skull"
	desc = "Кожаная шляпа треугольной формы. На одной из сторон вышит череп - яркий символ пиратства."

/obj/item/clothing/head/roguetown/helmet/tricorn/lucky
	name = "счастливая треуголка"
	desc = "Обветренная треуголка, повидавшая множество сражений. С ней на голове тебе обязательно повезет."
	armor = list("blunt" = 60, "slash" = 40, "stab" = 45, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/head/roguetown/helmet/bandana
	slot_flags = ITEM_SLOT_HEAD
	name = "бандана"
	desc = "Простая бандана из кожи, закрывающая голову, нос и уши."
	body_parts_covered = HEAD|HAIR|EARS|NOSE
	icon_state = "bandana"
	armor = list("blunt" = 47, "slash" = 27, "stab" = 37, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_BLUNT, BCLASS_TWIST)
	anvilrepair = null
	smeltresult = null
	sewrepair = TRUE
	blocksound = SOFTHIT
