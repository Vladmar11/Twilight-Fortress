/obj/item/clothing/cloak
	name = "плащ"
	icon = 'icons/roguetown/clothing/cloaks.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/cloaks.dmi'
	slot_flags = ITEM_SLOT_CLOAK
	desc = "Защищает от непогоды и скрывает от окружающих вашу личность."
	edelay_type = 1
	equip_delay_self = 10
	bloody_icon_state = "bodyblood"
	sewrepair = TRUE //Vrell - AFAIK, all cloaks are cloth ATM. Technically semi-less future-proof, but it removes a line of code from every subtype, which is worth it IMO.
	w_class = WEIGHT_CLASS_NORMAL

	grid_width = 64
	grid_height = 64


//////////////////////////
/// TABARD
////////////////////////

/obj/item/clothing/cloak/tabard
	name = "табард"
	desc = "Длинный жилет рыцарей, предназначенный для надевания поверх металлического доспеха."
	color = null
	icon_state = "tabard"
	item_state = "tabard"
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/detailed/tabards.dmi'
	alternate_worn_layer = TABARD_LAYER
	body_parts_covered = CHEST|GROIN
	boobed = TRUE
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_CLOAK
	flags_inv = HIDECROTCH|HIDEBOOB
	var/picked

/obj/item/clothing/cloak/tabard/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

/obj/item/clothing/cloak/tabard/attack_right(mob/user)
	if(picked)
		return
	var/the_time = world.time
	var/design = input(user, "Выберите узор:","Изменение внешнего вида") as null|anything in list("Без узора", "Рисунок", "Пополам", "Четверти", "В клетку", "Ромбы")
	if(!design)
		return
	if(world.time > (the_time + 30 SECONDS))
		return
	var/symbol_chosen = FALSE
	if(design == "Рисунок")
		design = null
		design = input(user, "Выберите рисунок: ","Изменение внешнего вида") as null|anything in list("chalice","psy","peace","z","imp","skull","widow","arrow")
		if(!design)
			return
		design = "_[design]"
		symbol_chosen = TRUE
	var/colorone = input(user, "Выберите основной цвет: ","Изменение внешнего вида") as null|anything in CLOTHING_COLOR_NAMES
	if(!colorone)
		return
	var/colortwo
	if(design != "Без узора")
		colortwo = input(user, "Выберите второстепенный цвет: ","Изменение внешнего вида") as null|anything in CLOTHING_COLOR_NAMES
		if(!colortwo)
			return
	if(world.time > (the_time + 30 SECONDS))
		return
	if(design != "Без узора")
		detail_tag = design
	switch(design)
		if("Пополам")
			detail_tag = "_spl"
		if("Четверти")
			detail_tag = "_quad"
		if("В клетку")
			detail_tag = "_box"
		if("Ромбы")
			detail_tag = "_dim"
	boobed_detail = !symbol_chosen
	color = clothing_color2hex(colorone)
	if(colortwo)
		detail_color = clothing_color2hex(colortwo)
	update_icon()
	if(ismob(loc))
		var/mob/L = loc
		L.update_inv_cloak()
	if(alert("Вас устраивает результат?", "Готово!", "Да", "Нет") != "Да")
		detail_color = initial(detail_color)
		color = initial(color)
		boobed_detail = initial(boobed_detail)
		detail_tag = initial(detail_tag)
		update_icon()
		if(ismob(loc))
			var/mob/L = loc
			L.update_inv_cloak()
		return
	picked = TRUE

/obj/item/clothing/cloak/tabard/knight
	color = CLOTHING_PURPLE

/obj/item/clothing/cloak/tabard/knight/attack_right(mob/user)
	return

/obj/item/clothing/cloak/tabard/knight/Initialize()
	. = ..()
	if(GLOB.lordprimary)
		lordcolor(GLOB.lordprimary,GLOB.lordsecondary)
	else
		GLOB.lordcolor += src

/obj/item/clothing/cloak/tabard/knight/Destroy()
	GLOB.lordcolor -= src
	return ..()

/obj/item/clothing/cloak/tabard/crusader
	detail_tag = "_psy"
	boobed_detail = FALSE

/obj/item/clothing/cloak/tabard/crusader/Initialize()
	. = ..()
	update_icon()

/obj/item/clothing/cloak/tabard/crusader/attack_right(mob/user)
	if(picked)
		return
	var/the_time = world.time
	var/design = input(user, "Выберите цветовую схему:","Изменение внешнего вида") as null|anything in list("Стандартный", "Золотой крест", "Бирюзовый", "Черное золото", "Черно-белый")
	if(!design)
		return
	if(world.time > (the_time + 30 SECONDS))
		return
	if(design == "Золотой крест")
		detail_color = "#b5b004"
	if(design == "Бирюзовый")
		detail_color = "#b5b004"
		color = "#249589"
	if(design == "Черное золото")
		detail_color = CLOTHING_YELLOW
		color = CLOTHING_BLACK
	if(design == "Черно-белый")
		detail_color = CLOTHING_WHITE
		color = CLOTHING_BLACK
	update_icon()
	if(ismob(loc))
		var/mob/L = loc
		L.update_inv_cloak()
	if(alert("Вас устраивает результат?", "Готово!", "Да", "Нет") != "Да")
		detail_color = initial(detail_color)
		color = initial(color)
		update_icon()
		if(ismob(loc))
			var/mob/L = loc
			L.update_inv_cloak()
		return
	picked = TRUE

/obj/item/clothing/cloak/tabard/crusader/tief
	color = CLOTHING_RED
	detail_color = CLOTHING_WHITE

