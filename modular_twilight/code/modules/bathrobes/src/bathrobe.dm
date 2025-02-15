/obj/item/clothing/suit/roguetown/shirt/robe/bath
	name = "банный халат"
	desc = "Халат с роскошной меховой отделкой."

	icon = 'modular_twilight/code/modules/bathrobes/icons/object.dmi'
	sleeved = 'modular_twilight/code/modules/bathrobes/icons/sleeves.dmi'
	mob_overlay_icon = 'modular_twilight/code/modules/bathrobes/icons/on_mob.dmi'

	icon_state = "bathrobe"
	adjustable = CAN_CADJUST
	body_parts_covered = ARM_LEFT | ARM_RIGHT
	flags_inv = HIDEBOOB
	sellprice = 10

/obj/item/clothing/suit/roguetown/shirt/robe/bath/AdjustClothes(mob/user)
	switch(adjustable)
		if(CAN_CADJUST)
			icon_state = "[initial(icon_state)]_t"
			body_parts_covered = ARM_LEFT | ARM_RIGHT | CHEST | GROIN
			flags_inv = HIDEBOOB | HIDECROTCH
			adjustable = CADJUSTED

		if(CADJUSTED)
			ResetAdjust(user)

	if(ishuman(user))
		var/mob/living/carbon/human/character = user
		character.update_inv_armor()
		character.update_icon()
