/obj/item/clothing/neck/roguetown/chaincoif/karuta_zukin
	name = "karuta zukin"
	desc = "A protective hood composed of rectangular plates sewn onto a fabric backing, offering a more solid \
	defense while remaining flexible."
	icon_state = "karuta_zukin"
	item_state = "karuta_zukin"
	icon = 'modular_twilight/icons/roguetown/clothing/neck.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/neck.dmi'
	adjustable = CAN_CADJUST

/obj/item/clothing/neck/roguetown/chaincoif/karuta_zukin/random/Initialize()
	color = pick("#a32121", "#8747b1", "#3d3a36", "#414143", "#685542", "#428138", "#264d26", "#537bc6", "#b5b004", "#249589", "#ffffff", "#bd6606", "#962e5c")
	..()

/obj/item/clothing/neck/roguetown/chaincoif/karuta_zukin/military/Initialize()
	color = pick("#3d3a36", "#685542", "#264d26")
	..()

/obj/item/clothing/neck/roguetown/chaincoif/karuta_zukin/kabukimono
	color = "#9b874f"

/obj/item/clothing/neck/roguetown/chaincoif/karuta_zukin/AdjustClothes(mob/user)
	if(loc == user)
		if(adjustable == CAN_CADJUST)
			adjustable = CADJUSTED
			if(toggle_icon_state)
				icon_state = "[initial(icon_state)]_t"
			flags_inv = null
			body_parts_covered = NECK
			if(ishuman(user))
				var/mob/living/carbon/H = user
				H.update_inv_neck()
				H.update_inv_head()
		else if(adjustable == CADJUSTED)
			ResetAdjust(user)
			flags_inv = HIDEEARS|HIDEHAIR
			if(user)
				if(ishuman(user))
					var/mob/living/carbon/H = user
					H.update_inv_neck()
					H.update_inv_head()

/obj/item/clothing/neck/roguetown/chaincoif/iron/kusari_zukin
	name = "iron kusari zukin"
	desc = "A hood made of riveted iron rings usually worn beneath or alongside a Kabuto. \
	It protects against cuts and slashes - but cannot spread blunt damage as efficiently."
	icon_state = "kusari_zukin"
	icon = 'modular_twilight/icons/roguetown/clothing/neck.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/neck.dmi'

/obj/item/clothing/neck/roguetown/psycross/silver/abyssanctum
	name = "reformist abyssanctum amulet"
	desc = "Despair thee not at the abyssal depths, for where light doth fade, vessels of might shall be therein carved, as Abyssor and the Weeper guide their own."
	icon = 'modular_twilight/icons/roguetown/clothing/neck.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/neck.dmi'
	icon_state = "abyssanctum"
	resistance_flags = FIRE_PROOF
	slot_flags = ITEM_SLOT_NECK|ITEM_SLOT_HIP|ITEM_SLOT_WRISTS

/obj/item/clothing/neck/roguetown/mercmedal/toweryakko
	name = "soul compressor"
	desc = "A metallic device of Tower-Yakko legacy used to shackle criminal souls and demons to eternity. The once-feared power ceased when Tower-Yakko's moral decay led to their disgrace in the eyes of the emperor. "
	icon = 'modular_twilight/icons/roguetown/clothing/neck.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/neck.dmi'
	icon_state = "soul_compressor"

/obj/item/clothing/neck/roguetown/mercmedal/kabukimaru
	name = "hihiirokane beads"
	desc = "Hihiirokane, or 'Mythril', is a luminous, rare metal drawn from the abyssal depths where the pressure is hostile to most life. The Abyssariads holds the key to its mystery, a secret that dwarves would covet at any cost."
	icon = 'modular_twilight/icons/roguetown/clothing/neck.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/neck.dmi'
	icon_state = "mythrilbeads"