/obj/item/clothing/cloak/tabard/crusader/dendor
	name = "сюрко ордена Дендора"
	icon_state = "tabard_dendor"
	item_state = "tabard_dendor"

/obj/item/clothing/cloak/tabard/crusader/pestra
	name = "сюрко ордена Пестры"
	icon_state = "tabard_pestra"
	item_state = "tabard_pestra"

/obj/item/clothing/cloak/tabard/crusader/noc
	name = "сюрко лунного ордена Нок"
	icon_state = "tabard_noc"
	item_state = "tabard_noc"

/obj/item/clothing/cloak/tabard/crusader/noc/alt
	icon_state = "tabard_noc_alt"
	item_state = "tabard_noc_alt"

/obj/item/clothing/cloak/tabard/crusader/eora
	name = "сюрко ордена Эоры"
	icon_state = "tabard_eora"
	item_state = "tabard_eora"

/obj/item/clothing/cloak/tabard/crusader/abyssor
	name = "сюрко ордена Абиссора"
	icon_state = "tabard_abyssor"
	item_state = "tabard_abyssor"

/obj/item/clothing/cloak/tabard/crusader/ravox
	name = "сюрко ордена Равокса"
	icon_state = "tabard_ravox"
	item_state = "tabard_ravox"

/obj/item/clothing/cloak/tabard/crusader/xylix
	name = "сюрко ордена Ксайликса"
	icon_state = "tabard_xylix"
	item_state = "tabard_xylix"

/obj/item/clothing/cloak/tabard/crusader/tief/attack_right(mob/user)
	if(picked)
		return
	var/the_time = world.time
	var/design = input(user, "Выберите цветовую схему:","Изменение внешнего вида") as null|anything in list("Стандартный", "Красный и черный", "Черный и красный")
	if(!design)
		return
	if(world.time > (the_time + 30 SECONDS))
		return
	if(design == "Красный и черный")
		detail_color = CLOTHING_BLACK
		color = CLOTHING_RED
	if(design == "Черный и красный")
		detail_color = CLOTHING_RED
		color = CLOTHING_BLACK
	update_icon()
	if(ismob(loc))
		var/mob/L = loc
		L.update_inv_cloak()
	if(alert("Вас устраивает результат?", "Готово!", "Да", "Нет") != "Да")
		detail_color = initial(detail_color)
		color = initial(color)
		update_icon()
		if(ismob(loc))
			var/mob/L = loc
			L.update_inv_cloak()
		return
	picked = TRUE

/obj/item/clothing/cloak/tabard/knight/guard
	desc = "Табард лейб-гвардейца, который принято одевать поверх лат во время длительной службы. Окрашен в цвета геральдики правителя."
	color = CLOTHING_RED
	detail_tag = "_spl"
	detail_color = CLOTHING_PURPLE

/obj/item/clothing/cloak/tabard/knight/guard/attack_right(mob/user)
	if(picked)
		return
	var/the_time = world.time
	var/chosen = input(user, "Выберите узор:","Изменение внешнего вида") as null|anything in list("Пополам", "Четверти", "В клетку", "Ромбы")
	if(world.time > (the_time + 10 SECONDS))
		return
	if(!chosen)
		return
	switch(chosen)
		if("Пополам")
			detail_tag = "_spl"
		if("Четверти")
			detail_tag = "_quad"
		if("В клетку")
			detail_tag = "_box"
		if("Ромбы")
			detail_tag = "_dim"
	update_icon()
	if(ismob(loc))
		var/mob/L = loc
		L.update_inv_cloak()
	if(alert("Вас устраивает результат?", "Готово!", "Да", "Нет") != "Да")
		detail_tag = initial(detail_tag)
		update_icon()
		if(ismob(loc))
			var/mob/L = loc
			L.update_inv_cloak()
		return
	picked = TRUE

/obj/item/clothing/cloak/tabard/knight/guard/Initialize()
	. = ..()
	if(GLOB.lordprimary)
		lordcolor(GLOB.lordprimary,GLOB.lordsecondary)
	else
		GLOB.lordcolor += src

/obj/item/clothing/cloak/tabard/knight/guard/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

/obj/item/clothing/cloak/tabard/knight/guard/lordcolor(primary,secondary)
	color = primary
	detail_color = secondary
	update_icon()
	if(ismob(loc))
		var/mob/L = loc
		L.update_inv_cloak()

/obj/item/clothing/cloak/tabard/knight/guard/Destroy()
	GLOB.lordcolor -= src
	return ..()

/obj/item/clothing/cloak/tabard/musketeer
	detail_tag = "_psy"
	color = CLOTHING_BLUE
	detail_color = CLOTHING_WHITE


//////////////////////////
/// SOLDIER TABARD
////////////////////////

/obj/item/clothing/cloak/stabard
	name = "сюрко"
	desc = "Средневековое пальто, которое надевают поверх доспехов. Оно похоже по покрою на пончо и часто украшается гербом владельца."
	icon_state = "stabard"
	alternate_worn_layer = TABARD_LAYER
	body_parts_covered = CHEST|GROIN
	boobed = TRUE
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/detailed/tabards.dmi'
	sleeved = 'icons/roguetown/clothing/onmob/detailed/tabards.dmi'
	sleevetype = "shirt"
	nodismemsleeves = TRUE
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_CLOAK
	flags_inv = HIDECROTCH|HIDEBOOB
	var/picked

