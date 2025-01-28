/obj/item/clothing/neck/roguetown
	name = ""
	desc = ""
	icon = 'icons/roguetown/clothing/neck.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/neck.dmi'
	bloody_icon_state = "bodyblood"
	w_class = WEIGHT_CLASS_SMALL

/obj/item/clothing/neck/roguetown/coif
	name = "койф"
	icon_state = "coif"
	item_state = "coif"
	desc = "Капюшон из ткани, достаточно удобный для сна, защищающий голову, уши и шею, но не обеспечивающий защиты от стрел и болтов, и, как ни прискорбно, слишком мягкий, чтобы предотвратить обезглавливание."
	flags_inv = HIDEHAIR
	slot_flags = ITEM_SLOT_NECK|ITEM_SLOT_HEAD
	blocksound = SOFTHIT
	body_parts_covered = NECK|HAIR|EARS|HEAD
	armor = list("blunt" = 33, "slash" = 12, "stab" = 22, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	max_integrity = 125
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_BLUNT)
	adjustable = CAN_CADJUST
	toggle_icon_state = TRUE
	sewrepair = TRUE

/obj/item/clothing/neck/roguetown/coif/AdjustClothes(mob/user)
	if(loc == user)
		if(adjustable == CAN_CADJUST)
			adjustable = CADJUSTED
			if(toggle_icon_state)
				icon_state = "[initial(icon_state)]_t"
			flags_inv = null
			body_parts_covered = NECK
			if(ishuman(user))
				var/mob/living/carbon/H = user
				H.update_inv_neck()
				H.update_inv_head()
		else if(adjustable == CADJUSTED)
			ResetAdjust(user)
			flags_inv = HIDEHAIR
			if(user)
				if(ishuman(user))
					var/mob/living/carbon/H = user
					H.update_inv_neck()
					H.update_inv_head()



/obj/item/clothing/neck/roguetown/chaincoif
	name = "кольчужный койф"
	icon_state = "chaincoif"
	item_state = "chaincoif"
	desc = "Стальной койф, состоящий из сцепленных между собой металлических колец. Немного защищает голову, уши и шею, но не позволит заснуть."
	flags_inv = HIDEHAIR
	resistance_flags = FIRE_PROOF
	armor = list("blunt" = 30, "slash" = 60, "stab" = 45, "bullet" = 10, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	max_integrity = 200
	resistance_flags = FIRE_PROOF
	slot_flags = ITEM_SLOT_NECK|ITEM_SLOT_HEAD
	body_parts_covered = NECK|HAIR|EARS|HEAD
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_ASSASSIN)
	adjustable = CAN_CADJUST
	toggle_icon_state = TRUE
	blocksound = CHAINHIT
	anvilrepair = /datum/skill/craft/blacksmithing
	smeltresult = /obj/item/ingot/steel

/obj/item/clothing/neck/roguetown/chaincoif/AdjustClothes(mob/user)
	if(loc == user)
		if(adjustable == CAN_CADJUST)
			adjustable = CADJUSTED
			if(toggle_icon_state)
				icon_state = "[initial(icon_state)]_t"
			flags_inv = null
			body_parts_covered = NECK
			if(ishuman(user))
				var/mob/living/carbon/H = user
				H.update_inv_neck()
				H.update_inv_head()
		else if(adjustable == CADJUSTED)
			ResetAdjust(user)
			flags_inv = HIDEHAIR
			if(user)
				if(ishuman(user))
					var/mob/living/carbon/H = user
					H.update_inv_neck()
					H.update_inv_head()


/obj/item/clothing/neck/roguetown/chaincoif/iron
	icon_state = "ichaincoif"
	anvilrepair = /datum/skill/craft/blacksmithing
	desc = "Железный койф, состоящий из сцепленных между собой металлических колец. Немного защищает голову, уши и шею, но не позволит заснуть."
	smeltresult = /obj/item/ingot/iron
	max_integrity = 150

