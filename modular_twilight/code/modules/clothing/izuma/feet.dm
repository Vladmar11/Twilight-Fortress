/obj/item/clothing/shoes/roguetown/boots/armor/light/kusaritabi
	name = "кусари таби"
	icon_state = "kusaritabi"
	item_state = "kusaritabi"
	desc = "Клепаная цепная защита для небронированной обуви таби."
	icon = 'modular_twilight/icons/roguetown/clothing/feet.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/feet.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/feet.dmi'

/obj/item/clothing/shoes/roguetown/boots/armor/suneate
	name = "сабатоны сунэат"
	desc = "Бронированный сунэат из стали, обеспечивающий надежную защиту от атак как ближнего, так и дальнего боя."
	icon = 'modular_twilight/icons/roguetown/clothing/feet.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/feet.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/feet.dmi'
	icon_state = "suneate"
	item_state = "suneate"

/obj/item/clothing/shoes/roguetown/boots/jikatabi
	name = "чикатаби"
	desc = "Стандартные таби, которые сохраняют гибкость и здоровье пальцев ног, предотвращая появление мозолей от длительных экспедиций.\
	Однако для жителей других островов она выглядит довольно глупо."
	icon = 'modular_twilight/icons/roguetown/clothing/feet.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/feet.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/feet.dmi'
	icon_state = "jikatabi"
	item_state = "jikatabi"

/obj/item/clothing/shoes/roguetown/boots/jikatabi/shinobi
	color = CLOTHING_BLACK

/obj/item/clothing/shoes/roguetown/boots/jikatabi/dragontabi
	name = "драконтаби"
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
	name = "гета"
	desc = "Обычная деревянная гета, наиболее подходящая для тех, кому нужно бродить там, где грязь поглощает всех."
	icon = 'modular_twilight/icons/roguetown/clothing/feet.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/feet.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/feet.dmi'
	icon_state = "geta"
	item_state = "geta"

/obj/item/clothing/shoes/roguetown/shortboots/cloudhead
	name = "облачная обувь"
	desc = "Традиционная обувь с характерным вздернутым носком, напоминающим форму облаков, символизирующих связь с небом."
	icon = 'modular_twilight/icons/roguetown/clothing/feet.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/feet.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/feet.dmi'
	icon_state = "cloudhead_shoes"
	item_state = "cloudhead_shoes"

/obj/item/clothing/shoes/roguetown/shortboots/cloudhead/kabukimono
	name = "облачные туфли кабуки-мару"
	desc = "Все те же традиционные туфли Изумы, но окрашенные в насыщенный желтый цвет и с сильным намеком на то, \
	что их использует низкий буракумин, принадлежащий к вооруженной банде."
	color = "#9b874f"

/obj/item/clothing/shoes/roguetown/shortboots/cloudhead/toweryakkos
	name = "tower-yakko cloudhead shoes"
	desc = "The same traditional cloudhead shoes of the Abyssariads, but colored in rich purple tone and with intense implication of being used by a lowly burakumin whom belongs to an armed gang."
	color = "#804d97"

/obj/item/clothing/shoes/roguetown/ridingboots/gutal
	name = "кожаный гутал"
	desc = "Сапоги, используемые кавалерией Изумы, с загнутыми носками и прочной, вываренной в масле кожей."
	icon_state = "leathergutal"
	item_state = "leathergutal"
	icon = 'modular_twilight/icons/roguetown/clothing/feet.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/feet.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/feet.dmi'
