/obj/effect/proc_holder/spell/invoked/diagnose/secular
	name = "Мирской диагноз"
	overlay_state = "diagnose"
	range = 1
	associated_skill = /datum/skill/misc/treatment
	miracle = FALSE
	devotion_cost = 0

/obj/effect/proc_holder/spell/targeted/docheal  //miracle but 1 tile range
	action_icon = 'icons/mob/actions/roguespells.dmi'
	name = "Стремительное исцеление"
	overlay_state = "doc"
	range = 1
	include_user = TRUE
	sound = 'sound/gore/flesh_eat_03.ogg'
	associated_skill = /datum/skill/misc/treatment
	antimagic_allowed = TRUE
	charge_max = 20 SECONDS
	miracle = FALSE
	devotion_cost = 0

/obj/effect/proc_holder/spell/targeted/stable // gamerfuel intravenously
	action_icon = 'icons/mob/actions/roguespells.dmi'
	name = "Стабилизирующая сыворотка"
	overlay_state = "stable"
	range = 1
	sound = 'modular/Smoker/sound/inject.ogg'
	associated_skill = /datum/skill/misc/treatment
	antimagic_allowed = TRUE
	include_user = TRUE
	charge_max = 1 MINUTES
	miracle = FALSE
	devotion_cost = 0

/obj/effect/proc_holder/spell/targeted/berserkium // doktor! turn off my pain inhibitors!
	action_icon = 'icons/mob/actions/roguespells.dmi'
	name = "Berserkium Injection"
	overlay_state = "bcry"
	range = 1
	include_user = TRUE
	sound = 'modular/Smoker/sound/inject.ogg'
	associated_skill = /datum/skill/misc/treatment
	antimagic_allowed = TRUE
	charge_max = 5 MINUTES
	miracle = FALSE
	devotion_cost = 0

/obj/effect/proc_holder/spell/targeted/purge // Purges all reagents and clears all toxin damage while lowering blood levels and hitting with brute (makes an artery wound)
	action_icon = 'icons/mob/actions/roguespells.dmi'
	name = "Очищающее кровопускание"
	overlay_state = "snek"
	range = 1
	include_user = TRUE
	sound = 'sound/combat/newstuck.ogg'
	associated_skill = /datum/skill/misc/treatment
	antimagic_allowed = TRUE
	charge_max = 1 MINUTES
	miracle = FALSE
	devotion_cost = 0

/obj/effect/proc_holder/spell/targeted/debride // Cure rot if has weak liver debuff (achieved by surgery)
	action_icon = 'icons/mob/actions/roguespells.dmi'
	name = "Очищение тканей"
	overlay_state = "unrot"
	range = 1
	include_user = FALSE
	sound = 'sound/combat/newstuck.ogg'
	associated_skill = /datum/skill/misc/treatment
	antimagic_allowed = TRUE
	charge_max = 1 MINUTES
	miracle = FALSE
	devotion_cost = 0
	/// Amount of PQ gained for curing zombos
	var/unzombification_pq = PQ_GAIN_UNZOMBIFY

/obj/effect/proc_holder/spell/targeted/cpr // Revive if has weak heart debuff (achieved by surgery)
	action_icon = 'icons/mob/actions/roguespells.dmi'
	name = "Массаж сердца"
	overlay_state = "cpr"
	range = 1
	include_user = FALSE
	sound = 'sound/combat/newstuck.ogg'
	associated_skill = /datum/skill/misc/treatment
	antimagic_allowed = TRUE
	charge_max = 1 MINUTES
	miracle = FALSE
	devotion_cost = 0
	/// Amount of PQ gained for reviving
	var/revive_pq = PQ_GAIN_REVIVE

/obj/effect/proc_holder/spell/targeted/cpr/cast(list/targets, mob/living/user)
	. = ..()
	if(isliving(targets[1]) && targets[1].has_status_effect(/datum/status_effect/debuff/wheart))
		testing("revived1")
		var/mob/living/target = targets[1]
		if(target == user)
			revert_cast()
			return FALSE
		if(target.stat < DEAD)
			to_chat(user, span_warning("Ничего не произошло."))
			revert_cast()
			return FALSE
		if(target.mob_biotypes & MOB_UNDEAD)
			to_chat(user, span_warning("Не подействует на нежить."))
			revert_cast()
			return FALSE
		if(!target.revive(full_heal = FALSE))
			to_chat(user, span_warning("Тело еще сильно повреждено."))
			revert_cast()
			return FALSE
		if(target.mobility_flags & MOBILITY_STAND)
			to_chat(user, span_warning("I need to lay them on the ground!"))
			revert_cast()
			return FALSE
		testing("revived2")
		var/mob/living/carbon/spirit/underworld_spirit = target.get_spirit()
		//GET OVER HERE!
		if(underworld_spirit)
			var/mob/dead/observer/ghost = underworld_spirit.ghostize()
			qdel(underworld_spirit)
			ghost.mind.transfer_to(target, TRUE)
		target.grab_ghost(force = TRUE)
		target.emote("breathgasp")
		target.Jitter(100)
		if(isseelie(target))
			var/mob/living/carbon/human/fairy_target = target
			fairy_target.set_heartattack(FALSE)
			var/obj/item/organ/wings/Wing = fairy_target.getorganslot(ORGAN_SLOT_WINGS)
			if(Wing == null)
				var/wing_type = fairy_target.dna.species.organs[ORGAN_SLOT_WINGS]
				var/obj/item/organ/wings/seelie/new_wings = new wing_type()
				new_wings.Insert(fairy_target)
		target.update_body()
		target.visible_message(span_notice("[target] начинает сильно дергаться!"), span_green("В моих ушах звенит!"))
		if(target.mind)
			if(revive_pq && !HAS_TRAIT(target, TRAIT_IWASREVIVED) && user?.ckey)
				adjust_playerquality(revive_pq, user.ckey)
				ADD_TRAIT(target, TRAIT_IWASREVIVED, "[type]")
			target.mind.remove_antag_datum(/datum/antagonist/zombie)
		return TRUE
	to_chat(user, span_warning("Сперва нужно вылечить сердце."))
	revert_cast()
	return FALSE

	if(!isliving(targets[1]))
		revert_cast()
		return FALSE

	var/mob/living/target = targets[1]
	if(target == user)
		revert_cast()
		return FALSE
	if(target.stat < DEAD)
		to_chat(user, span_warning("Ничего не произошло."))
		revert_cast()
		return FALSE
	if(HAS_TRAIT(target, TRAIT_RITUALIZED))
		to_chat(user, span_warning("Эссенция жизни была высосана из этого тела."))
		revert_cast()
		return FALSE
	if(world.time > target.mob_timers["lastdied"] + 10 MINUTES)
		to_chat(user, span_warning("Слишком поздно."))
		revert_cast()
		return FALSE
	if(target.mob_biotypes & MOB_UNDEAD)
		to_chat(user, span_warning("Не подействует на нежить."))
		revert_cast()
		return FALSE
	if(!target.revive(full_heal = FALSE))
		to_chat(user, span_warning("Тело еще сильно повреждено."))
		revert_cast()
		return FALSE
	
	var/mob/living/carbon/spirit/underworld_spirit = target.get_spirit()
	//GET OVER HERE!
	if(underworld_spirit)
		var/mob/dead/observer/ghost = underworld_spirit.ghostize()
		qdel(underworld_spirit)
		ghost.mind.transfer_to(target, TRUE)
	target.grab_ghost(force = TRUE)
	target.emote("breathgasp")
	target.Jitter(100)
	if(isseelie(target))
		var/mob/living/carbon/human/fairy_target = target
		fairy_target.set_heartattack(FALSE)
		var/obj/item/organ/wings/Wing = fairy_target.getorganslot(ORGAN_SLOT_WINGS)
		if(Wing == null)
			var/wing_type = fairy_target.dna.species.organs[ORGAN_SLOT_WINGS]
			var/obj/item/organ/wings/seelie/new_wings = new wing_type()
			new_wings.Insert(fairy_target)
	target.update_body()
	target.visible_message(span_notice("[target] оживляется священным светом!"), span_green("Я пробуждаюсь из тьмы."))
	target.mind?.remove_antag_datum(/datum/antagonist/zombie)
	return TRUE

/obj/effect/proc_holder/spell/targeted/cpr/cast_check(skipcharge = 0,mob/user = usr)
	if(!..())
		revert_cast()
		return FALSE
	return TRUE

