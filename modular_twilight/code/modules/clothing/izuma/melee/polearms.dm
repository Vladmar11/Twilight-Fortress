//All the items in this folder and its subdirectories are licensed under a proprietary agreement between client: [Vladmar] and artist: [SayonaraEcho].

//Redistribution, reproduction, or modification of these assets is prohibited without express permission from both licensors. 
//These assets are for use solely within this project and may not be extracted or repurposed for other projects or commercial use.

/obj/item/rogueweapon/mancatcher
	force = 10
	force_wielded = 20
	possible_item_intents = list(/datum/intent/spear/bash)
	gripped_intents = list(/datum/intent/spear/bash, /datum/intent/polearm/thrust/mancatcher)
	name = "сасумата"
	desc = "Уникальный шестопер с пружинящими клещами на конце, утыканными шипами, призванными причинять сильную боль, а не ранить."
	icon_state = "sasumata"
	icon = 'modular_twilight/icons/roguetown/weapons/64.dmi'
	wlength = WLENGTH_GREAT
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	blade_dulling = DULLING_BASHCHOP
	walking_stick = TRUE
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	max_blade_int = 120
	max_integrity = 200
	wdefense = 5
	gripsprite = TRUE
	associated_skill = /datum/skill/combat/polearms
	embedding = list(
		"embed_chance" = 75,
		"embedded_pain_multiplier" = 10,
		"embedded_fall_chance" = 0,
	)

/datum/intent/polearm/thrust/mancatcher //giving it pain, because it having a 'struggle system' to endure stun was a bit too much.
	name = "grabbing thrust"
	blade_class = BCLASS_STAB
	attack_verb = list("stabs")
	animname = "grab"
	icon_state = "ingrab"
	reach = 2
	chargetime = 10
	warnie = "mobwarning"
	hitsound = list('sound/combat/hits/bladed/genstab (1).ogg', 'sound/combat/hits/bladed/genstab (2).ogg', 'sound/combat/hits/bladed/genstab (3).ogg')
	damfactor = 0.5
	candodge = FALSE
	penfactor = 100
	swingdelay = 1
	misscost = 10

/obj/item/rogueweapon/spear/yari
	name = "су яри"
	desc = "Длинное копье с прямым наконечником, часто используемое морскими рейдерами для отражения атак легкой кавалерии на суше. \
	Хорошо известно благодаря стратегии «Яримазингу» среди изумийцев."
	icon_state = "suyari"
	icon = 'modular_twilight/icons/roguetown/weapons/64.dmi'
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	bigboy = TRUE
	gripsprite = TRUE
	smeltresult = /obj/item/ingot/iron
	dropshrink = 0.8
	blade_dulling = DULLING_BASHCHOP

/obj/item/rogueweapon/spear/yari/katakama
	name = "катакама яри"
	desc = "Эволюция су-яри, узнаваемая благодаря одному косому наконечнику, расположенному перпендикулярно основному острию, что позволяет лучше защищаться от нагинаты."
	icon_state = "katakamayari"
	wdefense = 5
	smeltresult = /obj/item/ingot/iron
	max_blade_int = 150
	max_integrity = 400

/obj/item/rogueweapon/spear/billhook/jumonji
	name = "джумонджи яри"
	desc = "Доведенный до логического завершения дизайн катакама-яри, дзюмондзи-яри имеет удлиненный хвостовик с каждой стороны, \
	длина которого равна длине переднего острия. Нет такого шестового оружия, которое обеспечивало бы лучшую защиту без ущерба для эффективности."
	icon_state = "jumonjiyari"

/obj/item/rogueweapon/halberd/bardiche/naginata
	name = "нагината"
	desc = "В самом начале своего существования нагината представляла собой клинок тачи, закрепленный на длинном деревянном шесте,\
	и стала первым шестовым оружием, получившим широкое распространение в Изуме."
	icon = 'modular_twilight/icons/roguetown/weapons/64.dmi'
	icon_state = "naginata"
	dropshrink = 0.8

/obj/item/rogueweapon/halberd/bardiche/naginata/tsukushi //make two instead of only one
	name = "цукуси нагината"
	desc = "Более дешевая и простая в изготовлении железная нагината с клинком, удерживаемым за гарду, а не за острие. \
	Этот клинок, вероятно, произошел от косы, и его легко найти у бедных странствующих монахов."
	force_wielded = 28
	icon_state = "surplusnaginata"
	smeltresult = /obj/item/ingot/iron
	dropshrink = 0.8
	wdefense = 4
	slot_flags = ITEM_SLOT_BACK

