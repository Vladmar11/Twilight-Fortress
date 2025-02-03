/datum/intent/simple/beast_claws
	candodge = TRUE
	canparry = TRUE

/datum/intent/simple/beast_claws/slash
	name = "slash"
	blade_class = BCLASS_CUT
	attack_verb = list("claws", "mauls", "eviscerates", "slashes")
	animname = "cut"
	hitsound = "genslash"
	miss_sound = "bluntwooshlarge"
	item_d_type = "slash"
	miss_text = "рассекает воздух!"

/datum/intent/simple/beast_claws/stab
	name = "stab"
	blade_class = BCLASS_STAB
	attack_verb = list("stabs", "penetrates")
	animname = "stab"
	icon_state = "instab"
	penfactor = 25
	miss_text = "пронзает воздух!"

// - - -

/obj/item/rogueweapon/beast_claws
	name = "когти зверя"
	max_blade_int = INFINITY
	max_integrity = INFINITY
	associated_skill = /datum/skill/combat/unarmed
	wlength = WLENGTH_NORMAL
	sharpness = IS_SHARP_ACCURATE
	armor_penetration = 10
	item_flags = DROPDEL
	possible_item_intents = list(/datum/intent/simple/beast_claws/slash, /datum/intent/simple/beast_claws/stab)

	// Временная замена до момента появления спрайтера. Увы.
	item_state = null
	lefthand_file = null
	righthand_file = null
	icon = 'icons/roguetown/weapons/32.dmi'
	icon_state = "claw_r"

/obj/item/rogueweapon/beast_claws/Initialize()
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, TRAIT_GENERIC)
	ADD_TRAIT(src, TRAIT_NOEMBED, TRAIT_GENERIC)

// - - -

/obj/effect/proc_holder/spell/self/beast_claws
	name = "Когти зверя"
	desc = "Вытянутые когти подобные остырм лезвиям, способным как резать так и колоть. \
	Старшие друиды рассказывают легенду, согласно которым Дендор использовал свои зверские когти, \
	когда повздорил с Равоксом, богом войны. \
	Их битва длилась три дэя, во время которых леса было страшно даже заглядывать. \
	Однако, на четвертый дэй все стихо, боги помирились."
	overlay_state = "dendor"
	req_items = list(
		/obj/item/clothing/neck/roguetown/psicross/dendor,
		/obj/item/clothing/mask/rogue/briar_mask,
	)
	antimagic_allowed = TRUE
	charge_max = 2 SECONDS
	miracle = TRUE

/obj/effect/proc_holder/spell/self/beast_claws/cast(mob/living/user = usr)
	. = ..()

	var/is_ability_activated = FALSE

	var/obj/item/active_hand_item = user.get_active_held_item()

	// Предовтращение манипуляций с когтями оборотня.
	if(istype(active_hand_item, /obj/item/rogueweapon/werewolf_claw))
		revert_cast()
		return FALSE

	if(istype(active_hand_item, /obj/item/rogueweapon/beast_claws))
		is_ability_activated = TRUE

	user.dropItemToGround(active_hand_item, TRUE)

	if(is_ability_activated)
		qdel(active_hand_item)
		return TRUE

	user.put_in_hands(new /obj/item/rogueweapon/beast_claws(user), TRUE, FALSE, TRUE)