/obj/item/clothing/neck/roguetown/chaincoif/ironb
	icon_state = "ichaincoif"
	anvilrepair = /datum/skill/craft/blacksmithing
	desc = "Койф из почерневшего железа, состоящий из сцепленных между собой металлических колец. Немного защищает голову, уши и шею, но не позволит заснуть."
	smeltresult = /obj/item/ingot/iron
	color = "#151615"
	max_integrity = 150

/obj/item/clothing/neck/roguetown/bervor
	name = "бевор"
	desc = "Стальной бевор, защищающий нижнюю часть головы: шею, рот и нос."
	icon_state = "bervor"
	armor = list("blunt" = 90, "slash" = 100, "stab" = 80, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	anvilrepair = /datum/skill/craft/blacksmithing
	smeltresult = /obj/item/ingot/steel
	max_integrity = 300
	resistance_flags = FIRE_PROOF
	slot_flags = ITEM_SLOT_NECK
	body_parts_covered = NECK|MOUTH|NOSE
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	blocksound = PLATEHIT

/obj/item/clothing/neck/roguetown/gorget
	name = "горжет"
	desc = "Железный горжет, предназначенный для защиты шеи."
	icon_state = "gorget"
	armor = list("blunt" = 90, "slash" = 100, "stab" = 80, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	smeltresult = /obj/item/ingot/iron
	anvilrepair = /datum/skill/craft/blacksmithing
	max_integrity = 150
	resistance_flags = FIRE_PROOF
	slot_flags = ITEM_SLOT_NECK
	body_parts_covered = NECK
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	blocksound = PLATEHIT


/obj/item/clothing/neck/roguetown/gorget/oring
	name = "горжет с кольцом"
	desc = "Железный воротник для защиты шеи. Спереди у него есть странное кольцо."
	leashable = TRUE
	icon_state = "ironcollargorget"

/obj/item/clothing/neck/roguetown/gorget/steel
	name ="стальной горжет"
	desc = "Стальной горжет, предназначенный для защиты шеи."
	smeltresult = /obj/item/ingot/steel
	max_integrity = 300
	icon_state = "sgorget"

/obj/item/clothing/neck/roguetown/gorget/steel/oring
	desc = "Стальной воротник для защиты шеи. Спереди у него есть странное кольцо."
	name ="стальной горжет с кольцом"
	leashable = TRUE
	icon_state = "steelcollargorget"

/obj/item/clothing/neck/roguetown/leather
	name = "крепкий кожаный горжет"
	desc = "Прочный, долговечный, гибкий. Представляет собой кожаный воротник для защиты шеи и горла от мечей и других видов холодного оружия."
	icon_state = "lgorget"
	armor = list("blunt" = 70, "slash" = 60, "stab" = 30, "bullet" = 20, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	max_integrity = 150
	slot_flags = ITEM_SLOT_NECK
	body_parts_covered = NECK
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST) //This one will help against chopping
	blocksound = SOFTHIT
	sewrepair = TRUE
	salvage_amount = 1
	salvage_result = /obj/item/natural/hide/cured

/obj/item/clothing/neck/roguetown/gorget/alt
	name = "волчий ошейник"
	desc = "Природа не знает пощады."
	icon_state = "iwolfcollar"
	leashable = TRUE

/obj/item/clothing/neck/roguetown/psicross
	name = "крест"
	desc = "Символ божественности Псайдона и Десяти"
	icon_state = "psicross"
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/neck.dmi'
	//dropshrink = 0.75
	resistance_flags = FIRE_PROOF
	slot_flags = ITEM_SLOT_NECK|ITEM_SLOT_HIP|ITEM_SLOT_WRISTS
	sellprice = 10
	experimental_onhip = TRUE
	anvilrepair = /datum/skill/craft/blacksmithing

/obj/item/clothing/neck/roguetown/psicross/astrata
	name = "амулет Астраты"
	desc = "Блестит, как луч солнца, наставляющий на путь."
	icon_state = "astrata"

/obj/item/clothing/neck/roguetown/psicross/silver/astrata
	name = "освященный амулет Астраты"
	desc = "Амулет Астраты из чистого серебра. Этот был благословлен церковью Десяти."
	icon_state = "astrata"

/obj/item/clothing/neck/roguetown/psicross/noc
	name = "амулет Нок"
	desc = "Полумесяц кажется еще ярче в лунном свете."
	icon_state = "noc"

/obj/item/clothing/neck/roguetown/psicross/dendor
	name = "амулет Дендора"
	desc = "Когти олицетворяют дары, принесенные природой. Как и кару за её разорение."
	icon_state = "dendor"

/obj/item/clothing/neck/roguetown/psicross/necra
	name = "амулет Некры"
	desc = "Неотвратимость и неизбежность смерти отражены в глазницах черепа."
	icon_state = "necra"

/obj/item/clothing/neck/roguetown/psicross/pestra
	name = "амулет Пестры"
	desc = "Принять страдание и исцелиться. Духом и телом."
	icon_state = "pestra"

/obj/item/clothing/neck/roguetown/psicross/ravox
	name = "amulet of Ravox"
	desc = "Острие копья звенит, неся справедливость. Близится Суд."
	icon_state = "ravox"

/obj/item/clothing/neck/roguetown/psicross/malum
	name = "амулет Маллума"
	icon_state = "malum"
	desc = "В горниле вечного пламени Маллума - пусть к неистовому мастерству."
	
/obj/item/clothing/neck/roguetown/psicross/eora
	name = "амулет Эоры"
	desc = "Пахнет розами и жизнью."
	icon_state = "eora"

/obj/item/clothing/neck/roguetown/psicross/wood
	name = "деревянный крест"
	icon_state = "psicrossw"
	sellprice = 0

/obj/item/clothing/neck/roguetown/psicross/silver
	name = "серебрянный крест"
	icon_state = "psicrossiron"
	sellprice = 50

/obj/item/clothing/neck/roguetown/psicross/silver/pickup(mob/user)
	. = ..()
	var/mob/living/carbon/human/H = user
	if(!H.mind)
		return
	var/datum/antagonist/vampirelord/V_lord = H.mind.has_antag_datum(/datum/antagonist/vampirelord/)
	var/datum/antagonist/werewolf/W = H.mind.has_antag_datum(/datum/antagonist/werewolf/)
	if(ishuman(H))
		if(H.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser))
			to_chat(H, span_userdanger("Я не могу дотрагиваться до серебра, это моя ПОГИБЕЛЬ!"))
			H.Knockdown(20)
			H.adjustFireLoss(60)
			H.Paralyze(20)
			H.fire_act(1,5)
		if(V_lord)
			if(V_lord.vamplevel < 4 && !H.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser))
				to_chat(H, span_userdanger("Я не могу дотрагиваться до серебра, это моя ПОГИБЕЛЬ!"))
				H.Knockdown(10)
				H.Paralyze(10)
		if(W && W.transformed == TRUE)
			to_chat(H, span_userdanger("Я не могу носить серебро, это моя ПОГИБЕЛЬ!"))
			H.Knockdown(20)
			H.Paralyze(20)

