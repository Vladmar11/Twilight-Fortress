/obj/item/clothing/cloak/raincloak/mino
	name = "плащ мино"
	desc = "Изуминский плащ из соломы, закрывающий все тело."
	icon_state = "mino"
	inhand_mod = FALSE
	hoodtype = null
	icon = 'modular_twilight/icons/roguetown/clothing/cloak.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/cloak.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/cloak.dmi'
	sleevetype = "shirt"
	body_parts_covered = CHEST|GROIN|VITALS|ARMS

/obj/item/clothing/cloak/raincloak/guardiancloak
	name = "плащ хранителя"
	desc = "Дизайн плащей от Хранителей древности. Символ Орла Вечности по-прежнему связывает ткань с пользователем, для тех, кто защищает небеса и океаны."
	icon_state = "guardiancloak"
	inhand_mod = FALSE
	hoodtype = null
	icon = 'modular_twilight/icons/roguetown/clothing/cloak.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/cloak.dmi'
	body_parts_covered = CHEST|GROIN|VITALS|ARMS
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/cloak.dmi'

/obj/item/clothing/cloak/raincloak/guardiancloak/black
	color = CLOTHING_BLACK

/obj/item/clothing/cloak/raincloak/guardiancloak/random/Initialize()
	color = RANDOM_COLOUR
	..()

/obj/item/clothing/cloak/raincloak/guardiancloak/red
	color = CLOTHING_RED

/obj/item/clothing/cloak/raincloak/guardiancloak/guard
	color = CLOTHING_RED

/obj/item/clothing/cloak/raincloak/guardiancloak/guard/Initialize()
	. = ..()
	if(GLOB.lordprimary)
		lordcolor(GLOB.lordprimary,GLOB.lordsecondary)
	else
		GLOB.lordcolor += src

/obj/item/clothing/cloak/raincloak/guardiancloak/lordcolor(primary,secondary)
	color = secondary
	update_icon()
	if(ismob(loc))
		var/mob/L = loc
		L.update_inv_cloak()

/obj/item/clothing/cloak/raincloak/guardiancloak/Destroy()
	GLOB.lordcolor -= src
	return ..()

/obj/item/clothing/cloak/raincloak/horocloak
	name = "плащ хоро"
	desc = "Военный плащ, способный ловить попутный ветер и разбрасывать стрелы, попавшие в него со спины."
	icon_state = "horocloak"
	inhand_mod = FALSE
	hoodtype = null
	icon = 'modular_twilight/icons/roguetown/clothing/cloak.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/cloak.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/cloak.dmi'
	body_parts_covered = CHEST|GROIN|VITALS|ARMS

/obj/item/clothing/cloak/raincloak/horocloak/random/Initialize()
	color = pick("#a32121", "#8747b1", "#3d3a36", "#414143", "#685542", "#428138", "#264d26", "#537bc6", "#b5b004", "#249589", "#ffffff", "#bd6606", "#962e5c")
	..()

/obj/item/clothing/cloak/raincloak/horocloak/toweryakko
	color = "#804d97"

/obj/item/clothing/cloak/raincloak/horocloak/kabukimono
	color = "#9b874f"

/obj/item/clothing/cloak/odoshisohei
	name = "старший сохэй одоси"
	desc = "Туго набитые шнурки, обычно используемые для скрепления кожаных и металлических чешуек, теперь используются для демонстрации принадлежности к кланам или святыням."
	icon_state = "odoshisohei"
	icon = 'modular_twilight/icons/roguetown/clothing/cloak.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/cloak.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/cloak.dmi'
	body_parts_covered = CHEST|GROIN|VITALS|ARMS
	slot_flags = ITEM_SLOT_CLOAK
	nodismemsleeves = TRUE
	flags_inv = HIDECROTCH|HIDEBOOB

/obj/item/clothing/cloak/newheartfelt
	name = "изуминский плащ"
	desc = "Роскошный шелковый плащ, украшенный царственным красным цветом, защитное одеяние, которое издавна олицетворяет дух народа Изумы и их лордов."
	icon_state = "heartfelt_cloak"
	body_parts_covered = CHEST|GROIN|VITALS|ARMS
	icon = 'modular_twilight/icons/roguetown/clothing/cloak.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/cloak.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/cloak.dmi'
	sleevetype = "shirt"
	slot_flags = ITEM_SLOT_CLOAK
	allowed_sex = list(MALE, FEMALE)
	sellprice = 50
	nodismemsleeves = TRUE
	flags_inv = HIDEBOOB

