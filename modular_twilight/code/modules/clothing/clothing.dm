// Royal cloaks:
/obj/item/clothing/cloak/lordcloak/ladycloak
	name = "женственный короткий плащ"
	desc = "Отделанный горностаем и передаваемый по наследству предмет королевского гардероба."
	color = null
	icon = 'modular_twilight/icons/roguetown/clothing/cloak.dmi'
	icon_state = "shortcloak"
	item_state = "shortcloak"
	alternate_worn_layer = CLOAK_BEHIND_LAYER
	slot_flags = ITEM_SLOT_BACK_R|ITEM_SLOT_CLOAK
	boobed = TRUE
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/cloak.dmi' 
	sleevetype = "shirt"
	nodismemsleeves = TRUE
	detail_tag = "_detail"

/obj/item/clothing/cloak/matron
	name = "плащ матроны"
	desc = "Плащ, который носят только самые дрянные старухи."
	icon_state = "matroncloak"
	icon = 'modular_twilight/icons/roguetown/clothing/cloak.dmi'
	mob_overlay_icon ='modular_twilight/icons/roguetown/clothing/onmob/cloak.dmi'
	body_parts_covered = CHEST|GROIN|VITALS|ARMS
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/cloak.dmi'
	sleevetype = "shirt"
	slot_flags = ITEM_SLOT_CLOAK
	flags_inv = HIDEBOOB|HIDECROTCH
	nodismemsleeves = TRUE

/obj/item/clothing/cloak/captain
	name = "плащ капитана"
	desc = "Плащ-накидка с вышитой золотом геральдикой Рокхилла."
	icon = 'modular_twilight/icons/roguetown/clothing/captain.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/captain.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/captain.dmi'
	sleevetype = "shirt"
	icon_state = "capcloak"
	detail_tag = "_detail"
	alternate_worn_layer = CLOAK_BEHIND_LAYER
	detail_color = CLOTHING_BLUE

/obj/item/clothing/cloak/captain/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

/obj/item/clothing/cloak/captain/lordcolor(primary,secondary)
	detail_color = primary
	update_icon()

/obj/item/clothing/cloak/captain/Initialize()
	. = ..()
	if(GLOB.lordprimary)
		lordcolor(GLOB.lordprimary,GLOB.lordsecondary)
	else
		GLOB.lordcolor += src

/obj/item/clothing/cloak/captain/Destroy()
	GLOB.lordcolor -= src
	return ..()

//Royal clothing:
//................ Royal Dress (Ball Gown)............... //

/obj/item/clothing/suit/roguetown/shirt/dress/royal
	slot_flags = ITEM_SLOT_SHIRT|ITEM_SLOT_ARMOR
	icon = 'modular_twilight/icons/roguetown/clothing/shirts_royalty.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/shirts_royalty.dmi'
	name = "королевское платье"
	desc = "Изысканное бальное платье, излюбленная мода королев и высшей знати в Энигме."
	body_parts_covered = CHEST|GROIN|ARMS|VITALS
	icon_state = "royaldress"
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/sleeves_shirts_royalty.dmi'
	boobed = TRUE
	detail_tag = "_detail"
	detail_color = CLOTHING_BLACK
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL

/obj/item/clothing/suit/roguetown/shirt/dress/royal/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

/obj/item/clothing/suit/roguetown/shirt/dress/royal/lordcolor(primary,secondary)
	detail_color = primary
	update_icon()

/obj/item/clothing/suit/roguetown/shirt/dress/royal/Initialize()
	. = ..()
	if(GLOB.lordprimary)
		lordcolor(GLOB.lordprimary,GLOB.lordsecondary)
	else
		GLOB.lordcolor += src

/obj/item/clothing/suit/roguetown/shirt/dress/royal/Destroy()
	GLOB.lordcolor -= src
	return ..()

//Queensleeves
/obj/item/clothing/wrists/roguetown/royalsleeves
	name = "королевские рукава"
	desc = "Рукава, подходящие к изысканному платью."
	slot_flags = ITEM_SLOT_WRISTS
	icon = 'modular_twilight/icons/roguetown/clothing/wrists.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/wrists.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/wrists.dmi'
	icon_state = "royalsleeves"
	item_state = "royalsleeves"
	detail_tag = "_detail"
	detail_color = CLOTHING_BLACK

/obj/item/clothing/wrists/roguetown/royalsleeves/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

/obj/item/clothing/wrists/roguetown/royalsleeves/lordcolor(primary,secondary)
	detail_color = primary
	update_icon()

/obj/item/clothing/wrists/roguetown/royalsleeves/Initialize()
	. = ..()
	if(GLOB.lordprimary)
		lordcolor(GLOB.lordprimary,GLOB.lordsecondary)
	else
		GLOB.lordcolor += src

