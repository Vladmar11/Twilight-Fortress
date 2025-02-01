/obj/item/clothing/mask/rogue/kaizoku
	icon = 'icons/roguetown/kaizoku/clothingicon/masks.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/masks.dmi'
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	body_parts_covered = FACE
	slot_flags = ITEM_SLOT_MASK

/obj/item/clothing/mask/rogue/kaizoku/menpo
	name = "iron men-yoroi"
	icon_state = "menyoroi"
	desc = "Ever since the Onis has been dignified on Abyssariad fold, they have been exalted in war masks - and this became their default pattern for menpos ever since. "
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

/obj/item/clothing/mask/rogue/kaizoku/menpo/half
	name = "iron half mempo"
	icon_state = "ironmempo"
	max_integrity = 100
	desc = "A cheaper menpo portraying the lower part of a Ogrun's head. It covers only the neck and the mouth."
	body_parts_covered = NECK|MOUTH
	flags_cover = HEADCOVERSMOUTH | MASKCOVERSMOUTH

/obj/item/clothing/mask/rogue/kaizoku/menpo/steel
	name = "steel men-yoroi"
	icon_state = "smenyoroi"
	max_integrity = 200
	armor = list("melee" = 80, "bullet" = 50, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)

/obj/item/clothing/mask/rogue/kaizoku/menpo/steel/half
	name = "steel mempo"
	icon_state = "steelmempo"
	desc = "The lower part of a menpo portraying the maws of a Ogrun's head. It covers only the neck and the mouth, often used by warriors that cares about their sight."
	max_integrity = 200
	body_parts_covered = NECK|MOUTH
	flags_cover = HEADCOVERSMOUTH | MASKCOVERSMOUTH

/obj/item/clothing/mask/rogue/kaizoku/menpo/facemask
	name = "iron Merkkin mask"
	icon_state = "irontribal"
	desc = "The old, barely used mask of the almost extinct Merkpeople, with fish-like characteristics. Usually used by Undines."
	max_integrity = 100
	body_parts_covered = FACE|MOUTH|EYES

/obj/item/clothing/mask/rogue/kaizoku/menpo/facemask/steel
	name = "steel tribal mask"
	icon_state = "steeltribal"
	max_integrity = 200

/obj/item/clothing/mask/rogue/kaizoku/menpo/facemask/colourable
	var/colorable_var
	var/picked

/obj/item/clothing/mask/rogue/kaizoku/menpo/facemask/colourable/tengu
	name = "tengu mask"
	icon_state = "colourable_tengumask"
	max_integrity = 200
	desc = "A mask that glorifies a Skylancer warrior. It portrays the exagerated perception over the race - even if they lack such noses and eyebrows."
	colorable_var = TRUE

/obj/item/clothing/mask/rogue/kaizoku/menpo/facemask/colourable/kitsune
	name = "changeling mask"
	icon_state = "colourable_kitsunemask"
	max_integrity = 200
	desc = "A mask that glorifies a Changeling warrior. It portrays the less exagerated perception over the race - since the mask's animalistic figure is no equal to their biology-defying skull."
	detail_tag = "_detail"
	colorable_var = TRUE

/obj/item/clothing/mask/rogue/kaizoku/menpo/facemask/colourable/oni
	name = "ogrun mask"
	icon_state = "colourable_onimask"
	max_integrity = 200
	desc = "A mask that glorifies a Ogrun warrior. It portrays the mostly perfect perception of the race, so efficiently it became the standards for Fog island military due to its intimidation value."
	colorable_var = TRUE

/obj/item/clothing/mask/rogue/kaizoku/menpo/facemask/colourable/attack_right(mob/user)
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

/obj/item/clothing/mask/rogue/kaizoku/menpo/steel/kitsune/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

/obj/item/clothing/mask/rogue/kaizoku/facemask/dishonor
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

/obj/item/clothing/mask/rogue/kaizoku/facemask/dishonor/Initialize()
	. = ..()
	name = "dishonor mask"
	ADD_TRAIT(src, TRAIT_NODROP, CURSED_ITEM_TRAIT)

/obj/item/clothing/mask/rogue/kaizoku/facemask/dishonor/dropped(mob/living/carbon/human/user)
	. = ..()
	if(QDELETED(src))
		return
	qdel(src)

/obj/item/clothing/mask/rogue/kaizoku/facemask/dishonor/obj_break(damage_flag)
	. = ..()
	if(QDELETED(src))
		return
	explode(src)
	qdel(src)

/obj/item/clothing/mask/rogue/kaizoku/facemask/dishonor/proc/explode(skipprob)
	STOP_PROCESSING(SSfastprocess, src)
	var/turf/T = get_turf(src)
	explosion(T, light_impact_range = 2, flame_range = 2, smoke = TRUE, soundin = pick('sound/misc/explode/bottlebomb (1).ogg','sound/misc/explode/bottlebomb (2).ogg'))

/obj/item/clothing/mask/rogue/kaizoku/eyeband
	name = "eye bands"
	icon_state = "eyeband"
	max_integrity = 20
	integrity_failure = 0.5
	body_parts_covered = EYES
	icon = 'icons/roguetown/kaizoku/clothingicon/masks.dmi'
	mob_overlay_icon = 'icons/roguetown/kaizoku/clothing/masks.dmi'

/obj/item/clothing/mask/rogue/kaizoku/eyeband/random/Initialize()
	color = pick("#a32121", "#8747b1", "#3d3a36", "#414143", "#685542", "#428138", "#264d26", "#537bc6", "#b5b004", "#249589", "#ffffff", "#bd6606", "#962e5c")
	..()

/obj/item/clothing/mask/rogue/kaizoku/eyeband/leonardo //katanas
	color = "#4f47be"

/obj/item/clothing/mask/rogue/kaizoku/eyeband/michelangelo //nunchucks
	color = "#a76e38"

/obj/item/clothing/mask/rogue/kaizoku/eyeband/donatello //bo staff
	color = "#65219c"

/obj/item/clothing/mask/rogue/kaizoku/eyeband/raphael //sais
	color = "#8a2d2d"