/obj/effect/proc_holder/spell/targeted/debride/cast(list/targets, mob/living/user)

	if(!isliving(targets[1]))
		revert_cast()
		return FALSE

	if(!targets[1].has_status_effect(/datum/status_effect/debuff/wliver))
		to_chat(user, span_warning("Сперва нужно вылечить печень."))
		revert_cast() // No need to consume the spell if it isn't properly cast.
		return FALSE

	var/mob/living/target = targets[1]

	if(target == user)
		revert_cast()
		return FALSE

	// If, for whatever reason, someone manages to capture a vampire with (somehow) rot??? This prevents them from losing their undead biotype.
	if(target.mind?.has_antag_datum(/datum/antagonist/vampire) || target.mind?.has_antag_datum(/datum/antagonist/vampire/lesser) || target.mind?.has_antag_datum(/datum/antagonist/vampirelord))
		to_chat(user, span_warning("Это неизлечимое зло, я не могу ничего с этим сделать."))
		revert_cast()
		return FALSE

	if(target.mobility_flags & MOBILITY_STAND)
		to_chat(user, span_warning("I need to lay them on the ground!"))
		revert_cast()
		return FALSE

	var/datum/antagonist/zombie/was_zombie = target.mind?.has_antag_datum(/datum/antagonist/zombie)

	testing("curerot2")

	if(was_zombie)
		target.mind.remove_antag_datum(/datum/antagonist/zombie)
		target.Unconscious(20 SECONDS)
		target.emote("breathgasp")
		target.Jitter(100)
		if(unzombification_pq && !HAS_TRAIT(target, TRAIT_IWASUNZOMBIFIED) && user?.ckey)
			adjust_playerquality(unzombification_pq, user.ckey)
			ADD_TRAIT(target, TRAIT_IWASUNZOMBIFIED, TRAIT_GENERIC)

	var/datum/component/rot/rot = target.GetComponent(/datum/component/rot)

	if(rot)
		rot.amount = 0

	if(iscarbon(target))
		var/mob/living/carbon/stinky = target
		for(var/obj/item/bodypart/limb in stinky.bodyparts)
			limb.rotted = FALSE
			limb.skeletonized = FALSE
			limb.update_limb()
			limb.update_disabled()

	// Specific edge-case where a body rots without a head or rots after a head is placed back on. We always want this gone so we can at least revive the person even if there is no mind, this is caused by the failure to remove the zombie antag datum.
	// un-deadite'ing process
	target.mob_biotypes &= ~MOB_UNDEAD // the zombie antag on_loss() does this as well, but this is for the times it doesn't work properly. We check if they're any special undead role first.

	for(var/trait in GLOB.traits_deadite)
		REMOVE_TRAIT(target, trait, TRAIT_GENERIC)

	if(target.stat < DEAD) // Drag and shove ghost back in.
		var/mob/living/carbon/spirit/underworld_spirit = target.get_spirit()
		if(underworld_spirit)
			var/mob/dead/observer/ghost = underworld_spirit.ghostize()
			ghost.mind.transfer_to(target, TRUE)
			qdel(underworld_spirit)
	target.grab_ghost(force = TRUE) // even suicides

	target.update_body()
	target.visible_message(span_notice("Гниль выходит из тела [target]!"), span_green("Я чувствую, как гниль покидает мое тело!"))

	return TRUE

/obj/effect/proc_holder/spell/targeted/debride/cast_check(skipcharge = 0,mob/user = usr)
	if(!..())
		revert_cast()
		return FALSE
	return TRUE


/obj/effect/proc_holder/spell/targeted/docheal/cast(list/targets, mob/living/user)
	. = ..()
	if(iscarbon(targets[1]))
		var/mob/living/carbon/target = targets[1]
		target.visible_message(span_green("[user] излечивает раны [target]."), span_notice("Я чувствую себя лучше!"))
		if(iscarbon(target))
			var/mob/living/carbon/C = target
			var/obj/item/bodypart/affecting = C.get_bodypart(check_zone(user.zone_selected))
			if(affecting)
				if(affecting.heal_damage(200, 200))
					C.update_damage_overlays()
				if(affecting.heal_wounds(200))
					C.update_damage_overlays()
		else
			target.adjustBruteLoss(-200)
			target.adjustFireLoss(-200)
		return TRUE
	revert_cast()
	return FALSE

/obj/effect/proc_holder/spell/targeted/stable/cast(list/targets, mob/user)
	. = ..()
	if(iscarbon(targets[1]))
		var/mob/living/carbon/target = targets[1]
		var/ramount = 10
		var/rid = /datum/reagent/medicine/stimu
		target.reagents.add_reagent(rid, ramount)
		target.visible_message(span_green("[user] stabs [target]'s chest with a syringe."), span_notice("Feel the vibrations – my hearts starts to pound!"))
		target.blood_volume = BLOOD_VOLUME_NORMAL
		return TRUE
	revert_cast()
	return FALSE

/obj/effect/proc_holder/spell/targeted/berserkium/cast(list/targets, mob/user)
	. = ..()
	if(iscarbon(targets[1]))
		var/mob/living/carbon/target = targets[1]
		var/ramount = 10
		var/rid = /datum/reagent/medicine/berserkium
		target.reagents.add_reagent(rid, ramount)
		target.visible_message(span_green("[user] stabs [target]'s chest with a syringe."), span_danger("I CAN'T DENY THE VOICES INSIDE MY BRAIN!"))
		target.emote("rage")
		return TRUE
	revert_cast()
	return FALSE

/obj/effect/proc_holder/spell/targeted/purge/cast(list/targets, mob/user)
	. = ..()
	if(iscarbon(targets[1]))
		var/mob/living/carbon/target = targets[1]
		var/obj/item/bodypart/BPA = target.get_bodypart(user.zone_selected)
		if(!BPA)
			to_chat(user, span_warning("Этой конечности нет!"))
			revert_cast()
			return FALSE
		if(target.mobility_flags & MOBILITY_STAND)
			to_chat(user, span_warning("I need to lay them on the ground!"))
			revert_cast()
			return FALSE
		BPA.add_wound(/datum/wound/artery/)
		target.visible_message(span_danger("[user] выводит реагенты и токсины из тела [target]."))
		target.adjustToxLoss(-999)
		target.reagents.remove_all_type(/datum/reagent, 9999)
		target.emote("scream")
		return TRUE
	revert_cast()
	return FALSE

/obj/effect/proc_holder/spell/targeted/purge/cast_check(skipcharge = 0,mob/user = usr)
	if(!..())
		revert_cast()
		return FALSE
	return TRUE

/obj/item/organ/heart/weak
	name = "ослабленное сердце"
	desc = "Похоже, оно едва способно качать кровь."

/datum/status_effect/debuff/wheart
	id = "wheart"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/wheart
	effectedstats = list("strength" = -3, "constitution" = -3, "endurance" = -3, "speed" = -3)

/atom/movable/screen/alert/status_effect/debuff/wheart
	name = "Слабое сердце"
	desc = "Я чувствую себя опустошенно и вяло. Моё сердце болезненно стучит."

/obj/item/organ/heart/weak/Insert(mob/living/carbon/M)
	..()
	M.apply_status_effect(/datum/status_effect/debuff/wheart)

/obj/item/organ/heart/weak/Remove(mob/living/carbon/M, special = 0)
	..()
	if(M.has_status_effect(/datum/status_effect/debuff/wheart))
		M.remove_status_effect(/datum/status_effect/debuff/wheart)

/obj/item/organ/liver/weak
	name = "ослабленная печень"
	desc = "Кажется, она едва функционирует."

/datum/status_effect/debuff/wliver
	id = "wliver"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/wliver
	effectedstats = list("strength" = -3, "constitution" = -3, "endurance" = -3, "speed" = -3)

/atom/movable/screen/alert/status_effect/debuff/wliver
	name = "Слабая печень"
	desc = "Я чувствую себя опустошенно и вяло. Меня мучают боли в животе."

/obj/item/organ/liver/weak/Insert(mob/living/carbon/M)
	..()
	if(M)
		M.apply_status_effect(/datum/status_effect/debuff/wliver)

/obj/item/organ/liver/weak/Remove(mob/living/carbon/M, special = 0)
	..()
	if(M.has_status_effect(/datum/status_effect/debuff/wliver))
		M.remove_status_effect(/datum/status_effect/debuff/wliver)

/datum/surgery/hepa
	name = "Гепатэктомия"
	target_mobtypes = list(/mob/living/carbon/human, /mob/living/carbon/monkey)
	possible_locs = list(BODY_ZONE_PRECISE_STOMACH)
	steps = list(
		/datum/surgery_step/incise,
		/datum/surgery_step/clamp,
		/datum/surgery_step/retract,
		/datum/surgery_step/saw,
		/datum/surgery_step/resection,
		/datum/surgery_step/cauterize,
	)

/datum/surgery_step/resection
	name = "Оживление печени"
	time = 20 SECONDS
	accept_hand = FALSE
	possible_locs = list(BODY_ZONE_PRECISE_STOMACH)
	implements = list(
		TOOL_SCALPEL = 60,
		TOOL_SHARP = 40,
	)
	target_mobtypes = list(/mob/living/carbon/human, /mob/living/carbon/monkey)
	surgery_flags = SURGERY_INCISED | SURGERY_RETRACTED
	skill_min = SKILL_LEVEL_EXPERT
	skill_median = SKILL_LEVEL_MASTER

/datum/surgery_step/resection/preop(mob/user, mob/living/target, target_zone, obj/item/tool, datum/intent/intent)
	if(target.has_status_effect(/datum/status_effect/debuff/wliver))
		to_chat(user, "Печень пациента слишком слабая!")
		return FALSE
	else
		display_results(user, target, span_notice("Я начинаю вырезать часть печени [target]..."),
			span_notice("[user] начинает вырезать часть печени [target]."),
			span_notice("[user] начинает вырезать часть печени [target]."))
		return TRUE

/datum/surgery_step/resection/success(mob/user, mob/living/target, target_zone, obj/item/tool, datum/intent/intent)
	display_results(user, target, span_notice("Я успешно срезаю поврежденные и инфицированные участки с печени [target]."),
		span_notice("[user] успешно вырезает куски печени [target], восстанавливая её работу!"),
		span_notice("[user] успешно вырезает куски печени [target], восстанавливая её работу!"))
	var/obj/item/organ/liver/liver = target.getorganslot(ORGAN_SLOT_LIVER)
	if(liver)
		liver.Remove(target)
		QDEL_NULL(liver)
		liver = new /obj/item/organ/liver/weak
		liver.Insert(target)
		return TRUE

