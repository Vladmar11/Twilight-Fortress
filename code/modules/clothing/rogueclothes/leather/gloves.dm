
/obj/item/clothing/gloves/roguetown/leather
	name = "кожаные перчатки"
	desc = "Кожаные перчатки, которые обычно носят рабочие что бы защитить пальцы от травм."
	icon_state = "leather_gloves"
	armor = list("blunt" = 30, "slash" = 10, "stab" = 20, "bullet" = 1, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_BLUNT)
	resistance_flags = null
	blocksound = SOFTHIT
	blade_dulling = DULLING_BASHCHOP
	max_integrity = 150
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	salvage_result = /obj/item/natural/hide/cured

/obj/item/clothing/gloves/roguetown/leather/black
	desc = "Leather gloves usually worn by laborers. Dyed black."
	color = "#6b6c6b"
	icon_state = "gloves_black"

/obj/item/clothing/gloves/roguetown/leather/advanced
	name = "укрепленные кожаные перчатки"
	desc = "Прочные, долговечные, гибкие. Чудо темных веков, существующее исключительно для защиты ваших пальцев."
	icon_state = "leathergloves_masterwork" //no advanced sprite
	max_integrity = 200
	prevent_crits = list(BCLASS_CUT, BCLASS_BLUNT, BCLASS_TWIST)
	armor = list("blunt" = 50, "slash" = 40, "stab" = 20, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/gloves/roguetown/leather/masterwork
	name = "шедевральные кожаные перчатки"
	desc = "Эти перчатки — чудо мастерства. Сделано из лучшей кожи. Прочные, маневренные, надежные."
	icon_state = "leathergloves_masterwork"
	max_integrity = 300
	prevent_crits = list(BCLASS_CUT, BCLASS_BLUNT, BCLASS_TWIST, BCLASS_CHOP) //we're adding chop here!
	armor = list("blunt" = 80, "slash" = 60, "stab" = 40, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/gloves/roguetown/leather/angle
	name = "heavy leather gloves"
	desc = "A thick pair of leather gloves."
	icon_state = "angle"
	armor = list("blunt" = 50, "slash" = 25, "stab" = 40, "bullet" = 5, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_BLUNT)
	resistance_flags = null
	blocksound = SOFTHIT
	max_integrity = 100
	blade_dulling = DULLING_BASHCHOP
	break_sound = 'sound/foley/cloth_rip.ogg'
	drop_sound = 'sound/foley/dropsound/cloth_drop.ogg'
	salvage_result = /obj/item/natural/fur
