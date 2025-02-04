/obj/item/clothing/mask/rogue/shepherd/shadowmask
	name = "purple halfmask"
	icon_state = "shadowmask"
	icon = 'modular_twilight/icons/roguetown/clothing/masks.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/masks.dmi'
	desc = "Tiny drops of white dye mark its front, not unlike teeth. A smile that leers from shadow."

/obj/item/clothing/mask/rogue/lordmask/shadowfacemask
	name = "ксайлианская маска"
	desc = "Ордер Ксайликса всегда казался загадочным и странным, и эта маска символизирует это."
	icon = 'modular_twilight/icons/roguetown/clothing/masks.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/masks.dmi'
	icon_state = "shadowfacemask"

/obj/item/clothing/mask/rogue/facemask/psydonmask
	name = "psydonian mask"
	desc = "A silver mask, forever locked in a rigor of uncontestable joy. The Order of Saint Xylix can't decide on whether it's meant to represent Psydon's 'mirthfulness', 'theatricality', or the unpredictable melding of both."
	icon = 'modular_twilight/icons/roguetown/clothing/masks.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/masks.dmi'
	icon_state = "psydonmask"
	item_state = "psydonmask"

/obj/item/clothing/mask/rogue/facemask/copper
	name = "copper mask"
	icon = 'modular_twilight/icons/roguetown/clothing/masks.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/masks.dmi'
	icon_state = "cmask"
	desc = "A heavy copper mask that conceals and protects the face, though not very effectively."
	max_integrity = 100
	blocksound = PLATEHIT
	break_sound = 'sound/foley/breaksound.ogg'
	drop_sound = 'sound/foley/dropsound/armor_drop.ogg'
	armor = list("blunt" = 50, "slash" = 50, "stab" = 50,  "piercing" = 50, "fire" = 0, "acid" = 0)
	flags_inv = HIDEFACE
	body_parts_covered = FACE
	block2add = FOV_BEHIND
	slot_flags = ITEM_SLOT_MASK|ITEM_SLOT_HIP
	experimental_onhip = TRUE
	sewrepair = FALSE
	anvilrepair = /datum/skill/craft/blacksmithing
	smeltresult = /obj/item/ingot/copper

/obj/item/clothing/mask/rogue/goggles
	name = "engineer's goggles"
	icon = 'modular_twilight/icons/roguetown/clothing/masks.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/masks.dmi'
	icon_state = "artigoggles"
	desc = "Protective goggles with green lenses. Perfect for staring into fires."
	resistance_flags = FIRE_PROOF
	slot_flags = list(ITEM_SLOT_HEAD, ITEM_SLOT_MASK)
	body_parts_covered = EYES
	toggle_icon_state = TRUE
	adjustable = CAN_CADJUST

/obj/item/clothing/mask/rogue/goggles/AdjustClothes(mob/user)
	if(loc == user)
		if(adjustable == CAN_CADJUST)
			adjustable = CADJUSTED
			if(toggle_icon_state)
				icon_state = "[initial(icon_state)]_t"
			flags_inv = null
			body_parts_covered = EYES
			if(ishuman(user))
				var/mob/living/carbon/H = user
				H.update_inv_wear_mask()
				H.update_inv_head()
		else if(adjustable == CADJUSTED)
			ResetAdjust(user)
			if(user)
				if(ishuman(user))
					var/mob/living/carbon/H = user
					H.update_inv_wear_mask()
					H.update_inv_head()
