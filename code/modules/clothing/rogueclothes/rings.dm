

/obj/item/clothing/ring
	name = "кольцо"
	desc = ""
	w_class = WEIGHT_CLASS_TINY
	icon = 'icons/roguetown/clothing/rings.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/rings.dmi'
	sleeved = 'icons/roguetown/clothing/onmob/rings.dmi'
	sleevetype = "shirt"
	icon_state = ""
	slot_flags = ITEM_SLOT_RING
	resistance_flags = FIRE_PROOF | ACID_PROOF
	anvilrepair = /datum/skill/craft/blacksmithing

/obj/item/clothing/ring/silver
	name = "серебрянное кольцо"
	icon_state = "ring_s"
	sellprice = 33

/obj/item/clothing/ring/copper
	name = "медное кольцо"
	icon_state = "ring_c"
	sellprice = 15

/obj/item/clothing/ringP  /////////////////////// cast focus ring for acolytes and shit.
	parent_type = /obj/item/clothing/neck/roguetown/psicross
	name = "колько с крестом"
	desc = "Кольцо с выгравированным крестом Псайдона для религиозных священников, аколитов и фанатиков."
	w_class = WEIGHT_CLASS_TINY
	icon = 'icons/roguetown/clothing/rings.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/rings.dmi'
	sleeved = 'icons/roguetown/clothing/onmob/rings.dmi'
	sleevetype = "shirt"
	icon_state = "castring"
	slot_flags = ITEM_SLOT_RING
	resistance_flags = FIRE_PROOF | ACID_PROOF
	anvilrepair = /datum/skill/craft/blacksmithing

/obj/item/clothing/ringP/graggar
	name = "испорченное кольцо с крестом"
	desc = "Испорченное кольцо, которым пользуются разрушительные силы."

/obj/item/clothing/ring/gold
	name = "золотое кольцо"
	icon_state = "ring_g"
	sellprice = 45

/obj/item/clothing/ring/lantern
	parent_type = /obj/item/flashlight/flare/torch/lantern // Inherits parents properties from lantern
	name = "кольцо алхимика"
	icon_state = "lanternR"
	w_class = WEIGHT_CLASS_TINY
	icon = 'icons/roguetown/clothing/rings.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/rings.dmi'
	sleeved = 'icons/roguetown/clothing/onmob/rings.dmi'
	sleevetype = "shirt"
	desc = "Крохотное пламя по щелчку пальца. (ПКМ по кольцу и СКМ, чтобы зажечь.)"
	light_range = 4 // standard torch range
	on = FALSE
	flags_1 = CONDUCT_1
	slot_flags = ITEM_SLOT_HIP
	force = 5
	on_damage = 5
	produce_heat = 1500
	heat = 1000
	slot_flags = ITEM_SLOT_RING
	resistance_flags = FIRE_PROOF | ACID_PROOF
	anvilrepair = /datum/skill/craft/blacksmithing
	fuel = 9999
	sellprice = 30

/obj/item/clothing/ring/lantern/MiddleClick(mob/living/user, params)
	if (!on)
		on = TRUE
		to_chat(user, "<span class='notice'>Щелкнув пальцем, вы высекаете пламя из кольца.</span>")
	..()

/obj/item/clothing/ring/active
	var/active = FALSE
	desc = "К сожалению, как и большинство магических колец, его следует использовать с осторожностью. (ПКМ, чтобы активировать)"
	var/cooldowny
	var/cdtime
	var/activetime
	var/activate_sound

/obj/item/clothing/ring/active/attack_right(mob/user)
	if(loc != user)
		return
	if(cooldowny)
		if(world.time < cooldowny + cdtime)
			to_chat(user, span_warning("Ничего не происходит."))
			return
	user.visible_message(span_warning("[user] поворачивает [src]!"))
	if(activate_sound)
		playsound(user, activate_sound, 100, FALSE, -1)
	cooldowny = world.time
	addtimer(CALLBACK(src, PROC_REF(demagicify)), activetime)
	active = TRUE
	update_icon()
	activate(user)

/obj/item/clothing/ring/active/proc/activate(mob/user)
	user.update_inv_wear_id()

/obj/item/clothing/ring/active/proc/demagicify()
	active = FALSE
	update_icon()
	if(ismob(loc))
		var/mob/user = loc
		user.visible_message(span_warning("Кольцо успокаивается."))
		user.update_inv_wear_id()


