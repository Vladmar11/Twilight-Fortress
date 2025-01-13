
/obj/item/clothing/shoes/roguetown/armor/leather
	name = "кожаные ботинки"
	desc = "Ботинки сделанные из кожи."
	max_integrity = 150
	icon_state = "leatherboots"
	salvage_amount = 1
	salvage_result = /obj/item/natural/hide/cured

/obj/item/clothing/shoes/roguetown/armor/leather/advanced
	name = "укрепленные кожаные ботинки"
	desc = "Прочные, долговечные, гибкие. Чудо темных веков, существующее исключительно для защиты ваших пальцев ног."
	max_integrity = 200
	icon_state = "leatherboots" //replace with advanced sprite
	prevent_crits = list(BCLASS_CUT, BCLASS_BLUNT, BCLASS_TWIST)
	armor = list("blunt" = 50, "slash" = 40, "stab" = 20, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/shoes/roguetown/armor/leather/masterwork
	name = "шедевральные кожаные ботинки"
	desc = "Эти ботинки – чудо мастерства. Сделано из лучшей кожи. Прочные, маневренные, надежные."
	icon_state = "leatherboots" //replace with masterwork sprite
	max_integrity = 300
	prevent_crits = list(BCLASS_CUT, BCLASS_BLUNT, BCLASS_TWIST, BCLASS_CHOP) //we're adding chop here!
	armor = list("blunt" = 80, "slash" = 60, "stab" = 40, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	filters = filter(type="drop_shadow", x=0, y=0, size=0.5, offset=1, color=rgb(218, 165, 32))