/obj/item/clothing/wrists/roguetown/royalsleeves/Destroy()
	GLOB.lordcolor -= src
	return ..()

/obj/item/clothing/head/roguetown/crown/consortcrown
	name = "жемчужина Рокхилла"
	desc = "Вы призваны разделить ношу, возложенную на плечи правителя."
	icon = 'modular_twilight/icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/head.dmi'
	icon_state = "consortcrown"

//................ Princess Dress ............... //
/obj/item/clothing/suit/roguetown/shirt/dress/royal/princess
	slot_flags = ITEM_SLOT_SHIRT|ITEM_SLOT_ARMOR
	name = "свежее парадное платье"
	desc = "Струящееся, замысловатое платье, сшитое лучшими портными для наследниц монарха."
	icon = 'modular_twilight/icons/roguetown/clothing/shirts_royalty.dmi'
	icon_state = "princess"
	boobed = TRUE
	detail_color = CLOTHING_PURPLE

//................ Prince Shirt   ............... //
/obj/item/clothing/suit/roguetown/shirt/dress/royal/prince
	slot_flags = ITEM_SLOT_SHIRT|ITEM_SLOT_ARMOR
	name = "позолоченная парадная рубашка"
	desc = "Парадная рубашка, расшитая золотом, изготовленная специально для наследников монарха."
	icon_state = "prince"
	boobed = TRUE
	detail_color = CLOTHING_BLUE

// End royal clothes

/obj/item/clothing/suit/roguetown/armor/leather/jacket/handjacket
	name = "благородный пиджак"
	icon_state = "handcoat"
	icon = 'modular_twilight/icons/roguetown/clothing/noble.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/noble.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/noble.dmi'
	detail_tag = "_detail"
	detail_color = CLOTHING_BLACK
	flags_inv = HIDEBOOB|HIDECROTCH

/obj/item/clothing/suit/roguetown/armor/leather/jacket/handjacket/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

/obj/item/clothing/suit/roguetown/armor/leather/jacket/handjacket/lordcolor(primary,secondary)
	detail_color = primary
	update_icon()

/obj/item/clothing/suit/roguetown/armor/leather/jacket/handjacket/Initialize()
	. = ..()
	if(GLOB.lordprimary)
		lordcolor(GLOB.lordprimary,GLOB.lordsecondary)
	else
		GLOB.lordcolor += src

/obj/item/clothing/suit/roguetown/armor/leather/jacket/handjacket/Destroy()
	GLOB.lordcolor -= src
	return ..()

/obj/item/clothing/suit/roguetown/shirt/robe/archivist
	name = "мантия архивариуса"
	desc = "Одеяния, принадлежащие искателям знаний."
	icon_state = "archivist"
	icon = 'modular_twilight/icons/roguetown/clothing/shirts.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/shirts.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/sleeves_shirts.dmi'
	boobed = TRUE
	flags_inv = HIDEBOOB|HIDECROTCH
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	allowed_sex = list(MALE, FEMALE)
	color = null
	sellprice = 100

/obj/item/clothing/head/roguetown/stewardtophat
	name = "украшенный цилиндр"
	desc = "Шляпа-цилиндр из крепкой, промасленной кожи, украшенная бронзовым обручем."
	icon_state = "stewardtophat"
	icon = 'modular_twilight/icons/roguetown/clothing/noble.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/64x64/head.dmi'
	worn_x_dimension = 64
	worn_y_dimension = 64
	bloody_icon = 'icons/effects/blood.dmi'
	bloody_icon_state = "helmetblood"

/obj/item/clothing/suit/roguetown/armor/gambeson/steward
	name = "черный фрак казначея"
	desc = "Плотный, безупречно чистый кожаный фрак казначея, украшенный отполированными бронзовыми пуговицами."
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/noble.dmi'
	icon_state = "stewardtailcoat"
	item_state = "stewardtailcoat"
	icon = 'modular_twilight/icons/roguetown/clothing/noble.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/noble.dmi'

/obj/item/clothing/suit/roguetown/shirt/dress/stewarddress
	name = "черное платье казначея"
	desc = "Черное платье казначея в викторианском стиле с блестящими бронзовыми пуговицами."
	icon = 'modular_twilight/icons/roguetown/clothing/noble.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/noble.dmi'
	icon_state = "stewarddress"
	sleeved = FALSE
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_SHIRT

/obj/item/clothing/shoes/roguetown/nobleboot/thighboots
	name = "высокие сапоги"
	desc = "Стильные сапоги, достающие до самых бедер. "
	icon_state = "thighboot"
	icon = 'modular_twilight/icons/roguetown/clothing/noble.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/noble.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/noble.dmi'

