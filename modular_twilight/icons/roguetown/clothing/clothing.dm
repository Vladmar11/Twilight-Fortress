// Royal cloaks:
/obj/item/clothing/cloak/lordcloak/ladycloak
	name = "ladylike shortcloak"
	desc = "Ermine trimmed, handed down."
	color = null
	icon = 'modular_twilight/icons/roguetown/clothing/cloak.dmi'
	icon_state = "shortcloak"
	item_state = "shortcloak"
	alternate_worn_layer = CLOAK_BEHIND_LAYER
	slot_flags = ITEM_SLOT_BACK_R|ITEM_SLOT_CLOAK
	boobed = TRUE
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/cloak.dmi' 
	sleevetype = "shirt"
	nodismemsleeves = TRUE
	detail_tag = "_detail"

/obj/item/clothing/cloak/matron
	name = "matron cloak"
	desc = "A cloak that only the meanest of old crones bother to wear."
	icon_state = "matroncloak"
	icon = 'modular_twilight/icons/roguetown/clothing/cloak.dmi'
	mob_overlay_icon ='modular_twilight/icons/roguetown/clothing/onmob/cloak.dmi'
	body_parts_covered = CHEST|GROIN|VITALS|ARMS
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/cloak.dmi'
	sleevetype = "shirt"
	slot_flags = ITEM_SLOT_CLOAK
	flags_inv = HIDEBOOB|HIDECROTCH
	nodismemsleeves = TRUE

/obj/item/clothing/cloak/captain
	name = "captain's cape"
	desc = "A cape with a gold embroided heraldry of Rockhill."
	icon = 'modular_twilight/icons/roguetown/clothing/captain.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/captain.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/captain.dmi'
	sleevetype = "shirt"
	icon_state = "capcloak"
	detail_tag = "_detail"
	alternate_worn_layer = CLOAK_BEHIND_LAYER
	detail_color = CLOTHING_BLUE

/obj/item/clothing/cloak/captain/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

/obj/item/clothing/cloak/captain/lordcolor(primary,secondary)
	detail_color = primary
	update_icon()

/obj/item/clothing/cloak/captain/Initialize()
	. = ..()
	if(GLOB.lordprimary)
		lordcolor(GLOB.lordprimary,GLOB.lordsecondary)
	else
		GLOB.lordcolor += src

/obj/item/clothing/cloak/captain/Destroy()
	GLOB.lordcolor -= src
	return ..()

//Royal clothing:
//................ Royal Dress (Ball Gown)............... //

/obj/item/clothing/suit/roguetown/shirt/dress/royal
	slot_flags = ITEM_SLOT_SHIRT|ITEM_SLOT_ARMOR
	icon = 'modular_twilight/icons/roguetown/clothing/shirts_royalty.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/shirts_royalty.dmi'
	name = "royal gown"
	desc = "An elaborate ball gown, a favoured fashion of queens and elevated nobility in Enigma."
	body_parts_covered = CHEST|GROIN|ARMS|VITALS
	icon_state = "royaldress"
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/sleeves_shirts_royalty.dmi'
	boobed = TRUE
	detail_tag = "_detail"
	detail_color = CLOTHING_BLACK
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL

/obj/item/clothing/suit/roguetown/shirt/dress/royal/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

/obj/item/clothing/suit/roguetown/shirt/dress/royal/lordcolor(primary,secondary)
	detail_color = primary
	update_icon()

/obj/item/clothing/suit/roguetown/shirt/dress/royal/Initialize()
	. = ..()
	if(GLOB.lordprimary)
		lordcolor(GLOB.lordprimary,GLOB.lordsecondary)
	else
		GLOB.lordcolor += src

/obj/item/clothing/suit/roguetown/shirt/dress/royal/Destroy()
	GLOB.lordcolor -= src
	return ..()

//Queensleeves
/obj/item/clothing/wrists/roguetown/royalsleeves
	name = "royal sleeves"
	desc = "Sleeves befitting an elaborate gown."
	slot_flags = ITEM_SLOT_WRISTS
	icon = 'modular_twilight/icons/roguetown/clothing/wrists.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/wrists.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/wrists.dmi'
	icon_state = "royalsleeves"
	item_state = "royalsleeves"
	detail_tag = "_detail"
	detail_color = CLOTHING_BLACK