/datum/surgery/bypass
	name = "Коронарное шунтирование"
	target_mobtypes = list(/mob/living/carbon/human, /mob/living/carbon/monkey)
	possible_locs = list(BODY_ZONE_CHEST)
	steps = list(
		/datum/surgery_step/incise,
		/datum/surgery_step/clamp,
		/datum/surgery_step/retract,
		/datum/surgery_step/saw,
		/datum/surgery_step/bypass,
		/datum/surgery_step/cauterize,
	)

/datum/surgery_step/bypass
	name = "Оживление сердца"
	time = 20 SECONDS
	accept_hand = TRUE
	implements = list(
		TOOL_HEMOSTAT = 60,
		TOOL_IMPROVHEMOSTAT = 30,
		TOOL_HAND = 10,
	)
	target_mobtypes = list(/mob/living/carbon/human, /mob/living/carbon/monkey)
	surgery_flags = SURGERY_BLOODY | SURGERY_INCISED | SURGERY_CLAMPED | SURGERY_RETRACTED | SURGERY_BROKEN
	skill_min = SKILL_LEVEL_EXPERT
	skill_median = SKILL_LEVEL_MASTER

/datum/surgery_step/bypass/preop(mob/user, mob/living/target, target_zone, obj/item/tool, datum/intent/intent)
	if(target.has_status_effect(/datum/status_effect/debuff/wheart))
		to_chat(user, "Сердце пациента слишком слабое!")
		return FALSE
	else
		display_results(user, target, span_notice("Я начинаю восстанавливать кровоток из артерий в сердце [target]..."),
			span_notice("[user] начинает восстанавливать кровоток из артерий в сердце [target]."),
			span_notice("[user] начинает восстанавливать кровоток из артерий в сердце [target]."))
		return TRUE

/datum/surgery_step/bypass/success(mob/user, mob/living/target, target_zone, obj/item/tool, datum/intent/intent)
	display_results(user, target, span_notice("Мне удалось восстановить кровоток из артерий в сердце [target]."),
		span_notice("[user] восстанавливает кровоток из артерий в сердце [target], восстанавливая его работу!"),
		span_notice("[user] восстанавливает кровоток из артерий в сердце [target], восстанавливая его работу!"))
	var/obj/item/organ/heart/heart = target.getorganslot(ORGAN_SLOT_HEART)
	if(heart)
		heart.Remove(target)
		QDEL_NULL(heart)
		heart = new /obj/item/organ/heart/weak
		heart.Insert(target)
		return TRUE

//------------------------------------------------reagents--------------------------------------------//

/obj/item/reagent_containers/powder/alch
	name = "эссенция"
	desc = "Порошок, готовый к перегонке."
	gender = PLURAL
	icon_state = "salt"
	can_brew = TRUE
	list_reagents = null
	grind_results = null
	volume = 24

/obj/item/reagent_containers/powder/alch/berry
	name = "эссенция ягоды"
	gender = PLURAL
	icon_state = "salt"
	color = "#4682b4"
	brew_reagent = /datum/reagent/alch/syrum_berry
	brew_amt = 24
	can_brew = TRUE
	list_reagents = null
	grind_results = null
	volume = 24

/obj/item/reagent_containers/powder/alch/berryp
	name = "эссенция ядовитой ягоды"
	gender = PLURAL
	icon_state = "salt"
	color = "#61DE2A"
	brew_reagent = /datum/reagent/alch/syrum_poison_berry
	brew_amt = 24
	can_brew = TRUE
	list_reagents = null
	grind_results = list(/datum/reagent/berrypoison = 10)
	volume = 10

/obj/item/reagent_containers/powder/alch/mincem
	name = "эссенция плоти"
	gender = PLURAL
	icon_state = "salt"
	color = "#ff7f7f"
	can_brew = TRUE
	brew_reagent = /datum/reagent/alch/syrum_meat
	brew_amt = 24
	list_reagents = list(/datum/reagent/consumable/nutriment = 3)
	grind_results = null
	volume = 10

/obj/item/reagent_containers/powder/alch/mincef
	name = "эссенция рыбы"
	gender = PLURAL
	icon_state = "salt"
	color = "#ff7f7f"
	brew_reagent = /datum/reagent/alch/syrum_fish
	brew_amt = 24
	can_brew = TRUE
	list_reagents = list(/datum/reagent/consumable/nutriment = 3)
	grind_results = null
	volume = 10

/obj/item/reagent_containers/powder/alch/stone
	name = "эссенция земли"
	gender = PLURAL
	icon_state = "salt"
	brew_reagent = /datum/reagent/alch/syrum_stone
	brew_amt = 24
	can_brew = TRUE
	color = "#808080"
	list_reagents = null
	grind_results = null
	volume = 10

/obj/item/reagent_containers/powder/alch/pipe
	name = "эссенция зависимости"
	gender = PLURAL
	icon_state = "salt"
	brew_reagent = /datum/reagent/alch/syrum_westleach_leaf
	brew_amt = 24
	can_brew = TRUE
	color = "#808080"
	list_reagents = list(/datum/reagent/drug/nicotine = 30)
	grind_results = null
	volume = 10

/obj/item/reagent_containers/powder/alch/swamp
	name = "эссенция чистоты"
	gender = PLURAL
	icon_state = "salt"
	brew_reagent = /datum/reagent/alch/syrum_swamp_weed
	brew_amt = 24
	can_brew = TRUE
	color = "#61DE2A"
	list_reagents = list(/datum/reagent/drug/space_drugs = 30)
	grind_results = null
	volume = 10

/datum/reagent/alch
	name = "???"
	description = "Вы не должны это видеть..."
	reagent_state = LIQUID
	color = "#808080"
	metabolization_rate = 0.25 * REAGENTS_METABOLISM
	overdose_threshold = null

/datum/reagent/alch/syrum_ash
	name = "сыворотка пламени"
	description = "Очищенная вязкая пепельная сыворотка."
	reagent_state = LIQUID
	color = "#808080"
	metabolization_rate = 1 * REAGENTS_METABOLISM
	overdose_threshold = null

/datum/reagent/alch/syrum_westleach_leaf
	name = "сыворотка из курительного листа"
	description = "Очищенная эссенция курительного листа."
	reagent_state = LIQUID
	color = "#808080"
	metabolization_rate = 0.25 * REAGENTS_METABOLISM
	overdose_threshold = null

/datum/reagent/alch/syrum_swamp_weed
	name = "сыворотка из болотника"
	description = "Очищенная сыворотка из свежей болотной травы."
	reagent_state = LIQUID
	color = "#61DE2A"
	metabolization_rate = 0.25 * REAGENTS_METABOLISM
	overdose_threshold = null

/datum/reagent/alch/syrum_meat
	name = "мясная сыворотка"
	description = "Очищенные густые помои с запахом крови."
	reagent_state = LIQUID
	color = "#ff7f7f"
	metabolization_rate = 1 * REAGENTS_METABOLISM
	overdose_threshold = null

/datum/reagent/alch/syrum_fish
	name = "рыбная сыворотка"
	description = "Очищенные вязкие помои с рыбным запахом."
	reagent_state = LIQUID
	color = "#ff7f7f"
	metabolization_rate = 1 * REAGENTS_METABOLISM
	overdose_threshold = null

/datum/reagent/alch/syrum_stone
	name = "землистая сыворотка"
	description = "Очищенный сжиженный камень."
	reagent_state = LIQUID
	color = "#E2E5DE"
	metabolization_rate = 0.25 * REAGENTS_METABOLISM
	overdose_threshold = null

/datum/reagent/alch/syrum_salt
	name = "соленая сыворотка"
	description = "Очищенный раствор соли."
	reagent_state = LIQUID
	color = "#E2E5DE"
	metabolization_rate = 0.25 * REAGENTS_METABOLISM
	overdose_threshold = null

/datum/reagent/alch/syrum_poison_berry
	name = "ядовитая сыворотка"
	description = "Очищенная сыворотка из яда дикой ягоды."
	reagent_state = LIQUID
	color = "#61DE2A"
	metabolization_rate = 0.25 * REAGENTS_METABOLISM
	overdose_threshold = null

/datum/reagent/alch/syrum_berry
	name = "ягодная сывороотка"
	description = "Очищенная эссенция из дикой ягоды"
	reagent_state = LIQUID
	color = "#61DE2A"
	metabolization_rate = 0.25 * REAGENTS_METABOLISM
	overdose_threshold = null

/datum/reagent/medicine/caffeine
	name = "кофеин"
	description = "Не спать!"
	reagent_state = LIQUID
	color = "#D2FFFA"
	metabolization_rate = 20 * REAGENTS_METABOLISM
	overdose_threshold = null

/datum/reagent/alch/on_mob_metabolize(mob/living/carbon/M)
	if(prob(50))
		M.confused = max(M.confused+3,0)
	M.emote(pick("cough"))

/datum/reagent/alch/syrum_ash/on_mob_metabolize(mob/living/carbon/M)
	M.adjustToxLoss(-1*REM, 0)
	M.adjustFireLoss(0.25*REM, 0)
	M.reagents.remove_all_type(/datum/reagent, 1)
	M.emote(pick("gag"))

