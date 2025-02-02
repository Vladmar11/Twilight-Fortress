/obj/item/clothing/mask/rogue/izuma
	icon = 'modular_twilight/icons/roguetown/clothing/masks.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/masks.dmi'
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	body_parts_covered = FACE
	slot_flags = ITEM_SLOT_MASK

/obj/item/clothing/mask/rogue/izuma/menpo
	name = "железный мен-йорои"
	icon_state = "menyoroi"
	desc = ""
	max_integrity = 100
	blocksound = PLATEHIT
	break_sound = 'sound/foley/breaksound.ogg'
	drop_sound = 'sound/foley/dropsound/armor_drop.ogg'
	resistance_flags = FIRE_PROOF
	armor = list("melee" = 80, "bullet" = 50, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	blocksound = PLATEHIT
	flags_inv = HIDEFACE
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH | MASKCOVERSMOUTH
	body_parts_covered = FACE|NECK
	block2add = FOV_BEHIND
	slot_flags = ITEM_SLOT_MASK|ITEM_SLOT_HIP
	experimental_onhip = TRUE
	sewrepair = FALSE

/obj/item/clothing/mask/rogue/izuma/menpo/half
	name = "железный полу-менпо"
	icon_state = "ironmempo"
	max_integrity = 100
	desc = "Дешевое менпо, изображающее нижнюю часть головы огруна. Она закрывает только шею и рот."
	body_parts_covered = NECK|MOUTH
	flags_cover = HEADCOVERSMOUTH | MASKCOVERSMOUTH

/obj/item/clothing/mask/rogue/izuma/menpo/steel
	name = "стальной менпо"
	icon_state = "smenyoroi"
	max_integrity = 200
	armor = list("melee" = 80, "bullet" = 50, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)

/obj/item/clothing/mask/rogue/izuma/menpo/steel/half
	name = "стальной мемпо"
	icon_state = "steelmempo"
	desc = "Нижняя часть менпо, изображающая пасть огруна. Она закрывает только шею и рот, часто используется воинами Изумы."
	max_integrity = 200
	body_parts_covered = NECK|MOUTH
	flags_cover = HEADCOVERSMOUTH | MASKCOVERSMOUTH

/obj/item/clothing/mask/rogue/izuma/menpo/facemask
	name = "железная маска мерккина"
	icon_state = "irontribal"
	desc = ""
	max_integrity = 100
	body_parts_covered = FACE|MOUTH|EYES

/obj/item/clothing/mask/rogue/izuma/menpo/facemask/steel
	name = "стальная племенная маска"
	icon_state = "steeltribal"
	max_integrity = 200

/obj/item/clothing/mask/rogue/izuma/menpo/facemask/colourable
	var/colorable_var
	var/picked

/obj/item/clothing/mask/rogue/izuma/menpo/facemask/colourable/tengu
	name = "маска тенгу"
	icon_state = "colourable_tengumask"
	max_integrity = 200
	desc = "Маска, прославляющая воина Изумы."
	colorable_var = TRUE

/obj/item/clothing/mask/rogue/izuma/menpo/facemask/colourable/kitsune
	name = "стальная маска кицунэ"
	icon_state = "colourable_kitsunemask"
	max_integrity = 200
	desc = "Маска, прославляющая воина Изумы. Изображает преувеличенное представление лисы, поражающим своей биологией."
	detail_tag = "_detail"
	colorable_var = TRUE

/obj/item/clothing/mask/rogue/izuma/menpo/facemask/colourable/oni
	name = "маска огрун"
	icon_state = "colourable_onimask"
	max_integrity = 200
	desc = "Маска, прославляющая воина. Она отображает в основном идеальное восприятие расы, поэтому стала стандартом для военных Туманных Островов, благодаря своей устрашающей ценности."
	colorable_var = TRUE

/obj/item/clothing/mask/rogue/izuma/menpo/facemask/colourable/attack_right(mob/user)
	if(colorable_var == TRUE)
		if(picked)
			return
		var/the_time = world.time
		if(world.time > (the_time + 30 SECONDS))
			return
		var/colorone = input(user, "Your emotions spreads your will.","Flush emotions within the threads.") as null|anything in CLOTHING_COLOR_NAMES
		if(!colorone)
			return
		picked = TRUE
		color = clothing_color2hex(colorone)
		update_icon()
		if(ismob(loc))
			var/mob/L = loc
			L.update_inv_wear_mask()
		return
	else
		return

/obj/item/clothing/mask/rogue/izuma/menpo/steel/kitsune/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

/obj/item/clothing/mask/rogue/izuma/facemask/dishonor
	name = "dishonor mask"
	desc = "Blackpowder-infused, soul-bound veil for dishonored Abyssariads as a consequence for bringing shame to their clan and traditions, for those unentitled to be called Abyssariads - the Burakumins (non-persons), such as prostitutes and beggars. If broken, it will explode."
	icon_state = "bmask"
	max_integrity = 300 //Unique and very protective. You will need it. Trust me.
	blocksound = PLATEHIT
	break_sound = 'sound/foley/breaksound.ogg'
	drop_sound = 'sound/foley/dropsound/armor_drop.ogg'
	resistance_flags = FIRE_PROOF
	armor = list("melee" = 60, "bullet" = 60, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT)
	flags_inv = HIDEFACE
	body_parts_covered = EYES | EARS | NOSE //Allows them to use their mouth due to the mouth opening.
	block2add = FOV_BEHIND
	slot_flags = ITEM_SLOT_MASK|ITEM_SLOT_HIP
	experimental_onhip = TRUE

/obj/item/clothing/mask/rogue/izuma/facemask/dishonor/Initialize()
	. = ..()
	name = "dishonor mask"
	ADD_TRAIT(src, TRAIT_NODROP, CURSED_ITEM_TRAIT)

/obj/item/clothing/mask/rogue/izuma/facemask/dishonor/dropped(mob/living/carbon/human/user)
	. = ..()
	if(QDELETED(src))
		return
	qdel(src)

/obj/item/clothing/mask/rogue/izuma/facemask/dishonor/obj_break(damage_flag)
	. = ..()
	if(QDELETED(src))
		return
	explode(src)
	qdel(src)

/obj/item/clothing/mask/rogue/izuma/facemask/dishonor/proc/explode(skipprob)
	STOP_PROCESSING(SSfastprocess, src)
	var/turf/T = get_turf(src)
	explosion(T, light_impact_range = 2, flame_range = 2, smoke = TRUE, soundin = pick('sound/misc/explode/bottlebomb (1).ogg','sound/misc/explode/bottlebomb (2).ogg'))

/obj/item/clothing/mask/rogue/izuma/eyeband
	name = "eye bands"
	icon_state = "eyeband"
	max_integrity = 20
	integrity_failure = 0.5
	body_parts_covered = EYES
	icon = 'modular_twilight/icons/roguetown/clothing/neck.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/masks.dmi'

/obj/item/clothing/mask/rogue/izuma/eyeband/random/Initialize()
	color = pick("#a32121", "#8747b1", "#3d3a36", "#414143", "#685542", "#428138", "#264d26", "#537bc6", "#b5b004", "#249589", "#ffffff", "#bd6606", "#962e5c")
	..()

/obj/item/clothing/mask/rogue/izuma/eyeband/leonardo //katanas
	color = "#4f47be"

/obj/item/clothing/mask/rogue/izuma/eyeband/michelangelo //nunchucks
	color = "#a76e38"

/obj/item/clothing/mask/rogue/izuma/eyeband/donatello //bo staff
	color = "#65219c"

/obj/item/clothing/mask/rogue/izuma/eyeband/raphael //sais
	color = "#8a2d2d"
