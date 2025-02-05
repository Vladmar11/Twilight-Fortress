//................ Briar Thorns ............... //	- Dendor Briar
/obj/item/clothing/head/roguetown/padded/briarthorns
	name = "briar thorns"
	desc = "The pain it causes perhaps can distract from the whispers of a mad God overpowering your sanity..."
	icon_state = "briarthorns"
	icon = 'modular_twilight/icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/head.dmi'

/obj/item/clothing/head/roguetown/padded/briarthorns/pickup(mob/living/user)
	. = ..()
	to_chat(user, span_warning ("The thorns prick me."))
	user.adjustBruteLoss(4)

//............... Simple Caps ............... //
/obj/item/clothing/head/roguetown/articap
	name = "кепочка ремесленника"
	desc = "Кепка с небольшим украшением в виде шестеренки. Популярная среди инженеров Хартфелта."
	icon_state = "articap"
	icon = 'modular_twilight/icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/head.dmi'

/obj/item/clothing/head/roguetown/duelhat //lifeweb sprite
	name = "duelist's hat"
	desc = "A feathered leather hat, to show them all your superiority."
	icon = 'modular_twilight/icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/head.dmi'
	icon_state = "duelhat"
	sewrepair = TRUE

/obj/item/clothing/head/roguetown/redmoonsosalbrimmed
	name = "brimmed hat"
	desc = "A simple brimmed hat that provides some relief from the sun."
	icon = 'modular_twilight/icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/head.dmi'
	icon_state = "brimmed"
	sewrepair = TRUE

//............... Miners Helmet ............... //
/obj/item/clothing/head/roguetown/helmet/leather/minershelm
	name = "miners helmet"
	desc = "Boiled leather kettle-like helmet with a headlamp, fueled by magiks."
	icon = 'modular_twilight/icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/head.dmi'
	icon_state = "minerslamp"
	item_state = "minerslamp"
	actions_types = list(/datum/action/item_action/toggle_helmet_light)
	sellprice = 35

	armor = list("blunt" = 25, "slash" = 25, "stab" = 25, "piercing" = 30, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_BITE, BCLASS_TWIST, BCLASS_BLUNT, BCLASS_CUT)

	var/brightness_on = 4 //less than a torch; basically good for one person.
	var/on = FALSE

/obj/item/clothing/head/roguetown/helmet/leather/minershelm/attack_self(mob/living/user)
	toggle_helmet_light(user)

/obj/item/clothing/head/roguetown/helmet/leather/minershelm/proc/toggle_helmet_light(mob/living/user)
	on = !on
	if(on)
		turn_on(user)
	else
		turn_off(user)
	update_icon()

/obj/item/clothing/head/roguetown/helmet/leather/minershelm/update_icon()
	icon_state = "minerslamp[on]"
	item_state = "minerslamp[on]"
	if(ishuman(loc))
		var/mob/living/carbon/human/H = loc
		H.update_inv_head()
	for(var/X in actions)
		var/datum/action/A = X
		A.UpdateButtonIcon(force = TRUE)
	..()

/obj/item/clothing/head/roguetown/helmet/leather/minershelm/proc/turn_on(mob/user)
	set_light(brightness_on)

/obj/item/clothing/head/roguetown/helmet/leather/minershelm/proc/turn_off(mob/user)
	set_light(0)

/obj/item/clothing/head/roguetown/roguehood/abyssor
	name = "depths hood"
	desc = "A hood worn by the followers of Abyssor, with a unique, coral-shaped mask. How do they even see out of this?"
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

//............... Feldshers Hood ............... //
/obj/item/clothing/head/roguetown/roguehood/ravox
	name = "justice hood"
	desc = ""
	icon = 'modular_twilight/icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/head.dmi'
	icon_state = "feldhood"
	item_state = "feldhood"
	color = null
	slot_flags = ITEM_SLOT_HEAD
	flags_inv = HIDEFACE|HIDEFACIALHAIR

//............... Physicians Hood ............... //
/obj/item/clothing/head/roguetown/roguehood/xylix
	name = "trickery hood"
	desc = ""
	icon = 'modular_twilight/icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/head.dmi'
	icon_state = "surghood"
	item_state = "surghood"
	color = null
	slot_flags = ITEM_SLOT_HEAD
	flags_inv = HIDEFACE|HIDEFACIALHAIR
	