/obj/item/clothing/cloak/stabard/attack_right(mob/user)
	if(picked)
		return
	var/the_time = world.time
	var/design = input(user, "Выберите узор:","Изменение внешнего вида") as null|anything in list("Без узора","Пополам", "Четверти", "В клетку", "Ромбы")
	if(!design)
		return
	var/colorone = input(user, "Выберите основной цвет: ","Изменение внешнего вида") as null|anything in CLOTHING_COLOR_NAMES
	if(!colorone)
		return
	var/colortwo
	if(design != "Без узора")
		colortwo = input(user, "Выберите второстепенный цвет: ","Изменение внешнего вида") as null|anything in CLOTHING_COLOR_NAMES
		if(!colortwo)
			return
	if(world.time > (the_time + 30 SECONDS))
		return
	switch(design)
		if("Пополам")
			detail_tag = "_spl"
		if("Четверти")
			detail_tag = "_quad"
		if("В клетку")
			detail_tag = "_box"
		if("Ромбы")
			detail_tag = "_dim"
	color = clothing_color2hex(colorone)
	if(colortwo)
		detail_color = clothing_color2hex(colortwo)
	update_icon()
	if(ismob(loc))
		var/mob/L = loc
		L.update_inv_cloak()
	if(alert("Вас устраивает результат?", "Готово!", "Да", "Нет") != "Да")
		detail_color = initial(detail_color)
		color = initial(color)
		boobed_detail = initial(boobed_detail)
		detail_tag = initial(detail_tag)
		update_icon()
		if(ismob(loc))
			var/mob/L = loc
			L.update_inv_cloak()
		return
	picked = TRUE

/obj/item/clothing/cloak/stabard/guard
	name = "сюрко стражника"
	desc = "Крепкое сюрко, предназначенное для ношения поверх брони в качестве единой формы гарнизона. Окрашено в цвета геральдики правителя."
	color = CLOTHING_RED
	detail_tag = "_spl"
	detail_color = CLOTHING_PURPLE

/obj/item/clothing/cloak/stabard/guard/attack_right(mob/user)
	if(picked)
		return
	var/the_time = world.time
	var/chosen = input(user, "Выберите узор:","Изменение внешнего вида") as null|anything in list("Пополам", "Четверти", "В клетку", "Ромбы")
	if(world.time > (the_time + 10 SECONDS))
		return
	if(!chosen)
		return
	switch(chosen)
		if("Пополам")
			detail_tag = "_spl"
		if("Четверти")
			detail_tag = "_quad"
		if("В клетку")
			detail_tag = "_box"
		if("Ромбы")
			detail_tag = "_dim"
	update_icon()
	if(ismob(loc))
		var/mob/L = loc
		L.update_inv_cloak()
	if(alert("Вас устраивает результат?", "Готово!", "Да", "Нет") != "Да")
		detail_tag = initial(detail_tag)
		update_icon()
		if(ismob(loc))
			var/mob/L = loc
			L.update_inv_cloak()
		return
	picked = TRUE

/obj/item/clothing/cloak/stabard/guard/Initialize()
	. = ..()
	if(GLOB.lordprimary)
		lordcolor(GLOB.lordprimary,GLOB.lordsecondary)
	else
		GLOB.lordcolor += src

/obj/item/clothing/cloak/stabard/guard/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

/obj/item/clothing/cloak/stabard/guard/lordcolor(primary,secondary)
	color = primary
	detail_color = secondary
	update_icon()
	if(ismob(loc))
		var/mob/L = loc
		L.update_inv_cloak()

/obj/item/clothing/cloak/stabard/guard/Destroy()
	GLOB.lordcolor -= src
	return ..()

/obj/item/clothing/cloak/raincloak/vanguard
	name = "плащ авангарда"
	desc = "Старая накидка в темных тонах. Её гордо носят те, что стойко защищают город и его жителей от всего нечестивого за каменными стенами."
	color = CLOTHING_VANGUARD
	detail_color = CLOTHING_VANGUARD_DETAIL


/obj/item/clothing/cloak/stabard/grenzelhoft
	name = "табард наемника"
	desc = "Накидка поверх брони, окрашенная в цвета Свободного Корпуса Грензельхофта."
	color = CLOTHING_YELLOW
	detail_color = CLOTHING_RED
	detail_tag = "_box"

/obj/item/clothing/cloak/stabard/dungeon
	color = CLOTHING_BLACK

/obj/item/clothing/cloak/stabard/dungeon/attack_right(mob/user)
	return

/obj/item/clothing/cloak/stabard/mercenary
	detail_tag = "_quad"

/obj/item/clothing/cloak/stabard/mercenary/Initialize()
	. = ..()
	detail_tag = pick("_quad", "_spl", "_box", "_dim")
	color = clothing_color2hex(pick(CLOTHING_COLOR_NAMES))
	detail_color = clothing_color2hex(pick(CLOTHING_COLOR_NAMES))
	update_icon()
	if(ismob(loc))
		var/mob/L = loc
		L.update_inv_cloak()

//////////////////////////
/// SURCOATS
////////////////////////

/obj/item/clothing/cloak/stabard/surcoat
	name = "жиппон"
	icon_state = "surcoat"

/obj/item/clothing/cloak/stabard/surcoat/marshal
	color = "#641E16"

/obj/item/clothing/cloak/stabard/surcoat/councillor
	color = "#2d2d2d"

