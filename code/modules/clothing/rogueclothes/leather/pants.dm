
/obj/item/clothing/under/roguetown/trou/leather
	name = "кожаные брюки"
	desc = "Брюки, сшитые из хорошей кожи."
	icon_state = "leatherpants"
	max_integrity = 130
	armor = list("blunt" = 50, "slash" = 25, "stab" = 40, "bullet" = 10, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB)
	salvage_result = /obj/item/natural/hide/cured

/obj/item/clothing/under/roguetown/trou/leather/advanced
	name = "крепкие кожаные шоссы"
	desc = "Прочная, долговечная и гибкая защита ног из крепкой кожи."
	icon_state = "leatherpants_masterwork" //no advanced sprite
	max_integrity = 200
	prevent_crits = list(BCLASS_CUT, BCLASS_BLUNT, BCLASS_TWIST)
	armor = list("blunt" = 70, "slash" = 60, "stab" = 30, "bullet" = 20, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/under/roguetown/trou/leather/masterwork
	name = "шедевральные кожаные шоссы"
	desc = "Эти шоссы – чудо мастерства. Сделаны из лучшей кожи, потому крепкие, легкие и надежные!"
	max_integrity = 250
	icon_state = "leatherpants_masterwork"
	prevent_crits = list(BCLASS_CUT, BCLASS_BLUNT, BCLASS_TWIST, BCLASS_CHOP)
	armor = list("blunt" = 100, "slash" = 70, "stab" = 40, "bullet" = 20, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	filters = filter(type="drop_shadow", x=0, y=0, size=0.5, offset=1, color=rgb(218, 165, 32))

/obj/item/clothing/under/roguetown/trou/leather/mourning
	name = "траурные брюки"
	desc = "Темные брюки, которые носят гробовщики при совершении погребальных обрядов."
	icon_state = "trou"
	color = "#151615"

//Gronn
/obj/item/clothing/under/roguetown/trou/nomadpants
	name = "nomad pants"
	desc = "Tight fitting leather pants worn under clothing of the steppes."
	icon_state = "nomadpants"
	max_integrity = 130
	armor = list("blunt" = 20, "slash" = 25, "stab" = 20, "bullet" = 5, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB)
	salvage_result = /obj/item/natural/hide/cured