/obj/item/clothing/suit/roguetown/shirt/tunic/noblecoat
	name = "элегантное одеяние"
	desc = "Модное сочетание туники и пальто. Как элегантно."
	icon = 'modular_twilight/icons/roguetown/clothing/shirts.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/shirts.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/sleeves_shirts.dmi'
	icon_state = "noblecoat"
	sleevetype = "noblecoat"
	color = CLOTHING_WHITE
	boobed = TRUE
	flags_inv = HIDEBOOB|HIDECROTCH

/obj/item/clothing/suit/roguetown/shirt/undershirt/fancy
	name = "элегантная туника"
	desc = "Рубашка на пуговицах из тонкого шелка, декорированная жабо и манжетами."
	icon_state = "fancyshirt"
	icon = 'modular_twilight/icons/roguetown/clothing/noble.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/noble.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/noble.dmi'

/obj/item/clothing/suit/roguetown/shirt/undershirt/artificer
	name = "рубашка ремесленника"
	desc = "Прижившаяся мода лучших ремесленников, мастеров и инженеров."
	icon = 'modular_twilight/icons/roguetown/clothing/shirts.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/shirts.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/sleeves_shirts.dmi'
	icon_state = "artishirt"
	flags_inv = HIDEBOOB

/obj/item/clothing/suit/roguetown/shirt/undershirt/lowcut
	name = "топик"
	desc = "Туника, обнажающая шею и большую часть плеч. Плечи?! Какой скандал..."
	icon = 'modular_twilight/icons/roguetown/clothing/shirts.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/shirts.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/sleeves_shirts.dmi'
	icon_state = "lowcut"
	flags_inv = HIDEBOOB

/obj/item/clothing/under/roguetown/shortskirt
	name = "обычная юбка"
	desc = "Длинная, гладкая и весьма скромная."
	icon = 'modular_twilight/icons/roguetown/clothing/pants.dmi'
	icon_state = "skirt"
	item_state = "skirt"
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/pants.dmi'
	color = "#6b5445"

/obj/item/clothing/under/roguetown/shortskirt/random
	name = "skirt"

/obj/item/clothing/under/roguetown/shortskirt/random/Initialize()
	color = pick("#6b5445", "#435436", "#704542", "#79763f")
	return ..()

/obj/item/clothing/under/roguetown/shortskirt/black
	color = CLOTHING_BLACK

/obj/item/clothing/under/roguetown/shortskirt/green
	color = CLOTHING_DARK_GREEN

/obj/item/clothing/under/roguetown/shortskirt/blue
	color = CLOTHING_BLUE

/obj/item/clothing/under/roguetown/shortskirt/red
	color = CLOTHING_RED

/obj/item/clothing/head/roguetown/crownheart //Holds vars for children
	name = "корона Хартфелта"
	desc = "Тяжелый вес короны не передаст всю тяжесть ответственности, которую она возлагает на своего владельца."
	icon_state = "serpcrown"
	dynamic_hair_suffix = null
	sellprice = 200
	resistance_flags = FIRE_PROOF | ACID_PROOF
	anvilrepair = /datum/skill/craft/blacksmithing
	sewrepair = FALSE

/obj/item/clothing/head/roguetown/crown //Holds vars for children
	icon = 'modular_twilight/icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/head.dmi'

/obj/item/clothing/shoes/roguetown/goldanklets
	name = "золотые браслеты"
	desc = "Изящные золотые обручи, которые надеваются на лодыжки."
	gender = PLURAL
	icon = 'modular_twilight/icons/roguetown/clothing/feet.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/feet.dmi'
	icon_state = "anklets"
	item_state = "anklets"
	sewrepair = TRUE

/obj/item/clothing/mask/rogue/exoticsilkmask
	name = "экзотичная шелковая маска"
	icon = 'modular_twilight/icons/roguetown/clothing/masks.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/masks.dmi'
	icon_state = "exoticsilkmask"
	flags_inv = HIDEFACE|HIDEFACIALHAIR
	body_parts_covered = NECK|MOUTH
	slot_flags = ITEM_SLOT_MASK|ITEM_SLOT_HIP
	sewrepair = TRUE

/obj/item/clothing/suit/roguetown/shirt/exoticsilkbra
	name = "экзотичные шелка"
	desc = "Причудливые шелка с золотым шитьем едва способны скрыть то немногое, что они прикрывают."
	icon = 'modular_twilight/icons/roguetown/clothing/shirts.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/shirts.dmi'
	icon_state = "exoticsilkbra"
	item_state = "exoticsilkbra"
	gender = PLURAL
	body_parts_covered = CHEST|ARMS|VITALS
	sewrepair = TRUE

/obj/item/storage/belt/rogue/leather/exoticsilkbelt
	name = "экзотичный шелковый пояс"
	desc = "Украшенный золотом пояс из тончайшего шелка едва скрывает достоинства фигуры."
	icon = 'modular_twilight/icons/roguetown/clothing/belts.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/belts.dmi'
	icon_state = "exoticsilkbelt"
	sewrepair = TRUE
