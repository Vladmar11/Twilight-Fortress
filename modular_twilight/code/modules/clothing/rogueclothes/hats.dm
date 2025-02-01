/obj/item/clothing/head/roguetown/roguehood/abyssor
	name = "капюшон глубин"
	desc = "Капюшон, который носят последователи Абиссора, с уникальной маской в форме коралла. Как они вообще в нем видят?"
	color = null
	icon = 'modular_twilight/icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/head.dmi'
	icon_state = "abyssorhood"
	item_state = "abyssorhood"
	body_parts_covered = NECK
	slot_flags = ITEM_SLOT_HEAD
	dynamic_hair_suffix = ""
	edelay_type = 1
	adjustable = CAN_CADJUST
	toggle_icon_state = TRUE
	max_integrity = 100

/obj/item/clothing/head/roguetown/helmet/heavy/abyssorgreathelm
	name = "Абиссоритский шлем"
	desc = "Шлем, который обычно носят храмовники, служащие Абиссору. Он пробуждает образы моря и угрожающих видов ракообразных."
	icon = 'modular_twilight/icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/head.dmi'
	icon_state = "abyssorgreathelm"
	item_state = "abyssorgreathelm"
	emote_environment = 3
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	block2add = FOV_BEHIND
	smeltresult = /obj/item/ingot/steel
