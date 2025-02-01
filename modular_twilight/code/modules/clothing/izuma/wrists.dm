obj/item/clothing/wrists/roguetown/bracers/kote
	name = "kote"
	desc = "A sashinuki kote, the armored sleeves and gloves knitted into a jacketed layer. It belongs as one of the armor component of sangu, together with suneate and haidate."
	icon = 'modular_twilight/icons/roguetown/clothing/wrists.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/wrists.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/wrists.dmi'
	body_parts_covered = ARMS|HANDS //bracer that protects hands and arms. Costier. Why no one made something with this theme before?
	icon_state = "kote"
	item_state = "kote"

/obj/item/clothing/wrists/roguetown/bracers/kote/cursed/Initialize()
	. = ..()
	name = "soulbinded kote"
	ADD_TRAIT(src, TRAIT_NODROP, CURSED_ITEM_TRAIT)

/obj/item/clothing/wrists/roguetown/bracers/mountainstar
	name = "weeping god-patterned bracers"
	desc = "Y-shaped steel plates marks this bracer everywhere it is looked upon, most proper for the Weeping God."
	icon = 'modular_twilight/icons/roguetown/clothing/wrists.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/wrists.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/wrists.dmi'
	icon_state = "mountainstar"
	item_state = "mountainstar"

/obj/item/clothing/wrists/roguetown/kaizoku/dragonwrap
	name = "dragon wrappings"
	desc = "fireproof cloth wrappings to cover the arms and hands. It is completely made of asbestos and resin keeping its toxicity in place. For now."
	slot_flags = ITEM_SLOT_WRISTS
	icon_state = "dragonwrap"
	item_state = "dragonwrap"
	icon = 'modular_twilight/icons/roguetown/clothing/wrists.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/wrists.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/wrists.dmi'
	armor = list("melee" = 20, "bullet" =20, "laser" = 0,"energy" = 0, "bomb" = 50, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 0)
	heat_protection = ARMS|HANDS
	resistance_flags = FIRE_PROOF | ACID_PROOF

/obj/item/clothing/wrists/roguetown/bracers/leather/khudagach
	name = "khudagach bracers"
	desc = "Oil-boiled leather bracers made to protect the forearms and wrists of abyssariad archers, light cavalry and farming folk."
	icon_state = "khudagach"
	item_state = "khudagach"
	icon = 'modular_twilight/icons/roguetown/clothing/wrists.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/wrists.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/wrists.dmi'

/obj/item/clothing/wrists/roguetown/bracers/bonebracer
	name = "bone bracers"
	desc = "the bracers made of bone, usually created and used by tribalistic Undines."
	armor = list("melee" = 40, "bullet" = 30, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	icon = 'modular_twilight/icons/roguetown/clothing/wrists.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/wrists.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/wrists.dmi'
	icon_state = "bonebracers"
	item_state = "bonebracers"
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_TWIST)
	resistance_flags = null
	blocksound = SOFTHIT
	smeltresult = /obj/item/ash
	blade_dulling = DULLING_BASHCHOP
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	anvilrepair = null
	sewrepair = FALSE

/obj/item/clothing/wrists/roguetown/shrinekeeper
	slot_flags = ITEM_SLOT_WRISTS
	name = "purificators"
	desc = "Blessed gauntlets for those who believes they can punch spirits."
	icon = 'modular_twilight/icons/roguetown/clothing/wrists.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/wrists.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/wrists.dmi'
	icon_state = "shrinekeeper_gauntlet"
	sleevetype = "shirt"
	resistance_flags = FLAMMABLE
	sewrepair = TRUE
	anvilrepair = null