/datum/reagent/alch/syrum_poison_berry/on_mob_metabolize(mob/living/carbon/M)
	M.add_nausea(9)
	M.adjustToxLoss(2, 0)

/datum/reagent/medicine/caffeine/on_mob_life(mob/living/carbon/M)
	M.energy_add(800)
	..()
	. = 1
	if(M.has_status_effect(/datum/status_effect/debuff/sleepytime))
		M.remove_status_effect(/datum/status_effect/debuff/sleepytime)
		M.remove_stress(/datum/stressevent/sleepytime)
		M.mind.sleep_adv.advance_cycle()

/datum/reagent/medicine/caffeine
	name = "кофеин"
	description = "Не спать!"
	reagent_state = LIQUID
	color = "#D2FFFA"
	metabolization_rate = 20 * REAGENTS_METABOLISM
	overdose_threshold = null

/datum/reagent/medicine/stimu
	name = "Стимул"
	description = "Мощное лекарство, восполняющее объем крови."
	reagent_state = LIQUID
	color = "#D2FFFA"
	metabolization_rate = 0.25 * REAGENTS_METABOLISM
	overdose_threshold = null

/datum/reagent/medicine/stimu/on_mob_life(mob/living/carbon/M)
	if(M.blood_volume < BLOOD_VOLUME_NORMAL)
		M.heal_wounds(2) // ok for healing minor bleeding wounds
		M.blood_volume = BLOOD_VOLUME_NORMAL
	if(M.losebreath >= 4)
		M.losebreath -= 2
	if(M.losebreath < 0)
		M.losebreath = 0
	..()

/datum/reagent/medicine/berserkium
	name = "Берсеркий"
	description = "Приводит вас в НАСТОЯЩЕЕ бешенство."
	reagent_state = LIQUID
	color = "#ff0000"
	metabolization_rate = 0.25 * REAGENTS_METABOLISM
	overdose_threshold = null

/datum/status_effect/buff/berserkium_buff
	id = "berserkiumbuff"
	alert_type = /atom/movable/screen/alert/status_effect/buff/berserkium_buff
	effectedstats = list("strength" = 5, "constitution" = 5, "speed" = -10, "perception" = -5, "intelligence" = -10)
	duration = 1

/atom/movable/screen/alert/status_effect/buff/berserkium_buff
	name = "АНОМАЛЬНАЯ ЯРОСТЬ"
	desc = "Я НЕ МОГУ ОТБРОСИТЬ ЭТИ ГОЛОСА В ГОЛОВЕ!"
	icon_state = "acid"

/datum/status_effect/buff/berserkium_crash
	id = "berserkiumcrash"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/berserkium_crash
	effectedstats = list("strength" = -4, "perception" = -4, "intelligence" = -4, "constitution" = -4, "endurance" = -4, "speed" = -4, "fortune" = -4)
	duration = 10 MINUTES

/atom/movable/screen/alert/status_effect/debuff/berserkium_crash
	name = "Аномальная усталость"
	desc = "За все наши праведные преступления мы платим цену."
	icon_state = "muscles"

/datum/reagent/medicine/berserkium/on_mob_metabolize(mob/living/carbon/M)
	..()
	ADD_TRAIT(M, TRAIT_NOSOFTCRIT, TRAIT_GENERIC)
	ADD_TRAIT(M, TRAIT_NOHARDCRIT, TRAIT_GENERIC)
	ADD_TRAIT(M, TRAIT_NODEATH, TRAIT_GENERIC)
	ADD_TRAIT(M, TRAIT_NOCRITDAMAGE, TRAIT_GENERIC)
	ADD_TRAIT(M, TRAIT_NOPAIN, TRAIT_GENERIC)
	ADD_TRAIT(M, TRAIT_NOPAINSTUN, TRAIT_GENERIC)
	ADD_TRAIT(M, TRAIT_NOLIMBDISABLE, TRAIT_GENERIC)
	ADD_TRAIT(M, TRAIT_STUNIMMUNE, TRAIT_GENERIC)
	ADD_TRAIT(M, TRAIT_BASHDOORS, TRAIT_GENERIC)
	ADD_TRAIT(M, TRAIT_NOBREATH, TRAIT_GENERIC)
	ADD_TRAIT(M, TRAIT_BLOODLOSS_IMMUNE, TRAIT_GENERIC)
	ADD_TRAIT(M, TRAIT_CRITICAL_RESISTANCE, TRAIT_GENERIC)
	ADD_TRAIT(M, TRAIT_NOSTAMINA, TRAIT_GENERIC)
	ADD_TRAIT(M, TRAIT_NOSLEEP, TRAIT_GENERIC)
	ADD_TRAIT(M, TRAIT_SCHIZO_AMBIENCE, TRAIT_GENERIC)
	ADD_TRAIT(M, TRAIT_NOFLASH, TRAIT_GENERIC)
	M.apply_status_effect(/datum/status_effect/buff/berserkium_buff)
	M.overlay_fullscreen("rage", /atom/movable/screen/fullscreen/color_vision/red)

/datum/reagent/medicine/berserkium/on_mob_end_metabolize(mob/living/carbon/M)
	REMOVE_TRAIT(M, TRAIT_NOSOFTCRIT, TRAIT_GENERIC)
	REMOVE_TRAIT(M, TRAIT_NOHARDCRIT, TRAIT_GENERIC)
	REMOVE_TRAIT(M, TRAIT_NODEATH, TRAIT_GENERIC)
	REMOVE_TRAIT(M, TRAIT_NOCRITDAMAGE, TRAIT_GENERIC)
	REMOVE_TRAIT(M, TRAIT_NOPAIN, TRAIT_GENERIC)
	REMOVE_TRAIT(M, TRAIT_NOPAINSTUN, TRAIT_GENERIC)
	REMOVE_TRAIT(M, TRAIT_NOLIMBDISABLE, TRAIT_GENERIC)
	REMOVE_TRAIT(M, TRAIT_STUNIMMUNE, TRAIT_GENERIC)
	REMOVE_TRAIT(M, TRAIT_BASHDOORS, TRAIT_GENERIC)
	REMOVE_TRAIT(M, TRAIT_NOBREATH, TRAIT_GENERIC)
	REMOVE_TRAIT(M, TRAIT_BLOODLOSS_IMMUNE, TRAIT_GENERIC)
	REMOVE_TRAIT(M, TRAIT_CRITICAL_RESISTANCE, TRAIT_GENERIC)
	REMOVE_TRAIT(M, TRAIT_NOSTAMINA, TRAIT_GENERIC)
	REMOVE_TRAIT(M, TRAIT_NOSLEEP, TRAIT_GENERIC)
	REMOVE_TRAIT(M, TRAIT_SCHIZO_AMBIENCE, TRAIT_GENERIC)
	REMOVE_TRAIT(M, TRAIT_NOFLASH, TRAIT_GENERIC)
	M.remove_status_effect(/datum/status_effect/buff/berserkium_buff)
	M.energy_add(-1000)
	M.stamina_add(1000)
	M.adjustOxyLoss(100)
	M.apply_status_effect(/datum/status_effect/buff/berserkium_crash)
	M.updatehealth()
	M.clear_fullscreen("rage")
	..()

/datum/reagent/medicine/berserkium/on_mob_life(mob/living/carbon/M)
	M.Dizzy(10)
	M.Jitter(10)
	if(M.has_status_effect(/datum/status_effect/debuff/sleepytime))
		M.remove_status_effect(/datum/status_effect/debuff/sleepytime)
		M.remove_stress(/datum/stressevent/sleepytime)
		M.mind.sleep_adv.advance_cycle()
	if(prob(25))
		M.say("А-А-А-АРГХ!!!", forced = /datum/reagent/medicine/berserkium)
		M.emote("rage")
	..()

/datum/reagent/medicine/purify
	name = "Очиститель"
	reagent_state = LIQUID
	color = "#808080"
	metabolization_rate = 0.5 * REAGENTS_METABOLISM
	overdose_threshold = null
	description = "Мощный препарат, очищающий кровь и болезненно заживляющий раны на теле."

/datum/reagent/medicine/purify/on_mob_life(mob/living/carbon/human/M)
	M.adjustFireLoss(0.5*REM, 0)
	M.heal_wounds(3)

	// Iterate through all body parts
	for (var/obj/item/bodypart/B in M.bodyparts)
		// Iterate through wounds on each body part
		for (var/datum/wound/W in B.wounds)
			// Check for and remove zombie infection
			if (W.zombie_infection_timer)
				deltimer(W.zombie_infection_timer)
				W.zombie_infection_timer = null
				to_chat(M, "Вы чувствуете, как препараты интенсивно горят внутри [B.name].")
			// Check for and remove werewolf infection
			if (W.werewolf_infection_timer)
				deltimer(W.werewolf_infection_timer)
				W.werewolf_infection_timer = null
				to_chat(M, "Вы чувствуете, как препараты интенсивно горят внутри [B.name].")

			// Handle destruction of the wound
			W.Destroy(0)

	M.update_damage_overlays()


//---------------------------------------alch reactions----------------------------------------------//

/datum/chemical_reaction/alch/lesserhealth
	name = "Слабое зелье здоровья"
	mix_sound = 'sound/items/fillbottle.ogg'
	id = /datum/reagent/medicine/lesserhealthpot
	results = list(/datum/reagent/medicine/lesserhealthpot = 45) //15 oz
	required_reagents = list(/datum/reagent/alch/syrum_meat = 24, /datum/reagent/alch/syrum_ash = 24)

