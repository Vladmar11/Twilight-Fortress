/obj/item/clothing/shoes/roguetown/boots/armor/light/kusaritabi
	name = "kusari tabi"
	icon_state = "kusaritabi"
	item_state = "kusaritabi"
	desc = "The riveted chainmail version of the unarmored Tabi footwear."
	icon = 'modular_twilight/icons/roguetown/clothing/feet.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/feet.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/feet.dmi'

/obj/item/clothing/shoes/roguetown/boots/armor/suneate
	name = "suneate boots"
	desc = "Armored suneate made from steel offering heavy protection against both melee and ranged attacks."
	icon = 'modular_twilight/icons/roguetown/clothing/feet.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/feet.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/feet.dmi'
	icon_state = "suneate"
	item_state = "suneate"

/obj/item/clothing/shoes/roguetown/boots/jikatabi
	name = "jikatabi"
	desc = "A standard tabi that keeps the toes flexible and healthy, avoiding calluses of long expeditions. However, it looks rather goofy for the non-islanders."
	icon = 'modular_twilight/icons/roguetown/clothing/feet.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/feet.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/feet.dmi'
	icon_state = "jikatabi"
	item_state = "jikatabi"

/obj/item/clothing/shoes/roguetown/boots/jikatabi/shinobi
	color = CLOTHING_BLACK

/obj/item/clothing/shoes/roguetown/boots/jikatabi/dragontabi
	name = "dragontabi"
	icon_state = "dragontabi"
	item_state = "dragontabi"
	icon = 'modular_twilight/icons/roguetown/clothing/feet.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/feet.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/feet.dmi'
	desc = "A tabi reinforced in dragon bones and asbestos, making it fire immune. Not very protective against physical damage, but still fairly durable."
	armor = list("melee" = 40, "bullet" = 40, "laser" = 0,"energy" = 0, "bomb" = 60, "bio" = 0, "rad" = 0, "fire" = 100, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	max_integrity = 250
	armor_class = ARMOR_CLASS_MEDIUM
	heat_protection = LEGS|FEET
	body_parts_covered = LEGS|FEET
	resistance_flags = FIRE_PROOF|ACID_PROOF

/obj/item/clothing/shoes/roguetown/sandals/geta
	name = "geta"
	desc = "A normal wooden geta most suitable for those who need to wander where the mud absorbs pressure."
	icon = 'modular_twilight/icons/roguetown/clothing/feet.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/feet.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/feet.dmi'
	icon_state = "geta"
	item_state = "geta"

/obj/item/clothing/shoes/roguetown/shortboots/cloudhead
	name = "cloudhead shoes"
	desc = "A traditional shoes with distinctive upturned toe design that resembles the shape of clouds, to symbolize connection to the skies."
	icon = 'modular_twilight/icons/roguetown/clothing/feet.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/feet.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/feet.dmi'
	icon_state = "cloudhead_shoes"
	item_state = "cloudhead_shoes"

/obj/item/clothing/shoes/roguetown/shortboots/cloudhead/kabukimono
	name = "kabuki-maru cloudhead shoes"
	desc = "The same traditional cloudhead shoes of the Abyssariads, but colored in rich yellow tone and with intense implication of being used by a lowly burakumin whom belongs to an armed gang."
	color = "#9b874f"

/obj/item/clothing/shoes/roguetown/shortboots/cloudhead/toweryakkos
	name = "tower-yakko cloudhead shoes"
	desc = "The same traditional cloudhead shoes of the Abyssariads, but colored in rich purple tone and with intense implication of being used by a lowly burakumin whom belongs to an armed gang."
	color = "#804d97"

/obj/item/clothing/shoes/roguetown/ridingboots/gutal
	name = "leather gutal"
	desc = "The boots used by Abyssariad cavalry with upturned toes and durable, oil-boiled leather."
	icon_state = "leathergutal"
	item_state = "leathergutal"
	icon = 'modular_twilight/icons/roguetown/clothing/feet.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/feet.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/feet.dmi'
