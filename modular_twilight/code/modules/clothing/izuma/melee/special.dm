/obj/item/rogueweapon/tetsubishi //I humbly request someone to cook the 'jump' not causing damage.
	name = "тецубиси"
	desc = "Острый шипообразный предмет, используемый для замедления преследователя, часто используется шиноби."
	icon_state = "tetsubishi"
	icon = 'modular_twilight/icons/roguetown/weapons/32.dmi'
	force = 5
	throwforce = 10
	w_class = WEIGHT_CLASS_SMALL
	block_chance = 0
	armor_penetration = 5
	can_parry = FALSE
	wlength = 6
	sellprice = 1
	has_inspect_verb = TRUE
	parrysound = list('sound/combat/parry/parrygen.ogg')
	anvilrepair = /datum/skill/craft/blacksmithing
	obj_flags = CAN_BE_HIT
	blade_dulling = DULLING_BASH
	max_integrity = 60
	wdefense = 3
	experimental_onhip = TRUE
	experimental_onback = TRUE
	embedding = list(
		"embed_chance" = 60,
		"embedded_pain_multiplier" = 1,
		"embedded_fall_chance" = 0,
	)
	attack_verb = list("stabbed", "slashed", "sliced", "cut")
	hitsound = 'sound/blank.ogg'
	var/icon_prefix

/obj/item/rogueweapon/tetsubishi/Initialize()
	. = ..()
	AddComponent(/datum/component/izuma/caltrop, 20, 30, 100, CALTROP_BYPASS_SHOES)

/obj/item/rogueweapon/tetsubishi/Crossed(mob/living/L)
	playsound(loc, 'sound/foley/flesh_rem2.ogg', TRUE)
	return ..()

/datum/component/izuma/caltrop //Less laggy alternative for the server-destroying OG caltrops.
	var/min_damage
	var/max_damage
	var/probability
	var/flags

	var/cooldown = 0

/datum/component/izuma/caltrop/Initialize(_min_damage = 0, _max_damage = 0, _probability = 100,  _flags = NONE)
	min_damage = _min_damage
	max_damage = max(_min_damage, _max_damage)
	probability = _probability
	flags = _flags

	RegisterSignal(parent, list(COMSIG_MOVABLE_CROSSED), PROC_REF(Crossed))

/datum/component/izuma/caltrop/proc/Crossed(datum/source, atom/movable/AM)
	var/atom/A = parent
	if(!prob(probability))
		return

	if(ishuman(AM))
		var/mob/living/carbon/human/H = AM
		if((flags & CALTROP_IGNORE_WALKERS) && H.m_intent == MOVE_INTENT_WALK)
			return

		var/picked_def_zone = pick(BODY_ZONE_L_LEG, BODY_ZONE_R_LEG)
		var/obj/item/bodypart/O = H.get_bodypart(picked_def_zone)
		if(!istype(O))
			return

		var/feetCover = (H.wear_armor && (H.wear_armor.body_parts_covered & FEET)) || (H.wear_pants && (H.wear_pants.body_parts_covered & FEET))

		if(!(flags & CALTROP_BYPASS_SHOES) && (H.shoes || feetCover))
			return

		if((H.movement_type & FLYING) || H.buckled)
			return

		var/damage = rand(min_damage, max_damage)
		H.apply_damage(damage, BRUTE, picked_def_zone)


		if(cooldown < world.time - 10) //cooldown to avoid message spam.
			if(!H.incapacitated(ignore_restraints = TRUE))
				H.visible_message("<span class='danger'>[H] steps on [A] as it pierces skin.</span>", \
						"<span class='danger'>I feel my feet being pierced as I step on [A]!</span>")
			else
				H.visible_message("<span class='danger'>[H] slides their bodies on [A]!</span>", \
						"<span class='danger'>I slide on [A]!</span>")

			cooldown = world.time
		H.Stun(60)

/obj/item/throwing_star/ninja
	name = "сюрикэн"
	desc = "Простой отвлекающий инструмент, используемый для создания суматохи и кровотечения, чтобы его пользователь мог разбежаться."
	icon_state = "shuriken"
	icon = 'modular_twilight/icons/roguetown/weapons/32.dmi'