/obj/item/clothing/wrists/roguetown/royalsleeves/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

/obj/item/clothing/wrists/roguetown/royalsleeves/lordcolor(primary,secondary)
	detail_color = primary
	update_icon()

/obj/item/clothing/wrists/roguetown/royalsleeves/Initialize()
	. = ..()
	if(GLOB.lordprimary)
		lordcolor(GLOB.lordprimary,GLOB.lordsecondary)
	else
		GLOB.lordcolor += src

/obj/item/clothing/wrists/roguetown/royalsleeves/Destroy()
	GLOB.lordcolor -= src
	return ..()

/obj/item/clothing/head/roguetown/crown/consortcrown
	name = "jewel of Rockhill"
	icon = 'modular_twilight/icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/head.dmi'
	icon_state = "consortcrown"

//................ Princess Dress ............... //
/obj/item/clothing/suit/roguetown/shirt/dress/royal/princess
	slot_flags = ITEM_SLOT_SHIRT|ITEM_SLOT_ARMOR
	name = "pristine dress"
	desc = "A flowy, intricate dress made by the finest tailors in the land for the monarch's children."
	icon = 'modular_twilight/icons/roguetown/clothing/shirts_royalty.dmi'
	icon_state = "princess"
	boobed = TRUE
	detail_color = CLOTHING_PURPLE

//................ Prince Shirt   ............... //
/obj/item/clothing/suit/roguetown/shirt/dress/royal/prince
	slot_flags = ITEM_SLOT_SHIRT|ITEM_SLOT_ARMOR
	name = "gilded dress shirt"
	desc = "A gold-embroidered dress shirt specially tailored for the monarch's children."
	icon_state = "prince"
	boobed = TRUE
	detail_color = CLOTHING_BLUE

// End royal clothes

/obj/item/clothing/suit/roguetown/armor/leather/jacket/handjacket
	name = "noble jacket"
	icon_state = "handcoat"
	icon = 'modular_twilight/icons/roguetown/clothing/noble.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/noble.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/noble.dmi'
	detail_tag = "_detail"
	detail_color = CLOTHING_BLACK
	flags_inv = HIDEBOOB|HIDECROTCH

/obj/item/clothing/suit/roguetown/armor/leather/jacket/handjacket/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

/obj/item/clothing/suit/roguetown/armor/leather/jacket/handjacket/lordcolor(primary,secondary)
	detail_color = primary
	update_icon()

/obj/item/clothing/suit/roguetown/armor/leather/jacket/handjacket/Initialize()
	. = ..()
	if(GLOB.lordprimary)
		lordcolor(GLOB.lordprimary,GLOB.lordsecondary)
	else
		GLOB.lordcolor += src

/obj/item/clothing/suit/roguetown/armor/leather/jacket/handjacket/Destroy()
	GLOB.lordcolor -= src
	return ..()

/obj/item/clothing/suit/roguetown/shirt/robe/archivist
	name = "archivist's robe"
	desc = "Robes belonging to seekers of knowledge."
	icon_state = "archivist"
	icon = 'modular_twilight/icons/roguetown/clothing/shirts.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/shirts.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/sleeves_shirts.dmi'
	boobed = TRUE
	flags_inv = HIDEBOOB|HIDECROTCH
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	allowed_sex = list(MALE, FEMALE)
	color = null
	sellprice = 100

/obj/item/clothing/head/roguetown/stewardtophat
	name = "top hat"
	icon_state = "stewardtophat"
	icon = 'modular_twilight/icons/roguetown/clothing/noble.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/64x64/head.dmi'
	worn_x_dimension = 64
	worn_y_dimension = 64
	bloody_icon = 'icons/effects/blood.dmi'
	bloody_icon_state = "helmetblood"