/obj/item/clothing/cloak/stabard/surcoat/attack_right(mob/user)
	if(picked)
		return
	var/the_time = world.time
	var/design = input(user, "Выберите узор:","Изменение внешнего вида") as null|anything in list("Без узора","Пополам", "Четверти", "В клетку", "Ромбы")
	if(!design)
		return
	var/colorone = input(user, "Выберите основной цвет: ","Изменение внешнего вида") as null|anything in CLOTHING_COLOR_NAMES
	if(!colorone)
		return
	var/colortwo
	if(design != "Без узора")
		colortwo = input(user, "Выберите второстепенный цвет: ","Изменение внешнего вида") as null|anything in CLOTHING_COLOR_NAMES
		if(!colortwo)
			return
	if(world.time > (the_time + 30 SECONDS))
		return
	switch(design)
		if("Пополам")
			detail_tag = "_spl"
		if("Четверти")
			detail_tag = "_quad"
		if("В клетку")
			detail_tag = "_box"
		if("Ромбы")
			detail_tag = "_dim"
	color = clothing_color2hex(colorone)
	if(colortwo)
		detail_color = clothing_color2hex(colortwo)
	update_icon()
	if(ismob(loc))
		var/mob/L = loc
		L.update_inv_cloak()
	if(alert("Вас устраивает результат?", "Готово!", "Да", "Нет") != "Да")
		detail_color = initial(detail_color)
		color = initial(color)
		detail_tag = initial(detail_tag)
		update_icon()
		if(ismob(loc))
			var/mob/L = loc
			L.update_inv_cloak()
		return
	picked = TRUE

/obj/item/clothing/cloak/stabard/surcoat/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

/obj/item/clothing/cloak/stabard/surcoat/guard
	desc = "Накидка, предназначенная для ношения поверх брони в качестве единой формы гарнизона. Окрашен в цвета геральдики правителя."
	color = CLOTHING_RED
	detail_tag = "_quad"
	detail_color = CLOTHING_PURPLE

/obj/item/clothing/cloak/stabard/surcoat/guard/attack_right(mob/user)
	if(picked)
		return
	var/the_time = world.time
	var/chosen = input(user, "Выберите узор:","Изменение внешнего вида") as null|anything in list("Пополам", "Четверти", "В клетку", "Ромбы")
	if(world.time > (the_time + 10 SECONDS))
		return
	if(!chosen)
		return
	switch(chosen)
		if("Пополам")
			detail_tag = "_spl"
		if("Четверти")
			detail_tag = "_quad"
		if("В клетку")
			detail_tag = "_box"
		if("Ромбы")
			detail_tag = "_dim"
	update_icon()
	if(ismob(loc))
		var/mob/L = loc
		L.update_inv_cloak()
	if(alert("Вас устраивает результат?", "Готово!", "Да", "Нет") != "Да")
		detail_tag = initial(detail_tag)
		update_icon()
		if(ismob(loc))
			var/mob/L = loc
			L.update_inv_cloak()
		return
	picked = TRUE


/obj/item/clothing/cloak/stabard/surcoat/guard/Initialize()
	. = ..()
	if(GLOB.lordprimary)
		lordcolor(GLOB.lordprimary,GLOB.lordsecondary)
	else
		GLOB.lordcolor += src

/obj/item/clothing/cloak/stabard/surcoat/guard/lordcolor(primary,secondary)
	color = primary
	detail_color = secondary
	update_icon()
	if(ismob(loc))
		var/mob/L = loc
		L.update_inv_cloak()

/obj/item/clothing/cloak/stabard/surcoat/guard/Destroy()
	GLOB.lordcolor -= src
	return ..()

/obj/item/clothing/cloak/lordcloak
	name = "величественный плащ"
	desc = "Очень дорогой плащ из отборного меха, что своим видом подчеркивает состояние своего владельца."
	color = null
	icon_state = "lord_cloak"
	item_state = "lord_cloak"
	alternate_worn_layer = CLOAK_BEHIND_LAYER
	slot_flags = ITEM_SLOT_BACK_R|ITEM_SLOT_CLOAK
	boobed = TRUE
	sleeved = 'icons/roguetown/clothing/onmob/cloaks.dmi'
	sleevetype = "shirt"
	nodismemsleeves = TRUE
	inhand_mod = TRUE
//	allowed_sex = list(MALE)
	allowed_race = NON_DWARVEN_RACE_TYPES
	detail_tag = "_det"
	detail_color = CLOTHING_PURPLE

/obj/item/clothing/cloak/lordcloak/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

/obj/item/clothing/cloak/lordcloak/lordcolor(primary,secondary)
	detail_color = primary
	update_icon()
	if(ismob(loc))
		var/mob/L = loc
		L.update_inv_cloak()

/obj/item/clothing/cloak/lordcloak/Initialize()
	. = ..()
	if(GLOB.lordprimary)
		lordcolor(GLOB.lordprimary,GLOB.lordsecondary)
	else
		GLOB.lordcolor += src

/obj/item/clothing/cloak/lordcloak/Destroy()
	GLOB.lordcolor -= src
	return ..()


/obj/item/clothing/cloak/lordcloak/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/storage/concrete/roguetown/cloak/lord)
	
/obj/item/clothing/cloak/lordcloak/dropped(mob/living/carbon/human/user)
	..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	if(STR)
		var/list/things = STR.contents()
		for(var/obj/item/I in things)
			STR.remove_from_storage(I, get_turf(src))

/obj/item/clothing/cloak/apron
	name = "фартук"
	desc = "Фартуки носят многие мастера и ремесленники, чтобы не запачкать одежду."
	color = null
	icon_state = "apron"
	item_state = "apron"
	alternate_worn_layer = TABARD_LAYER
	body_parts_covered = CHEST|GROIN
	boobed = TRUE
	allowed_race = CLOTHED_RACES_TYPES
	flags_inv = HIDECROTCH|HIDEBOOB
	w_class = WEIGHT_CLASS_SMALL

