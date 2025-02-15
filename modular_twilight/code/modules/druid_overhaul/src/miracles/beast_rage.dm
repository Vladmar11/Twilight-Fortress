// -- Debuff

/atom/movable/screen/alert/status_effect/debuff/beast_rage
	name = "Уставший зверь"
	desc = "Мой внутренни зверь устал, как и я."
	icon_state = "neutral"

/datum/status_effect/debuff/beast_rage_weakness
	id = "beast_rage_weakness"
	alert_type = /atom/movable/screen/alert/status_effect/debuff/beast_rage
	effectedstats = list(
		"speed" = -1,
		"strength" = -1,
	)
	duration = 1 MINUTES

// -- Buff

/atom/movable/screen/alert/status_effect/buff/beast_rage
	name = "Буйствующий зверь"
	desc = "Мой внутренни зверь буйствует! Силы переполняют меня, но мой разум гаснет!"
	icon_state = "buff"

/datum/status_effect/buff/beast_rage
	id = "beast_rage"
	alert_type = /atom/movable/screen/alert/status_effect/buff/beast_rage
	effectedstats = list(
		"speed" = 2,
		"strength" = 2,
		"endurance" = 1,
		"intelligence" = -5,
	)
	duration = 1 MINUTES

/datum/status_effect/buff/beast_rage/on_remove()
	. = ..()
	owner.apply_status_effect(/datum/status_effect/debuff/beast_rage_weakness)
	owner.apply_status_effect(/datum/status_effect/debuff/sleepytime)
	owner.clear_fullscreen("beast_mode")

// -- Spell

/obj/effect/proc_holder/spell/self/beast_rage
	name = "Буйство зверя"
	desc = ""
	overlay_state = "dendor"
	charge_max = 2.5 MINUTES
	req_items = list(
		/obj/item/clothing/neck/roguetown/psicross/dendor,
		/obj/item/clothing/mask/rogue/briar_mask,
	)
	sound = 'sound/magic/churn.ogg'
	associated_skill = /datum/skill/magic/druidic
	invocation = "Вот она! Ярость дикого сердца!"
	invocation_type = "shout" //can be none, whisper, emote and shout
	miracle = TRUE
	devotion_cost = 50

/obj/effect/proc_holder/spell/self/beast_rage/cast(mob/living/user = usr)
	. = ..()
	user.remove_status_effect(/datum/status_effect/debuff/sleepytime)
	user.apply_status_effect(/datum/status_effect/buff/beast_rage)
	user.overlay_fullscreen("beast_mode", /atom/movable/screen/fullscreen/color_vision/red)
	user.Dizzy(10)