/obj/item/clothing/neck/roguetown/psicross/silver/mob_can_equip(mob/living/M, mob/living/equipper, slot, disable_warning = FALSE, bypass_equip_delay_self = FALSE)
	. = ..()
	if(ishuman(M))
		var/mob/living/carbon/human/H = M
		if(!H.mind)
			return TRUE
		var/datum/antagonist/vampirelord/V_lord = H.mind.has_antag_datum(/datum/antagonist/vampirelord/)
		var/datum/antagonist/werewolf/W = H.mind.has_antag_datum(/datum/antagonist/werewolf/)
		if(H.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser))
			to_chat(H, span_userdanger("Я не могу носить серебро, это моя ПОГИБЕЛЬ!"))
			H.Knockdown(20)
			H.adjustFireLoss(60)
			H.Paralyze(20)
			H.fire_act(1,5)
		if(V_lord)
			if(V_lord.vamplevel < 4 && !H.mind.has_antag_datum(/datum/antagonist/vampirelord/lesser))
				to_chat(H, span_userdanger("Я не могу носить серебро, это моя ПОГИБЕЛЬ!"))
				H.Knockdown(10)
				H.Paralyze(10)
		if(W && W.transformed == TRUE)
			to_chat(H, span_userdanger("Я не могу носить серебро, это моя ПОГИБЕЛЬ!"))
			H.Knockdown(20)
			H.Paralyze(20)