/datum/chemical_reaction/alch/health //purify minor health pot into half a bottle by using essence of clarity (swampweed)
	name = "Очищенное зелье здоровья"
	mix_sound = 'sound/items/fillbottle.ogg'
	id = /datum/reagent/medicine/healthpot
	results = list(/datum/reagent/medicine/healthpot = 22.5) //about 7.5 oz
	required_reagents = list(/datum/reagent/medicine/lesserhealthpot = 45, /datum/reagent/alch/syrum_swamp_weed = 24)


/datum/chemical_reaction/alch/greaterhealth //purify health pot into half a bottle of super by using essence of poison (poison berry) which used to be in the old red recipe
	name = "Усиленное зелье здоровья"
	mix_sound = 'sound/items/fillbottle.ogg'
	id = /datum/reagent/medicine/greaterhealthpot
	results = list(/datum/reagent/medicine/greaterhealthpot = 22.5) //about 7.5 oz
	required_reagents = list(/datum/reagent/medicine/healthpot = 45, /datum/reagent/alch/syrum_poison_berry = 24)

/*documentation: 15 oz = 45 units
2 lesser health makes 1 health bottle, 2 health makes 1 greater health
you need 4 lesser bottles to make 2 health to make 1 half bottle of greater
8 lesser bottles for 1 bottle of greater
end recipe count: 8 ash, 8 minced meat, 4 swampweed, 2 poisonberry to make 1 bottle of greater*/

/datum/chemical_reaction/alch/mana
	name = "Зелье маны"
	id = /datum/reagent/medicine/manapot
	results = list(/datum/reagent/medicine/manapot = 45)
	required_reagents = list(/datum/reagent/alch/syrum_fish = 24, /datum/reagent/alch/syrum_ash = 24)

/datum/chemical_reaction/alch/salt
	name = "Солеварение"
	id = "saltify"
	required_reagents = list(/datum/reagent/alch/syrum_stone = 24, /datum/reagent/alch/syrum_ash = 24)

/datum/chemical_reaction/alch/salt/on_reaction(datum/reagents/holder, created_volume)
	var/location = get_turf(holder.my_atom)
	for(var/i = 1, i <= created_volume, i++)
		new /obj/item/reagent_containers/powder/salt(location)

/datum/chemical_reaction/alch/ozium
	name = "Опиумоварение"
	id = "oziumify"
	required_reagents = list(/datum/reagent/alch/syrum_poison_berry = 24, /datum/reagent/alch/syrum_swamp_weed = 24)

/datum/chemical_reaction/alch/ozium/on_reaction(datum/reagents/holder, created_volume)
	var/location = get_turf(holder.my_atom)
	for(var/i = 1, i <= created_volume, i++)
		new /obj/item/reagent_containers/powder/ozium(location)

/datum/chemical_reaction/alch/moon
	name = "Варка лунной пыли"
	id = "moondustify"
	required_reagents = list(/datum/reagent/alch/syrum_poison_berry = 24, /datum/reagent/alch/syrum_westleach_leaf = 24)

/datum/chemical_reaction/alch/moon/on_reaction(datum/reagents/holder, created_volume)
	var/location = get_turf(holder.my_atom)
	for(var/i = 1, i <= created_volume, i++)
		new /obj/item/reagent_containers/powder/moondust(location)

/datum/chemical_reaction/alch/spice
	name = "Варка специи"
	id = "spiceify"
	required_reagents = list(/datum/reagent/alch/syrum_swamp_weed = 24, /datum/reagent/alch/syrum_westleach_leaf = 24)

/datum/chemical_reaction/alch/spice/on_reaction(datum/reagents/holder, created_volume)
	var/location = get_turf(holder.my_atom)
	for(var/i = 1, i <= created_volume, i++)
		new /obj/item/reagent_containers/powder/spice(location)

/datum/chemical_reaction/alch/pure
	name = "Очищение лунной пыли"
	id = "clean moondustify"
	required_reagents = list(/datum/reagent/ozium = 15, /datum/reagent/moondust = 15)

/datum/chemical_reaction/alch/pure/on_reaction(datum/reagents/holder, created_volume)
	var/location = get_turf(holder.my_atom)
	for(var/i = 1, i <= created_volume, i++)
		new /obj/item/reagent_containers/powder/moondust_purest(location)

//------------------------------------tools and pre made bottles-----------------------------------------//

/obj/item/storage/backpack/rogue/backpack/rucksack
	name = "рюкзак"
	desc = "Объемный рюкзак на спине, в котором можно хранить множество вещей."
	icon_state = "rucksack"
	item_state = "rucksack"
	icon = 'icons/roguetown/clothing/storage.dmi'
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	resistance_flags = NONE
	max_integrity = 300
	equip_sound = 'sound/blank.ogg'
	bloody_icon_state = "bodyblood"
	sewrepair = TRUE

/obj/item/storage/backpack/rogue/backpack/rucksack/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	if(STR)
		STR.max_combined_w_class = 42
		STR.max_w_class = WEIGHT_CLASS_NORMAL
		STR.max_items = 10
		STR.not_while_equipped = TRUE

/obj/item/rogueweapon/surgery/saw/improv
	name = "примитивная пила"
	desc = "Инструмент, используемый для разрезания костей... Пилит плохо, но лучше, чем ничего."
	icon_state = "bonesaw_wood"
	possible_item_intents = list(/datum/intent/dagger/cut, /datum/intent/dagger/chop/cleaver)
	slot_flags = ITEM_SLOT_HIP
	parrysound = list('sound/combat/parry/bladed/bladedmedium (1).ogg','sound/combat/parry/bladed/bladedmedium (2).ogg','sound/combat/parry/bladed/bladedmedium (3).ogg')
	swingsound = list('sound/combat/wooshes/bladed/wooshmed (1).ogg','sound/combat/wooshes/bladed/wooshmed (2).ogg','sound/combat/wooshes/bladed/wooshmed (3).ogg')
	pickup_sound = 'sound/foley/equip/swordsmall2.ogg'
	force = 12
	throwforce = 12
	wdefense = 3
	wbalance = 1
	w_class = WEIGHT_CLASS_NORMAL
	thrown_bclass = BCLASS_CHOP
	tool_behaviour = TOOL_IMPROVSAW

/obj/item/rogueweapon/surgery/hemostat/improv
	name = "примитивный зажим"
	desc = "Инструмент, используемый для зажима мягких тканей. Плохая альтернатива металлическим инструментам."
	icon_state = "forceps_wood"
	possible_item_intents = list(/datum/intent/use)
	slot_flags = ITEM_SLOT_HIP|ITEM_SLOT_MOUTH
	parrysound = list('sound/combat/parry/bladed/bladedsmall (1).ogg','sound/combat/parry/bladed/bladedsmall (2).ogg','sound/combat/parry/bladed/bladedsmall (3).ogg')
	swingsound = list('sound/combat/wooshes/bladed/wooshsmall (1).ogg','sound/combat/wooshes/bladed/wooshsmall (2).ogg','sound/combat/wooshes/bladed/wooshsmall (3).ogg')
	pickup_sound = 'sound/foley/equip/swordsmall2.ogg'
	tool_behaviour = TOOL_IMPROVHEMOSTAT

/obj/item/rogueweapon/surgery/retractor/improv
	name = "примитивный расширитель"
	desc = "Инструмент, используемый для раскрытия ткани во время хирургической операции. Надеюсь, выдержит..."
	icon_state = "speculum_wood"
	possible_item_intents = list(/datum/intent/use)
	slot_flags = ITEM_SLOT_HIP
	parrysound = list('sound/combat/parry/bladed/bladedsmall (1).ogg','sound/combat/parry/bladed/bladedsmall (2).ogg','sound/combat/parry/bladed/bladedsmall (3).ogg')
	swingsound = list('sound/combat/wooshes/bladed/wooshsmall (1).ogg','sound/combat/wooshes/bladed/wooshsmall (2).ogg','sound/combat/wooshes/bladed/wooshsmall (3).ogg')
	pickup_sound = 'sound/foley/equip/swordsmall2.ogg'
	wdefense = 3
	wbalance = 1
	w_class = WEIGHT_CLASS_NORMAL
	thrown_bclass = BCLASS_BLUNT
	tool_behaviour = TOOL_IMPROVRETRACTOR

/obj/item/storage/fancy/pilltin
	name = "баночка для таблеток"
	desc = "Банка для всех необходимых таблеток."
	icon = 'icons/roguetown/items/surgery.dmi'
	icon_state = "pilltin"
	w_class = WEIGHT_CLASS_TINY
	throwforce = 1
	slot_flags = null
	icon_type = "pill"

/obj/item/storage/fancy/pilltin/update_icon()
	if(fancy_open)
		if(contents.len == 0)
			icon_state = "pilltin_empty"
		else if(istype(contents[1], /obj/item/reagent_containers/pill/caffpill))
			icon_state = "pilltinwake_open"
		else if(istype(contents[1], /obj/item/reagent_containers/pill/pnkpill))
			icon_state = "pilltinpink_open"
		else
			icon_state = "pilltincustom_open"
	else
		icon_state = "pilltin"

/obj/item/storage/fancy/pilltin/MiddleClick(mob/user, params)
	fancy_open = !fancy_open
	update_icon()
	to_chat(user, span_notice("[src] [fancy_open ? "открыта" : "закрыта"]."))