//modular tabards. Requires bugfixing.

/obj/item/clothing/cloak/stabard/haramaki
	name = "харамаки"
	desc = "Плотно прилегающие друг к другу шнурки, обычно используемые для скрепления кожаных и металлических чешуек."
	icon_state = "haramaki"
	item_state = "haramaki"
	icon = 'modular_twilight/icons/roguetown/clothing/cloak.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/cloak.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/cloak.dmi'

/obj/item/clothing/cloak/stabard/haramaki/odoshi
	name = "одоси"
	icon_state = "odoshi"
	item_state = "odoshi"

/obj/item/clothing/cloak/stabard/haramaki/jinbaori
	name = "чинбаори"
	desc = "Cloth piece meant to portray the user's loyalty to an lord."
	icon_state = "jinbaori"
	item_state = "jinbaori"

/obj/item/clothing/cloak/stabard/haramaki/jinbaori/jizamurai
	desc = "Одоси, используемые самураями, связаны с лордами Рокхилла. В нем используются геральдические цвета лордов."
	color = CLOTHING_BLACK
	detail_tag = "_spl"
	detail_color = CLOTHING_RED

/obj/item/clothing/cloak/stabard/haramaki/jinbaori/guard
	desc = "Чинбаори с геральдическими цветами лорда. Такой обычно носят асигарусы, приобретенные лордами Рокхилла по договору с Туманными Островами."
	color = CLOTHING_RED
	detail_tag = "_spl"
	detail_color = CLOTHING_PURPLE

/obj/item/clothing/cloak/stabard/haramaki/jinbaori/guard/Initialize()
	. = ..()
	if(GLOB.lordprimary)
		lordcolor(GLOB.lordprimary,GLOB.lordsecondary)
	else
		GLOB.lordcolor += src

/obj/item/clothing/cloak/stabard/haramaki/jinbaori/guard/lordcolor(primary,secondary)
	color = primary
	detail_color = secondary
	update_icon()
	if(ismob(loc))
		var/mob/L = loc
		L.update_inv_cloak()

/obj/item/clothing/cloak/stabard/haramaki/jinbaori/guard/Destroy()
	GLOB.lordcolor -= src
	return ..()

/obj/item/clothing/cloak/stabard/haramaki/jinbaori/raider
	name = "рейдерский чинбаори"
	desc = "Чинбаори, используемый традиционными асигару - хранителями Абиссора. Неумолимы, как океан, который их уносит вдаль."
	color = CLOTHING_BLACK
	detail_tag = "_spl"
	detail_color = CLOTHING_PURPLE

/obj/item/clothing/cloak/stabard/haramaki/odoshi/zamurai
	desc = "Одоси, используемые самурями, связаны с лордами Рокхилла. В нем используются геральдические цвета лордов."
	color = CLOTHING_RED
	detail_tag = "_spl"
	detail_color = CLOTHING_PURPLE

/obj/item/clothing/cloak/stabard/haramaki/odoshi/zamurai/attack_right(mob/user)
	return

/obj/item/clothing/cloak/stabard/haramaki/odoshi/zamurai/Initialize()
	. = ..()
	if(GLOB.lordprimary)
		lordcolor(GLOB.lordprimary,GLOB.lordsecondary)
	else
		GLOB.lordcolor += src

/obj/item/clothing/cloak/stabard/haramaki/odoshi/zamurai/Destroy()
	GLOB.lordcolor -= src
	return ..()

/obj/item/clothing/cloak/stabard/haramaki/odoshi/toweryakko
	color = "#804d97"

/obj/item/clothing/cloak/stabard/haramaki/odoshi/toweryakko/attack_right(mob/user)
	return

/obj/item/clothing/cloak/stabard/haramaki/odoshi/raider
	name = "рейдерский одоси"
	desc = "Одоси, используемый традиционными самураями. Неумолимы, как океан, который их уносит вдаль."
	color = CLOTHING_BLACK
	detail_tag = "_spl"
	detail_color = CLOTHING_PURPLE

/obj/item/clothing/cloak/raincloak/dragonslayer
	name = "плащ драконоборца-хранителя"
	desc = "Огнеупорный асбестовый плащ, обработанный копаловой и ладанной смолой, заключенный в драконью чешую, чтобы предотвратить прямой контакт с асбестовыми волокнами. \
	Плащ почти полностью предотвращает от горения."
	heat_protection = FULL_BODY
	body_parts_covered = FULL_BODY
	resistance_flags = FIRE_PROOF | LAVA_PROOF
	color = "#7e0707"
