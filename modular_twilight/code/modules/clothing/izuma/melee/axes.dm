/obj/item/rogueweapon/battle/ono
	slot_flags = ITEM_SLOT_HIP
	force = 15
	force_wielded = 25
	possible_item_intents = list(/datum/intent/axe/cut)
	name = "nagai ono"
	desc = "A battleaxe of Abyssariad design with a longer handle and shorter blade than its Humen counterpart. The increased leverage, reduced weight, and smaller striking area give it greater use against armor, while the longer handle makes it easier to parry with."
	icon_state = "ono"
	max_blade_int = 500
	smeltresult = /obj/item/ingot/steel
	gripped_intents = list(/datum/intent/axe/cut,/datum/intent/axe/battleaxe/chop/ono)
	parrysound = list('sound/combat/parry/wood/parrywood (1).ogg', 'sound/combat/parry/wood/parrywood (2).ogg', 'sound/combat/parry/wood/parrywood (3).ogg')
	swingsound = BLADEWOOSH_MED
	associated_skill = /datum/skill/combat/axes
	minstr = 8
	icon = 'modular_twilight/icons/roguetown/weapons/32.dmi'
	max_blade_int = 200
	max_integrity = 300
	wdefense = 6

/obj/item/rogueweapon/battle/getonmobprop(tag)
	if(tag)
		switch(tag)
			if("gen")
				return list("shrink" = 0.6,"sx" = -12,"sy" = -10,"nx" = 12,"ny" = -10,"wx" = -8,"wy" = -7,"ex" = 3,"ey" = -9,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 90,"sturn" = -90,"wturn" = -90,"eturn" = 90,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("wielded")
				return list("shrink" = 0.6,"sx" = -12,"sy" = 3,"nx" = 12,"ny" = 2,"wx" = -8,"wy" = 2,"ex" = 4,"ey" = 2,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 8,"wflip" = 8,"eflip" = 0)
			if("onbelt")
				return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0)
	return ..()

/obj/item/rogueweapon/thrown/ono
	slot_flags = ITEM_SLOT_HIP
	force = 15
	possible_item_intents = list(/datum/intent/axe/cut, /datum/intent/axe/chop) //Added chop because the throwing Ono is still suitable for woodcutting. It's a hatchet.
	name = "nage ono"
	desc = "A well-balanced, short-handled Abyssariad axe designed for throwing. Traditionally used as a hunting weapon as an alternative to archery, as bow wood is scarce on the Fog Isles."
	icon = 'modular_twilight/icons/roguetown/weapons/32.dmi'
	icon_state = "throwing_ono"
	max_blade_int = 500
	smeltresult = /obj/item/ash
	parrysound = list('sound/combat/parry/wood/parrywood (1).ogg', 'sound/combat/parry/wood/parrywood (2).ogg', 'sound/combat/parry/wood/parrywood (3).ogg')
	swingsound = BLADEWOOSH_MED
	wlength = WLENGTH_SHORT
	associated_skill = /datum/skill/combat/axes
	minstr = 6
	max_blade_int = 200
	max_integrity = 300
	wdefense = 3
	throwforce = 40
	embedding = list("embedded_pain_multiplier" = 3, "embed_chance" = 20, "embedded_fall_chance" = 60)

/obj/item/rogueweapon/woodcut/changfu
	name = "iron changfu"
	desc = "The tool of justice, hardwork and destruction, all in one."
	icon_state = "changfu"
	icon = 'modular_twilight/icons/roguetown/weapons/32.dmi'
	wdefense = 4 //Battle designed.

/datum/intent/axe/battleaxe/chop/ono //because actual battle axes don't have stupid large blades.
	name = "chop"
	icon_state = "inchop"
	blade_class = BCLASS_CHOP
	attack_verb = list("chops", "hacks")
	animname = "chop"
	hitsound = list('sound/combat/hits/bladed/genchop (1).ogg', 'sound/combat/hits/bladed/genchop (2).ogg', 'sound/combat/hits/bladed/genchop (3).ogg')
	penfactor = 70
	swingdelay = 1
	misscost = 10