/obj/item/storage/fancy/pilltin/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	if(STR)
		STR.max_combined_w_class = 42
		STR.max_w_class = WEIGHT_CLASS_NORMAL
		STR.max_items = 12
		STR.set_holdable(list(/obj/item/reagent_containers/pill))

/obj/item/storage/fancy/pilltin/wake
	name = "баночка для таблеток (тонизирующие)"

	populate_contents = list(
		/obj/item/reagent_containers/pill/caffpill,
		/obj/item/reagent_containers/pill/caffpill,
		/obj/item/reagent_containers/pill/caffpill
	)

/obj/item/storage/fancy/skit
	name = "хирургический набор"
	desc = "Легкий и компактный."
	icon = 'icons/roguetown/items/surgery.dmi'
	icon_state = "skit"
	w_class = WEIGHT_CLASS_SMALL
	slot_flags = ITEM_SLOT_HIP
	throwforce = 1

/obj/item/storage/fancy/skit/update_icon()
	if(fancy_open)
		if(contents.len == 0)
			icon_state = "skit_empty"
		else
			icon_state = "skit_open"
	else
		icon_state = "skit"

/obj/item/storage/fancy/skit/examine(mob/user)
	. = ..()
	if(fancy_open)
		if(length(contents) == 1)
			. += "В нём остался один предмет."
		else
			. += "В нём [contents.len <= 0 ? "не осталось" : "осталось [contents.len]"] предметов."

/obj/item/storage/fancy/skit/attack_self(mob/user)
	fancy_open = !fancy_open
	update_icon()
	. = ..()

/obj/item/storage/fancy/skit/Entered(mob/user)
	if(!fancy_open)
		to_chat(user, span_notice("Нужно открыть [src], чтобы достать предметы."))
		return
	fancy_open = TRUE
	update_icon()
	. = ..()

/obj/item/storage/fancy/skit/Exited(mob/user)
	fancy_open = FALSE
	update_icon()
	. = ..()

/obj/item/storage/fancy/skit/MiddleClick(mob/user, params)
	fancy_open = !fancy_open
	update_icon()
	to_chat(user, span_notice("[src] [fancy_open ? "открыт" : "закрыт"]."))

/obj/item/storage/fancy/skit/ComponentInitialize()
	..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 10
	STR.max_w_class = WEIGHT_CLASS_NORMAL
	STR.max_combined_w_class = 42
	STR.set_holdable(list(
		/obj/item/rogueweapon/surgery/scalpel,
		/obj/item/rogueweapon/surgery/saw,
		/obj/item/rogueweapon/surgery/hemostat,
		/obj/item/rogueweapon/surgery/retractor,
		/obj/item/rogueweapon/surgery/bonesetter,
		/obj/item/rogueweapon/surgery/cautery,
		/obj/item/natural/worms/leech/cheele,
		/obj/item/needle,
		/obj/item/needle/thorn,
		/obj/item/needle/pestra
	))

/obj/item/storage/fancy/skit
	populate_contents = list(
		/obj/item/rogueweapon/surgery/scalpel,
		/obj/item/rogueweapon/surgery/saw,
		/obj/item/rogueweapon/surgery/hemostat,
		/obj/item/rogueweapon/surgery/hemostat,
		/obj/item/rogueweapon/surgery/retractor,
		/obj/item/rogueweapon/surgery/bonesetter,
		/obj/item/rogueweapon/surgery/cautery,
		/obj/item/natural/worms/leech/cheele,
		/obj/item/needle/pestra
	)


/obj/item/storage/fancy/ifak
	name = "личный перевязочный набор"
	desc = "Персональный лечебный мешочек, в котором есть все, чтобы помешать вам или кому-то еще встретиться с Некрой. В комплект поставки даже входит небольшой справочник для медлительных."
	icon = 'icons/roguetown/items/surgery.dmi'
	icon_state = "ifak"
	w_class = WEIGHT_CLASS_SMALL
	throwforce = 1
	slot_flags = null

	populate_contents = list(
		/obj/item/reagent_containers/hypospray/medipen/sealbottle/reju,
		/obj/item/natural/bundle/cloth/bandage/full,
		/obj/item/reagent_containers/hypospray/medipen/sty/detox,
		/obj/item/reagent_containers/pill/pnkpill,
		/obj/item/candle/yellow,
		/obj/item/needle,
		/obj/item/book/rogue/medical_notebook
	)

/obj/item/storage/fancy/ifak/update_icon()
	if(fancy_open)
		if(contents.len == 0)
			icon_state = "ifak_empty"
		else
			icon_state = "ifak_open"
	else
		icon_state = "ifak"

/obj/item/storage/fancy/ifak/examine(mob/user)
	. = ..()
	if(fancy_open)
		if(length(contents) == 1)
			. += "В нём остался один предмет."
		else
			. += "В нём [contents.len <= 0 ? "не осталось" : "осталось [contents.len]"] предметов."

/obj/item/storage/fancy/ifak/attack_self(mob/user)
	fancy_open = !fancy_open
	update_icon()
	. = ..()

/obj/item/storage/fancy/ifak/Entered(mob/user)
	if(!fancy_open)
		to_chat(user, span_notice("Нужно открыть [src], чтобы достать предметы."))
		return
	fancy_open = TRUE
	update_icon()
	. = ..()

/obj/item/storage/fancy/ifak/Exited(mob/user)
	fancy_open = FALSE
	update_icon()
	. = ..()

/obj/item/storage/fancy/ifak/MiddleClick(mob/user, params)
	fancy_open = !fancy_open
	update_icon()
	to_chat(user, span_notice("[src] [fancy_open ? "открыт" : "закрыт"]."))

/obj/item/storage/fancy/ifak/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	STR.max_items = 8
	STR.max_w_class = WEIGHT_CLASS_NORMAL
	STR.max_combined_w_class = 42
	STR.set_holdable(list(
		/obj/item/reagent_containers/hypospray/medipen/sealbottle/reju,
		/obj/item/reagent_containers/hypospray/medipen/sty/detox,
		/obj/item/natural/cloth/bandage,
		/obj/item/natural/bundle/cloth/bandage,
		/obj/item/natural/bundle/cloth/bandage/full,
		/obj/item/reagent_containers/pill/pnkpill,
		/obj/item/candle,
		/obj/item/needle,
		/obj/item/needle/thorn,
		/obj/item/needle/pestra,
		/obj/item/book/rogue/medical_notebook
	))

/obj/item/reagent_containers/hypospray/medipen/sealbottle
	name = "sealed bottle item"
	desc = "If you see this, call an admin."
	icon = 'icons/roguetown/items/surgery.dmi'
	icon_state = "THEbottle"

/obj/item/reagent_containers/hypospray/medipen/sealbottle/attack_self(mob/user)
	if(has_cap)
		has_cap = FALSE
		icon_state = "[icon_state]_nocap"  // Update icon state for no cap
		to_chat(user, span_notice("Вы срываете пробку с горлышка [src]."))
		playsound(src, 'modular/Smoker/sound/corkpop.ogg', 100, TRUE)
	else
		to_chat(user, span_warning("[src] не имеет пробки."))

/obj/item/reagent_containers/hypospray/medipen/sealbottle/update_icon()
	if(reagents.total_volume > 0)
		icon_state = initial(icon_state)
	else
		icon_state = "[initial(icon_state)]0"

/obj/item/reagent_containers/hypospray/medipen/sealbottle/inject(mob/living/M, mob/user)
	if(reagents.total_volume <= 0)
		return FALSE
	if(!M)
		return FALSE
	if(user == M)
		to_chat(user, span_danger("Вы пьете [src]!"))
	else
		to_chat(user, span_danger("Вы заставляете [M] выпить [src]."))
	reagents.trans_to(M, reagents.total_volume, transfered_by = user)  // Transfer all remaining reagents
	reagents.maximum_volume = 0  // Makes them useless afterwards
	reagents.flags = NONE  // Ensure reagents are deactivated
	update_icon()
	playsound(src, 'modular/Smoker/sound/chug.ogg', 100, TRUE)
	return TRUE

/obj/item/reagent_containers/hypospray/medipen/sealbottle/attack(mob/user)
	if(user.canUseTopic(src, BE_CLOSE, FALSE, NO_TK))
		if(has_cap)
			to_chat(user, span_warning("Горлышко [src] запечатано пробкой. Нужно сначала её снять."))
			return
		inject(user, user)

/obj/item/reagent_containers/hypospray/medipen/sealbottle/attack(mob/user)
	if(user.canUseTopic(src, BE_CLOSE, FALSE, NO_TK))
		if(has_cap)
			to_chat(user, span_warning("Горлышко [src] запечатано пробкой. Нужно сначала её снять."))
			return
		inject(user, user)

/obj/item/reagent_containers/hypospray/medipen/sty
	name = "sealed sty"
	desc = "If you see this, call an admin."
	icon = 'icons/roguetown/items/surgery.dmi'
	icon_state = "sty"

/obj/item/reagent_containers/hypospray/medipen/sty/attack_self(mob/user)
	if(has_cap)
		has_cap = FALSE
		icon_state = "[icon_state]_nocap"  // Update icon state for no cap
		to_chat(user, span_notice("Вы срываете зубами колпачок с [src] и выплевываете его."))
		playsound(src, 'modular/Smoker/sound/capoff.ogg', 100, TRUE)
	else
		to_chat(user, span_warning("[src] не имеет колпачка."))

