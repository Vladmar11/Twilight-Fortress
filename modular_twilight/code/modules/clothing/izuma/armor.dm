/obj/item/clothing/suit/roguetown/armor/leather/vest/muneate //exists only for the drip.
	name = "мунаатэ"
	desc = "Простая кожаная защита груди для обычных лучников. Едва ли защищает - почти бесполезен."
	icon_state = "muneate"
	item_state = "muneate"
	icon = 'modular_twilight/icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'

/obj/item/clothing/suit/roguetown/armor/leather/vest/muneate/random/Initialize()
	color = RANDOM_COLOUR
	..()

/obj/item/clothing/suit/roguetown/armor/leather/vest/muneate/kappa
	color = CLOTHING_DARK_GREEN

/obj/item/clothing/suit/roguetown/armor/plate/nanbando
	name = "нанбан-доу-содэ"
	desc = "Стальная кираса из Изумы, усовершенствованный и с дополнительным укреплением для защиты. \
	Редкий и ценимый высокопоставленными самураями."
	icon = 'modular_twilight/icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	icon_state = "nanbando"
	item_state = "nanbando"

/obj/item/clothing/suit/roguetown/armor/plate/half/nanbando
	name = "нанбан-доу"
	desc = "Стальная кираса из Изумы, защищающий только грудь. Относительно часто встречается у выходцев из низшей касты самураев."
	icon = 'modular_twilight/icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	icon_state = "nanbandoc"
	item_state = "nanbandoc"

/obj/item/clothing/suit/roguetown/armor/plate/full/nanbando
	name = "нанбан-до-гусоку"
	desc = "Полный комплект стального доспеха из Изумы, усовершенствованный и с дополнительными вспомогательными частями для защиты."
	icon = 'modular_twilight/icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	icon_state = "nanbandofull"

/obj/item/clothing/suit/roguetown/armor/chainmail/tatami
	name = "ламеллаэ-татами до"
	desc = "Складной, легкий доспех для удобства перемещения и простоты изготовления.\
	Изготовлен из прямоугольных стальных ламелей, вшитых в цепную броню, и является массовым доспехом в Сёгунате Изумы.\
	Считается основой военной брони Изумы, часто используется вместо зеркальной брони и о-йорои."
	icon = 'modular_twilight/icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	icon_state = "laminartatami"

/obj/item/clothing/suit/roguetown/armor/chainmail/iron/tatami
	name = "татами карута-ганэ"
	desc = "Складной, легкий доспех для удобства перемещения и простоты изготовления.\
	Он сделан из лакированных железных квадратов, похожих на карты, вшитых в мягкую тканевую или кожаную основу."
	icon = 'modular_twilight/icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	icon_state = "tatami"

/obj/item/clothing/suit/roguetown/armor/chainmail/hauberk/kusari
	name = "кусари катабира"
	desc = "Или просто «однослойная цепная мантия», эти доспехи сделаны из клепаных стальных колец \
	скрепленных между собой тонкими пластинами, защищающими локти. Доспехи доходят до ног и рук."
	icon = 'modular_twilight/icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	icon_state = "kusari"
	item_state = "kusari"