/obj/item/clothing/head/roguetown/roguehood/shalal/xylixheavyhood
	name = "trickery hood"
	flags_inv = null
	desc = ""
	color = CLOTHING_BLACK
	item_state = "heavyhood"
	icon_state = "heavyhood"

/obj/item/clothing/head/roguetown/helmet/heavy/templar/abyssorgreathelm
	name = "abyssorite helmet"
	desc = "A helmet commonly worn by Templars in service to Abyssor. It evokes imagery of the sea with a menacing crustacean visage."
	icon = 'modular_twilight/icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/head.dmi'
	icon_state = "abyssorgreathelm"
	item_state = "abyssorgreathelm"
	emote_environment = 3
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	block2add = FOV_BEHIND
	smeltresult = /obj/item/ingot/steel

/obj/item/clothing/head/roguetown/helmet/heavy/xylixcagehelm
	name = "cage helmet"
	desc = "Headwear commonly worn by templars who worship Xylix. Life is a cage and we must all do our time."
	icon_state = "headcage"
	item_state = "headcage"
	icon = 'modular_twilight/icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/64x64/head.dmi'
	worn_x_dimension = 64
	worn_y_dimension = 64
	emote_environment = 3
	block2add = FOV_BEHIND
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	smeltresult = /obj/item/ingot/steel

/obj/item/clothing/head/roguetown/helmet/heavy/templar/xylixhelm
	name = "xylixian helmet"
	desc = "Стальной шлем, который обычно носят храмовники, поклоняющиеся Ксайликсу. Необычайно легкий, даже если он выглядит как стальной."
	icon_state = "briarhelm"
	item_state = "briarhelm"
	icon = 'modular_twilight/icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/head.dmi'
	emote_environment = 3
	block2add = FOV_BEHIND
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	armor_class = ARMOR_CLASS_LIGHT
	armor = list("blunt" = 60, "slash" = 70, "stab" = 60, "bullet" = 90, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	smeltresult = /obj/item/ingot/steel

/obj/item/clothing/head/roguetown/helmet/heavy/templar/pestrahelm
	name = "pestran helmet"
	desc = "A great helmet made of coarse, tainted steel. It is modeled after a plagued carrion, a blessed abomination of Pestra."
	icon_state = "pestrahelm"
	item_state = "pestrahelm"
	icon = 'modular_twilight/icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/head.dmi'
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	emote_environment = 3
	block2add = FOV_BEHIND
	smeltresult = /obj/item/ingot/steel

//......................................................................................................
/*------------------\
| Decorated helmets |
\------------------*/

/obj/item/clothing/head/roguetown/helmet/heavy/decoratedknighthelm
	name = "decorated knight helmet"
	desc = "A lavish knight's helmet which allows a crest to be mounted on top."
	block2add = FOV_BEHIND
	flags_inv = HIDEEARS|HIDEHAIR|HIDEFACIALHAIR|HIDEFACE
	emote_environment = 3
	icon_state = "decorated_knight"
	item_state = "decorated_knight"
	icon = 'modular_twilight/icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/64x64/head.dmi'
	worn_x_dimension = 64
	worn_y_dimension = 64
	var/picked = FALSE
	smeltresult = /obj/item/ingot/steel

/obj/item/clothing/head/roguetown/helmet/heavy/decoratedknighthelm/attack_right(mob/user)
	..()
	if(!picked)
		var/list/icons = list(
		"Basic"="basic_decoration",
		"Blue"="blue_decoration",
		"Stripes"="stripes_decoration",
		"Red Castle"="castle_red_decoration",
		"White Castle"="castle_white_decoration",
		"Nyrnhe"="graggar_decoration",
		"Efreet"="efreet_decoration",
		"Sun"="sun_decoration",
		"Feathers"="feathers_decoration",
		"Lion"="lion_decoration",
		"Red Dragon"="dragon_red_decoration",
		"Green Dragon"="dragon_green_decoration",
		"Horns"="horns_decoration",
		"Swan"="swan_decoration",
		"Fish"="fish_decoration",
		"Oathtaker"="oathtaker_decoration",
		"Skull"="skull_decoration")
		var/choice = input(user, "Choose a crest.", "Knightly crests") as anything in icons
		var/playerchoice = icons[choice]
		picked = TRUE
		icon_state = playerchoice
		item_state = playerchoice
		update_icon()
		if(loc == user && ishuman(user))
			var/mob/living/carbon/H = user
			H.update_inv_head()

/obj/item/clothing/head/roguetown/helmet/heavy/decoratedknighthelm/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)	