/obj/item/clothing/cloak/apron/blacksmith
	name = "фартук кузнеца"
	desc = "Жаропрочный кожаный фартук, который используют мастера плавки, ковки и закалки металлов."
	color = null
	icon_state = "leather_apron"
	item_state = "leather_apron"
	body_parts_covered = CHEST|GROIN
	armor = list("blunt" = 25, "slash" = 5, "stab" = 15, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 24, "acid" = 0)
	boobed = TRUE
	salvage_result = /obj/item/natural/hide/cured

/obj/item/clothing/cloak/apron/brown
	color = CLOTHING_BROWN

/obj/item/clothing/cloak/apron/waist
	name = "короткий фартук"
	desc = "Такие можно увидеть на придворных слугах и горничных."
	color = null
	icon_state = "waistpron"
	item_state = "waistpron"
	body_parts_covered = null
	boobed = FALSE
	flags_inv = HIDECROTCH

/obj/item/clothing/cloak/apron/waist/brown
	color = CLOTHING_BROWN

/obj/item/clothing/cloak/apron/waist/bar
	color = "#251f1d"


/obj/item/clothing/cloak/apron/cook
	name = "поварской фартук"
	desc = "Показывает опрятность, аккуратность и чистоплотность повара."
	color = null
	icon_state = "aproncook"
	item_state = "aproncook"
	body_parts_covered = CHEST
	boobed = FALSE
	flags_inv = HIDECROTCH|HIDEBOOB

/obj/item/clothing/cloak/raincloak
	name = "кожаный плащ"
	desc = "Поможет не намокнуть в самую дождливую погоду. А еще в нем не так больно лежать на камнях"
	color = null
	icon_state = "rain_cloak"
	item_state = "rain_cloak"
	alternate_worn_layer = CLOAK_BEHIND_LAYER
	slot_flags = ITEM_SLOT_BACK_R|ITEM_SLOT_CLOAK
//	body_parts_covered = ARMS|CHEST
	boobed = TRUE
	sleeved = 'icons/roguetown/clothing/onmob/cloaks.dmi'
	sleevetype = "shirt"
	nodismemsleeves = TRUE
	inhand_mod = TRUE
	hoodtype = /obj/item/clothing/head/hooded/rainhood
	toggle_icon_state = FALSE
	salvage_result = /obj/item/natural/hide/cured

/obj/item/clothing/wash_act(clean)
	. = ..()
	if(hood)
		wash_atom(hood,clean)

/obj/item/clothing/cloak/raincloak/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/storage/concrete/roguetown/cloak)

/obj/item/clothing/cloak/raincloak/dropped(mob/living/carbon/human/user)
	..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	if(STR)
		var/list/things = STR.contents()
		for(var/obj/item/I in things)
			STR.remove_from_storage(I, get_turf(src))



/obj/item/clothing/cloak/raincloak/red
	color = CLOTHING_RED

/obj/item/clothing/cloak/raincloak/mortus
	name = "похоронный плащ"
	desc = "Плащ, который носят гробовщики во время частых ритуалов по захоронению мертвых."
	color = CLOTHING_BLACK

/obj/item/clothing/cloak/raincloak/brown
	color = CLOTHING_BROWN

/obj/item/clothing/cloak/raincloak/green
	color = CLOTHING_GREEN

/obj/item/clothing/cloak/raincloak/blue
	color = CLOTHING_BLUE

/obj/item/clothing/cloak/raincloak/purple
	color = CLOTHING_PURPLE

/obj/item/clothing/head/hooded/rainhood
	name = "капюшон"
	desc = "Частично спасет от непогоды и скроет вашу личность."
	icon_state = "rain_hood"
	item_state = "rain_hood"
	slot_flags = ITEM_SLOT_HEAD
	dynamic_hair_suffix = ""
	edelay_type = 1
	body_parts_covered = HEAD
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR|HIDETAIL
	block2add = FOV_BEHIND

/obj/item/clothing/head/hooded/equipped(mob/user, slot)
	. = ..()
	user.update_fov_angles()

/obj/item/clothing/head/hooded/dropped(mob/user)
	. = ..()
	user.update_fov_angles()

/obj/item/clothing/cloak/raincloak/furcloak
	name = "меховой плащ"
	desc = "Этот великолепный плащ сделан из меха животных и качественной кожи. Очень мягкий и теплый."
	icon_state = "furgrey"
	inhand_mod = FALSE
	hoodtype = /obj/item/clothing/head/hooded/rainhood/furhood
	salvage_amount = 1
	salvage_result = /obj/item/natural/fur

/obj/item/clothing/cloak/raincloak/furcloak/crafted/Initialize()
	. = ..()
	if(prob(50))
		color = pick("#685542","#66564d")

/obj/item/clothing/cloak/raincloak/furcloak/brown
	color = "#685542"

/obj/item/clothing/cloak/raincloak/furcloak/black
	color = "#66564d"

/obj/item/clothing/head/hooded/rainhood/furhood
	icon_state = "fur_hood"
	block2add = FOV_BEHIND

/obj/item/clothing/cloak/cape
	name = "накидка"
	desc = "Красивая, развевающаяся на ветру накидка. Жаль, что она слишком сильно цепляется за растительность."
	color = null
	icon_state = "cape"
	item_state = "cape"
	alternate_worn_layer = CLOAK_BEHIND_LAYER
	boobed = TRUE
	sleeved = 'icons/roguetown/clothing/onmob/cloaks.dmi'
	sleevetype = "shirt"
	nodismemsleeves = TRUE
	inhand_mod = FALSE
	slot_flags = ITEM_SLOT_BACK_R|ITEM_SLOT_CLOAK

/obj/item/clothing/cloak/cape/purple
	color = "#801380"