/obj/item/reagent_containers/hypospray/medipen/sty/update_icon()
	if(reagents.total_volume > 0)
		icon_state = initial(icon_state)
	else
		icon_state = "[initial(icon_state)]0"

/obj/item/reagent_containers/hypospray/medipen/sty/inject(mob/living/M, mob/user)
	if(reagents.total_volume <= 0)
		return FALSE
	if(!M)
		return FALSE
	if(user == M)
		to_chat(user, span_danger("Вы делаете себе укол [src]."))
	else
		to_chat(user, span_danger("Вы делате [M] укол [src]!"))
	reagents.trans_to(M, reagents.total_volume, transfered_by = user)  // Transfer all remaining reagents
	reagents.maximum_volume = 0  // Makes them useless afterwards
	reagents.flags = NONE  // Ensure reagents are deactivated
	update_icon()
	playsound(src, 'modular/Smoker/sound/inject.ogg', 100, TRUE)
	return TRUE

/obj/item/reagent_containers/hypospray/medipen/sty/attack(mob/user)
	if(user.canUseTopic(src, BE_CLOSE, FALSE, NO_TK))
		if(has_cap)
			to_chat(user, span_warning("Колпачок на [src] еще не сорван. Нужно избавиться от колпачка."))
			return
		inject(user, user)

/obj/item/reagent_containers/pill/caffpill
	name = "Энергия Дендора"
	desc = "Таблетки от сонливости и для повышения бдительности."
	icon_state = "pillg"
	icon = 'icons/roguetown/items/surgery.dmi'
	list_reagents = list(/datum/reagent/medicine/caffeine = 1, /datum/reagent/medicine/antihol = 10, /datum/reagent/consumable/coffee = 81) //coffee OD is safe. causes jitters for awhile.
	dissolvable = FALSE
	grind_results = null

/obj/item/reagent_containers/pill/pnkpill
	name = "Pозовые исцеляющие таблетки"
	desc = "Маленькие розовые шарики. С беглого взгляда вы можете быть уверены, что это разбавленные красный и пепельный цвета."
	icon_state = "pinkb"
	icon = 'icons/roguetown/items/surgery.dmi'
	list_reagents = list(/datum/reagent/ash = 15, /datum/reagent/iron = 15, /datum/reagent/medicine/healthpot = 15)
	dissolvable = FALSE
	grind_results = null

/obj/item/reagent_containers/hypospray/medipen/sty/detox
	name = "Антитоксин"
	desc = "Очищает организм от всего неестественного."
	volume = 34
	amount_per_transfer_from_this = 34
	list_reagents = list(/datum/reagent/medicine/antihol = 10, /datum/reagent/medicine/pen_acid = 24)

/obj/item/reagent_containers/hypospray/medipen/sealbottle/reju
	name = "Элексир омоложения"
	desc = "Восстанавливает кровь, заживляет раны, помогает стабилизировать дыхание и слегка притупляет боль."
	icon_state = "THEbottle"
	volume = 16
	amount_per_transfer_from_this = 16
	list_reagents = list(/datum/reagent/medicine/stimu = 15, /datum/reagent/medicine/caffeine = 1)

/obj/item/reagent_containers/hypospray/medipen/sealbottle/purify
	name = "элексир очищения"
	desc = "Мощный препарат, очищающий кровь и заживляющий раны на теле. Очень больно."
	icon_state = "THEbottle"
	volume = 30
	amount_per_transfer_from_this = 30
	list_reagents = list(/datum/reagent/medicine/purify = 20, /datum/reagent/ozium = 5, /datum/reagent/consumable/ethanol/hooch = 5) // lil laudanum for your troubles

/obj/item/natural/cloth/bandage
	name = "повязка"
	desc = "Простая повязка, используемая для перевязки ран. Наложение повязки занимает больше времени, но такая перевязь более эффективна, чем простая тряпка. Также медленно заживляет раны и сращивает переломы."
	icon_state = "bandageroll"
	icon = 'icons/roguetown/items/surgery.dmi'
	possible_item_intents = list(/datum/intent/use)
	force = 0
	throwforce = 0
	firefuel = 5 MINUTES
	resistance_flags = FLAMMABLE
	slot_flags = ITEM_SLOT_MOUTH | ITEM_SLOT_HIP
	body_parts_covered = null
	experimental_onhip = TRUE
	max_integrity = 20
	muteinmouth = TRUE
	w_class = WEIGHT_CLASS_TINY
	spitoutmouth = FALSE
	bundletype = /obj/item/natural/bundle/cloth/bandage
	bandage_effectiveness = 1

/obj/item/natural/cloth/bandage/attack(mob/living/carbon/human/M, mob/user)
	if (!M.can_inject(user, TRUE)) return
	if (!ishuman(M)) return
	var/mob/living/carbon/human/H = M
	var/obj/item/bodypart/affecting = H.get_bodypart(check_zone(user.zone_selected))
	if (!affecting) return
	if (affecting.bandage)
		to_chat(user, "Повязка уже наложена на эту часть тела.")
		return
	var/used_time = 100
	if (H.mind)
		used_time -= (H.mind.get_skill_level(/datum/skill/misc/treatment) * 10)
	playsound(loc, 'sound/foley/bandage.ogg', 100, FALSE)
	if (!do_mob(user, M, used_time)) return
	playsound(loc, 'sound/foley/bandage.ogg', 100, FALSE)
	user.dropItemToGround(src)
	affecting.try_bandage(src)
	H.update_damage_overlays()

	// Heal the specific body part every second while bandaged and manage wound pain and disabling effects
	addtimer(CALLBACK(src, /proc/heal_and_manage_pain_disabling, H, affecting), 10, 1, TRUE)
	if (M == user)
		user.visible_message("Вы перевязываете [affecting].")
	else
		user.visible_message("Вы помогаете [M] и перевязываете [affecting] .")

/proc/heal_and_manage_pain_disabling(var/mob/living/carbon/human/H, var/obj/item/bodypart/affecting)
	if (!affecting) return
	affecting.heal_wounds(0.5)
	for (var/datum/wound/W in affecting.wounds)
		if (W.woundpain > 30)
			W.woundpain = 30

/obj/item/natural/bundle/cloth/bandage
	name = "набор повязок"
	desc = "Связка бинтов, используемых для перевязки ран. Эффективнее останавливает кровь, чем простая ткань"
	icon = 'icons/roguetown/items/surgery.dmi'
	icon_state = "bandageroll1"
	possible_item_intents = list(/datum/intent/use)
	force = 0
	throwforce = 0
	maxamount = 3
	firefuel = 15 MINUTES
	resistance_flags = FLAMMABLE
	w_class = WEIGHT_CLASS_TINY
	stacktype = /obj/item/natural/cloth/bandage
	stackname = "bandages"
	icon1 = "bandageroll1"
	icon1step = 2
	icon2 = "bandageroll2"
	icon2step = 3

/obj/item/book/rogue/medical_notebook
	name = "Медицинский блокнот"
	desc = "Краткий обзор медицинских работ."
	icon_state ="book6_0"
	base_icon_state = "book6"
	bookfile = "medical.json"

/obj/item/natural/bundle/cloth/bandage/full
	icon_state = "bandageroll2"
	amount = 3
	firefuel = 60 MINUTES

//------------------------------------alembic/brewing--------------------------------//

// I'm going to hate every moment of working on this.


// *cry. agony.

/obj/item/reagent_containers/glass/alembic
	name = "перегонный куб"
	possible_item_intents = list(INTENT_POUR, INTENT_SPLASH)
	desc = "Так значит, вы теперь алхимик?"
	icon = 'icons/roguetown/items/surgery.dmi'
	icon_state = "alembic_empty"
	volume = 120
	reagent_flags = OPENCONTAINER|REFILLABLE|DRAINABLE|AMOUNT_VISIBLE
	var/speed_multiplier = 1 // How fast it brews. Defaults to 100% (1.0). Lower is better.
	var/list/active_brews = list()
	var/brewing_started = FALSE // Track if brewing has started
	var/datum/looping_sound/boilloop/boilloop

/obj/item
	var/can_brew = FALSE // If FALSE, this object cannot be brewed
	var/brew_reagent // If NULL and this object can be brewed, it uses a generic fruit_wine reagent and adjusts its variables
	var/brew_amt = 24
	var/brewing_time
	var/start_time
	var/mill_result = null

/obj/item/reagent_containers/glass/alembic/Initialize()
	create_reagents(100, REFILLABLE | DRAINABLE | AMOUNT_VISIBLE) // 2 Bottles capacity
	icon_state = "alembic_empty"
	boilloop = new(src, FALSE)
	. = ..()

/obj/item/reagent_containers/glass/alembic/examine(mob/user)
	. = ..()
	if (active_brews.len == 0)
		. += span_notice("Куб простаивает.")
	else
		. += span_notice("Куб в процессе перегонки.")
		for (var/obj/item/I in active_brews)
			var/time_left = (I.brewing_time - (world.time - I.start_time)) / 10
			. += span_notice("[I]: [time_left] секунд до заершения.")

/obj/item/reagent_containers/glass/alembic/proc/makebrew(obj/item/I)
	if(I.reagents)
		I.reagents.remove_all_type(/datum/reagent, I.reagents.total_volume)
		I.reagents.trans_to(src, I.reagents.total_volume)
	if(I.brew_reagent)
		reagents.add_reagent(I.brew_reagent, I.brew_amt)
	qdel(I)
	active_brews -= I
	if(active_brews.len >= 2)
		icon_state = "alembic_full"
	else
		icon_state = "alembic_empty"
	playsound(src, "bubbles", 60, TRUE)
	boilloop.stop() // Stop the looping sound once brewing is done
	brewing_started = FALSE // Reset brewing status after brewing completes