/obj/item/clothing/head/roguetown/helmet/heavy/decoratedhounskull
	name = "decorated hounskull"
	desc = "A lavish hounskull which allows a crest to be mounted on top."
	block2add = FOV_BEHIND
	flags_inv = HIDEEARS|HIDEHAIR|HIDEFACIALHAIR|HIDEFACE
	icon_state = "decorated_hounskull"
	item_state = "decorated_hounskull"
	icon = 'modular_twilight/icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/64x64/head.dmi'
	worn_x_dimension = 64
	worn_y_dimension = 64
	emote_environment = 3
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	var/picked = FALSE
	smeltresult = /obj/item/ingot/steel

/obj/item/clothing/head/roguetown/helmet/heavy/decoratedhounskull/attack_right(mob/user)
	..()
	if(!picked)
		var/list/icons = list(
		"Basic"="basic_houndecoration",
		"Blue"="blue_houndecoration",
		"Stripes"="stripes_houndecoration",
		"Red Castle"="castle_red_houndecoration",
		"White Castle"="castle_white_houndecoration",
		"Nyrnhe"="graggar_houndecoration",
		"Efreet"="efreet_houndecoration",
		"Sun"="sun_houndecoration",
		"Feathers"="feathers_houndecoration",
		"Lion"="lion_houndecoration",
		"Red Dragon"="dragon_red_houndecoration",
		"Green Dragon"="dragon_green_houndecoration",
		"Horns"="horns_houndecoration",
		"Swan"="swan_houndecoration",
		"Fish"="fish_houndecoration",
		"Oathtaker"="oathtaker_houndecoration",
		"Skull"="skull_houndecoration")
		var/choice = input(user, "Choose a crest.", "Knightly crests") as anything in icons
		var/playerchoice = icons[choice]
		picked = TRUE
		icon_state = playerchoice
		item_state = playerchoice
		update_icon()
		if(loc == user && ishuman(user))
			var/mob/living/carbon/H = user
			H.update_inv_head()

/obj/item/clothing/head/roguetown/helmet/heavy/decoratedhounskull/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

/obj/item/clothing/head/roguetown/helmet/heavy/decoratedbucket
	name = "decorated great helmet"
	desc = "A lavish greathelm which allows a crest to be mounted on top."
	block2add = FOV_BEHIND
	flags_inv = HIDEEARS|HIDEHAIR|HIDEFACIALHAIR|HIDEFACE
	icon_state = "decorated_bucket"
	item_state = "decorated_bucket"
	icon = 'modular_twilight/icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/64x64/head.dmi'
	worn_x_dimension = 64
	worn_y_dimension = 64
	max_integrity = 435
	emote_environment = 3
	var/picked = FALSE
	smeltresult = /obj/item/ingot/steel

/obj/item/clothing/head/roguetown/helmet/heavy/decoratedbucket/attack_right(mob/user)
	..()
	if(!picked)
		var/list/icons = list(
		"Basic"="basic_bucket",
		"Blue"="blue_bucket",
		"Stripes"="stripes_bucket",
		"Red Castle"="castle_red_bucket",
		"White Castle"="castle_white_bucket",
		"Nyrnhe"="graggar_bucket",
		"Efreet"="efreet_bucket",
		"Sun"="sun_bucket",
		"Feathers"="feathers_bucket",
		"Lion"="lion_bucket",
		"Red Dragon"="dragon_red_bucket",
		"Green Dragon"="dragon_green_bucket",
		"Horns"="horns_bucket",
		"Swan"="swan_bucket",
		"Fish"="fish_bucket",
		"Oathtaker"="oathtaker_bucket",
		"Skull"="skull_bucket")
		var/choice = input(user, "Choose a crest.", "Knightly crests") as anything in icons
		var/playerchoice = icons[choice]
		picked = TRUE
		icon_state = playerchoice
		item_state = playerchoice
		update_icon()
		if(loc == user && ishuman(user))
			var/mob/living/carbon/H = user
			H.update_inv_head()

/obj/item/clothing/head/roguetown/helmet/heavy/decoratedbucket/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)
	
/obj/item/clothing/head/roguetown/helmet/heavy/decoratedgbucket
	name = "decorated goldhelm"
	desc = "A lavish gold-trimmed greathelm which allows a crest to be mounted on top."
	block2add = FOV_BEHIND
	flags_inv = HIDEEARS|HIDEHAIR|HIDEFACIALHAIR|HIDEFACE
	icon_state = "decorated_gbucket"
	item_state = "decorated_gbucket"
	icon = 'modular_twilight/icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/64x64/head.dmi'
	worn_x_dimension = 64
	worn_y_dimension = 64
	max_integrity = 435
	emote_environment = 3
	var/picked = FALSE
	smeltresult = /obj/item/ingot/steel