/obj/item/clothing/cloak/cape/knight
	color = CLOTHING_PURPLE

/obj/item/clothing/cloak/cape/guard
	color = CLOTHING_RED

/obj/item/clothing/cloak/cape/black
	color = CLOTHING_BLACK

/obj/item/clothing/cloak/cape/guard/Initialize()
	. = ..()
	if(GLOB.lordprimary)
		lordcolor(GLOB.lordprimary,GLOB.lordsecondary)
	else
		GLOB.lordcolor += src
/obj/item/clothing/cloak/cape/guard/lordcolor(primary,secondary)
	color = secondary
	update_icon()
	if(ismob(loc))
		var/mob/L = loc
		L.update_inv_cloak()
/obj/item/clothing/cloak/cape/guard/Destroy()
	GLOB.lordcolor -= src
	return ..()


/obj/item/clothing/cloak/cape/puritan
	icon_state = "puritan_cape"
	allowed_race = CLOTHED_RACES_TYPES

/obj/item/clothing/cloak/cape/archivist
	icon_state = "puritan_cape"
	color = CLOTHING_BLACK
	allowed_race = CLOTHED_RACES_TYPES

/obj/item/clothing/cloak/cape/rogue
	name = "cape"
	icon_state = "roguecape"
	item_state = "roguecape"

/obj/item/clothing/cloak/cape/hood
	name = "hooded cape"
	icon_state = "hoodcape"
	item_state = "hoodcape"

/obj/item/clothing/cloak/cape/fur
	name = "fur cape"
	icon_state = "furcape"
	item_state = "furcape"
	inhand_mod = TRUE

/obj/item/clothing/cloak/chasuble
	name = "chasuble"
	desc = ""
	icon_state = "chasuble"
	body_parts_covered = CHEST|GROIN|ARMS
	sleeved = 'icons/roguetown/clothing/onmob/cloaks.dmi'
	sleevetype = "shirt"
	slot_flags = ITEM_SLOT_CLOAK
	allowed_sex = list(MALE, FEMALE)
	allowed_race = NON_DWARVEN_RACE_TYPES
	nodismemsleeves = TRUE


/obj/item/clothing/cloak/stole
	name = "стола"
	desc = "Литургические облачения священника, которые принято носить во время мессы перед паствой."
	icon_state = "stole_gold"
	sleeved = null
	sleevetype = null
	body_parts_covered = null
	flags_inv = null

/obj/item/clothing/cloak/stole/red
	icon_state = "stole_red"

/obj/item/clothing/cloak/stole/purple
	icon_state = "stole_purple"

/obj/item/clothing/cloak/black_cloak
	name = "черное меховой плащ"
	desc = "Качественно скроенный, прошитый и обработанный дорогими маслами плащ из черного меха и шкур."
	icon_state = "black_cloak"
	body_parts_covered = CHEST|GROIN|VITALS|ARMS
	sleeved = 'icons/roguetown/clothing/onmob/cloaks.dmi'
	sleevetype = "shirt"
	slot_flags = ITEM_SLOT_CLOAK
	allowed_sex = list(MALE, FEMALE)
	allowed_race = NON_DWARVEN_RACE_TYPES
	sellprice = 50
	nodismemsleeves = TRUE

/obj/item/clothing/cloak/heartfelt
	name = "изысканный плащ"
	desc = "Произведение искусства и гордость ремесленников."
	icon_state = "heartfelt_cloak"
	body_parts_covered = CHEST|GROIN|VITALS|ARMS
	sleeved = 'icons/roguetown/clothing/onmob/cloaks.dmi'
	sleevetype = "shirt"
	slot_flags = ITEM_SLOT_CLOAK
	allowed_sex = list(MALE, FEMALE)
	allowed_race = NON_DWARVEN_RACE_TYPES
	sellprice = 50
	nodismemsleeves = TRUE

/obj/item/clothing/cloak/half
	name = "полуплащ"
	desc = "Плащ, закрывающий преимущественно одну половину тела."
	color = null
	icon_state = "halfcloak"
	alternate_worn_layer = CLOAK_BEHIND_LAYER
	slot_flags = ITEM_SLOT_BACK_R|ITEM_SLOT_CLOAK
//	body_parts_covered = ARMS|CHEST
	boobed = TRUE
	sleeved = 'icons/roguetown/clothing/onmob/cloaks.dmi'
	sleevetype = "shirt"
	nodismemsleeves = TRUE
	inhand_mod = TRUE
	hoodtype = null
	toggle_icon_state = FALSE
	color = CLOTHING_BLACK
	allowed_sex = list(MALE, FEMALE)
	allowed_race = NON_DWARVEN_RACE_TYPES
	flags_inv = null
	w_class = WEIGHT_CLASS_SMALL
	salvage_amount = 1

/obj/item/clothing/cloak/half/ComponentInitialize()
	. = ..()
	AddComponent(/datum/component/storage/concrete/roguetown/cloak)

/obj/item/clothing/cloak/half/dropped(mob/living/carbon/human/user)
	..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	if(STR)
		var/list/things = STR.contents()
		for(var/obj/item/I in things)
			STR.remove_from_storage(I, get_turf(src))

/obj/item/clothing/cloak/half/brown
	color = CLOTHING_BROWN

/obj/item/clothing/cloak/half/red
	color = CLOTHING_RED

/obj/item/clothing/cloak/half/orange
	color = CLOTHING_ORANGE

/obj/item/clothing/cloak/half/vet
	name = "плащ городской стражи"
	icon_state = "guardcloak"
	color = CLOTHING_RED
	allowed_sex = list(MALE, FEMALE)
	allowed_race = NON_DWARVEN_RACE_TYPES
	inhand_mod = FALSE

