/obj/item/clothing/shoes/roguetown
	name = "shoes"
	icon = 'icons/roguetown/clothing/feet.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/feet.dmi'
	desc = ""
	gender = PLURAL
	slot_flags = ITEM_SLOT_SHOES
	body_parts_covered = FEET
	sleeved = 'icons/roguetown/clothing/onmob/feet.dmi'
	sleevetype = "leg"
	bloody_icon_state = "shoeblood"
	equip_delay_self = 30
	w_class = WEIGHT_CLASS_SMALL
	sewrepair = TRUE

/obj/item/clothing/shoes/roguetown/shortboots
	name = "полусапоги"
	color = "#d5c2aa"
	desc = "Сапоги, которые немного короче лодыжек."
	icon_state = "shortboots"
	item_state = "shortboots"

/obj/item/clothing/shoes/roguetown/ridingboots
	name = "сапоги всадника"
	color = "#d5c2aa"
	desc = "Сапоги для тех, кто часто ездит верхом на сайгах."
	icon_state = "ridingboots"
	item_state = "ridingboots"

/obj/item/clothing/shoes/roguetown/gladiator
	name = "гладиаторские сандалии"
	desc = "Древняя обувь для сражения на арене, по собственной воле или нет."
	icon_state = "gladiator"
	item_state = "gladiator"

/obj/item/clothing/shoes/roguetown/sandals
	name = "сандалии"
	desc = "Открытая лёгкая обувь. Подошва закрепляется на ноге ремешками или верёвками."
	icon_state = "sandals"
	item_state = "sandals"

/obj/item/clothing/shoes/roguetown/jester
	name = "смешные туфли"
	desc = "Идеальны для исполнения джиги или спасения своей жизни после неудачной шутки."
	do_sound_bell = FALSE
	icon_state = "jestershoes"
	resistance_flags = null

/obj/item/clothing/shoes/roguetown/simpleshoes
	name = "простые туфли"
	desc = "Лучше, чем ходить босиком."
	icon_state = "simpleshoe"
	item_state = "simpleshoe"
	resistance_flags = null
	color = "#473a30"
	salvage_amount = 1
	salvage_result = /obj/item/natural/hide/cured

/obj/item/clothing/shoes/roguetown/simpleshoes/white
	color = null

/obj/item/clothing/shoes/roguetown/simpleshoes/buckle
	name = "башмаки"
	desc = "Простая обувь, популярная среди горожан и путешественников."
	icon_state = "buckleshoes"
	color = null

/obj/item/clothing/shoes/roguetown/simpleshoes/lord
	name = "благородные башмаки"
	desc = "Мягкая обувь из качественных материалов."
	icon_state = "simpleshoe"
	item_state = "simpleshoe"
	resistance_flags = null
	color = "#cbcac9"


// **ARMOURED** //


/obj/item/clothing/shoes/roguetown/armor //This subtype is for armoured shoes
	name = "темные сапоги"
	color = "#d5c2aa"
	desc = "Пара крепких сапог черного цвета. Защищают ноги."
	icon_state = "blackboots"
	item_state = "blackboots"
	blocksound = SOFTHIT //This hit sound is for leather
	prevent_crits = list(BCLASS_BLUNT, BCLASS_TWIST) //These match leather helmets
	armor = list("blunt" = 30, "slash" = 10, "stab" = 20, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/shoes/roguetown/armor/inqboots
	name = "Сапоги инквизитора"
	desc = "Потертые сапоги в пятнах от грязи. Со временем они научатся любить тебя."
	icon_state = "inqboots"
	item_state = "inqboots"
	blocksound = SOFTHIT //This hit sound is for leather
	prevent_crits = list(BCLASS_BLUNT, BCLASS_TWIST)
	armor = list("blunt" = 30, "slash" = 10, "stab" = 20, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/shoes/roguetown/armor/steel
	name = "сабатоны"
	desc = "Пластинчатые ботинки, выкованные из стали для защиты хрупких пальцев ног."
	icon_state = "armorboots"
	item_state = "armorboots"
	color = null
	blocksound = PLATEHIT
	anvilrepair = /datum/skill/craft/blacksmithing
	smeltresult = /obj/item/ingot/steel
	sewrepair = FALSE
	resistance_flags = FIRE_PROOF
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	armor = list("blunt" = 90, "slash" = 100, "stab" = 80, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

	// ----------------- BLACKSTEEL -----------------------

/obj/item/clothing/shoes/roguetown/boots/blacksteel/plateboots
	name = "сабатоны из черной стали"
	desc = "Пара сапог, выкованных из черной стали."
	body_parts_covered = FEET
	icon = 'icons/roguetown/clothing/special/blkknight.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/blkknight.dmi'
	icon_state = "bkboots"
	item_state = "bkboots"
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	color = null
	blocksound = PLATEHIT
	resistance_flags = FIRE_PROOF
	armor = list("blunt" = 90, "slash" = 100, "stab" = 80, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	anvilrepair = /datum/skill/craft/blacksmithing
	smeltresult = /obj/item/ingot/blacksteel
	

/obj/item/clothing/shoes/roguetown/armor/nobleboot
	name = "дворянские сапоги"
	desc = "Добротные сапоги из качественной темной кожи. Они плотные и не порвутся так просто."
	icon_state = "nobleboots"
	item_state = "nobleboots"
	armor = list("blunt" = 35, "slash" = 15, "stab" = 25, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/shoes/roguetown/armor/shalal
	name = "пулены"
	desc = "Пара башмачков с заостренными носами. Такие еще называют бабушами."
	icon_state = "shalal"
	item_state = "shalal"
	armor = list("blunt" = 25, "slash" = 20, "stab" = 25, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/shoes/roguetown/armor/grenzelhoft
	name = "грензельхофтские сапоги"
	desc = "Пара крепких сапог, которые носят наемники."
	icon_state = "grenzelboots"
	item_state = "grenzelboots"
	sleeved = 'icons/roguetown/clothing/onmob/helpers/stonekeep_merc.dmi'
	armor = list("blunt" = 15, "slash" = 15, "stab" = 15, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