/obj/item/clothing/suit/roguetown/armor/plate/mirror/iron
	name = "железные зеркальные доспехи"
	desc = "Полированные железные пластины определяют каркас этого доспеха с металлическим диском в центре.\
	Такой доспех используется на Туманных Островах вместе с кусари-катабирой."
	icon = 'modular_twilight/icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	icon_state = "imirrorarmor"
	max_integrity = 200
	armor = list("blunt" = 80, "slash" = 100, "stab" = 80, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	smeltresult = /obj/item/ingot/iron
	armor_class = ARMOR_CLASS_MEDIUM

/obj/item/clothing/suit/roguetown/armor/plate/mirror
	name = "стальная зеркальная броня"
	icon_state = "mirrorarmor"
	desc = "Полированные стальные пластины определяют каркас этого доспеха с металлическим диском в центре. Такой доспех используется на Туманных Островах вместе с кусари-катабирой."
	icon = 'modular_twilight/icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	icon_state = "mirrorarmor"

/obj/item/clothing/suit/roguetown/armor/brigandine/oyoroi //I did everything I could to fix this shit. I couldn't. So the entire 'colourscheme overlay' ordeal went to hell.
	name = "о-йорои"
	desc = "Сверхпрочные пластинчатые доспехи почитались высокопоставленными самураями как на коне, так и на земле."
	icon = 'modular_twilight/icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	icon_state = "halfoyoroi"
	body_parts_covered = CHEST|GROIN|VITALS
	armor_class = ARMOR_CLASS_MEDIUM
	max_integrity = 320

/obj/item/clothing/suit/roguetown/armor/brigandine/oyoroi/royal/Initialize()
	. = ..()
	AddComponent(/datum/component/squeak, list('sound/foley/footsteps/armor/coatplates (1).ogg',\
												'sound/foley/footsteps/armor/coatplates (2).ogg',\
												'sound/foley/footsteps/armor/coatplates (3).ogg'), 100)

/obj/item/clothing/suit/roguetown/armor/brigandine/oyoroi/royal/update_icon()
	cut_overlays()
	detail_tag = "_met"
	detail_color = GLOB.lordprimary
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

/obj/item/clothing/suit/roguetown/armor/brigandine/oyoroi/captain/Initialize()
	. = ..()
	if(GLOB.lordprimary)
		lordcolor(GLOB.lordprimary,GLOB.lordsecondary)
	else
		GLOB.lordcolor += src

/obj/item/clothing/suit/roguetown/armor/brigandine/oyoroi/captain/lordcolor(primary,secondary)
	detail_tag = "_met"
	detail_color = primary
	update_icon()
	if(ismob(loc))
		var/mob/L = loc
		L.update_inv_armor()

/obj/item/clothing/suit/roguetown/armor/brigandine/oyoroi/captain/Destroy()
	GLOB.lordcolor -= src
	return ..()

/obj/item/clothing/suit/roguetown/armor/brigandine/oyoroi/oyoroigusoku
	name = "о-йорои гусоку"
	desc = "Сверхпрочный полный комплект ламеллярных доспехов, которые высокопоставленные самураи почитают как на коне, так и на земле."
	icon_state = "oyoroi"
	body_parts_covered = CHEST|GROIN|VITALS|LEGS|ARMS

/obj/item/clothing/suit/roguetown/armor/plate/half/iron/sanmaido
	name = "сан май-до"
	desc = "Дешевая кираса с тремя основными пластинами, скрепленными между собой тканью. Гибкий и достаточно прочный, неотъемлемая часть многих бедных пехотинцев из Изумы."
	icon = 'modular_twilight/icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	icon_state = "sanmaido"

/obj/item/clothing/suit/roguetown/armor/leather/abyssal
	name = "кожаные ламеллярные доспехи"
	desc = "Эта кожаная броня из Туманных Островов, известная также под названием «Тийоджиа», имеет небольшие прямоугольные кожаные пластины, \
	скрепленные между собой, чтобы закрыть жизненно важные органы."
	icon = 'modular_twilight/icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	icon_state = "tiejia"

/obj/item/clothing/suit/roguetown/armor/leather/hide/dustwalker
	name = "кожаные кавалерийские доспехи"
	desc = "Хатагский тегелгах предназначен для использования абиссариадской легкой кавалерией и конными лучниками в центре Туманного острова."
	icon = 'modular_twilight/icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	icon_state = "arisan_khuyag"

/obj/item/clothing/suit/roguetown/armor/leather/splint/kikko //This one is more realistic than Studded Leather armor. A reminder that Studded leather armor is a misinterpretation of a Brigandine.
	name = "куртка кикко"
	desc = "Более дешевая и легкая версия кикко татами, кожаная куртка с металлическими шестиугольными пластинами в виде черепашьего панциря."
	icon = 'modular_twilight/icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	icon_state = "kikko"
	adjustable = CAN_CADJUST

/obj/item/clothing/suit/roguetown/armor/leather/splint/kikko/eidolon
	color = CLOTHING_TEAL

/obj/item/clothing/suit/roguetown/armor/leather/splint/kikko/rich/Initialize()
	color = RANDOM_COLOUR
	..()

/obj/item/clothing/suit/roguetown/armor/leather/studded/kikko/AdjustClothes(mob/user)
	if(loc == user)
		if(adjustable == CAN_CADJUST)
			adjustable = CADJUSTED
			if(toggle_icon_state)
				icon_state = "[initial(icon_state)]_open"
			flags_inv = null
			body_parts_covered = CHEST
			if(ishuman(user))
				var/mob/living/carbon/H = user
				H.update_inv_armor()
		else if(adjustable == CADJUSTED)
			ResetAdjust(user)
			if(user)
				if(ishuman(user))
					var/mob/living/carbon/H = user
					H.update_inv_armor()

/obj/item/clothing/suit/roguetown/armor/leather/hide/shozoku
	name = "сёдзоку"
	desc = "Основная одежда, используемая ниндзя и куноичи, чтобы слиться с тенью. Непригоден для использования при дневном свете, но его легко хранить где угодно и когда угодно."
	icon = 'modular_twilight/icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	icon_state = "shinobi"
	item_state = "shinobi"
	blocksound = SOFTHIT
	color = "#6a6896"
	max_integrity = 200
	body_parts_covered = CHEST|GROIN|VITALS|LEGS|ARMS
	prevent_crits = list(BCLASS_CUT, BCLASS_BLUNT, BCLASS_TWIST)
	armor = list("blunt" = 75, "slash" = 60, "stab" = 30, "bullet" = 10, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/suit/roguetown/armor/chainmail/iron/rattan //New armor; Iron-to-steel tier.
	slot_flags = ITEM_SLOT_ARMOR
	name = "ротанговые доспехи"
	desc = "Гибкий и прочный плащ для всего тела, изготовленный из проваренного в масле ротанга и многослойной железной проволоки. Используется рейдерами Линь Ю, легко ремонтируется."
	icon = 'modular_twilight/icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	icon_state = "rattan"
	item_state = "rattan"
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_TWIST, BCLASS_ASSASSIN)
	body_parts_covered = CHEST|GROIN|VITALS|LEGS
	max_integrity = 200
	sewrepair = TRUE //this armor's utility.

/obj/item/clothing/suit/roguetown/armor/leather/jacket/haori
	name = "хаори"
	desc = "Традиционный жакет, который надевают поверх кимоно."
	icon_state = "haori"
	icon = 'modular_twilight/icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'

/obj/item/clothing/suit/roguetown/armor/leather/jacket/haori/random/Initialize()
	color = RANDOM_COLOUR
	..()

/obj/item/clothing/suit/roguetown/armor/leather/jacket/haori/dark
	color = CLOTHING_BLACK

//New Rare Heartfelt equipment
/obj/item/clothing/suit/roguetown/armor/medium/surcoat/heartfelt/abyssariad
	name = "изума кикко гусоку"
	desc = "Доспехи, которые были изготовлены для высокопостапленных лиц, чтобы лучше снабжать быстроходную кавалерию самураев, заменив более тяжелые и дорогие пластинчатые о-йорои."
	body_parts_covered = CHEST|GROIN|VITALS|LEGS //does not protect the arms. Countering the Brigandine that protects the arms, but not legs.
	icon = 'modular_twilight/icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	sellprice = 65 //not unique.

/obj/item/clothing/suit/roguetown/armor/leather/vest/izuma
	name = "вайтао Изумы"
	icon_state = "waitao_coat"
	color = null
	desc = "Шелковый плащ, сделанный в Изуме, используется жителями Изумы, теми, кто случайно принес это название чужакам на Туманные Острова. Или просто творческие люди."
	icon = 'modular_twilight/icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	body_parts_covered = CHEST|VITALS|LEGS
	sellprice = 45

/obj/item/clothing/suit/roguetown/armor/brigandine/shanwenkai //I dislike overused armor in unique roles. so I just made an "Officer" armor based on the chinese actual officer armor. Brigadine.
	slot_flags = ITEM_SLOT_ARMOR
	name = "шанвенкай" //This is the Shan Wen Kia armor, but the downwards 'Y' is upwards now, so I can't name it <mountain patterned armor>
	desc = "Древний богвенкай - тяжелый доспех с накладными пластинами, украшенный символом Псайдоном. Ее используют избранные Туманных Островов, которые все еще остаются в этом мире, почитая Псайдона, вскормившего Абиссора."
	icon_state = "shanwenkai"
	icon = 'modular_twilight/icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'

/obj/item/clothing/suit/roguetown/armor/brigandine/shanwenkai/update_icon()
	return

/obj/item/clothing/suit/roguetown/armor/gambeson/ruankai
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_SHIRT
	name = "укрепленный руанкай"
	desc = "Из многослойного хлопка или шелка, простеганные вместе, они поглощают удары и защищают владельца как амортизирующий слой. Достаточно, чтобы пережить удар сайги."
	icon_state = "ruankai"
	icon = 'modular_twilight/icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'

/obj/item/clothing/suit/roguetown/armor/gambeson/light/hitatare
	name = "йорои хитатаре"
	desc = "Традиционный изуминский халат с широкими рукавами, предназначенный для ношения под доспехами. \
	Удобный и плотный, но не очень защищающий по сравнению с руанкай, зато его можно использовать постоянно, не вызывая подозрений."
	icon_state = "yoroihitatare"
	icon = 'modular_twilight/icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	var/picked = FALSE

/obj/item/clothing/suit/roguetown/armor/gambeson/light/hitatare/zamurai/proc/get_player_input()
	if(!ishuman(loc))
		return

	var/list/colors = list(
	"PURPLE"="#865c9c",
	"RED"="#933030",
	"BROWN"="#685542",
	"GREEN"="#79763f",
	"BLUE"="#395480",
	"YELLOW"="#b5b004",
	"TEAL"="#249589",
	"WHITE"="#ffffff",
	"ORANGE"="#b86f0c",
	"MAJENTA"="#962e5c")
	var/mob/living/carbon/human/L = loc
	var/choice = input(L, "Choose a color.", "ZAMURAI COLORPLEX") as anything in colors
	var/playerchoice = colors[choice]
	picked = TRUE
	detail_color = playerchoice
	update_icon()
	for(var/obj/item/clothing/V in L.get_equipped_items(FALSE))
		testing("clothes to color are [V]")
		if(V.colorgrenz)
			V.detail_color = playerchoice
			V.update_icon()
	L.regenerate_icons()

/obj/item/clothing/suit/roguetown/armor/gambeson/light/hitatare/zamurai/Initialize()
	. = ..()
	if(!picked)
		INVOKE_ASYNC(src, PROC_REF(get_player_input))

/obj/item/clothing/suit/roguetown/armor/gambeson/light/hitatare/zamurai/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

// Randomized color Hitatare
/obj/item/clothing/suit/roguetown/armor/gambeson/light/hitatare/random/Initialize()
	color = RANDOM_COLOUR
	..()

// Randomized //Тwilight Fоrtress// color Hitatare
/obj/item/clothing/suit/roguetown/armor/gambeson/light/hitatare/rich/Initialize()
	color = RANDOM_COLOUR
	..()

// Ronin Hitatare
/obj/item/clothing/suit/roguetown/armor/gambeson/light/hitatare/ronin
	color = CLOTHING_BLACK

// Eidolon Hitatare
/obj/item/clothing/suit/roguetown/armor/gambeson/light/hitatare/eidolon
	color = CLOTHING_TEAL

/obj/item/clothing/suit/roguetown/armor/gambeson/heavy/deelcoat
	name = "укрепленная туника островитян"
	desc = "Свободно облегающая туника из Туманных Островов, обычно из конской кожи, традиционно используемая охотниками. Плотная подкладка надежно защищает от тупых ударов."
	icon_state = "deel"
	icon = 'modular_twilight/icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'

/obj/item/clothing/suit/roguetown/armor/leather/splint/ninjakappa //same as studded leather armor
	name = "бронзовая кираса"
	desc = "Многослойный доспех из промасленной кожи, усиленный бронзовыми пластинами, вшитыми в ткань. \
	Легкая и гибкая, она используется жителями Изумы, которые стали частью подпольных операций шиноби по уничтожению незаконных банд, наркоторговцев и центров проституции."
	icon_state = "ninjakappa"
	item_state = "ninjakappa"
	icon = 'modular_twilight/icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'

/obj/item/clothing/suit/roguetown/armor/rare/myrmidon
	name = "мирмидон минггуан кай" // that's "明光铠", not the genshin character.
	desc = "Наложенные друг на друга стальные пластины, омытые океаном, соединенные нитями из шкуры убитого монстра и вкраплениями орихалка,\
	нанесенными эмблемами Абиссора и символами Псайдона. На каждом стальном слое выгравировано:\
	По приказу Небесного Императора. Для бездны вопреки всему."
	icon_state = "myrmidon"
	item_state = "myrmidon"
	sleevetype = null
	max_integrity = 400 //Chest + Pants - Everything is on a single armor. Breaks easier since it gets battered everywhere, so it requires more endurance.
	icon = 'modular_twilight/icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	body_parts_covered = CHEST|GROIN|ARMS|VITALS|LEGS //Pays off by not having other limbparts.
	anvilrepair = /datum/skill/craft/blacksmithing
	smeltresult = /obj/item/ingot/steel
	equip_delay_self = 4 SECONDS
	unequip_delay_self = 4 SECONDS
	sellprice = 40
	clothing_flags = CANT_SLEEP_IN
	armor_class = ARMOR_CLASS_HEAVY
	armor = list("blunt" = 80, "slash" = 100, "stab" = 80, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)

/obj/item/clothing/suit/roguetown/armor/rare/Initialize()
	. = ..()
	AddComponent(/datum/component/squeak, list('sound/foley/footsteps/armor/fullplate (1).ogg',\
												'sound/foley/footsteps/armor/fullplate (2).ogg',\
												'sound/foley/footsteps/armor/fullplate (3).ogg'), 80)

//Тwilight Fоrtress//

/obj/item/clothing/suit/roguetown/armor/ceramic
	name = "племенные покрытия"
	desc = "Более проработанная броня, изготовленная из прочных костей животных. Подходит для племен, не использующих металлургию."
	icon_state = "nacre_covering"
	icon = 'modular_twilight/icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	armor = list("blunt" = 60, "slash" = 100, "stab" = 80, "bullet" = 50, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	blocksound = SOFTHIT
	blade_dulling = DULLING_BASHCHOP
	body_parts_covered = CHEST|GROIN|VITALS
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_STAB) // Bones are ceramic-like. These are horrible against blunt.
	armor_class = ARMOR_CLASS_MEDIUM
	max_integrity = 150
	anvilrepair = TRUE
	smeltresult = /obj/item/ash
	sewrepair = FALSE
	slot_flags = ITEM_SLOT_ARMOR