/obj/item/clothing/ring/active/nomag
	name = "кольцо антимагии"
	icon_state = "ruby"
	activate_sound = 'sound/magic/antimagic.ogg'
	cdtime = 10 MINUTES
	activetime = 30 SECONDS
	sellprice = 100

/obj/item/clothing/ring/active/nomag/update_icon()
	..()
	if(active)
		icon_state = "rubyactive"
	else
		icon_state = "ruby"

/obj/item/clothing/ring/active/nomag/activate(mob/user)
	. = ..()
	AddComponent(/datum/component/anti_magic, TRUE, FALSE, FALSE, ITEM_SLOT_RING, INFINITY, FALSE)

/obj/item/clothing/ring/active/nomag/demagicify()
	. = ..()
	var/datum/component/magcom = GetComponent(/datum/component/anti_magic)
	if(magcom)
		magcom.RemoveComponent()

//gold rings
/obj/item/clothing/ring/emerald
	name = "кольцо с гемеральдом"
	icon_state = "g_ring_emerald"
	sellprice = 195

/obj/item/clothing/ring/ruby
	name = "кольцо с ронцем"
	icon_state = "g_ring_ruby"
	sellprice = 255

/obj/item/clothing/ring/topaz
	name = "кольцо с топером"
	icon_state = "g_ring_topaz"
	sellprice = 180

/obj/item/clothing/ring/quartz
	name = "кольцо с бларцем"
	icon_state = "g_ring_quartz"
	sellprice = 245

/obj/item/clothing/ring/sapphire
	name = "кольцо с саффирой"
	icon_state = "g_ring_sapphire"
	sellprice = 200

/obj/item/clothing/ring/diamond
	name = "кольцо с дорпелем"
	icon_state = "g_ring_diamond"
	sellprice = 270

//silver rings
/obj/item/clothing/ring/emeralds
	name = "кольцо с гемеральдом"
	icon_state = "s_ring_emerald"
	sellprice = 155

/obj/item/clothing/ring/rubys
	name = "кольцо с ронцем"
	icon_state = "s_ring_ruby"
	sellprice = 215

/obj/item/clothing/ring/topazs
	name = "кольцо с топером"
	icon_state = "s_ring_topaz"
	sellprice = 140

/obj/item/clothing/ring/quartzs
	name = "кольцо с блорцем"
	icon_state = "s_ring_quartz"
	sellprice = 205

/obj/item/clothing/ring/sapphires
	name = "кольцо с саффирой"
	icon_state = "s_ring_sapphire"
	sellprice = 160

/obj/item/clothing/ring/diamonds
	name = "кольцо с дорпелем"
	icon_state = "s_ring_diamond"
	sellprice = 230

// Copper Rings

/obj/item/clothing/ring/emeraldc
	name = "кольцо с гемеральдом"
	icon_state = "c_ring_emerald"
	sellprice = 110

/obj/item/clothing/ring/rubyc
	name = "кольцо с ронцем"
	icon_state = "c_ring_ruby"
	sellprice = 155

/obj/item/clothing/ring/topazc
	name = "кольцо с топером"
	icon_state = "c_ring_topaz"
	sellprice = 105

/obj/item/clothing/ring/quartzc
	name = "кольцо с блорцем"
	icon_state = "c_ring_quartz"
	sellprice = 150

/obj/item/clothing/ring/sapphirec
	name = "кольцо с саффирой"
	icon_state = "c_ring_sapphire"
	sellprice = 115

/obj/item/clothing/ring/diamondc
	name = "кольцо с дорпелем"
	icon_state = "c_ring_diamond"
	sellprice = 170


/obj/item/clothing/ring/dragon_ring
	name = "драконье кольцо"
	icon_state = "dragonring"
	sellprice = 666
	var/active_item

/obj/item/clothing/ring/dragon_ring/equipped(mob/living/user)
	. = ..()
	if(active_item)
		return
	else
		active_item = TRUE
		to_chat(user, span_notice("Hic sunt dracones."))
		user.change_stat("strength", 2)
		user.change_stat("constitution", 2)
		user.change_stat("endurance", 2)
		return

/obj/item/clothing/ring/dragon_ring/dropped(mob/living/user)
	if(active_item)
		to_chat(user, span_notice("Буря внутри стихает..."))
		user.change_stat("strength", -2)
		user.change_stat("constitution", -2)
		user.change_stat("endurance", -2)
		active_item = FALSE
		return