/obj/item/reagent_containers/glass/alembic/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item))
		if(user.mind.get_skill_level(/datum/skill/misc/treatment) <= 2)
			to_chat(user, span_warning("Я без понятия, как этим пользоваться."))
			return TRUE
		if(!I.can_brew)
			to_chat(user, span_warning("Из этого ничего не сварить."))
			return TRUE
		else if(active_brews.len >= 2 || reagents.total_volume >= 99)
			to_chat(user, span_warning("Я могу одновременно перегонять до двух предметов. Возможно, установка забита до отказа."))
			return TRUE
		else if(!user.transferItemToLoc(I, src))
			to_chat(user, span_warning("[I] прилипло к моей руке!"))
			return TRUE
		to_chat(user, span_info("Я помещаю [I] внутрь [src]."))
		I.start_time = world.time
		I.brewing_time = 600
		active_brews += I
		icon_state = "alembic_brew"
		boilloop.start()
		addtimer(CALLBACK(src, /obj/item/reagent_containers/glass/alembic/proc/makebrew, I), I.brewing_time)
		return TRUE
	return ..()

/obj/item/reagent_containers/glass/alembic/attack_self(mob/user)
	if(brewing_started)
		to_chat(user, span_warning("Перегонка началась. Больше предметы нельзя вернуть."))
		return TRUE
	for(var/obj/item/I in active_brews)
		I.forceMove(drop_location())
	active_brews.Cut()
	icon_state = "alembic_empty"
	to_chat(user, span_notice("Я вытаскиваю предметы, лежащие внутри куба."))



/obj/item/reagent_containers/glass/mortar
	name = "ступка"
	desc = "Небольшая каменная чаша с толстыми стенками. Её используют для измельчения продуктов."
	icon = 'icons/roguetown/items/surgery.dmi'
	icon_state = "mortar_empty"
	volume = 100
	reagent_flags = OPENCONTAINER|REFILLABLE|DRAINABLE
	spillable = FALSE
	var/obj/item/grinded
	var/grinding_started = FALSE

/obj/item/reagent_containers/glass/mortar/attack_self(mob/user)
	if(grinding_started)
		to_chat(user, "Перемолка началась, я больше не смогу вернуть исходные предметы.")
		return TRUE
	if(grinded)
		grinded.forceMove(drop_location())
		grinded = null
		icon_state = "mortar_empty"
		to_chat(user, "Я вытаскиваю предметы, лежащие внутри ступки.")

/obj/item/reagent_containers/glass/mortar/MiddleClick(mob/user, params)
	if(grinded)
		grinding_started = TRUE // Mark grinding as started
		to_chat(user, "Я начинаю перемолку...")
		if((do_after(user, 25, target = src)) && grinded)
			if(grinded.mill_result && !istype(user.rmb_intent, /datum/rmb_intent/strong)) // This goes first. Strong intent to bypass.
				new grinded.mill_result(get_turf(src))
				QDEL_NULL(grinded)
				icon_state = reagents.total_volume > 0 ? "mortar_full" : "mortar_empty"
				grinding_started = FALSE // Reset grinding status
				return
			if(grinded.juice_results)
				grinded.on_juice()
				reagents.add_reagent_list(grinded.juice_results)
				to_chat(user, "Я выжал [grinded] до однородной жидкости.")
			if(grinded.grind_results && !isemptylist(grinded.grind_results))
				grinded.on_grind()
				reagents.add_reagent_list(grinded.grind_results)
				to_chat(user, "Я перетер [grinded] в однородный порошок.")
				QDEL_NULL(grinded)
				icon_state = reagents.total_volume > 0 ? "mortar_full" : "mortar_empty"
				grinding_started = FALSE // Reset grinding status
				return
			if(grinded.reagents) // Other stuff that might have reagents in them, let's not cause a runtime shall we?
				grinded.reagents.trans_to(src, grinded.reagents.total_volume, transfered_by = user)
				icon_state = reagents.total_volume > 0 ? "mortar_full" : "mortar_empty"
				to_chat(user, "Я растолкал [grinded] в бесформенную кашицу.")
				QDEL_NULL(grinded)
				grinding_started = FALSE // Reset grinding status
				return
			grinding_started = FALSE // Reset grinding status
			return
		else
			to_chat(user, "Здесь нечего перемалывать!")
			return

/obj/item/reagent_containers/glass/mortar/attackby(obj/item/I, mob/living/carbon/human/user)
	if(grinded)
		to_chat(user, "Внутри уже что-то есть!")
		return TRUE
	if(istype(I, /obj/item/reagent_containers/glass))
		if(user.used_intent.type == INTENT_POUR)
			if(!I.reagents.total_volume)
				to_chat(user, "[I] пуста!")
				return TRUE
			if(reagents.holder_full())
				to_chat(user, "[src] заполнена.")
				return TRUE
			user.visible_message(span_notice("Переливание начинается."), span_notice("Переливание окончено."))
			if(user.m_intent != MOVE_INTENT_SNEAK)
				if(poursounds)
					playsound(user.loc, pick(poursounds), 100, TRUE)
			for(var/i in 1 to 10)
				if(do_after(user, 8, target = src))
					if(!I.reagents.total_volume) break
					if(reagents.holder_full()) break
					if(!I.reagents.trans_to(src, amount_per_transfer_from_this, transfered_by = user))
						reagents.reaction(src, TOUCH, amount_per_transfer_from_this)
					else break
			return
		if(is_drainable() && (user.used_intent.type == /datum/intent/fill))
			if(!reagents.total_volume)
				to_chat(user, "[src] пуст!")
				return
			if(I.reagents.holder_full())
				to_chat(user, "[I] полон.")
				return
			if(user.m_intent != MOVE_INTENT_SNEAK)
				if(fillsounds)
					playsound(user.loc, pick(fillsounds), 100, TRUE)
			user.visible_message(span_notice("Переливание начинается."), span_notice("Переливание окончено."))
			for(var/i in 1 to 10)
				if(do_after(user, 8, target = src))
					if(I.reagents.holder_full()) break
					if(!reagents.total_volume) break
					reagents.trans_to(I, amount_per_transfer_from_this, transfered_by = user)
				else break
			return
	if(I.juice_results || I.grind_results || I.mill_result)
		I.forceMove(src)
		grinded = I
		icon_state = "mortar_grind"
		return
	to_chat(user, "Я не могу перемолоть это!")




//-----------------------------------crafts----------------------------------------//

/datum/anvil_recipe/tools/alembic
	name = "Перегонный куб - (1 железо)"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/reagent_containers/glass/alembic
	i_type = "Tools"

/datum/crafting_recipe/roguetown/mortar
	name = "Ступка и пестик - (1 полено, 1 палка)"
	result = /obj/item/reagent_containers/glass/mortar
	reqs = list(/obj/item/grown/log/tree/stick = 1, /obj/item/grown/log/tree/small = 1,)
	skill_level = 1
	skillcraft = /datum/skill/craft/crafting

/datum/crafting_recipe/roguetown/bandage
	name = "Набор повязок - (3 ткани, 1 пепел)"
	result = /obj/item/natural/bundle/cloth/bandage/full
	reqs = list(/obj/item/natural/cloth = 3, /obj/item/ash = 1,)
	skill_level = 2
	skillcraft = /datum/skill/misc/treatment

/datum/crafting_recipe/roguetown/impsaw
	name = "примитивная пила - (1 волокно, 1 камень, 1 палка)"
	result = /obj/item/rogueweapon/surgery/saw/improv
	reqs = list(/obj/item/natural/fibers = 1, /obj/item/natural/stone = 1, /obj/item/grown/log/tree/stick = 1,)
	skill_level = 1
	skillcraft = /datum/skill/craft/crafting

/datum/crafting_recipe/roguetown/impretra
	name = "примитивный зажим - (1 волокно, 2 палки)"
	result = /obj/item/rogueweapon/surgery/hemostat/improv
	reqs = list(/obj/item/natural/fibers = 1, /obj/item/grown/log/tree/stick = 2,)
	skill_level = 1
	skillcraft = /datum/skill/craft/crafting

/datum/crafting_recipe/roguetown/imphemo
	name = "примитивный расширитель - (1 волокно, 2 палки)"
	result = /obj/item/rogueweapon/surgery/retractor/improv
	reqs = list(/obj/item/natural/fibers = 1, /obj/item/grown/log/tree/stick = 2,)
	skill_level = 1
	skillcraft = /datum/skill/craft/crafting

/datum/crafting_recipe/roguetown/rucksack
	name = "рюкзак - (1 веревка, 1 мешок)"
	result = /obj/item/storage/backpack/rogue/backpack/rucksack
	reqs = list(/obj/item/rope = 1, /obj/item/storage/roguebag/crafted = 1,)
	skill_level = 0
	skillcraft = /datum/skill/craft/crafting

/*/datum/crafting_recipe/roguetown/splint
	name = "splint"
	result = /obj/item/splint
	reqs = list(/obj/item/natural/cloth = 1, /obj/item/grown/log/tree/stick = 1,)
	skill_level = 2
	skillcraft = /datum/skill/misc/treatment*/