/obj/item/clothing/head/roguetown/helmet/heavy/decoratedgbucket/attack_right(mob/user)
	..()
	if(!picked)
		var/list/icons = list(
		"Basic"="basic_gbucket",
		"Blue"="blue_gbucket",
		"Stripes"="stripes_gbucket",
		"Red Castle"="castle_red_gbucket",
		"White Castle"="castle_white_gbucket",
		"Nyrnhe"="graggar_gbucket",
		"Efreet"="efreet_gbucket",
		"Sun"="sun_gbucket",
		"Feathers"="feathers_gbucket",
		"Lion"="lion_gbucket",
		"Red Dragon"="dragon_red_gbucket",
		"Green Dragon"="dragon_green_gbucket",
		"Horns"="horns_gbucket",
		"Swan"="swan_gbucket",
		"Fish"="fish_gbucket",
		"Oathtaker"="oathtaker_gbucket",
		"Skull"="skull_gbucket")
		var/choice = input(user, "Choose a crest.", "Knightly crests") as anything in icons
		var/playerchoice = icons[choice]
		picked = TRUE
		icon_state = playerchoice
		item_state = playerchoice
		update_icon()
		if(loc == user && ishuman(user))
			var/mob/living/carbon/H = user
			H.update_inv_head()

/obj/item/clothing/head/roguetown/helmet/heavy/decoratedgbucket/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)


/obj/item/clothing/head/roguetown/helmet/decoratedbascinet
	name = "decorated bascinet"
	desc = "A simple steel helmet that can be decorated with a crest. Somewhat basic, but you'll be the envy of those who cannot afford such a fancy helmet."
	icon = 'modular_twilight/icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/64x64/head.dmi'
	icon_state = "decorated_bascinet"
	sellprice = 30
	equip_delay_self = 2 SECONDS
	unequip_delay_self = 2 SECONDS
	block2add = null
	body_parts_covered = HEAD|HAIR|EARS
	worn_x_dimension = 64
	worn_y_dimension = 64
	max_integrity = 250
	emote_environment = 3
	flags_inv = HIDEHAIR|HIDEEARS
	armor_class = ARMOR_CLASS_MEDIUM
	var/picked = FALSE
	smeltresult = /obj/item/ingot/steel

/obj/item/clothing/head/roguetown/helmet/decoratedbascinet/attack_right(mob/user)
	..()
	if(!picked)
		var/list/icons = list(
		"Basic"="basic_bascinet",\
		"Blue"="blue_bascinet",\
		"Stripes"="stripes_bascinet",\
		"Red Castle"="castle_red_bascinet",\
		"White Castle"="castle_white_bascinet",\
		"Graggar"="graggar_bascinet",\
		"Efreet"="efreet_bascinet",\
		"Sun"="sun_bascinet",\
		"Peace"="peace_bascinet",\
		"Feathers"="feathers_bascinet",\
		"Lion"="lion_bascinet",\
		"Red Dragon"="dragon_red_bascinet",\
		"Green Dragon"="dragon_green_bascinet",\
		"Horns"="horns_bascinet",\
		"Swan"="swan_bascinet",\
		"Fish"="fish_bascinet",\
		"Windmill"="windmill_bascinet",\
		"Oathtaker"="oathtaker_bascinet",\
		"Skull"="skull_bascinet")
		var/choice = input(user, "Choose a crest.", "Knightly crests") as anything in icons
		var/playerchoice = icons[choice]
		picked = TRUE
		icon_state = playerchoice
		item_state = playerchoice
		update_icon()
		if(loc == user && ishuman(user))
			var/mob/living/carbon/H = user
			H.update_inv_head()

/obj/item/clothing/head/roguetown/helmet/decoratedbascinet/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

//................ Kettle Helmet (Slitted)............... //
/obj/item/clothing/head/roguetown/helmet/kettle/slit
	name = "капеллина с разрезами"
	desc = "A lightweight steel helmet generally worn by crossbowmen and garrison archers. This one has eyeslits for the paranoid."
	icon = 'modular_twilight/icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/head.dmi'
	icon_state = "slitkettle"
	body_parts_covered = HEAD|HAIR|EARS