/obj/item/clothing/suit/roguetown/armor/ceramic/reinforced
	name = "Доспехи охотника на троллей"
	desc = "Тяжелая броня, используемая племенными силами мародеров Ундины под флагом Абиссариады с Туманных Островов. \
	Изготовлена из материала, похожего на керамику, добываемую на островах."
	icon_state = "marauder_chest"
	icon = 'modular_twilight/icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_STAB) // Bones are ceramic-like. These are horrible against blunt.
	blade_dulling = DULLING_BASHCHOP
	body_parts_covered = CHEST|VITALS|ARMS|GROIN //Protects an acceptable large range of places for such relatively cost-y armor. I hope.
	armor = list("blunt" = 40, "slash" = 100, "stab" = 60, "bullet" = 30, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	max_integrity = 250
	equip_delay_self = 40
	armor_class = ARMOR_CLASS_MEDIUM

/obj/item/clothing/suit/roguetown/armor/ceramic/light
	name = "костные покрытия"
	desc = "Простая, примитивная броня, сделанная из выточенных костей, скрепленных волокнами и сухожилиями. \
	Прочнее гамбезонов, но для их изготовления требуется победить жестоких дендорских существ."
	icon = 'modular_twilight/icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	armor = list("blunt" = 40, "slash" = 100, "stab" = 60, "bullet" = 20, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	icon_state = "ivory_coverings"
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_SHIRT
	blocksound = SOFTHIT
	blade_dulling = DULLING_BASHCHOP
	body_parts_covered = CHEST|GROIN
	max_integrity = 100 //breaks quickly
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB) //Bones acts similar to ceramics, it will crack with blunt damage.
	armor_class = ARMOR_CLASS_LIGHT