/obj/item/rogueweapon/halberd/bisento //Giving the Bisento storeable 'back' because, otherwise, people will SUFFER spawning with it. Too bugged for my taste.
	name = "бисенто"
	desc = "Сродни большому тесаку или широкому топору."
	icon_state = "bisento"
	dropshrink = 0.8
	icon = 'modular_twilight/icons/roguetown/weapons/64.dmi'

/obj/item/rogueweapon/spear/stone/obsidian //direct upgrade to the stone one.
	force = 17
	force_wielded = 19
	throwforce = 15
	name = "обсидиановое копье"
	desc = "Копье с удивительно острым острием из вулканического стекла."
	icon_state = "obsidian_spear"
	icon = 'modular_twilight/icons/roguetown/weapons/64.dmi'
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	smeltresult = /obj/item/ash
	max_blade_int = 100

/obj/item/rogueweapon/woodstaff/quarterstaff/bostaff
	name = "посох бо"
	desc = "Бо, или «четвертьстолб», - простое оружие, используемое в боевых искусствах для заманивания, нанесения ударов и зачистки противника."
	icon_state = "bostaff"
	icon = 'modular_twilight/icons/roguetown/weapons/64.dmi'
	bigboy = TRUE

/obj/item/rogueweapon/firelance
	name = "sanctiflux firelance"
	desc = "The new iteration of the ancient abyssariad 'Widowmaker', the harbinger of purification against zizodemons, tieflings and grezelhoft. \
	Used safely by the hundred thousand march, by hands whom holds purifying intentions from the abyss." //Hundred thousand march is the definition of champions. But after bloody apotheosis, its just anyone islander-cultured.
	icon = 'modular_twilight/icons/roguetown/weapons/firelance.dmi'
	icon_state = "firelance"
	slot_flags = ITEM_SLOT_BACK
	w_class = WEIGHT_CLASS_BULKY
	can_parry = TRUE
	wlength = WLENGTH_GREAT
	bigboy = TRUE
	gripsprite = FALSE
	resistance_flags = FLAMMABLE // Weapon made mostly of wood
	max_integrity = 200
	minstr = 8
	smeltresult = /obj/item/ingot/steel
	associated_skill = /datum/skill/combat/polearms
	drop_sound = 'sound/foley/dropsound/wooden_drop.ogg'
	parrysound = list('sound/combat/parry/wood/parrywood (1).ogg', 'sound/combat/parry/wood/parrywood (2).ogg', 'sound/combat/parry/wood/parrywood (3).ogg')
	dropshrink = 0.8
	blade_dulling = DULLING_BASHCHOP
	walking_stick = TRUE
	wlength = WLENGTH_LONG
	sharpness = IS_BLUNT
	minstr = 8
	sellprice = 400

	var/cocked = FALSE
	var/lit = FALSE
	var/range = 5
	var/fuel_source = FALSE
	var/fuze = 30

/obj/item/rogueweapon/firelance/proc/ignite(mob/living/user)
	if(lit)
		to_chat(user.loc, "<span class='warning'>The Firelance's fuse is already ignited and fierce as a bull.</span>")
		return

	if(!fuel_source)
		to_chat(user.loc, "<span class='warning'>You cannot burn your enemies without a gourd with sanctiflux.</span>")
		return

	to_chat(src.loc, "<span class='info'>The firelance's fuze starts to rebel in sparking lights.</span>")
	playsound(src.loc, 'modular_twilight/sound/izuma/spells/firelance_cooking.ogg', 100)
	lit = TRUE
	spawn(20) // 2 seconds
		if(lit)
			to_chat(src.loc, "<span class='warning'>The fuze reaches the composite, building deadly pressure.</span>")
	spawn(40) // 4 seconds
		if(lit)
			to_chat(src.loc, "<span class='danger'>The Firelance is about to release purifying death!</span>")
	spawn(60) // 6 seconds
		if(lit)
			flamefire(user)
			fuel_source = FALSE
			lit = FALSE
			update_icon()

