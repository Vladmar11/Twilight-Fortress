/obj/item/clothing/head/roguetown
	name = "hat"
	desc = ""
	icon = 'icons/roguetown/clothing/head.dmi'
	icon_state = "top_hat"
	item_state = "that"
	body_parts_covered = HEAD|HAIR
	slot_flags = ITEM_SLOT_HEAD|ITEM_SLOT_HIP
	dynamic_hair_suffix = "+generic"
	bloody_icon_state = "helmetblood"
	experimental_onhip = TRUE
	w_class = WEIGHT_CLASS_SMALL
	sewrepair = TRUE

/obj/item/clothing/head/roguetown/equipped(mob/user, slot)
	. = ..()
	user.update_fov_angles()

/obj/item/clothing/head/roguetown/dropped(mob/user)
	. = ..()
	user.update_fov_angles()

/obj/item/clothing/head/roguetown/roguehood
	name = "капюшон"
	desc = "Обычный и ничем не выдающийся капюшон, который может частично скрыть вашу личность и защитить голову от дождя."
	color = CLOTHING_BROWN
	icon_state = "basichood"
	item_state = "basichood"
	icon = 'icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/head.dmi' //Overrides slot icon behavior
	body_parts_covered = NECK
	slot_flags = ITEM_SLOT_HEAD|ITEM_SLOT_MASK
	sleevetype = null
	sleeved = null
	dynamic_hair_suffix = ""
	edelay_type = 1
	adjustable = CAN_CADJUST
	toggle_icon_state = TRUE
	max_integrity = 100
	salvage_amount = 1
	salvage_result = /obj/item/natural/cloth

/obj/item/clothing/head/roguetown/roguehood/reinforced
	name = "капюшон"
	desc = "Обычный и ничем не выдающийся капюшон, который может частично скрыть вашу личность и защитить голову от дождя. Выглядит заметно крепче и плотнее обычного."
	body_parts_covered = HEAD|HAIR|EARS|NOSE
	armor = list("blunt" = 47, "slash" = 27, "stab" = 37, "bullet" = 20, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_BLUNT, BCLASS_TWIST)
	max_integrity = 150
	blocksound = SOFTHIT
	sewrepair = TRUE
	salvage_result = /obj/item/natural/hide/cured

/obj/item/clothing/head/roguetown/roguehood/reinforced/newmoon
	color = "#78a3c9"


