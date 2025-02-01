/obj/item/rogueweapon/mace/goden/otsuchi
	force = 10
	force_wielded = 25
	possible_item_intents = list(/datum/intent/mace/strike)
	gripped_intents = list(/datum/intent/mace/strike, /datum/intent/mace/smash)
	name = "otsuchi"
	desc = "A wooden greathammer of Abyssariad make, heavy enough to give any warrior pause. Often used by Yamabushi warriors."
	icon_state = "otsuchi"
	icon = 'modular_twilight/icons/roguetown/weapons/64.dmi'
	sharpness = IS_BLUNT
	wlength = WLENGTH_GREAT
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	associated_skill = /datum/skill/combat/maces
	smeltresult = /obj/item/ash
	swingsound = BLUNTWOOSH_HUGE
	max_integrity = 250
	minstr = 10
	wdefense = 3
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	bigboy = TRUE
	gripsprite = TRUE

/obj/item/rogueweapon/mace/goden/kanabo
	name = "kanabo"
	desc = "A heavy two handed club, reinforced with an iron sleeve. Most commonly seen in the hands of Onis and Yamabushis."
	icon_state = "kanabo"
	possible_item_intents = list(/datum/intent/mace/strike)
	gripped_intents = list(/datum/intent/mace/smash) //Can't spear people, but can make them bleed due to spikes.
	sharpness = IS_SHARP
	icon = 'modular_twilight/icons/roguetown/weapons/64.dmi'
	parrysound = "parrywood"
	swingsound = BLUNTWOOSH_MED
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	bigboy = TRUE
	gripsprite = TRUE
	slowdown = 1

/obj/item/rogueweapon/mace/goden/kanabo/dustcurse/dropped()
	. = ..()
	name = "Dustcurse kanabo"
	to_chat(src, "<span class='warning'>A haunting wind scatters [usr] into dust, sweeping it back to the ocean!</span>")
	minstr = 0 //asset solely to be used by NPCs. This will not be found on the hands of players.
	if(QDELETED(src))
		return
	qdel(src)

/obj/item/rogueweapon/mace/goden/steel/tetsubo
	name = "tetsubo"
	desc = "A heavier variant of the kanabo, fitted with a steel sleeve bearing menacing spikes and favored by Ogrun Warlords. Requires immense strength to use, but hits like a raging bull."
	icon_state = "tetsubo"
	possible_item_intents = list(/datum/intent/mace/strike)
	gripped_intents = list(/datum/intent/mace/smash) //Can't spear people, but can make them bleed due to spikes.
	sharpness = IS_SHARP
	icon = 'modular_twilight/icons/roguetown/weapons/64.dmi'
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64

/obj/item/rogueweapon/mace/goden/steel/tetsubo/dustcurse/dropped()
	. = ..()
	name = "Dustcurse tetsubo"
	minstr = 0 //asset solely to be used by NPCs. This will not be found on the hands of players.
	to_chat(src, "<span class='warning'>A haunting wind scatters [usr] into dust, sweeping it back to the ocean!</span>")
	if(QDELETED(src))
		return
	qdel(src)

/obj/item/rogueweapon/mace/ararebo
	name = "ararebo"
	icon = 'modular_twilight/icons/roguetown/weapons/32.dmi'
	icon_state = "ararebo"
	desc = "A large, iron-capped club used by Abyssariads as a armor-breaking tool. Most suitable to breach Grezenholftean cuirass while still holding a shield in the off-hand."

/obj/item/rogueweapon/mace/ararebo/dustcurse/dropped()
	. = ..()
	name = "Dustcurse ararebo"
	to_chat(src, "<span class='warning'>A haunting wind scatters [usr] into dust, sweeping it back to the ocean!</span>")
	if(QDELETED(src))
		return
	qdel(src)

/obj/item/rogueweapon/mace/ararebo/obsidian
	name = "obsidian club"
	icon_state = "obsidian_club"
	desc = "A large, wooden club with sharp flakes of obsidian embedded into it. Its appearance is similar to a flanged mace, but it inflicts deep cuts."
	max_integrity = 150
	wlength = WLENGTH_SHORT
	w_class = WEIGHT_CLASS_NORMAL
	sharpness = IS_SHARP
	wbalance = -1
	minstr = 0
	wdefense = 3

/obj/item/rogueweapon/mace/steel/ararebo
	name = "steel ararebo"
	icon = 'modular_twilight/icons/roguetown/weapons/32.dmi'
	icon_state = "sararebo"
	desc = "A large, steel-capped club used by Abyssariads as a armor-breaking tool. Most suitable to breach Grezenholftean cuirass while still holding a shield in the off-hand."

/obj/item/rogueweapon/mace/steel/ararebo/dustcurse/dropped()
	. = ..()
	name = "Dustcurse steel ararebo"
	to_chat(src, "<span class='warning'>A haunting wind scatters [usr] into dust, sweeping it back to the ocean!</span>")
	if(QDELETED(src))
		return
	qdel(src)

/obj/item/rogueweapon/mace/cudgel/rungu
	force = 15
	force_wielded = 20
	name = "rungu club"
	desc = "A more well defined, chiseled and ashed wooden club that can be throw at enemies. Used by Undine warriors."
	icon_state = "rungu"
	icon = 'modular_twilight/icons/roguetown/weapons/32.dmi'
	wbalance = 0
	wdefense = 1
	wlength = WLENGTH_NORMAL
	w_class = WEIGHT_CLASS_NORMAL
	max_integrity = 150
	possible_item_intents = list(/datum/intent/mace/strike/wood)
	gripped_intents = list(/datum/intent/mace/strike/wood, /datum/intent/mace/smash/wood)
	smeltresult = /obj/item/ash
	minstr = 0
	throwforce = 25

/obj/item/rogueweapon/mace/cudgel/jitte
	name = "jitte"
	desc = "An abyssariad Ashigaru guard weapon. The hook along the shaft allows the club to arrest a blade that has been parried, increasing the defensive utility of a otherwise simple baton."
	icon = 'modular_twilight/icons/roguetown/weapons/32.dmi'
	icon_state = "jitte"
	wdefense = 4