/obj/item/rogueweapon/firelance/proc/flamefire(mob/living/user)
	if(!user)
		return

	var/turf/start = get_turf(user) 	// VERY important. It determine user's position and firing direction. May remove it for handmade fuels.
	if(!start)
		return

	var/delta_x = 0
	var/delta_y = 0
	switch(user.dir)
		if(NORTH) delta_y = 1
		if(EAST) delta_x = 1
		if(SOUTH) delta_y = -1
		if(WEST) delta_x = -1

	for(var/distance in 1 to range) // This fire pattern widens every second tile. This will be the Abyssariad/Heartfelt 'military' standard.
		var/width = distance / 2 // Calculate when it widens
		for(var/offset in -width to width) // Control the width itself
			var/turf/current_turf
			if(delta_x) // Horizontal spread
				current_turf = locate(start.x + (delta_x * distance), start.y + offset, start.z)
			else if(delta_y) // Vertical spread
				current_turf = locate(start.x + offset, start.y + (delta_y * distance), start.z)

			if(current_turf)
				// Ignite the tile
				new /obj/effect/oilspill(current_turf)
				current_turf.hotspot_expose(500, 30, 1)

				for(var/mob/living/L in current_turf.contents)
					if(iscarbon(L) && L != user)
						L.visible_message("<span class='danger'>[L] is engulfed in flames!</span>")
						L.adjustFireLoss(rand(10, 20)) //Enough damage to ensure the player will move away.
	playsound(src.loc, 'modular_twilight/sound/izuma/spells/firelance.ogg', 100)
	cocked = FALSE
	fuel_source = FALSE // Consume  fuel after use
	update_icon()

/obj/item/rogueweapon/firelance/dropped(mob/living/user)
	. = ..()
	if(fuel_source)
		to_chat(src, "<span class='info'>[user] lowered the [usr] with care, sensing the potential calamity bound within, aware of the cost from underestimating it.</span>")
		return
	else
		to_chat(src, "<span class='info'>[user] dropped the [usr] with its gourd's cap unsealed, hissing quietly, as it tells the tales of widowmaking by doing the obvious.</span>")
		user.adjust_fire_stacks(3)
		user.IgniteMob()
		flamefire(user)

/obj/item/rogueweapon/firelance/attack_self(mob/living/user)
	if(lit) // safeguard
		return
	else
		if(cocked && !fuel_source)
			to_chat(user, "<span class='info'>You open the blades, making it suitable for use. It only requires a gourd filled with fuel.</span>")
			cocked = FALSE
			update_icon()
			return

		if(!cocked && !fuel_source)
			to_chat(user, "<span class='info'>You triggered the mechanism under the blades even without a gourd. No internal repair is needed.</span>")
			cocked = TRUE
			update_icon()
			return
		else
			var/obj/item/bodypart/limb
			var/list/limb_list = list(BODY_ZONE_L_ARM, BODY_ZONE_R_ARM)
			for(var/zone in limb_list)
				limb = user.get_bodypart(zone)
				if(limb)
					playsound(src,'sound/misc/guillotine.ogg', rand(30,60), TRUE)
					to_chat(user, "<span class='danger'>Without a gourd, [user]'s [limb] was accidentally snatched by jagged blades, bleeding before being severed!</span>")
					limb.dismember()
					qdel(limb)
					user.emote("scream")
					cocked = TRUE
					update_icon()
					return

		if(!cocked && fuel_source)
			to_chat(user, "<span class='info'>You start spinning the mechanisms, watching the jagged blades close. The weapon is now ready, but it needs to be lit.</span>")
			if(do_after(user, 60 - user.STASTR, target = user))
				playsound(user, 'sound/combat/Ranged/crossbow_medium_reload-01.ogg', 100, FALSE)
				cocked = TRUE
				update_icon()
			return
		else
			to_chat(user, "<span class='warning'>Fuel spills due to misuse, rendering the weapon unprepared.</span>")
			cocked = FALSE
			fuel_source = FALSE
			update_icon()