/obj/item/clothing/head/roguetown/roguehood/shalal
	name = "куфия"
	desc = "Защитный головной убор, который носят жители пустыни."
	color = null
	icon_state = "shalal"
	item_state = "shalal"
	flags_inv = HIDEHAIR
	sleevetype = null
	sleeved = null
	icon = 'icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/head.dmi' //Overrides slot icon behavior
	alternate_worn_layer  = 8.9 //On top of helmet
	body_parts_covered = HEAD|HAIR|EARS|NECK
	slot_flags = ITEM_SLOT_HEAD|ITEM_SLOT_MASK
	armor = list("blunt" = 20, "slash" = 20, "stab" = 15, "bullet" = 1, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	dynamic_hair_suffix = ""
	edelay_type = 1
	adjustable = CAN_CADJUST
	toggle_icon_state = TRUE
	blocksound = SOFTHIT
	max_integrity = 100

/obj/item/clothing/head/roguetown/roguehood/shalal/AdjustClothes(mob/user)
	if(loc == user)
		if(adjustable == CAN_CADJUST)
			adjustable = CADJUSTED
			icon_state = "shalal_t"
			body_parts_covered = HEAD|EARS|HAIR|NECK|NOSE|MOUTH
			flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
			flags_cover = null
			if(ishuman(user))
				var/mob/living/carbon/H = user
				H.update_inv_head()
			block2add = null
		else if(adjustable == CADJUSTED)
			ResetAdjust(user)

/obj/item/clothing/head/roguetown/roguehood/shalalz
	name = "зибантинская куфия"
	desc = "Защитный головной убор, который носят жители пустынь Зибантинской империи."
	color = null
	icon_state = "shalal_z"
	item_state = "shalal_z"
	flags_inv = HIDEHAIR
	sleevetype = null
	sleeved = null
	icon = 'icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/head.dmi' //Overrides slot icon behavior
	alternate_worn_layer  = 8.9 //On top of helmet
	body_parts_covered = HEAD|HAIR|EARS|NECK
	slot_flags = ITEM_SLOT_HEAD|ITEM_SLOT_MASK
	armor = list("blunt" = 20, "slash" = 20, "stab" = 15, "bullet" = 1, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	dynamic_hair_suffix = ""
	edelay_type = 1
	adjustable = CAN_CADJUST
	toggle_icon_state = TRUE
	blocksound = SOFTHIT
	max_integrity = 100

/obj/item/clothing/head/roguetown/roguehood/shalalz/AdjustClothes(mob/user)
	if(loc == user)
		if(adjustable == CAN_CADJUST)
			adjustable = CADJUSTED
			icon_state = "shalal_zt"
			body_parts_covered = HEAD|EARS|HAIR|NECK|NOSE|MOUTH
			flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
			flags_cover = null
			if(ishuman(user))
				var/mob/living/carbon/H = user
				H.update_inv_head()
			block2add = null
		else if(adjustable == CADJUSTED)
			ResetAdjust(user)

/obj/item/clothing/head/roguetown/roguehood/astrata
	name = "солнечный капюшон"
	desc = "Капюшон тех, кто поклоняется Астрате. Хвала перворожденному Солнцу!"
	color = null
	icon_state = "astratahood"
	item_state = "astratahood"
	icon = 'icons/roguetown/clothing/head.dmi'
	body_parts_covered = NECK
	slot_flags = ITEM_SLOT_HEAD
	dynamic_hair_suffix = ""
	edelay_type = 1
	adjustable = CAN_CADJUST
	toggle_icon_state = TRUE
	max_integrity = 100

/obj/item/clothing/head/roguetown/roguehood/nochood
	name = "лунный капюшон"
	desc = "Капюшон с маской в форме полумесяца, который носят сторонники Богини Луны, ночи, тайн и знаний - Нок."
	color = null
	icon_state = "nochood"
	item_state = "nochood"
	icon = 'icons/roguetown/clothing/head.dmi'
	body_parts_covered = NECK
	slot_flags = ITEM_SLOT_HEAD
	flags_inv = HIDEFACE|HIDEFACIALHAIR
	dynamic_hair_suffix = ""
	edelay_type = 1
	adjustable = CAN_CADJUST
	toggle_icon_state = TRUE
	max_integrity = 100

/obj/item/clothing/head/roguetown/necrahood
	name = "вуаль смерти"
	desc = "Одеяние для покойников и тех кто служит Некре - Богине смерти, разложения, цикла и загробной жизни."
	color = null
	icon_state = "necrahood"
	item_state = "necrahood"
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	dynamic_hair_suffix = ""

/obj/item/clothing/head/roguetown/dendormask
	name = "маска с шипами"
	desc = "Маска из дерева, которую носят друиды, служащие Дендору."
	color = null
	icon_state = "dendormask"
	item_state = "dendormask"
	flags_inv = HIDEFACE|HIDEFACIALHAIR
	dynamic_hair_suffix = ""

/obj/item/clothing/head/roguetown/necromhood
	name = "капюшон некроманта"
	desc = "Запах смерти, нежити и темной магии сопровождает владельца на его пути."
	color = null
	icon_state = "necromhood"
	item_state = "necromhood"
	body_parts_covered = NECK
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	dynamic_hair_suffix = ""

/obj/item/clothing/head/roguetown/priestmask
	name = "солнечный лик"
	desc = "Освященный шлем самых преданных последователей. Воры, будьте осторожны."
	color = null
	icon_state = "priesthead"
	item_state = "priesthead"
	body_parts_covered = HEAD|HAIR|EARS|NECK
	resistance_flags = FIRE_PROOF | ACID_PROOF
	armor = list("blunt" = 20, "slash" = 20, "stab" = 20, "bullet" = 15, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST, BCLASS_ASSASSIN)
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	dynamic_hair_suffix = ""

/obj/item/clothing/head/roguetown/priestmask/pickup(mob/living/user)
	if(!HAS_TRAIT(user, TRAIT_CHOSEN))
		to_chat(user, "<font color='yellow'>НЕДОСТОЙНЫЙ! ОСТАВЬ ОДЕЯНИЕ СИЕ ИЛИ УЗРИ БОЖЕСТВЕННЫЙ ГНЕВ!</font>")
		spawn(30)
			if(loc == user)
				user.adjust_fire_stacks(5)
				user.IgniteMob()

/obj/item/clothing/head/roguetown/roguehood/red
	color = CLOTHING_RED

/obj/item/clothing/head/roguetown/roguehood/black
	color = CLOTHING_BLACK

/obj/item/clothing/head/roguetown/roguehood/random/Initialize()
	color = pick("#544236", "#435436", "#543836", "#79763f")
	return ..()

/obj/item/clothing/head/roguetown/roguehood/mage/Initialize()
	color = pick("#4756d8", "#759259", "#bf6f39", "#c1b144", "#b8252c")
	return ..()

/obj/item/clothing/head/roguetown/roguehood/AdjustClothes(mob/user)
	if(loc == user)
		if(adjustable == CAN_CADJUST)
			adjustable = CADJUSTED
			if(toggle_icon_state)
				icon_state = "[initial(icon_state)]_t"
			flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
			body_parts_covered = NECK|HAIR|EARS|HEAD
			if(ishuman(user))
				var/mob/living/carbon/H = user
				H.update_inv_head()
				H.update_inv_wear_mask() //Snowflake case for Desert Merc hood
			block2add = FOV_BEHIND
		else if(adjustable == CADJUSTED)
			ResetAdjust(user)
			flags_inv = null
			if(user)
				if(ishuman(user))
					var/mob/living/carbon/H = user
					H.update_inv_head()
					H.update_inv_wear_mask() //Snowflake case for Desert Merc hood
		user.update_fov_angles()


/obj/item/clothing/head/roguetown/menacing
	name = "мешок-капюшон"
	desc = "Капюшон, который обычно носят палачи. Скрывает лицо, однако клеймо, связанное с казнями и пытками, делает многих палачей изгоями само по себе."
	icon_state = "menacing"
	item_state = "menacing"
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	dynamic_hair_suffix = ""
	fiber_salvage = FALSE

/obj/item/clothing/head/roguetown/menacing/bandit
	icon_state = "капюшон разбойника"
	desc = "Капюшон, который носят вольные жители леса. Он имеет дополнительную подкладку, обеспечивающую скромную защиту."
	body_parts_covered = HEAD|HAIR|EARS|NECK|EYES|NOSE|MOUTH
	slot_flags = ITEM_SLOT_HEAD|ITEM_SLOT_NECK
	armor = list("blunt" = 50, "slash" = 30, "stab" = 40, "bullet" = 20, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_BLUNT, BCLASS_CUT)
	anvilrepair = null
	max_integrity = 200
	blocksound = SOFTHIT

/obj/item/clothing/head/roguetown/jester
	name = "шутовской колпак"
	desc = "Забавная шляпа с прикрепленными к ней звенящими колокольчиками."
	icon_state = "jester"
	item_state = "jester"
	do_sound_bell = TRUE
	bell = TRUE
	dynamic_hair_suffix = "+generic"
	flags_inv = HIDEEARS

/obj/item/clothing/head/roguetown/strawhat
	name = "соломенная шляпка"
	desc = "Защищает голову от солнца во время работы в поле."
	icon_state = "strawhat"
	salvage_result = /obj/item/natural/fibers

/obj/item/clothing/head/roguetown/puritan
	name = "шляпа с пряжкой"
	icon_state = "puritan_hat"

/obj/item/clothing/head/roguetown/nightman
	name = "цилиндр"
	icon_state = "tophat"
	color = CLOTHING_BLACK

/obj/item/clothing/head/roguetown/bardhat
	name = "шляпа барда"
	desc = "Этой шляпке будет рад каждый бард. И песню за это спеть вам он рад."
	icon_state = "bardhat"

/obj/item/clothing/head/roguetown/fancyhat
	name = "изысканная шляпа"
	desc = "Необычная шляпка с торчащими из нее разноцветными перьями."
	icon_state = "fancy_hat"
	item_state = "fancyhat"

/obj/item/clothing/head/roguetown/hatfur
	name = "меховая шапка"
	desc = "Удобная теплая шапка с меховой подкладкой."
	icon_state = "hatfur"

/obj/item/clothing/head/roguetown/hatblu
	name = "меховая шапка"
	desc = "Синяя шапка с подкладкой из меха."
	icon_state = "hatblu"

/obj/item/clothing/head/roguetown/fisherhat
	name = "рыбацкая шляпа"
	desc = "Шапка, которую носят рыбаки для защиты от солнца."
	icon_state = "fisherhat"
	item_state = "fisherhat"

/obj/item/clothing/head/roguetown/flathat
	name = "широкая шляпа"
	desc = "Хорошая шляпа с широкими полями."
	icon_state = "flathat"
	item_state = "flathat"

/obj/item/clothing/head/roguetown/chaperon
	name = "шаперон"
	desc = "Изысканный головной убор, который иногда носили дворяне."
	icon_state = "chaperon"
	item_state = "chaperon"

/obj/item/clothing/head/roguetown/cookhat
	name = "поварской колпак"
	desc = "Шляпа, обозначающая человека, хорошо разбирающегося в кулинарии."
	icon_state = "chef"
	item_state = "chef"

/obj/item/clothing/head/roguetown/chaperon/greyscale
	icon_state = "chap_alt"
	item_state = "chap_alt"
	color = "#cf99e3"

/obj/item/clothing/head/roguetown/chef
	name = "поварской колпак"
	desc = "Шляпа, обозначающая человека, хорошо разбирающегося в кулинарии."
	icon_state = "chef"

/obj/item/clothing/head/roguetown/armingcap
	name = "колпак"
	desc = "Легкий колпак из кожи. Обычно носится, как подшлемник."
	icon_state = "armingcap"
	item_state = "armingcap"
	flags_inv = HIDEEARS

/obj/item/clothing/head/roguetown/knitcap
	name = "вязанная шапка"
	desc = "Простая вязанная шапочка."
	icon_state = "knitcap"

/obj/item/clothing/head/roguetown/armingcap/dwarf
	color = "#cb3434"

/obj/item/clothing/head/roguetown/headband
	name = "головная повязка"
	desc = "Простая повязка, обвязанная вокруг головы, чтобы пот не заливал глаза."
	icon_state = "headband"
	item_state = "headband"
	fiber_salvage = FALSE
	salvage_amount = 1
	dynamic_hair_suffix = null

/obj/item/clothing/head/roguetown/headband/red
	color = CLOTHING_RED

/obj/item/clothing/head/roguetown/crown //Holds vars for children
	name = "корона Рокхилла"
	desc = "Тяжелый вес короны не передаст всю тяжесть ответственности, которую она возлагает на своего владельца."
	icon_state = "rockhillcrown"
	dynamic_hair_suffix = null
	sellprice = 200
	resistance_flags = FIRE_PROOF | ACID_PROOF
	anvilrepair = /datum/skill/craft/blacksmithing
	sewrepair = FALSE

/obj/item/clothing/head/roguetown/crown/serpcrown
	visual_replacement = /obj/item/clothing/head/roguetown/crown/fakecrown

/obj/item/clothing/head/roguetown/crown/serpcrown/Initialize()
	. = ..()
	SSroguemachine.crown = src
	visual_replacement = /obj/item/clothing/head/roguetown/crown/fakecrown

/obj/item/clothing/head/roguetown/crown/serpcrown/proc/anti_stall()
	src.visible_message(span_warning("Корона Рокхилла рассыпается в пыль, её пепел уносится в направлении крепости."))
	SSroguemachine.crown = null //Do not harddel.
	qdel(src) //Anti-stall

/obj/item/clothing/head/roguetown/crown/fakecrown
	name = "ложная корона"
	desc = "Этого не должно тут быть."
	icon_state = "rockhillcrown"

/obj/item/clothing/head/roguetown/crown/surplus
	name = "корона"
	icon_state = "serpcrowno"
	sellprice = 100
	allowed_race = list(/datum/species/goblinp)

/obj/item/clothing/head/roguetown/crown/sparrowcrown
	name = "обруч чемпиона"
	icon_state = "sparrowcrown"
	sellprice = 50

/obj/item/clothing/head/roguetown/priesthat
	name = "митра священника"
	desc = "Головной убор, являющийся частью богослужебного облачения церкви Десяти."
	icon_state = "priest"
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/64x64/head.dmi'
	dynamic_hair_suffix = "+generic"
	sellprice = 77
	worn_x_dimension = 64
	worn_y_dimension = 64

/obj/item/clothing/head/roguetown/reqhat
	name = "змеиная корона"
	desc = ""
	icon_state = "reqhat"
	sellprice = 100
	anvilrepair = /datum/skill/craft/blacksmithing
	sewrepair = FALSE

/obj/item/clothing/head/roguetown/headdress
	name = "заморский головной убор"
	desc = "Вы не видели таких прежде... или видели?"
	icon_state = "headdress"
	sellprice = 10

/obj/item/clothing/head/roguetown/headdress/alt
	icon_state = "headdressalt"

/obj/item/clothing/head/roguetown/nun
	name = "монашеская ряса"
	icon_state = "nun"
	sellprice = 5

/obj/item/clothing/head/roguetown/hennin
	name = "геннин"
	desc = "Он же атур, сложный головной убор для женщин из высокого сословия."
	icon_state = "hennin"
	sellprice = 19
	dynamic_hair_suffix = "+generic"

/obj/item/clothing/head/roguetown/paddedcap
	name = "стеганый колпак"
	desc = "Скромный на вид защитный колпак."
	icon_state = "armingcap"
	item_state = "armingcap"
	sleevetype = null
	sleeved = null
	body_parts_covered = HEAD|HAIR|EARS
	slot_flags = ITEM_SLOT_MASK|ITEM_SLOT_NECK|ITEM_SLOT_HEAD
	armor = list("blunt" = 35, "slash" = 15, "stab" = 25, "bullet" = 1, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_SMASH)
	blocksound = SOFTHIT
	max_integrity = 75
	color = "#463C2B"

/obj/item/clothing/head/roguetown/helmet
	icon = 'icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/head.dmi'
	slot_flags = ITEM_SLOT_HEAD|ITEM_SLOT_HIP
	name = "шлем"
	desc = "Шлем, конструкция которого не может быть еще проще."
	body_parts_covered = HEAD|HAIR|NOSE
	icon_state = "nasal"
	sleevetype = null
	sleeved = null
	armor = list("blunt" = 90, "slash" = 100, "stab" = 80, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	dynamic_hair_suffix = "+generic"
	bloody_icon_state = "helmetblood"
	anvilrepair = /datum/skill/craft/blacksmithing
	smeltresult = /obj/item/ingot/steel
	blocksound = PLATEHIT
	max_integrity = 200
	w_class = WEIGHT_CLASS_NORMAL
	armor_class = ARMOR_CLASS_LIGHT
	resistance_flags = FIRE_PROOF
	clothing_flags = CANT_SLEEP_IN
	sewrepair = FALSE

/obj/item/clothing/head/roguetown/helmet/skullcap
	name = "железный колпак"
	desc = "Шлем из железа, который прикрывает собой лишь макушку."
	icon_state = "skullcap"
	body_parts_covered = HEAD|HAIR
	max_integrity = 200
	smeltresult = /obj/item/ingot/iron

/obj/item/clothing/head/roguetown/helmet/horned
	name = "рогатый шлем"
	desc = "Шлем с двумя рогами, торчащими по бокам."
	icon_state = "hornedcap"
	max_integrity = 225
	body_parts_covered = HEAD|HAIR

/obj/item/clothing/head/roguetown/helmet/winged
	name = "крылатый шлем"
	desc = "Шлем с двумя крыльями, торчащими по бокам."
	icon_state = "wingedcap"
	max_integrity = 225
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/64x64/head.dmi'
	worn_x_dimension = 64
	worn_y_dimension = 64
	body_parts_covered = HEAD|HAIR

/obj/item/clothing/head/roguetown/helmet/kettle
	name = "котелок"
	desc = "Стальной шлем, защищающий всю голову."
	icon_state = "kettle"
	body_parts_covered = HEAD|HAIR|EARS
	flags_inv = HIDEEARS
	body_parts_covered = HEAD|HAIR

/obj/item/clothing/head/roguetown/helmet/kettle/attackby(obj/item/W, mob/living/user, params)
	..()
	if(istype(W, /obj/item/natural/cloth) && !detail_tag)
		var/list/colors = list(
		"Лебединый белый"="#ffffff",
		"Лавандовый"="#865c9c",
		"Королевский пурпурный"="#5E4687",
		"Винно-красный"="#752B55",
		"Кожа свиноматки"="#CE929F",
		"Королевский красный"="#933030",
		"Свекольный красный"="#AD4545",
		"Бархатцевый оранжевый"="#E2A844",
		"Вежливо мерзкий"="#685542",
		"Солнечный желтый"="#FFFD8D",
		"Болотистый зеленый"="#375B48",
		"Морская пена"="#49938B",
		"Металлический синий"="#395480",
		"Синий василек"="#749EE8",
		"Металлический серый"="#404040",)

		var/choice = input(user, "Выберите цвет:", "Отделка тканью") as anything in colors
		user.visible_message(span_warning("[user] дополняет [src] при помощи [W]."))
		qdel(W)
		detail_color = colors[choice]
		detail_tag = "_detail"
		update_icon()
		if(loc == user && ishuman(user))
			var/mob/living/carbon/H = user
			H.update_inv_head()

/obj/item/clothing/head/roguetown/helmet/kettle/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

//................ CULTIST HOOD ............... //
/obj/item/clothing/head/roguetown/helmet/leather/cult_hood
	name = "капюшон культиста"
	desc = "Зловещий смех отдается эхом в голове."
	icon_state = "warlockhood"
	dynamic_hair_suffix = ""
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	body_parts_covered = NECK|HAIR|EARS|HEAD

//................ Sallet ............... //
/obj/item/clothing/head/roguetown/helmet/sallet
	name = "салад"
	icon_state = "sallet"
	desc = "Стальной шлем, защищающий уши. Обладает длинным назатыльником."
	smeltresult = /obj/item/ingot/steel
	body_parts_covered = HEAD|HAIR|EARS
	flags_inv = HIDEEARS

/obj/item/clothing/head/roguetown/helmet/sallet/attackby(obj/item/W, mob/living/user, params)
	..()
	if(istype(W, /obj/item/natural/cloth) && !detail_tag)
		var/list/colors = list(
		"Лебединый белый"="#ffffff",
		"Лавандовый"="#865c9c",
		"Королевский пурпурный"="#5E4687",
		"Винно-красный"="#752B55",
		"Кожа свиноматки"="#CE929F",
		"Королевский красный"="#933030",
		"Свекольный красный"="#AD4545",
		"Бархатцевый оранжевый"="#E2A844",
		"Вежливо мерзкий"="#685542",
		"Солнечный желтый"="#FFFD8D",
		"Болотистый зеленый"="#375B48",
		"Морская пена"="#49938B",
		"Металлический синий"="#395480",
		"Синий василек"="#749EE8",
		"Металлический серый"="#404040",)

		var/choice = input(user, "Выберите цвет:", "Отделка тканью") as anything in colors
		user.visible_message(span_warning("[user] дополняет [src] при помощи [W]."))
		qdel(W)
		detail_color = colors[choice]
		detail_tag = "_detail"
		update_icon()
		if(loc == user && ishuman(user))
			var/mob/living/carbon/H = user
			H.update_inv_head()

/obj/item/clothing/head/roguetown/helmet/sallet/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

/obj/item/clothing/head/roguetown/helmet/sallet/visored
	name = "салад с забралом"
	desc = "Стальной шлем, защищающий уши. Обладает длинным назатыльником и забралом, закрывающим глаза и нос."
	icon_state = "sallet_visor"
	max_integrity = 275
	adjustable = CAN_CADJUST
	flags_inv = HIDEFACE|HIDEEARS
	flags_cover = HEADCOVERSEYES
	armor_class = ARMOR_CLASS_MEDIUM
	body_parts_covered = HEAD|EARS|HAIR|NOSE|EYES
	block2add = FOV_BEHIND

/obj/item/clothing/head/roguetown/helmet/sallet/visored/attackby(obj/item/W, mob/living/user, params)
	..()
	if(istype(W, /obj/item/natural/cloth) && !detail_tag)
		var/list/colors = list(
		"Лебединый белый"="#ffffff",
		"Лавандовый"="#865c9c",
		"Королевский пурпурный"="#5E4687",
		"Винно-красный"="#752B55",
		"Кожа свиноматки"="#CE929F",
		"Королевский красный"="#933030",
		"Свекольный красный"="#AD4545",
		"Бархатцевый оранжевый"="#E2A844",
		"Вежливо мерзкий"="#685542",
		"Солнечный желтый"="#FFFD8D",
		"Болотистый зеленый"="#375B48",
		"Морская пена"="#49938B",
		"Металлический синий"="#395480",
		"Синий василек"="#749EE8",
		"Металлический серый"="#404040",)

		var/choice = input(user, "Выберите цвет:", "Отделка тканью") as anything in colors
		user.visible_message(span_warning("[user] дополняет [src] при помощи [W]."))
		qdel(W)
		detail_color = colors[choice]
		detail_tag = "_detail"
		update_icon()
		if(loc == user && ishuman(user))
			var/mob/living/carbon/H = user
			H.update_inv_head()

/obj/item/clothing/head/roguetown/helmet/sallet/visored/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

/obj/item/clothing/head/roguetown/helmet/sallet/visored/AdjustClothes(mob/user)
	if(loc == user)
		playsound(user, "sound/items/visor.ogg", 100, TRUE, -1)
		if(adjustable == CAN_CADJUST)
			adjustable = CADJUSTED
			icon_state = "[initial(icon_state)]_raised"
			body_parts_covered = HEAD|EARS|HAIR
			flags_cover = null
			flags_inv = null
			if(ishuman(user))
				var/mob/living/carbon/H = user
				H.update_inv_head()
			block2add = null
		else if(adjustable == CADJUSTED)
			ResetAdjust(user)
			flags_inv = HIDEFACE
			if(user)
				if(ishuman(user))
					var/mob/living/carbon/H = user
					H.update_inv_head()
		user.update_fov_angles()

//................ Volf Helm ............... //

/obj/item/clothing/head/roguetown/helmet/volfplate // Was originally a heavy helm, but now mercs can only use medium armor
	name = "волчий шлем"
	desc = "Стальной бацинетный шлем с волчьим забралом-маской, защищающим голову, уши, глаза, нос и рот."
	body_parts_covered = FULL_HEAD
	icon_state = "volfplate"
	item_state = "volfplate"
	adjustable = CAN_CADJUST
	max_integrity = 300
	emote_environment = 3
	armor_class = ARMOR_CLASS_MEDIUM
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	block2add = FOV_BEHIND
	smeltresult = /obj/item/ingot/steel

/obj/item/clothing/head/roguetown/helmet/volfplate/AdjustClothes(mob/user)
	if(loc == user)
		playsound(user, "sound/items/visor.ogg", 100, TRUE, -1)
		if(adjustable == CAN_CADJUST)
			adjustable = CADJUSTED
			icon_state = "volfplate_visor_raised"
			body_parts_covered = HEAD|EARS|HAIR
			flags_inv = HIDEEARS
			flags_cover = null
			if(ishuman(user))
				var/mob/living/carbon/H = user
				H.update_inv_head()
			block2add = null
		else if(adjustable == CADJUSTED)
			ResetAdjust(user)
			if(user)
				if(ishuman(user))
					var/mob/living/carbon/H = user
					H.update_inv_head()
		user.update_fov_angles()

/obj/item/clothing/head/roguetown/helmet/heavy
	name = "барбют"
	desc = "Простой шлем с нащечниками и Y-образным вырезом."
	body_parts_covered = FULL_HEAD
	icon_state = "barbute"
	item_state = "barbute"
	flags_inv = HIDEEARS|HIDEFACE
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	armor = list("blunt" = 90, "slash" = 100, "stab" = 80, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_SMASH, BCLASS_TWIST)
	block2add = FOV_RIGHT|FOV_LEFT
	armor_class = ARMOR_CLASS_HEAVY
	max_integrity = 400

/obj/item/clothing/head/roguetown/helmet/heavy/guard
	name = "савойский шлем"
	desc = "Шлем с угрожающим видом."
	icon_state = "guardhelm"
	emote_environment = 3
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	block2add = FOV_RIGHT|FOV_LEFT
	smeltresult = /obj/item/ingot/iron

/obj/item/clothing/head/roguetown/helmet/heavy/gate
	name = "шлем с решеткой"
	desc = "Стальной шлем, обеспечивающий хорошую защиту лица. Решетки напоминают ворота поместья, закрытые и защищающие личность привратника."
	icon_state = "gatehelm"
	emote_environment = 3
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	block2add = FOV_BEHIND
	armor_class = ARMOR_CLASS_MEDIUM	//breaks the 'scheme' of armor class, because it's a unqiue helm, that can't be remade. Go forth, gatemaster.
	smeltresult = /obj/item/ingot/steel

/obj/item/clothing/head/roguetown/helmet/heavy/knight
	name = "рыцарский шлем"
	desc = "Шлем благородного рыцаря. С пером выглядит еще лучше."
	icon_state = "knight"
	item_state = "knight"
	adjustable = CAN_CADJUST
	emote_environment = 3
	block2add = FOV_RIGHT|FOV_LEFT
	smeltresult = /obj/item/ingot/steel

/obj/item/clothing/head/roguetown/helmet/heavy/knight/attackby(obj/item/W, mob/living/user, params)
	..()
	if(istype(W, /obj/item/natural/feather) && !detail_tag)
		var/list/colors = list(
		"Лебединый белый"="#ffffff",
		"Лавандовый"="#865c9c",
		"Королевский пурпурный"="#5E4687",
		"Винно-красный"="#752B55",
		"Кожа свиноматки"="#CE929F",
		"Королевский красный"="#933030",
		"Свекольный красный"="#AD4545",
		"Бархатцевый оранжевый"="#E2A844",
		"Вежливо мерзкий"="#685542",
		"Солнечный желтый"="#FFFD8D",
		"Болотистый зеленый"="#375B48",
		"Морская пена"="#49938B",
		"Металлический синий"="#395480",
		"Синий василек"="#749EE8",
		"Металлический серый"="#404040",)
		var/choice = input(user, "Выберите цвет:", "Вставляем перо") as anything in colors
		detail_color = colors[choice]
		detail_tag = "_detail"
		user.visible_message(span_warning("[user] вставляет [W] в [src]."))
		qdel(W)
		update_icon()
		if(loc == user && ishuman(user))
			var/mob/living/carbon/H = user
			H.update_inv_head()
/obj/item/clothing/head/roguetown/helmet/heavy/knight/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

/obj/item/clothing/head/roguetown/helmet/heavy/knight/black
	color = CLOTHING_BLACK

/obj/item/clothing/head/roguetown/helmet/heavy/knight/AdjustClothes(mob/user)
	if(loc == user)
		playsound(user, "sound/items/visor.ogg", 100, TRUE, -1)
		if(adjustable == CAN_CADJUST)
			adjustable = CADJUSTED
			icon_state = "knightum"
			body_parts_covered = HEAD|HAIR|EARS
			flags_inv = HIDEEARS
			flags_cover = null
			emote_environment = 0
			if(ishuman(user))
				var/mob/living/carbon/H = user
				H.update_inv_head()
			block2add = null
		else if(adjustable == CADJUSTED)
			ResetAdjust(user)
			emote_environment = 3
			if(user)
				if(ishuman(user))
					var/mob/living/carbon/H = user
					H.update_inv_head()
		user.update_fov_angles()

/obj/item/clothing/head/roguetown/helmet/heavy/bucket
	name = "топфхелм"
	desc = "Кавалерийский шлем, закрывающий всю голову. Обеспечивает превосходную защиту."
	icon_state = "topfhelm"
	item_state = "topfhelm"
	max_integrity = 435
	emote_environment = 3
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	block2add = FOV_RIGHT|FOV_LEFT
	smeltresult = /obj/item/ingot/steel

/obj/item/clothing/head/roguetown/helmet/heavy/bucket/attackby(obj/item/W, mob/living/user, params)
	..()
	if(istype(W, /obj/item/natural/cloth) && !detail_tag)
		var/list/colors = list(
		"Лебединый белый"="#ffffff",
		"Лавандовый"="#865c9c",
		"Королевский пурпурный"="#5E4687",
		"Винно-красный"="#752B55",
		"Кожа свиноматки"="#CE929F",
		"Королевский красный"="#933030",
		"Свекольный красный"="#AD4545",
		"Бархатцевый оранжевый"="#E2A844",
		"Вежливо мерзкий"="#685542",
		"Солнечный желтый"="#FFFD8D",
		"Болотистый зеленый"="#375B48",
		"Морская пена"="#49938B",
		"Металлический синий"="#395480",
		"Синий василек"="#749EE8",
		"Металлический серый"="#404040",)
		var/choice = input(user, "Выберите цвет:", "Отделка тканью") as anything in colors
		user.visible_message(span_warning("[user] дополняет [src] при помощи [W]."))
		qdel(W)
		detail_color = colors[choice]
		detail_tag = "_detail"
		update_icon()
		if(loc == user && ishuman(user))
			var/mob/living/carbon/H = user
			H.update_inv_head()
/obj/item/clothing/head/roguetown/helmet/heavy/bucket/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

/obj/item/clothing/head/roguetown/helmet/heavy/bucket/gold
	desc = "Кавалерийский шлем, закрывающий всю голову. Обеспечивает отличную защиту. У этого золотистая крестообразная бровь. DEUS VULT!"
	icon_state = "topfhelm_gold"
	item_state = "topfhelm_gold"

/obj/item/clothing/head/roguetown/helmet/heavy/pigface
	name = "свинолицый бацинет"
	desc = "Стальной бацинетный шлем со свиным козырьком, защищающим голову, уши, нос, рот и глаза. Добавьте перо, чтобы показать цвета вашей семьи или вассала."
	icon_state = "hounskull"
	item_state = "hounskull"
	adjustable = CAN_CADJUST
	emote_environment = 3
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	block2add = FOV_RIGHT|FOV_LEFT
	smeltresult = /obj/item/ingot/steel

/obj/item/clothing/head/roguetown/helmet/heavy/pigface/AdjustClothes(mob/user)
	if(loc == user)
		playsound(user, "sound/items/visor.ogg", 100, TRUE, -1)
		if(adjustable == CAN_CADJUST)
			adjustable = CADJUSTED
			icon_state = "hounskull_visor_raised"
			body_parts_covered = HEAD|EARS|HAIR
			flags_inv = HIDEEARS
			flags_cover = null
			if(ishuman(user))
				var/mob/living/carbon/H = user
				H.update_inv_head()
			block2add = null
		else if(adjustable == CADJUSTED)
			ResetAdjust(user)
			if(user)
				if(ishuman(user))
					var/mob/living/carbon/H = user
					H.update_inv_head()
		user.update_fov_angles()

/obj/item/clothing/head/roguetown/helmet/heavy/pigface/attackby(obj/item/W, mob/living/user, params)
	..()
	if(istype(W, /obj/item/natural/feather) && !detail_tag)
		var/list/colors = list(
		"Лебединый белый"="#ffffff",
		"Лавандовый"="#865c9c",
		"Королевский пурпурный"="#5E4687",
		"Винно-красный"="#752B55",
		"Кожа свиноматки"="#CE929F",
		"Королевский красный"="#933030",
		"Свекольный красный"="#AD4545",
		"Бархатцевый оранжевый"="#E2A844",
		"Вежливо мерзкий"="#685542",
		"Солнечный желтый"="#FFFD8D",
		"Болотистый зеленый"="#375B48",
		"Морская пена"="#49938B",
		"Металлический синий"="#395480",
		"Синий василек"="#749EE8",
		"Металлический серый"="#404040",)
		var/choice = input(user, "Выберите цвет:", "Вставляем перо") as anything in colors
		detail_color = colors[choice]
		detail_tag = "_detail"
		user.visible_message(span_warning("[user] вставляет [W] в [src]."))
		qdel(W)
		update_icon()
		if(loc == user && ishuman(user))
			var/mob/living/carbon/H = user
			H.update_inv_head()
/obj/item/clothing/head/roguetown/helmet/heavy/pigface/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

/obj/item/clothing/head/roguetown/helmet/heavy/frogmouth
	name = "штеххелм"
	desc = "Высокий и внушительный шлем в виде лягушачьей пасти, популярный на самых высоких плато Отавы. Закрывает не только голову, но и шею. Добавьте ткань, чтобы показать цвета вашей семьи или вассала."
	icon_state = "frogmouth"
	item_state = "frogmouth"
	emote_environment = 3
	body_parts_covered = FULL_HEAD|NECK
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	block2add = FOV_RIGHT|FOV_LEFT
	smeltresult = /obj/item/ingot/steel
/obj/item/clothing/head/roguetown/helmet/heavy/frogmouth/attackby(obj/item/W, mob/living/user, params)
	..()
	if(istype(W, /obj/item/natural/cloth) && !detail_tag)
		var/list/colors = list(
		"Лебединый белый"="#ffffff",
		"Лавандовый"="#865c9c",
		"Королевский пурпурный"="#5E4687",
		"Винно-красный"="#752B55",
		"Кожа свиноматки"="#CE929F",
		"Королевский красный"="#933030",
		"Свекольный красный"="#AD4545",
		"Бархатцевый оранжевый"="#E2A844",
		"Вежливо мерзкий"="#685542",
		"Солнечный желтый"="#FFFD8D",
		"Болотистый зеленый"="#375B48",
		"Морская пена"="#49938B",
		"Металлический синий"="#395480",
		"Синий василек"="#749EE8",
		"Металлический серый"="#404040",)
		var/choice = input(user, "Выберите цвет:", "Отделка тканью") as anything in colors
		user.visible_message(span_warning("[user] дополняет [src] при помощи [W]."))
		qdel(W)
		detail_color = colors[choice]
		detail_tag = "_detail"
		update_icon()
		if(loc == user && ishuman(user))
			var/mob/living/carbon/H = user
			H.update_inv_head()
/obj/item/clothing/head/roguetown/helmet/heavy/frogmouth/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

/obj/item/clothing/head/roguetown/helmet/bascinet
	name = "бацинет"
	desc = "Стальной шлем-бацинет без козырька, защищающий голову и уши."
	icon_state = "bascinet_novisor"
	item_state = "bascinet_novisor"
	max_integrity = 235
	emote_environment = 3
	body_parts_covered = HEAD|HAIR|EARS
	flags_inv = HIDEHAIR|HIDEEARS
	armor_class = ARMOR_CLASS_MEDIUM
	block2add = FOV_BEHIND

/obj/item/clothing/head/roguetown/helmet/leather
	slot_flags = ITEM_SLOT_HEAD|ITEM_SLOT_HIP
	name = "кожаный шлем"
	desc = "Шлем, сделанный из кожи."
	body_parts_covered = HEAD|HAIR|EARS|NOSE
	icon_state = "leatherhelm"
	armor = list("blunt" = 47, "slash" = 27, "stab" = 37, "bullet" = 20, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_BLUNT, BCLASS_TWIST)
	anvilrepair = null
	smeltresult = null
	blocksound = SOFTHIT
	clothing_flags = null
	sewrepair = TRUE
	salvage_amount = 1
	salvage_result = /obj/item/natural/hide/cured

/obj/item/clothing/head/roguetown/helmet/leather/advanced
	name = "крепкий кожаный шлем"
	desc = "Прочный, долговечный, гибкий. Удобный и надежный шлем из прочной кожи."
	icon_state = "alhelmet"
	max_integrity = 250
	body_parts_covered = HEAD|EARS|HAIR|NOSE|EYES|MOUTH
	prevent_crits = list(BCLASS_CUT, BCLASS_BLUNT, BCLASS_TWIST)
	armor = list("blunt" = 70, "slash" = 60, "stab" = 30, "bullet" = 20, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/head/roguetown/helmet/leather/masterwork
	name = "шедевральный кожаный шлем"
	desc = "Этот шлем – чудо мастерства. Сделан из лучшей кожи, потому прочный, легкий, надежный!"
	max_integrity = 300
	body_parts_covered = HEAD|EARS|HAIR|NOSE|EYES|MOUTH
	prevent_crits = list(BCLASS_CUT, BCLASS_BLUNT, BCLASS_TWIST, BCLASS_CHOP) //we're adding chop here!
	armor = list("blunt" = 100, "slash" = 70, "stab" = 40, "bullet" = 10, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	filters = filter(type="drop_shadow", x=0, y=0, size=0.5, offset=1, color=rgb(218, 165, 32))

/obj/item/clothing/head/roguetown/helmet/leather/volfhelm
	slot_flags = ITEM_SLOT_HEAD|ITEM_SLOT_HIP
	name = "волчий шлем"
	desc = "Обряды инициации разбойников часто включают в себя убийство волка."
	body_parts_covered = HEAD|HAIR|EARS
	icon_state = "volfhead"
	item_state = "volfhead"
	armor = list("blunt" = 47, "slash" = 27, "stab" = 37, "bullet" = 20, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_BLUNT, BCLASS_TWIST)
	anvilrepair = null
	blocksound = SOFTHIT
	clothing_flags = null

/obj/item/clothing/head/roguetown/wizhat
	name = "шляпа волшебника"
	desc = "Используется, чтобы отличить опасных волшебников от дряхлых стариков."
	icon_state = "wizardhat"
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/64x64/head.dmi'
	dynamic_hair_suffix = "+generic"
	worn_x_dimension = 64
	worn_y_dimension = 64

	/// This var basicly counts the numbers of times this hat has changes its appearence
	var/hat_count = 0

/obj/item/clothing/head/roguetown/wizhat/MiddleClick(mob/user, params)
	. = ..()
	if(!do_after(user, 20, target = user))
		return
	if(hat_count == 0)
		icon_state = "wizardhatred"
		hat_count += 1
	else if(hat_count == 1)
		icon_state = "wizardhatyellow"
		hat_count += 1
	else if(hat_count == 2)
		icon_state = "wizardhatgreen"
		hat_count += 1
	else if(hat_count == 3)
		icon_state = "wizardhatblack"
		hat_count += 1
	else if(hat_count == 4)
		icon_state = "wizardhatgen"
		hat_count += 1
	else if(hat_count == 5)
		icon_state = "wizardhat"
		hat_count = 0
	to_chat(user, span_info("Шляпа волшебника магическим образом меняет свой цвет!"))
	playsound(src, 'sound/magic/swap.ogg', 50, TRUE)

/obj/item/clothing/head/roguetown/wizhat/red
	icon_state = "wizardhatred"

/obj/item/clothing/head/roguetown/wizhat/yellow
	icon_state = "wizardhatyellow"

/obj/item/clothing/head/roguetown/wizhat/green
	icon_state = "wizardhatgreen"

/obj/item/clothing/head/roguetown/wizhat/black
	icon_state = "wizardhatblack"

/obj/item/clothing/head/roguetown/wizhat/gen
	icon_state = "wizardhatgen"

/obj/item/clothing/head/roguetown/wizhat/gen/wise
	name = "шляпа мудрости"
	sellprice = 100
	desc = "Только самые мудрые носят эту шляпу."

/obj/item/clothing/head/roguetown/wizhat/gen/wise/equipped(mob/user, slot)
	. = ..()
	if(!ishuman(user))
		return
	var/mob/living/carbon/wise = user
	if(slot == SLOT_HEAD)
		wise.change_stat("intelligence", 2, "wisehat")
		to_chat(wise, span_green("Похоже, я обрел великую мудрость."))

/obj/item/clothing/head/roguetown/wizhat/gen/wise/dropped(mob/user)
	. = ..()
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/wise = user
	if(wise.get_item_by_slot(SLOT_HEAD) == src)
		wise.change_stat("intelligence", -2, "wisehat")
		to_chat(wise, span_red("Великая мудрость покидает мой разум."))

/obj/item/clothing/head/roguetown/physician
	name = "шляпа целителя"
	desc = "Мое лечение наиболее эффективно."
	icon_state = "physhat"

/obj/item/clothing/head/roguetown/nyle
	name = "Жемчужина Нила"
	icon_state = "nile"
	body_parts_covered = null
	slot_flags = ITEM_SLOT_HEAD
	dynamic_hair_suffix = null
	sellprice = 100
	resistance_flags = FIRE_PROOF
	anvilrepair = /datum/skill/craft/blacksmithing
	sewrepair = FALSE

/obj/item/clothing/head/roguetown/grenzelhofthat
	name = "грензельхофтская шляпа с пером"
	desc = "Убивая монстров или прекрасных девиц: выстоит Грензельхофт."
	icon_state = "grenzelhat"
	item_state = "grenzelhat"
	icon = 'icons/roguetown/clothing/head.dmi'
	sleeved = 'icons/roguetown/clothing/onmob/helpers/stonekeep_merc.dmi'
	slot_flags = ITEM_SLOT_HEAD
	detail_tag = "_detail"
	dynamic_hair_suffix = ""
	max_integrity = 150
	colorgrenz = TRUE

/obj/item/clothing/head/roguetown/grenzelhofthat/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

/obj/item/clothing/head/peaceflower
	name = "бутон Эоры"
	desc = "Цветок с нежными лепестками, ассоциирующийся с Эорой, иногда - с Некрой. Обычно носят на голове или же кладут на могилы как символ любви и мира."
	icon = 'icons/roguetown/items/produce.dmi'
	icon_state = "peaceflower"
	item_state = "peaceflower"
	slot_flags = ITEM_SLOT_HEAD
	body_parts_covered = NONE
	dynamic_hair_suffix = ""
	force = 0
	throwforce = 0
	w_class = WEIGHT_CLASS_TINY
	throw_speed = 1
	throw_range = 3

/obj/item/clothing/head/peaceflower/equipped(mob/living/carbon/human/user, slot)
	. = ..()
	if(slot == SLOT_HEAD)
		ADD_TRAIT(user, TRAIT_PACIFISM, "peaceflower_[REF(src)]")
		ADD_TRAIT(user, TRAIT_SPELLCOCKBLOCK, "peaceflower_[REF(src)]")
		user.add_stress(/datum/stressevent/eora)

/obj/item/clothing/head/peaceflower/dropped(mob/living/carbon/human/user)
	..()
	REMOVE_TRAIT(user, TRAIT_PACIFISM, "peaceflower_[REF(src)]")
	REMOVE_TRAIT(user, TRAIT_SPELLCOCKBLOCK, "peaceflower_[REF(src)]")
	user.remove_stress(/datum/stressevent/eora)

/obj/item/clothing/head/peaceflower/proc/peace_check(mob/living/user)
	// return true if we should be unequippable, return false if not
	if(iscarbon(user))
		var/mob/living/carbon/C = user
		if(src == C.head)
			to_chat(user, span_warning("Я чувствую умиротворение. <b style='color:pink'>Зачем желать что-то еще?</b>"))
			return TRUE
	return FALSE

/obj/item/clothing/head/peaceflower/MouseDrop(atom/over_object)
	if (!peace_check(usr))
		return ..()

/obj/item/clothing/head/peaceflower/attack_hand(mob/user)
	if (!peace_check(user))
		return ..()

/obj/item/clothing/head/roguetown/helmet/tricorn
	slot_flags = ITEM_SLOT_HEAD
	name = "шляпа-треуголка"
	desc = "Кожаная шляпа треугольной формы, особо популярная среди мореходов."
	body_parts_covered = HEAD|HAIR|EARS|NOSE
	icon_state = "tricorn"
	armor = list("blunt" = 47, "slash" = 27, "stab" = 37, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_BLUNT, BCLASS_TWIST)
	anvilrepair = null
	smeltresult = null
	blocksound = SOFTHIT
	clothing_flags = null
	salvage_amount = 1
	salvage_result = /obj/item/natural/hide/cured

/obj/item/clothing/head/roguetown/helmet/tricorn/skull
	icon_state = "tricorn_skull"
	desc = "Кожаная шляпа треугольной формы. На одной из сторон вышит череп - яркий символ пиратства."

/obj/item/clothing/head/roguetown/helmet/tricorn/lucky
	name = "счастливая треуголка"
	desc = "Обветренная треуголка, повидавшая множество сражений. С ней на голове тебе обязательно повезет."
	armor = list("blunt" = 60, "slash" = 40, "stab" = 45, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/head/roguetown/helmet/bandana
	slot_flags = ITEM_SLOT_HEAD
	name = "бандана"
	desc = "Простая бандана из кожи, закрывающая голову, нос и уши."
	body_parts_covered = HEAD|HAIR|EARS|NOSE
	icon_state = "bandana"
	armor = list("blunt" = 47, "slash" = 27, "stab" = 37, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_BLUNT, BCLASS_TWIST)
	anvilrepair = null
	smeltresult = null
	blocksound = SOFTHIT
	clothing_flags = null
	salvage_amount = 1
	salvage_result = /obj/item/natural/hide/cured

/obj/item/clothing/head/roguetown/inqhat
	name = "шляпа инквизитора"
	desc = "Твоя валюта - искупление."
	icon_state = "inqhat"
	item_state = "inqhat"
	sewrepair = TRUE

//Gronn
/obj/item/clothing/head/roguetown/helmet/nomadhelmet
	name = "nomad helmet"
	desc = "An iron helmet with leather to help protect the neck."
	icon_state = "nomadhelmet"
	item_state = "nomadhelmet"
	flags_inv = HIDEHAIR
	body_parts_covered = HEAD|HAIR|EARS|NOSE|NECK
	armor = list("blunt" = 50, "slash" = 30, "stab" = 40, "bullet" = 20, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_BLUNT, BCLASS_TWIST)
	max_integrity = 250
	anvilrepair = TRUE
	smeltresult = /obj/item/ingot/iron

//----------------- BLACKSTEEL ---------------------

/obj/item/clothing/head/roguetown/helmet/blacksteel/bucket
	name = "топфхелм из черной стали"
	desc = "Кавалерийский шлем из прочной черной стали. Никто не пройдет.."
	body_parts_covered = FULL_HEAD
	icon = 'icons/roguetown/clothing/special/blkknight.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/blkknight.dmi'
	icon_state = "bkhelm"
	item_state = "bkhelm"
	flags_inv = HIDEEARS|HIDEFACE
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	armor = list("blunt" = 90, "slash" = 100, "stab" = 80, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_SMASH, BCLASS_TWIST, BCLASS_PICK)
	block2add = FOV_RIGHT|FOV_LEFT
	max_integrity = 525
	smeltresult = /obj/item/ingot/blacksteel

/obj/item/clothing/head/roguetown/helmet/heavy/crusader
	name = "топфхелм"
	desc = "Шлем крестоносца, позволяющий нести божье слово, не беспокоясь за свою голову."
	icon_state = "crusader_helm"
	icon = 'icons/roguetown/clothing/special/crusader.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/crusader.dmi'

/obj/item/clothing/head/roguetown/helmet/heavy/crusader/t
	icon_state = "crusader_helmt2"
