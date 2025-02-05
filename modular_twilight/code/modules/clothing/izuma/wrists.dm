/obj/item/clothing/wrists/roguetown/bracers/kote
	name = "котэ"
	desc = "Сасинуки-котэ - бронированные рукава, связанные в куртку. Является одним из компонентов доспехов сангу, наряду с сунате и хайдате."
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
	name = "браслеты с божественным узором"
	desc = "Y-образные стальные пластины отмечают этот браслет везде, где на него обращают внимание, что особенно уместно для Псайдона."
	icon = 'modular_twilight/icons/roguetown/clothing/wrists.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/wrists.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/wrists.dmi'
	icon_state = "mountainstar"
	item_state = "mountainstar"

/obj/item/clothing/wrists/roguetown/izuma/dragonwrap
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
	name = "браслеты кхудагач"
	desc = "Вываренные в масле кожаные браслеты, предназначенные для защиты предплечий и запястий абиссариадских лучников, легкой кавалерии и земледельцев."
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
	name = "очистители"
	desc = "Благословенные перчатки для тех, кто верит, что может бить духов."
	icon = 'modular_twilight/icons/roguetown/clothing/wrists.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/wrists.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/wrists.dmi'
	icon_state = "shrinekeeper_gauntlet"
	sleevetype = "shirt"
	resistance_flags = FLAMMABLE
	sewrepair = TRUE
	anvilrepair = null