/obj/item/clothing/cloak/half/vet/Initialize()
	. = ..()
	if(GLOB.lordprimary)
		lordcolor(GLOB.lordprimary,GLOB.lordsecondary)
	else
		GLOB.lordcolor += src

/obj/item/clothing/cloak/half/vet/Destroy()
	GLOB.lordcolor -= src
	return ..()

// Dumping old black knight stuff here
/obj/item/clothing/cloak/cape/blkknight
	name = "кровавая мантия"
	icon_state = "bkcape"
	icon = 'icons/roguetown/clothing/special/blkknight.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/blkknight.dmi'
	sleeved = 'icons/roguetown/clothing/special/onmob/blkknight.dmi'

/obj/item/clothing/head/roguetown/helmet/heavy/blkknight
	name = "шлем из черной стали"
	icon_state = "bkhelm"
	icon = 'icons/roguetown/clothing/special/blkknight.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/blkknight.dmi'
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/clothing/cloak/tabard/blkknight
	name = "кровавый пояс"
	desc = "Старый тканевый табард, перекинутый через плечо и вымоченный в чьей-то крови."
	icon_state = "bksash"
	icon = 'icons/roguetown/clothing/special/blkknight.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/blkknight.dmi'
	w_class = WEIGHT_CLASS_NORMAL

/obj/item/clothing/under/roguetown/platelegs/blk
	name = "поножи из черной стали"
	icon_state = "bklegs"
	icon = 'icons/roguetown/clothing/special/blkknight.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/blkknight.dmi'
	sleeved = 'icons/roguetown/clothing/special/onmob/blkknight.dmi'
	w_class = WEIGHT_CLASS_BULKY

/obj/item/clothing/gloves/roguetown/plate/blk
	name = "наручи из черной стали"
	icon_state = "bkgloves"
	icon = 'icons/roguetown/clothing/special/blkknight.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/blkknight.dmi'
	sleeved = 'icons/roguetown/clothing/special/onmob/blkknight.dmi'
	w_class = WEIGHT_CLASS_SMALL

/obj/item/clothing/neck/roguetown/blkknight
	name = "ожерелье из драконьей чешуи"
	desc = "Один только блеск чешуек заставляет кровь закипеть..."
	icon_state = "bktrinket"
	max_integrity = 100000
	armor = list("blunt" = 100, "slash" = 100, "stab" = 100, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 0)
	prevent_crits = list(BCLASS_CUT,BCLASS_BLUNT)
	blocksound = PLATEHIT
	icon = 'icons/roguetown/clothing/special/blkknight.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/blkknight.dmi'
	//dropshrink = 0.75
	resistance_flags = FIRE_PROOF
	sellprice = 666
	static_price = TRUE
	var/active_item = FALSE
	w_class = WEIGHT_CLASS_SMALL

