// Эффект

/atom/movable/screen/alert/status_effect/buff/wooden_skin
	name = "Дубовая кожа"
	desc = "Моя кожа прочна, как кора дуба"
	icon_state = "buff"

/datum/status_effect/buff/wooden_skin
	id = "wooden_skin"
	alert_type = /atom/movable/screen/alert/status_effect/buff/wooden_skin
	effectedstats = list("constitution" = 2, "endurance" = 1)
	duration = 1 MINUTES

// Чудо

/obj/effect/proc_holder/spell/invoked/wood_skin
	name = "Дубовая кожа"
	range = 7
	overlay_state = "blesscrop"
	releasedrain = 30
	charge_max = 1.5 MINUTES
	req_items = list(
		/obj/item/clothing/neck/roguetown/psicross/dendor,
		/obj/item/clothing/mask/rogue/briar_mask,
	)
	sound = 'sound/magic/churn.ogg'
	associated_skill = /datum/skill/magic/druidic
	invocation = "Да окрепнет кожа перед угрозой!"
	invocation_type = "shout" //can be none, whisper, emote and shout
	miracle = TRUE
	devotion_cost = 20
	message = span_notice("Моя кожа становится плотной, как кора дуба...")

/obj/effect/proc_holder/spell/invoked/wood_skin/cast(list/targets, mob/user = usr)
	. = ..()
	if(!isliving(targets[1]))
		return FALSE

	var/mob/living/target = targets[1]

	if(target.has_status_effect(/datum/status_effect/buff/wooden_skin))
		return FALSE

	target.apply_status_effect(/datum/status_effect/buff/wooden_skin)
	return TRUE
