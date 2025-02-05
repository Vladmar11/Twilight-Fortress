/obj/projectile/bullet/reusable/arrow/poison/fog
	name = "туманная стрела"
	desc = "An arrow with it's tip drenched in a powerful sedative."
	icon = 'modular_twilight/icons/roguetown/weapons/ammo.dmi'
	icon_state = "arrowfog_proj"
	ammo_type = /obj/item/ammo_casing/caseless/rogue/arrow

/obj/item/ammo_casing/caseless/rogue/arrow/poison/fog
	name = "туманная стрела"
	desc = "An arrow with it's tip drenched in a powerful sedative."
	projectile_type = /obj/projectile/bullet/reusable/arrow/poison/fog
	icon = 'modular_twilight/icons/roguetown/weapons/ammo.dmi'
	icon_state = "arrow_fog"

/obj/projectile/bullet/reusable/arrow/poison/fog/Initialize()
	. = ..()
	create_reagents(50, NO_REACT)

/obj/projectile/bullet/reusable/arrow/poison/fog/on_hit(atom/target, blocked = FALSE)
	if(iscarbon(target))
		var/mob/living/carbon/M = target
		if(blocked != 100) // not completely blocked
			if(M.can_inject(null, FALSE, def_zone)) // Pass the hit zone to see if it can inject by whether it hit the head or the body.
				..()
				reagents.reaction(M, INJECT)
				reagents.trans_to(M, reagents.total_volume)
				return BULLET_ACT_HIT
			else
				blocked = 100
				target.visible_message("<span class='danger'>\The [src] was deflected!</span>", \
									   "<span class='danger'>My armor protected me against \the [src]!</span>")

	..(target, blocked)
	DISABLE_BITFIELD(reagents.flags, NO_REACT)
	reagents.handle_reactions()
	return BULLET_ACT_HIT

/obj/projectile/bullet/reusable/arrow/poison/fog/Initialize()
	. = ..()
	reagents.add_reagent(/datum/reagent/fogblight, 5)

/obj/item/ammo_casing/caseless/rogue/bolt/poison/fog
	name = "туманный болт"
	desc = "A bolt dipped with a potent sedative."
	projectile_type = /obj/projectile/bullet/reusable/bolt/poison/fog
	possible_item_intents = list(/datum/intent/dagger/cut, /datum/intent/dagger/thrust)
	icon = 'modular_twilight/icons/roguetown/weapons/ammo.dmi'
	icon_state = "bolt_fog"

/obj/projectile/bullet/reusable/bolt/poison/fog
	name = "туманный болт"
	desc = "A bolt dipped with a potent sedative."
	damage = 35
	damage_type = BRUTE
	icon = 'modular_twilight/icons/roguetown/weapons/ammo.dmi'
	icon_state = "boltfogn_proj"
	ammo_type = /obj/item/ammo_casing/caseless/rogue/bolt

/obj/projectile/bullet/reusable/bolt/poison/fog/Initialize()
	. = ..()
	create_reagents(50, NO_REACT)

/obj/projectile/bullet/reusable/bolt/poison/fog/on_hit(atom/target, blocked = FALSE)
	if(iscarbon(target))
		var/mob/living/carbon/M = target
		if(blocked != 100) // not completely blocked
			if(M.can_inject(null, FALSE, def_zone)) // Pass the hit zone to see if it can inject by whether it hit the head or the body.
				..()
				reagents.reaction(M, INJECT)
				reagents.trans_to(M, reagents.total_volume)
				return BULLET_ACT_HIT
			else
				blocked = 100
				target.visible_message("<span class='danger'>\The [src] was deflected!</span>", \
									   "<span class='danger'>My armor protected me against \the [src]!</span>")

	..(target, blocked)
	DISABLE_BITFIELD(reagents.flags, NO_REACT)
	reagents.handle_reactions()
	return BULLET_ACT_HIT

/obj/projectile/bullet/reusable/bolt/poison/fog/Initialize()
	. = ..()
	reagents.add_reagent(/datum/reagent/fogblight, 5)

/datum/reagent/fogblight
	name = "fogblight"
	description = "liquid concentrate from fog island's frogs. Used by shinobis."
	taste_description = ""
	reagent_state = LIQUID
	color = "#1f434d"
	metabolization_rate = 0.2

/datum/reagent/fogblight/on_mob_life(mob/living/carbon/M)
	switch(current_cycle)
		if(1 to 10)
			M.confused += 2
			M.drowsyness += 2
		if(10 to 50)
			M.Sleeping(40, 0)
			. = 1
		if(51 to INFINITY)
			M.Sleeping(40, 0)
			M.adjustToxLoss((current_cycle - 50)*REM, 0)
			. = 1
	..()