/obj/item/rogueweapon/firelance/attackby(obj/item/I, mob/living/user)
	if(!istype(I, /obj/item/sanctiflux))
		to_chat(user, "<span class='warning'>[I] is not a valid fuel source!</span>")
		return
	else
		if(fuel_source) // If it already has a fuel source, you can't insert a new one.
			to_chat(user, "<span class='warning'>The firelance already has a gourd on.</span>")
			return
		if(cocked)
			to_chat(user, "<span class='warning'>I shoved the gourd against the steel blades, almost cracking it. I cannot put the gourd inside if the blades are on the way.</span>")
			return
		if(!cocked)
			fuel_source = TRUE
			update_icon()
			qdel(I)
			to_chat(user, "<span class='info'>I press the gourd against the insertion hole. I just need to adjust the mechanisms so the automata within do the rest of the job.</span>")
			..()

/obj/item/rogueweapon/firelance/spark_act()
	ignite(usr)

/obj/item/rogueweapon/firelance/fire_act()
	ignite(usr)

/obj/item/rogueweapon/firelance/update_icon()
	if(lit)
		icon_state = "firelance_lit"
	else
		if(!cocked)
			if(fuel_source)
				icon_state = "firelance_oil"
			else
				icon_state = "firelance"
		else
			if(fuel_source)
				icon_state = "firelance_cocked_oil"
			else
				icon_state = "firelance_cocked"

/obj/item/sanctiflux
	name = "sanctiflux gourd"
	desc = "The abyssariad answer to demonic corruption, purger of zizo and men, malum's essence in sanctifying form to branch with abyssal valors. An Abyssariad secret from Fog Islands."
	icon = 'modular_twilight/icons/roguetown/weapons/items.dmi'
	icon_state = "gourd"

/obj/effect/oilspill
	anchored = TRUE
	mouse_opacity = MOUSE_OPACITY_TRANSPARENT
	icon = 'modular_twilight/icons/roguetown/misc/tileset/fire.dmi'
	icon_state = "newfire"
	layer = GASFIRE_LAYER

	var/life = 120 // Lifespan of the fire in ticks. May decrease later, but I prefer to keep its area-denial use.

/obj/effect/oilspill/Initialize()
	. = ..()
	setDir(pick(GLOB.cardinals))
	START_PROCESSING(SSfastprocess, src)
	return

/obj/effect/oilspill/process()
	for(var/mob/living/carbon/human/H in view(2, src)) 	// Sate pyromaniac addiction. I don't even know if that thing works, but anyway.
		if(H.has_flaw(/datum/charflaw/addiction/pyromaniac))
			H.sate_addiction()
	life--
	if(life <= 0)
		qdel(src)
		return

/obj/effect/oilspill/Destroy()
	STOP_PROCESSING(SSfastprocess, src)
	set_light(0)
	return ..()

/obj/effect/oilspill/Crossed(atom/movable/AM, oldLoc)
	..()
	if(isliving(AM))
		var/mob/living/L = AM
		L.fire_act(20, 40)


/*
			This is for later, for when I make different types of oilfuel, all of abyssariad or heartfelt making. Possibly the handmade alternative.
	//This following code spreads the fire in a linear pattern, the first one I made.
	for(var/distance in 1 to range)
		var/turf/current_turf = locate(start.x + (delta_x * distance), start.y + (delta_y * distance), start.z)
		if(!current_turf || current_turf.density) // Stop if obstructed
			break
	// This following code spreads the fire in a triangle pattern.
	for(var/distance in 1 to range)
		for(var/offset in -distance to distance)
			var/turf/current_turf
			if(delta_x) // Horizontal spread (EAST/WEST)
				current_turf = locate(start.x + (delta_x * distance), start.y + offset, start.z)
			else if(delta_y) // Vertical spread (NORTH/SOUTH)
				current_turf = locate(start.x + offset, start.y + (delta_y * distance), start.z)
	//This following code preads the fire in diagonal around the player.
	var/list/diagonal_directions = list(
		list(1, 1),  // NORTHEAST
		list(1, -1), // SOUTHEAST
		list(-1, -1),// SOUTHWEST
		list(-1, 1)  // NORTHWEST
	)
	// Loop through each diagonal direction
	for(var/dir_offset in diagonal_directions)
		var/delta_x = dir_offset[1]
		var/delta_y = dir_offset[2]
		// Generate the fire pattern for the given direction
		for(var/distance in 1 to range)
			var/turf/current_turf = locate(start.x + (delta_x * distance), start.y + (delta_y * distance), start.z)
*/
