/obj/item/clothing/head/roguetown/takuhatsugasa
	name = "такухацугаса"
	icon_state = "takuhatsugasa"
	desc = "Шляпа, которую носят монахи из Изумы во время поломничества или когда убивают демонов."
	icon = 'modular_twilight/icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/head.dmi'
	flags_inv = HIDEEARS|HIDEHAIR
	armor = list("blunt" = 25, "slash" = 25, "stab" = 15, "bullet" = 10, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = HEAD|HAIR|EARS
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	max_integrity = 150

/obj/item/clothing/head/roguetown/tengai
	name = "тенгай"
	icon_state = "tengai"
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	desc = "Широкополая шляпа, которую традиционно носят странствующие монахи Изумы."
	bloody_icon = 'icons/effects/blood.dmi'
	bloody_icon_state = "helmetblood"
	worn_x_dimension = 64
	worn_y_dimension = 64
	icon = 'modular_twilight/icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/64x64/head.dmi'
	armor = list("blunt" = 25, "slash" = 25, "stab" = 15, "bullet" = 10, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = HEAD|HAIR|EARS
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	max_integrity = 150

/obj/item/clothing/head/roguetown/tengai/yamabushi
	name = "ямабуси тэнгай"
	icon_state = "stengai"
	desc = "Тенгай, окрашенный в черный цвет смолы, традиционно носят ямабуши."
	bloody_icon_state = "helmetblood"

/obj/item/clothing/head/roguetown/tengai/gasa
	name = "гаса"
	icon_state = "гаса"
	desc = "Коническая соломенная шляпа для защиты от солнца и дождя. Обычно используется простолюдинами, а также самураями и их приближенными."
	flags_inv = HIDEEARS

/obj/item/clothing/head/roguetown/lilly
	name = "маленькая лилипутка гаса"
	icon_state = "lilypad_small"
	desc = "Маленькая лилия, используемая ундинами для защиты от солнца и дождя. Эта лиллия используется в рамках межкультурного обмена, подражая гасам Изумы."
	icon = 'modular_twilight/icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/head.dmi'

/obj/item/clothing/head/roguetown/lilly/medium
	name = "средняя лилипутка гаса"
	icon_state = "lilypad_medium"
	desc = "Средняя лилия, используемая ундинами для защиты от солнца и дождя. Эта лиллия используется в рамках межкультурного обмена, подражая гасам Изумы."

/obj/item/clothing/head/roguetown/lilly/big
	name = "большая лилипутка гаса"
	icon_state = "lilypad_big"
	desc = "Большая лилия, используемая ундинами для защиты от солнца и дождя. Эта лиллия используется в рамках межкультурного обмена, подражая гасам Изумы."

/obj/item/clothing/head/roguetown/tengai/roningasa
	name = "ронингаса"
	icon_state = "roningasa"
	flags_inv = HIDEEARS|HIDEFACE
	desc = "Шляпа, которую обычно носили бесхитростные самураи - ронины."
	bloody_icon_state = null

/obj/item/clothing/head/roguetown/tengai/torioigasa
	name = "ториоигаса"
	icon_state = "torioigasa"
	desc = "Традиционный головной убор, предназначенный для долгих путешествий по туманным землям. Чаще всего используется простолюдинами."
	bloody_icon_state = null

/obj/item/clothing/head/roguetown/tengai/sandogasa
	name = "сандогаса"
	icon_state = "sandogasa"
	flags_inv = HIDEEARS
	desc = "Большой головной убор, обеспечивающий достаточную защиту от стихий, в том числе от дождя."
	bloody_icon_state = null

/obj/item/clothing/head/roguetown/tengai/sandogasa/yamabushi
	name = "ямабуси сандогаса"
	icon_state = "ssandogasa"
	desc = "Сандогаса, выкрашенная в черный цвет смолы, которую традиционно носят ямабуши."
	bloody_icon_state = null

/obj/item/clothing/head/roguetown/soheicloth
	name = "покрытия сохей"
	desc = "Освященная ткань, омываемая святой водой, защищает сохей от тлетворных запахов и обеспечивает анонимность. Символ преданности, демонстрирующий их смирение."
	icon_state = "soheicloth"
	body_parts_covered = HEAD|HAIR
	body_parts_covered = HEAD|HAIR|EARS|MOUTH
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR //it is not hiding facial hair when put on the neck. No idea how to fix.
	slot_flags = ITEM_SLOT_NECK|ITEM_SLOT_HEAD
	icon = 'modular_twilight/icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/head.dmi'

/obj/item/clothing/head/roguetown/soheicloth/thunder
	name = "thunder sohei coverings"
	color = CLOTHING_BLUE

/obj/item/clothing/head/roguetown/soheicloth/storm
	name = "storm sohei coverings"
	color = CLOTHING_BLACK

/obj/item/clothing/head/roguetown/soheicloth/ocean
	name = "ocean sohei coverings"
	color = CLOTHING_PURPLE

/obj/item/clothing/head/roguetown/soheicloth/island
	name = "island sohei coverings"
	color = CLOTHING_BROWN

/obj/item/clothing/head/roguetown/shinobi_zukin
	name = "капюшон шиноби"
	icon_state = "shinobi_zukin"
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	desc = "Капюшон, который носят члены кланов шиноби, чтобы скрыть свою личность и слиться с тенью. Не подходит для шпионажа, так как слишком заметен."
	icon = 'modular_twilight/icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/head.dmi'
	color = "#6a6896"

/obj/item/clothing/head/roguetown/helmet/skullcap/hachigane
	name = "хати-ганэ"
	desc = "Простой пластинчатый головный убор, который изготавливался для скромных монахов, ронинов и бедняков - материал для них часто собирали из железной панировки."
	icon_state = "hachi-gane"
	icon = 'modular_twilight/icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/head.dmi'

/obj/item/clothing/head/roguetown/helmet/skullcap/hachigane/thunder
	name = "thunder hachi-gane"
	desc = "Simple, lamellar head protection. Marked in yellow for the mountainous magicians and monks who praises Abyssor's thunders."
	color = CLOTHING_BLUE

/obj/item/clothing/head/roguetown/helmet/skullcap/hachigane/storm
	name = "storm hachi-gane"
	desc = "Simple, lamellar head protection. Marked in dark blue for the lighthouse keepers of Abyssanctum's faith, who keeps the eternal fire going."
	color = CLOTHING_MAJENTA

/obj/item/clothing/head/roguetown/helmet/skullcap/hachigane/ocean
	name = "ocean hachi-gane"
	desc = "Simple, lamellar head protection. Marked in light blue for the expeditionary magicians and monks of Abyssanctum's faith, long married to the ocean."
	color = CLOTHING_PURPLE

/obj/item/clothing/head/roguetown/helmet/skullcap/hachigane/island
	name = "island hachi-gane"
	desc = "Simple, lamellar head protection. Marked in red for the soilgazers of Abyssanctum's faith, those bent in ensuring no plague shall reach their blessed islands. "
	color = CLOTHING_BROWN

/obj/item/clothing/head/roguetown/helmet/zijinguan
	name = "цзыцзиньгуань" //This is actually a ming dynasty helmet
	desc = "Более дешевая версия шлема Мирмидона, который относится к другой эпохе,\
	но все еще остается эффективным. Этот шлем стал символом военной культуры Изумы.\
	наряду с дзингаса."
	icon_state = "zijinguan"
	flags_inv = HIDEEARS
	icon = 'modular_twilight/icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/64x64/head.dmi'
	bloody_icon = 'icons/effects/blood.dmi'
	bloody_icon_state = "helmetblood"
	worn_x_dimension = 64
	worn_y_dimension = 64
	detail_tag = "_detail"
	dynamic_hair_suffix = ""

/obj/item/clothing/head/roguetown/helmet/zijinguan/update_icon()
	cut_overlays()
	if(get_detail_tag())
		var/mutable_appearance/pic = mutable_appearance(icon(icon, "[icon_state][detail_tag]"))
		pic.appearance_flags = RESET_COLOR
		if(get_detail_color())
			pic.color = get_detail_color()
		add_overlay(pic)

/obj/item/clothing/head/roguetown/helmet/jingasa //the same as a Kettle. Just don't want the 64x64 bits.
	name = "дзингаса"
	desc = "Металлическая гаса конической формы. Носится в основном ашигарусами, защищает от стрел и прямых ударов.\
	стрел и прямых ударов. Наиболее эффективна вместе с подкладкой, так как\
	большое пространство для движения шлема после удара, что облегчает удар."
	icon_state = "jingasa"
	body_parts_covered = HEAD|HAIR|EARS
	flags_inv = HIDEEARS
	icon = 'modular_twilight/icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/head.dmi'
	bloody_icon = 'icons/effects/blood.dmi'
	bloody_icon_state = "helmetblood"
	smeltresult = /obj/item/ingot/steel
	sellprice = 25

/obj/item/clothing/head/roguetown/helmet/sallet/tosei_kabuto
	name = "тосэй кабуто"
	desc = "Изготовлен из нескольких стальных пластин, скрепленных заклепками, расположенных в радиальном направлении,\
	имеет прекрасный баланс и распределение веса, защищая даже от круглых шариков из огнестрельного оружия.\
	Часто используемый самураями, этот шлем не редкость на поле боя."
	icon_state = "tosei_kabuto"
	icon = 'modular_twilight/icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/64x64/head.dmi'
	bloody_icon = 'icons/effects/blood.dmi'
	bloody_icon_state = "helmetblood"
	worn_x_dimension = 64
	worn_y_dimension = 64

/obj/item/clothing/head/roguetown/helmet/sallet/visored/tosei_kabuto
	name = "тосэй кабуто с маской"
	desc = "Изготовлен из нескольких стальных пластин, скрепленных заклепками, расположенных в радиальном порядке.\
	Маска защищает лицо того, кто ее использует, но затрудняет обзор."
	icon_state = "toseikabuto_visor"
	icon = 'modular_twilight/icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/64x64/head.dmi'
	bloody_icon = 'icons/effects/blood.dmi'
	bloody_icon_state = "helmetblood"
	worn_x_dimension = 64
	worn_y_dimension = 64
	flags_inv = HIDEEARS|HIDEFACE
	block2add = FOV_BEHIND
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	body_parts_covered = HEAD|HAIR|NOSE|EARS|EYES

/obj/item/clothing/head/roguetown/helmet/heavy/knight/zunari //knight helmet.
	name = "дзунари кабуто"
	desc = "Этчу дзунари кабуто с передним концом продольной пластины\
	накладывается на брови, над глазами, а не приклепывается под ними\
	чтобы эффективно отражать удары и стрелы, а также защищать от солнца и воды."
	icon_state = "zunari_kabuto"
	icon = 'modular_twilight/icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/head.dmi'
	adjustable = CAN_CADJUST
	emote_environment = 3
	block2add = FOV_RIGHT|FOV_LEFT
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
	armor = list("melee" = 90, "bullet" = 80, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = HEAD|HAIR|NOSE|EARS|EYES

/obj/item/clothing/head/roguetown/zurarikabutonew
	name = "зунари кабуто Изумы"
	desc = "Кабуто этчу дзунари с маркировкой Изумы. У него нет демонической\
	маски для устрашения - но она остается такой же эффективной, к тому же демонстрирует\
	невероятную художественную ценность, которая поддерживает культуру Изумы."
	icon_state = "heartfelt_kabuto"
	body_parts_covered = HEAD|HAIR|EARS //maskless, protects less of the face.
	flags_inv = HIDEEARS
	icon = 'modular_twilight/icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/64x64/head.dmi'
	bloody_icon = 'icons/effects/blood.dmi'
	bloody_icon_state = "helmetblood"
	worn_x_dimension = 64
	worn_y_dimension = 64
	emote_environment = 3
	sellprice = 50
	clothing_flags = CANT_SLEEP_IN
	armor_class = ARMOR_CLASS_MEDIUM
	armor = list("blunt" = 90, "slash" = 100, "stab" = 80, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	max_integrity = 250

/obj/item/clothing/head/roguetown/helmet/leather/malgai
	name = "кожаный малгай"
	desc = "Кожаный шлем абиссариадцев, обычно используемый теми, кто обитает\
	в центре Туманных Островов, где есть большие степи, или обычный охотник."
	icon_state = "malgai"
	icon = 'modular_twilight/icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/head.dmi'

/obj/item/clothing/head/roguetown/helmet/leather/malgai/duulga //same changes of 'leather' to 'hide' has been brought over to this hat + mouth protection, because Mongol hat go brrtt
	name = "арисан дуулга"
	desc = "Шлем из толстой, промасленной кожи, используемый абиссарийцами в центре Туманных Островов."
	icon_state = "arisan_duulga"
	armor = list("melee" = 40, "bullet" = 15, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_BLUNT, BCLASS_TWIST)
	body_parts_covered = HEAD|HAIR|EARS|NOSE|MOUTH
	resistance_flags = FLAMMABLE // Made of leather
	smeltresult = /obj/item/ash
	anvilrepair = null
	max_integrity = 250
	sewrepair = TRUE
	blocksound = SOFTHIT
	sellprice = 25
	icon = 'modular_twilight/icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/head.dmi'

/obj/item/clothing/head/roguetown/helmet/skullcap/rattan
	name = "тэнпай доу"
	icon_state = "rattan_helmet"
	desc = "Дешевый изуминский шлем, сделанный из ободранного, проваренного в масле ротанга и железа.\
	Используется только ополченцами и рейдерами Линьоу. Защищает хуже, но легко ремонтируется."
	flags_inv = HIDEEARS
	armor = list("melee" = 60, "bullet" = 40, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = HEAD|HAIR|EARS
	max_integrity = 125
	sellprice = 20
	icon = 'modular_twilight/icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/64x64/head.dmi'
	bloody_icon = 'icons/effects/blood.dmi'
	bloody_icon_state = "helmetblood"
	worn_x_dimension = 64
	worn_y_dimension = 64
	sewrepair = TRUE

/obj/item/clothing/head/roguetown/helmet/heavy/bronzepot //hopefully asking someone to draw this helmet.
	name = "реликвия Изумы"
	icon_state = "bronzeb"
	desc = "Вечная реликвия избранных из Изумы, используемая для войны."
	smeltresult = /obj/item/ingot/steel //Intentional. The helmet is not actually made of bronze. It is just a lingering apotheosis-age term for that internal-mirror design.
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	icon = 'modular_twilight/icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/64x64/head.dmi'
	bloody_icon = 'icons/effects/blood.dmi'
	bloody_icon_state = "helmetblood"
	worn_x_dimension = 64
	worn_y_dimension = 64
	block2add = null //Can easily see - cannot remove the helmet. This is your new skull.
	adjustable = CAN_CADJUST
	clothing_flags = null

/obj/item/clothing/head/roguetown/helmet/heavy/bronzepot/AdjustClothes(mob/user)
	if(loc == user)
		playsound(user, "sound/items/visor.ogg", 100, TRUE, -1)
		if(adjustable == CAN_CADJUST)
			adjustable = CADJUSTED
			icon_state = "[initial(icon_state)]_raised"
			body_parts_covered = HEAD|HAIR|EARS
			flags_inv = HIDEEARS|HIDEHAIR
			flags_cover = null
			armor = list("blunt" = 90, "slash" = 100, "stab" = 80, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
			prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT) // Vulnerable to eye stabbing while visor is open
			if(ishuman(user))
				var/mob/living/carbon/H = user
				H.update_inv_head()
		else if(adjustable == CADJUSTED)
			ResetAdjust(user)
			prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_SMASH, BCLASS_TWIST)
			body_parts_covered = FULL_HEAD
			flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR
			flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
			if(user)
				if(ishuman(user))
					var/mob/living/carbon/H = user
					H.update_inv_head()
	else // Failsafe.
		to_chat(user, "<span class='warning'>How the hell you removed your external cranium? PUT IT BACK, EIDOLON.</span>")
		return

/obj/item/clothing/head/roguetown/helmet/heavy/bronzepot/Initialize()
	. = ..()
	ADD_TRAIT(src, TRAIT_NODROP, CURSED_ITEM_TRAIT) //It is molten on the user's head.

/obj/item/clothing/head/roguetown/helmet/heavy/bronzepot/obj_break(damage_flag) //If it breaks, qdel.
	. = ..()
	if(QDELETED(src))
		return
	qdel(src)

/obj/item/clothing/head/roguetown/helmet/heavy/bronzepot/dropped(mob/living/carbon/human/user)
	. = ..()
	if(QDELETED(src))
		return
	qdel(src)

/obj/item/clothing/head/roguetown/helmet/leather/malgai/izuma
	name = "изуминская шляпа"
	desc = "Шляпа с тремя сторонами околыша, поднятыми вверх и зашнурованными,\
	образуя треугольник. Обычно используется флотом Туманного Острова или богатыми людьми в Изуме."
	icon_state = "tricorn"

/obj/item/clothing/head/roguetown/sallet/visored/abyssalchampion //hounskull tier.
	name = "Крылатый шлем бездны"
	desc = "Традиционный крылатый шлем античного дизайна с защитной маской.\
	Его основой послужили древние шлемы стражников-мирмидонов из Изумы.\
	Маска может быть поднята внутрь для большего обзора, но при этом остаются открытыми глаза."
	icon_state = "abyssal_champion"
	item_state = "abyssal_champion"
	icon = 'modular_twilight/icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/head.dmi'
	emote_environment = 3
	block2add = FOV_RIGHT|FOV_LEFT
	armor = list("blunt" = 90, "slash" = 100, "stab" = 80, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/head/roguetown/helmet/heavy/bucket/soheidemon
	name = "бронированный колпак сохэй"
	desc = "Ткань, освященная святой водой и сталью. Металлическое усиление в виде маски\
	покрытая желтым шелком, защищает череп."
	icon_state = "soheidemon"
	item_state = "soheidemon"
	icon = 'modular_twilight/icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/64x64/head.dmi'
	bloody_icon = 'icons/effects/blood.dmi'
	bloody_icon_state = "helmetblood"
	worn_x_dimension = 64
	worn_y_dimension = 64

// 'bone-tier' Undine equipments.

/obj/item/clothing/head/roguetown/wizhat/onmyoji
	name = "онмёдзи вархат"
	desc = "Удивительно огромные шапки используют онмёдзи, которые участвуют в войне. Тени от шляпы скрывают глаза у представителей низших каст."
	icon_state = "abyssalhat"
	icon = 'modular_twilight/icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/64x64/head.dmi'
	bloody_icon = 'icons/effects/blood.dmi'
	bloody_icon_state = "helmetblood"
	worn_x_dimension = 64
	worn_y_dimension = 64
	resistance_flags = FLAMMABLE

/obj/item/clothing/head/roguetown/wizhat/onmyoji/random/Initialize()
	. = ..()
	color = pick("#4756d8", "#759259", "#bf6f39", "#c1b144")

/obj/item/clothing/head/roguetown/wizhat/onmyoji/thunder
	name = "thunder onmyoji warhat"
	color = CLOTHING_BLUE

/obj/item/clothing/head/roguetown/wizhat/onmyoji/storm
	name = "storm onmyoji warhat"
	color = CLOTHING_PURPLE

/obj/item/clothing/head/roguetown/wizhat/onmyoji/ocean
	name = "ocean onmyoji warhat"
	color = CLOTHING_DARK_GREEN

/obj/item/clothing/head/roguetown/wizhat/onmyoji/island
	name = "island onmyoji warhat"
	color = CLOTHING_GREEN

/obj/item/clothing/head/roguetown/wizhat/onmyoji/black
	color = CLOTHING_BLACK

/obj/item/clothing/head/roguetown/wizhat/onmyoji/eboshi
	name = "шляпа эбоси"
	desc = "Традиционные головные уборы онмёдзи для тех, кто желает заниматься не военным делом, а естественными науками или ремеслом."
	icon_state = "eboshihat"
	icon = 'modular_twilight/icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/64x64/head.dmi'
	bloody_icon = 'icons/effects/blood.dmi'
	bloody_icon_state = "helmetblood"
	sellprice = 100
	worn_x_dimension = 64
	worn_y_dimension = 64
	resistance_flags = FLAMMABLE

/obj/item/clothing/head/roguetown/wizhat/onmyoji/eboshi/Initialize()
	color = RANDOM_COLOUR
	..()

/obj/item/clothing/head/roguetown/helmet/heavy/myrmidon
	name = "шлем мирмидона"
	desc = "Жрецы-воины, связанные божественной клятвой, посвященные для сражения.\
	Они стали образцом для современных цзыцзиньгуань и крылатых шлемов."
	icon_state = "myrmidon"
	item_state = "myrmidon"
	allowed_sex = list(MALE, FEMALE)
	flags_inv = HIDEEARS
	clothing_flags = CANT_SLEEP_IN
	body_parts_covered = HEAD|HAIR|EARS|MOUTH|NOSE
	icon = 'modular_twilight/icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/64x64/head.dmi'
	bloody_icon = 'icons/effects/blood.dmi'
	bloody_icon_state = "helmetblood"
	worn_x_dimension = 64
	worn_y_dimension = 64
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR

/obj/item/clothing/head/roguetown/helmet/heavy/dragonslayer
	name = "dragonslayer helmet"
	icon_state = "dragonslayer"
	item_state = "dragonslayer"
	desc = "Отличительная черта Драконоборцев, тех, кто рожден, чтобы выдержать пылающий ад. Асбестовые материалы отлично противостоят сильному жару драконьего огня и чародейства."
	heat_protection = HEAD|EARS|HAIR|FACE
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	resistance_flags = FIRE_PROOF | ACID_PROOF
	worn_x_dimension = 64
	worn_y_dimension = 64
	icon = 'modular_twilight/icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/64x64/head.dmi'
	bloody_icon = 'icons/effects/blood.dmi'
	bloody_icon_state = "helmetblood"

/obj/item/clothing/head/roguetown/bardhat/bloodhunter
	name = "изуминская шляпа"
	desc = "Изуминская шляпа, выскобленная острыми инструментами и закаленная в масле,\
	призвана передать статус человека, который не только уничтожает такую дорогую вещь, но и держит ее поднятой, как шипы."
	icon_state = "bloodhunter"
	icon = 'modular_twilight/icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/head.dmi'

/obj/item/clothing/head/roguetown/helmet/leather/malgai/izuma/female
	name = "изуминская шляпа леди"
	desc = "Шляпа, созданная руками жителей Туманных Островов или Изумы для самых прекрасных дам. Или богатых."
	icon_state = "heartfelthandf"
	icon = 'modular_twilight/icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/head.dmi'

//temple helmet
//................ Abyssor Shrinekeeper ............... //
/obj/item/clothing/head/roguetown/helmet/leather/shrinekeeper
	name = "shrinekeeper kabuto"
	desc = "A gift to new Abyssanctum devotees and a badge of their shrinekeeping duties, referencing guardianship of old, this helm is crafted from the enamel of deep-sea leviathans to protect the head of shrinekeepers.."
	icon = 'modular_twilight/icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/head.dmi'
	icon_state = "shrinekeeper_kabuto"
	flags_inv = HIDEEARS | HIDEHAIR | HIDEFACIALHAIR
	armor = list("blunt" = 20, "slash" = 20, "stab" = 20, "bullet" = 20, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	salvage_result = /obj/item/natural/cloth

/obj/item/clothing/head/roguetown/helmet/ceramic
	name = "bone tribal helmet"
	icon_state = "ivory_head"
	desc = "a simple, protective bone helmet made from the creatures of the land."
	slot_flags = ITEM_SLOT_HEAD|ITEM_SLOT_HIP
	body_parts_covered = HEAD|HAIR
	prevent_crits = list(BCLASS_STAB) //This one is too thin to actually protect someone beyond stabbing wounds. Cut would have too much 'blunt'.
	resistance_flags = FIRE_PROOF
	icon_state = "ivory_head"
	armor = list("melee" = 40, "bullet" = 30, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	anvilrepair = null
	smeltresult = /obj/item/ash
	sewrepair = FALSE
	blocksound = SOFTHIT
	sellprice = 10
	max_integrity = 150
	icon = 'modular_twilight/icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/head.dmi'

/obj/item/clothing/head/roguetown/helmet/ceramic/medium
	name = "bone ravanger helmet"
	icon_state = "ravager_head"
	desc = "The helmets commonly used by Undine warriors or common riverdwellers who took upon themselves to protect their heads against goblinoid invasions."
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB) //Bones are not good against blunt.
	body_parts_covered = HEAD|HAIR|EARS
	flags_inv = HIDEEARS
	max_integrity = 200
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	armor = list("melee" = 60, "bullet" = 50, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	icon = 'modular_twilight/icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/64x64/head.dmi'
	bloody_icon = 'icons/effects/blood.dmi'
	bloody_icon_state = "helmetblood"
	worn_x_dimension = 64
	worn_y_dimension = 64

/obj/item/clothing/head/roguetown/helmet/ceramic/reinforced
	name = "marauder trollhunter helmet"
	icon_state = "marauder_head"
	desc = "The full bone helmet that became the symbol of the unison of the Undine tribes and the Abyssariads, taking reference from the Championage's Dragonslayer helmets."
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_STAB) //Bones are not good against blunt.
	body_parts_covered = HEAD|EARS|HAIR|NOSE|EYES|FACE
	flags_inv = HIDEEARS
	max_integrity = 250
	flags_cover = HEADCOVERSEYES | HEADCOVERSMOUTH
	armor = list("melee" = 60, "bullet" = 60, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	block2add = FOV_RIGHT|FOV_LEFT
	bloody_icon_state = null
	icon = 'modular_twilight/icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/64x64/head.dmi'
	bloody_icon = 'icons/effects/blood.dmi'
	bloody_icon_state = "helmetblood"
	worn_x_dimension = 64
	worn_y_dimension = 64
