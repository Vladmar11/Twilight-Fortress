/obj/item/rogueweapon/huntingknife/kunai //Practically a villager knife with more utility. It helps others to climb walls.
	name = "kunai"
	desc = "A simple stabbing weapon made of iron which originated as a masonry or gardening tool, useful for climbing walls in similar ways to pitons."
	icon = 'modular_twilight/icons/roguetown/weapons/32.dmi'
	icon_state = "kunai"
	force = 8

/obj/item/rogueweapon/knife/kaiken
	name = "iron kaiken"
	desc = "The weapon laws in colonized Abyssariad islands, with high humen or elven population, forbade non-warriors from carrying blades in public, so abyssariad colonists made weapons such as this."
	icon = 'modular_twilight/icons/roguetown/weapons/32.dmi'
	icon_state = "kaiken"
	possible_item_intents = list(/datum/intent/dagger/thrust, /datum/intent/dagger/cut)
	force = 12
	smeltresult = /obj/item/ingot/iron
	sellprice = 15

/obj/item/rogueweapon/huntingknife/idagger/tanto
	name = "steel tanto"
	desc = "Initially a companion blade to the tachi in a zamurai's daisho, the tanto was later replaced by the wakizashi with the shift to infantry tactics after the Bloody Apotheosis."
	icon = 'modular_twilight/icons/roguetown/weapons/32.dmi'
	icon_state = "tanto"
	possible_item_intents = list(/datum/intent/dagger/cut, /datum/intent/dagger/thrust, /datum/intent/dagger/chop)
	force = 15
	smeltresult = /obj/item/ingot/steel
	wdefense = 3
	wbalance = 1
	sellprice = 20

/obj/item/rogueweapon/huntingknife/sai //I love gundam for helping me on my request on this sai. I love HIM!!!!!!!!!!!!! -Monochrome
	name = "sai"
	desc = "Recognizable by its uniqueness and typically carried in pairs, the sai features a sharply-tapered central rod with two prongs at the cross-guards. It lacks blade for cutting, but it excels in jabbing and defending against other weapons."
	icon = 'modular_twilight/icons/roguetown/weapons/32.dmi'
	icon_state = "sai"
	possible_item_intents = list(/datum/intent/dagger/thrust,/datum/intent/dagger/thrust/pick)
	w_class = WEIGHT_CLASS_NORMAL
	smeltresult = /obj/item/ingot/steel
	force = 12
	wdefense = 5
