/obj/item/clothing/wrists/roguetown
	slot_flags = ITEM_SLOT_WRISTS
	sleeved = 'icons/roguetown/clothing/onmob/wrists.dmi'
	icon = 'icons/roguetown/clothing/wrists.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/wrists.dmi'
	sleevetype = "shirt"
	w_class = WEIGHT_CLASS_SMALL
	sewrepair = TRUE
	fiber_salvage = FALSE

	grid_width = 32
	grid_height = 64

/obj/item/clothing/wrists/roguetown/bracers
	name = "наручи"
	desc = "Крепкие металлические наручи, отлично защищающие запястья."
	body_parts_covered = ARMS
	icon_state = "bracers"
	item_state = "bracers"
	armor = list("blunt" = 90, "slash" = 100, "stab" = 80, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	blocksound = PLATEHIT
	max_integrity = 300
	anvilrepair = /datum/skill/craft/blacksmithing
	smeltresult = /obj/item/ingot/steel
	sewrepair = FALSE

/obj/item/clothing/wrists/roguetown/bracers/leather
	name = "кожаные наручи"
	desc = "Наручи из кожи, защищающие запястья."
	icon_state = "lbracers"
	item_state = "lbracers"
	armor = list("blunt" = 32, "slash" = 12, "stab" = 22, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_BLUNT, BCLASS_TWIST)
	resistance_flags = null
	blocksound = SOFTHIT
	max_integrity = 200
	blade_dulling = DULLING_BASHCHOP
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	anvilrepair = null
	sewrepair = TRUE
	salvage_amount = 1
	salvage_result = /obj/item/natural/hide/cured

/obj/item/clothing/wrists/roguetown/bracers/leather/advanced
	name = "крепкие кожаные наручи"
	desc = "Hаручи из прочной кожи, которые еще больше защитят ваши запястья от ударов."
	icon_state = "albracers"
	armor = list("blunt" = 60, "slash" = 40, "stab" = 20, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_BLUNT, BCLASS_TWIST) //We're losing stab here
	max_integrity = 250

/obj/item/clothing/wrists/roguetown/bracers/leather/masterwork
	name = "шедевральные кожаные наручи"
	desc = "Эти наручи — чудо мастерства. Сделаны из лучшей кожи, потому прочные, легкие и надежные!"
	armor = list("blunt" = 80, "slash" = 60, "stab" = 40, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST) //We're getting chop here
	max_integrity = 300
	filters = filter(type="drop_shadow", x=0, y=0, size=0.5, offset=1, color=rgb(218, 165, 32))

/obj/item/clothing/wrists/roguetown/wrappings
	name = "солнечные обмотки"
	icon_state = "wrappings"
	item_state = "wrappings"

/obj/item/clothing/wrists/roguetown/nocwrappings
	name = "лунные обмотки"
	icon_state = "nocwrappings"
	item_state = "nocwrappings"

/obj/item/clothing/wrists/roguetown/splintarms
	name = "бригантинные рукава"
	desc = "Металлические наручи, наплечники и набор накладок. Предназначены для защиты рук, при этом обеспечивая почти полную свободу движений."
	body_parts_covered = ARMS
	icon_state = "splintarms"
	item_state = "splintarms"
	armor = list("blunt" = 60, "slash" = 70, "stab" = 70, "bullet" = 60, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT)
	blocksound = SOFTHIT
	max_integrity = 250
	anvilrepair = /datum/skill/craft/blacksmithing
	smeltresult = /obj/item/ingot/iron
	armor_class = ARMOR_CLASS_MEDIUM
	w_class = WEIGHT_CLASS_NORMAL
	resistance_flags = FIRE_PROOF
	sewrepair = FALSE