/obj/item/clothing/neck/roguetown/blkknight/equipped(mob/living/user)
	. = ..()
	if(active_item)
		return
	active_item = TRUE
	if(user.mind.special_role == "Bandit")
		to_chat(user, span_notice("Я чувствую воодушевление от сил Маттиоса!..."))
		user.change_stat("strength", 2)
		user.change_stat("perception", 2)
		user.change_stat("intelligence", 2)
		user.change_stat("constitution", 2)
		user.change_stat("endurance", 2)
		user.change_stat("speed", 2)
		armor = getArmor("blunt" = 100, "slash" = 100, "stab" = 100, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 0)
	else
		to_chat(user, span_notice("Я чувствую, как злая сила исходит от этого ожерелья..."))
		armor = getArmor("blunt" = 0, "slash" = 0, "stab" = 0, "bullet" = 0, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/neck/roguetown/blkknight/dropped(mob/living/user)
	if(!active_item)
		return
	active_item = FALSE
	if(user.mind.special_role == "Bandit")
		to_chat(user, span_notice("Я снял ожерелье Маттиоса..."))
		user.change_stat("strength", -2)
		user.change_stat("perception", -2)
		user.change_stat("intelligence", -2)
		user.change_stat("constitution", -2)
		user.change_stat("endurance", -2)
		user.change_stat("speed", -2)
	else
		to_chat(user, span_notice("Хм, странное ощущение исчезло..."))
		armor = getArmor("blunt" = 100, "slash" = 100, "stab" = 100, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 50, "acid" = 0)

/obj/item/clothing/suit/roguetown/armor/plate/blkknight
	slot_flags = ITEM_SLOT_ARMOR
	name = "латы из черной стали"
	body_parts_covered = CHEST|GROIN|VITALS|ARMS
	r_sleeve_status = SLEEVE_NOMOD
	l_sleeve_status = SLEEVE_NOMOD
	icon_state = "bkarmor"
	icon = 'icons/roguetown/clothing/special/blkknight.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/blkknight.dmi'
	sleeved = 'icons/roguetown/clothing/special/onmob/blkknight.dmi'
	w_class = WEIGHT_CLASS_BULKY

/obj/item/clothing/shoes/roguetown/armor/steel/blkknight
	name = "сабатоны из черной стали"
	icon_state = "bkboots"
	icon = 'icons/roguetown/clothing/special/blkknight.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/blkknight.dmi'
	sleeved = 'icons/roguetown/clothing/special/onmob/blkknight.dmi'
	w_class = WEIGHT_CLASS_SMALL

//Short hoods for guards

/obj/item/clothing/cloak/stabard/guardhood
	name = "капюшон стражника"
	desc = "Наплечный капюшон, окрашенный в цвета геральдики правителя."
	color = CLOTHING_RED
	detail_tag = "_spl"
	detail_color = CLOTHING_PURPLE
	icon_state = "guard_hood"
	body_parts_covered = CHEST

/obj/item/clothing/cloak/stabard/guardhood/attack_right(mob/user)
	if(picked)
		return
	var/the_time = world.time
	var/chosen = input(user, "Выберите узор:","Изменение внешнего вида") as null|anything in list("Пополам")
	if(world.time > (the_time + 10 SECONDS))
		return
	if(!chosen)
		return
	switch(chosen)
		if("Пополам")
			detail_tag = "_spl"
	update_icon()
	if(ismob(loc))
		var/mob/L = loc
		L.update_inv_cloak()
	if(alert("Вас устраивает результат?", "Готово!", "Да", "Нет") != "Да")
		detail_tag = initial(detail_tag)
		update_icon()
		if(ismob(loc))
			var/mob/L = loc
			L.update_inv_cloak()
		return
	picked = TRUE

/obj/item/clothing/cloak/stabard/guardhood/Initialize()
	. = ..()
	if(GLOB.lordprimary)
		lordcolor(GLOB.lordprimary,GLOB.lordsecondary)
	else
		GLOB.lordcolor += src

/obj/item/clothing/cloak/stabard/guardhood/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

/obj/item/clothing/cloak/stabard/guardhood/lordcolor(primary,secondary)
	color = primary
	detail_color = secondary
	update_icon()
	if(ismob(loc))
		var/mob/L = loc
		L.update_inv_cloak()

/obj/item/clothing/cloak/stabard/guardhood/Destroy()
	GLOB.lordcolor -= src
	return ..()

///////////////////////////
///                     ///
///   TEMPLAR CLOAKS    ///
///                     ///
///////////////////////////

/obj/item/clothing/cloak/templar/astratan
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/cloaks.dmi'
	alternate_worn_layer = TABARD_LAYER
	boobed = FALSE
	name = "сюрко рыцаря Астраты"
	desc = "Прекрасные одежды храмовника. Прошиты выцветшим, но все еще ярко блестящим златом солнечного крестоносца Астраты."
	icon_state = "astratatabard"

/obj/item/clothing/cloak/templar/malummite
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/cloaks.dmi'
	alternate_worn_layer = TABARD_LAYER
	boobed = FALSE
	name = "сюрко рыцаря Маллума"
	desc = "Одеяния храмовника светло-черного и серого цвета. Полотно рассекается ярко-красными оттенками, словно искрами вечного пламени из-под железного молота Маллума."
	icon_state = "malumtabard"

/obj/item/clothing/cloak/templar/necran
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/cloaks.dmi'
	alternate_worn_layer = TABARD_LAYER
	boobed = FALSE
	name = "сюрко рыцаря Некры"
	desc = "Одеяния храмовника глубокого темного цвета. Черный покров поглощающает весь свет, чтобы погрузить недругов Некры в вечный сон."
	icon_state = "necratabard"

/obj/item/clothing/cloak/fauld
	name = "тканевый фольд"
	desc = "Кусок ткани, обычно его носят что бы частично прикрыть ноги или бедра."
	color = null
	icon_state = "faulds"
	mob_overlay_icon = 'icons/roguetown/clothing/onmob/cloaks.dmi'
	alternate_worn_layer = TABARD_LAYER
	body_parts_covered = LEGS|GROIN
	slot_flags = ITEM_SLOT_CLOAK|ITEM_SLOT_PANTS
	flags_inv = HIDECROTCH
	detail_tag = "_belt"

/obj/item/clothing/cloak/fauld/update_icon()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

/obj/item/clothing/cloak/fauld/battleskirt
	name = "боевая юбка"
	desc = "Длинная юбка, которую обычно носят в бою, окрашивая в цвет ее владельца."
	icon_state = "battleskirt"

/obj/item/clothing/cloak/fauld/battleskirt/update_icon()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

/obj/item/clothing/cloak/stabard/crusader
	name = "сюрко златоносного ордена"
	icon_state = "crusader_surcoat"
	icon = 'icons/roguetown/clothing/special/crusader.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/crusader.dmi'
	sleeved = 'icons/roguetown/clothing/special/onmob/crusader.dmi'

/obj/item/clothing/cloak/stabard/crusader/t
	name = "сюрко сереброносного ордена"
	icon_state = "crusader_surcoatt2"

/obj/item/clothing/cloak/cape/crusader
	name = "пустынная накидка"
	icon_state = "crusader_cloak"
	icon = 'icons/roguetown/clothing/special/crusader.dmi'
	mob_overlay_icon = 'icons/roguetown/clothing/special/onmob/crusader.dmi'
	sleeved = 'icons/roguetown/clothing/special/onmob/crusader.dmi'

/obj/item/clothing/cloak/cape/crusader/ComponentInitialize()
	. = ..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	if(STR)
		STR.max_combined_w_class = 3
		STR.max_w_class = WEIGHT_CLASS_NORMAL
		STR.max_items = 1

/obj/item/clothing/cloak/cape/crusader/attack_right(mob/user)
	var/datum/component/storage/CP = GetComponent(/datum/component/storage)
	if(CP)
		CP.rmb_show(user)
		return TRUE
	..()

/obj/item/clothing/cloak/cape/crusader/dropped(mob/living/carbon/human/user)
	..()
	var/datum/component/storage/STR = GetComponent(/datum/component/storage)
	if(STR)
		var/list/things = STR.contents()
		for(var/obj/item/I in things)
			STR.remove_from_storage(I, get_turf(src))