/obj/item/clothing/neck/roguetown/psicross/g
	name = "золотой крест"
	desc = "Крест Псайдона из чистого золота"
	icon_state = "psicrossg"
	//dropshrink = 0.75
	resistance_flags = FIRE_PROOF
	sellprice = 100

/obj/item/clothing/neck/roguetown/talkstone
	name = "Lapis Loquens"
	desc = "Издаваемый камнем таинственный шепот позволяет вам в точности понимать речь на других языках."
	icon_state = "talkstone"
	item_state = "talkstone"
	//dropshrink = 0.75
	resistance_flags = FIRE_PROOF
	leashable = TRUE
	allowed_race = CLOTHED_RACES_TYPES
	sellprice = 98
	anvilrepair = /datum/skill/craft/blacksmithing

/obj/item/clothing/neck/roguetown/horus
	name = "око Гора"
	desc = ""
	icon_state = "horus"
	//dropshrink = 0.75
	resistance_flags = FIRE_PROOF
	sellprice = 30
	anvilrepair = /datum/skill/craft/blacksmithing

/obj/item/clothing/neck/roguetown/shalal
	name = "медальон пустынного всадника"
	desc = ""
	icon_state = "shalal"
	//dropshrink = 0.75
	resistance_flags = FIRE_PROOF
	sellprice = 15
	anvilrepair = /datum/skill/craft/blacksmithing

/obj/item/clothing/neck/roguetown/collar
	name = "rope collar"
	desc = "This is for debug and item inheritance. If you are seeing this, bug a coder!"
	icon = 'modular/icons/obj/items/leashes_collars.dmi'
	mob_overlay_icon = 'modular/icons/mob/collars_leashes.dmi'
	icon_state = "collar_rope"
	color = "#d7bb9f"
	allowed_race = CLOTHED_RACES_TYPES
	allowed_sex = list(MALE,FEMALE)
	leashable = TRUE
	do_sound_bell = FALSE
	slot_flags = ITEM_SLOT_NECK
	salvage_amount = 1
	salvage_result = /obj/item/rope

/obj/item/clothing/neck/roguetown/collar/leather
	name = "ошейник из кожи"
	desc = "Удобный ошейник из полос кожи."
	icon_state = "leathercollar"
	color = null
	slot_flags = ITEM_SLOT_NECK
	salvage_amount = 1
	salvage_result = /obj/item/natural/hide/cured

/obj/item/clothing/neck/roguetown/collar/leather/cursed/Initialize(mapload)
	. = ..()
	name = "проклятый ошейник"
	resistance_flags = FIRE_PROOF
	ADD_TRAIT(src, TRAIT_NODROP, CURSED_ITEM_TRAIT)
	clothing_flags = ITEM_SLOT_NECK
	icon = 'modular/icons/obj/items/leashes_collars.dmi'
	mob_overlay_icon = 'modular/icons/mob/collars_leashes.dmi'
	icon_state = "leathercollar"

/obj/item/clothing/neck/roguetown/collar/leather/cursed/dropped(mob/living/carbon/human/user)
	. = ..()
	if(QDELETED(src))
		return
	qdel(src)

/obj/item/clothing/neck/roguetown/collar/leather/bell
	name = "звенящий ошейник"
	desc = "Удобный ошейник из полос кожи с закрепленными на нем бубенчиками!"
	icon_state = "catbellcollar"
	slot_flags = ITEM_SLOT_NECK
	do_sound_bell = TRUE
	bell = TRUE
	salvage_result = list(/obj/item/natural/hide/cured = 1, /obj/item/catbell = 1)

/obj/item/clothing/neck/roguetown/collar/leather/bell/cow
	name = "звенящий ошейник"
	desc = "Удобный ошейник из полос кожи с закрепленным на нем колокольчиком!"
	icon_state = "cowbellcollar"
	slot_flags = ITEM_SLOT_NECK
	salvage_result = list(/obj/item/natural/hide/cured = 1, /obj/item/catbell/cow = 1)