/obj/item/clothing/suit/roguetown/armor/gambeson/steward
	name = "steward tailcoat"
	desc = "A thick, pristine leather tailcoat adorned with polished bronze buttons."
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/noble.dmi'
	icon_state = "stewardtailcoat"
	item_state = "stewardtailcoat"
	icon = 'modular_twilight/icons/roguetown/clothing/noble.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/noble.dmi'

/obj/item/clothing/suit/roguetown/shirt/dress/stewarddress
	name = "steward's dress"
	desc = "A victorian-styled black dress with shining bronze buttons."
	icon = 'modular_twilight/icons/roguetown/clothing/noble.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/noble.dmi'
	icon_state = "stewarddress"
	sleeved = FALSE
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_SHIRT

/obj/item/clothing/shoes/roguetown/nobleboot/thighboots
	name = "thigh boots"
	icon_state = "thighboot"
	icon = 'modular_twilight/icons/roguetown/clothing/noble.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/noble.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/noble.dmi'

/obj/item/clothing/suit/roguetown/shirt/tunic/noblecoat
	name = "элегантное одеяние"
	desc = "A fancy tunic and coat combo. How elegant."
	icon = 'modular_twilight/icons/roguetown/clothing/shirts.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/shirts.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/sleeves_shirts.dmi'
	icon_state = "noblecoat"
	sleevetype = "noblecoat"
	color = CLOTHING_WHITE
	boobed = TRUE
	flags_inv = HIDEBOOB|HIDECROTCH

/obj/item/clothing/suit/roguetown/shirt/undershirt/fancy
	name = "элегантная туника"
	desc = "A button-down shirt woven from fine sliks with a decorated front and cuffs."
	icon_state = "fancyshirt"
	icon = 'modular_twilight/icons/roguetown/clothing/noble.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/noble.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/noble.dmi'

/obj/item/clothing/suit/roguetown/shirt/undershirt/artificer
	name = "рубашка ремесленника"
	desc = "Typical fashion of the best Heartfelt engineers."
	icon = 'modular_twilight/icons/roguetown/clothing/shirts.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/shirts.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/sleeves_shirts.dmi'
	icon_state = "artishirt"
	flags_inv = HIDEBOOB

/obj/item/clothing/suit/roguetown/shirt/undershirt/lowcut
	name = "low cut tunic"
	desc = "A tunic exposing much of the shoulders and neck. Shoulders?! How scandalous..."
	icon = 'modular_twilight/icons/roguetown/clothing/shirts.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/shirts.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/sleeves_shirts.dmi'
	icon_state = "lowcut"
	flags_inv = HIDEBOOB

/obj/item/clothing/under/roguetown/skirt
	name = "юбка"
	desc = "Long, flowing, and modest."
	icon = 'modular_twilight/icons/roguetown/clothing/pants.dmi'
	icon_state = "skirt"
	item_state = "skirt"
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/pants.dmi'
	color = "#6b5445"

/obj/item/clothing/under/roguetown/skirt/random
	name = "skirt"

/obj/item/clothing/under/roguetown/skirt/random/Initialize()
	color = pick("#6b5445", "#435436", "#704542", "#79763f")
	return ..()

/obj/item/clothing/under/roguetown/skirt/black
	color = CLOTHING_BLACK

/obj/item/clothing/under/roguetown/skirt/green
	color = CLOTHING_DARK_GREEN

/obj/item/clothing/under/roguetown/skirt/blue
	color = CLOTHING_BLUE

/obj/item/clothing/under/roguetown/skirt/red
	color = CLOTHING_RED

/obj/item/clothing/head/roguetown/crownheart //Holds vars for children
	name = "crown of Heartfelt"
	desc = "Heavy is the weight of the crown, and even heavier the responsability it infers to its wearer."
	icon_state = "serpcrown"
	dynamic_hair_suffix = null
	sellprice = 200
	resistance_flags = FIRE_PROOF | ACID_PROOF
	anvilrepair = /datum/skill/craft/blacksmithing
	sewrepair = FALSE

/obj/item/clothing/head/roguetown/crown //Holds vars for children
	icon = 'modular_twilight/icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/head.dmi'
