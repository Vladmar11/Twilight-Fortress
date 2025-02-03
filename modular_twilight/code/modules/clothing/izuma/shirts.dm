/obj/item/clothing/suit/roguetown/shirt/tunic/kimono
	name = "традиционное кимоно"
	desc = "Одежда с длинными рукавами, сшитая из длинного узкого куска ткани, использовавшаяся в качестве официального одеяния как бедными, так и богатыми."
	icon = 'modular_twilight/icons/roguetown/clothing/shirts.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/shirts.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_shirts.dmi'
	icon_state = "kimono"
	item_state = "kimono"
	slot_flags = ITEM_SLOT_SHIRT|ITEM_SLOT_ARMOR
	boobed = TRUE
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL

/obj/item/clothing/suit/roguetown/shirt/tunic/kimono/random/Initialize()
	color = RANDOM_COLOUR
	..()

/obj/item/clothing/suit/roguetown/shirt/tunic/kimono/ronin
	color = CLOTHING_DARK_GREEN

/obj/item/clothing/suit/roguetown/shirt/tunic/kimono/dark
	color = CLOTHING_BLACK

/obj/item/clothing/suit/roguetown/shirt/tunic/kimono/kabukimono
	color = CLOTHING_BLUE

/obj/item/clothing/suit/roguetown/shirt/rags/monkgarb
	name = "одеяние самуэ"
	desc = "Самуэ - это одежда, используемая монахами Изумы, которые занимаются Саму, в основном для тех, кто занимается обслуживанием храмов и ходит в походы в горы."
	slot_flags = ITEM_SLOT_SHIRT|ITEM_SLOT_ARMOR
	icon = 'modular_twilight/icons/roguetown/clothing/shirts.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/shirts.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_shirts.dmi'
	icon_state = "monkgarb"
	item_state = "monkgarb"
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	body_parts_covered = CHEST|ARMS|VITALS

/obj/item/clothing/suit/roguetown/shirt/rags/monkgarb/random/Initialize()
	color = RANDOM_COLOUR
	..()

/obj/item/clothing/suit/roguetown/shirt/tunic/kamishimo //I know this is actually a Kataginu, but it is know more as 'Kamishimo', even if lacking a Hakama. Because HAKAMA is its own thing here.
	name = "катагиину"
	desc = "Официальное кимоно, используемое мужчинами, - короткая одежда без рукавов из конопли, которая обычно сочетается с хакама и надевается поверх косодэ или кимоно. \
	Использование такого одеяния без ткани под ним выдает характер ронина."
	icon = 'modular_twilight/icons/roguetown/clothing/shirts.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/shirts.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_shirts.dmi'
	slot_flags = ITEM_SLOT_SHIRT|ITEM_SLOT_ARMOR|ITEM_SLOT_CLOAK
	icon_state = "kamishimo"
	item_state = "kamishimo"
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	body_parts_covered = CHEST|VITALS

/obj/item/clothing/suit/roguetown/shirt/tunic/kamishimo/random/Initialize()
	color = RANDOM_COLOUR
	..()

/obj/item/clothing/suit/roguetown/shirt/tunic/kamishimo/ronin
	color = CLOTHING_BLACK

/obj/item/clothing/suit/roguetown/shirt/tunic/kamishimo/eidolon
	color = CLOTHING_TEAL

/obj/item/clothing/suit/roguetown/shirt/looseshirt
	name = "кимоно дзинбэй"
	desc = "Летняя рубашка, которая сочетается с тоби, используется жарким летом."
	slot_flags = ITEM_SLOT_SHIRT|ITEM_SLOT_ARMOR
	icon = 'modular_twilight/icons/roguetown/clothing/shirts.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/shirts.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_shirts.dmi'
	icon_state = "looseshirt"
	item_state = "looseshirt"
	boobed = TRUE
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	body_parts_covered = CHEST|ARMS|VITALS
	color = "#6a6896"

/obj/item/clothing/suit/roguetown/shirt/looseshirt/shinobi
	color = "#6a6896"

/obj/item/clothing/suit/roguetown/shirt/looseshirt/dragonslayer
	resistance_flags = FIRE_PROOF | ACID_PROOF

/obj/item/clothing/suit/roguetown/shirt/rags/tribal
	name = "племенные лохмотья"
	desc = "Tribal clothings made from plant fiber commonly used by Undine tribesmen."
	icon = 'modular_twilight/icons/roguetown/clothing/shirts.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/shirts.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_shirts.dmi'
	slot_flags = ITEM_SLOT_SHIRT|ITEM_SLOT_ARMOR
	icon_state = "tribalgarb"
	item_state = "tribalgarb"
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	body_parts_covered = CHEST|VITALS

/obj/item/clothing/suit/roguetown/shirt/robe/wizard/guardian
	name = "военное одеяние онмёдзи"
	desc = "The garbs used by Abyssariad magicians during times of warfare, holding the marks of Abyssor upon the cloth."
	icon_state = "abyssaltunic"
	icon = 'modular_twilight/icons/roguetown/clothing/shirts.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/shirts.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_shirts.dmi'
	boobed = TRUE
	flags_inv = HIDEBOOB
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	allowed_sex = list(MALE, FEMALE)
	color = null
	sellprice = 100

/obj/item/clothing/suit/roguetown/shirt/robe/wizard/guardian/black
	color = CLOTHING_BLACK

/obj/item/clothing/suit/roguetown/shirt/robe/wizard/guardian/random/Initialize()
	color = RANDOM_COLOUR
	..()

/obj/item/clothing/suit/roguetown/shirt/robe/wizard/guardian/thunder
	name = "thunder onmyoji's warfare garb"
	desc = "The garbs used by Abyssariad magicians during times of warfare. Marked in yellow for the mountainous magicians and monks who praises Abyssor's thunders."
	color = CLOTHING_BLUE

/obj/item/clothing/suit/roguetown/shirt/robe/wizard/guardian/storm
	name = "storm onmyoji's warfare garb"
	desc = "The garbs used by Abyssariad magicians during times of warfare. Marked in dark blue for the lighthouse keepers of Abyssanctum's faith, who keeps the eternal fire going."
	color = CLOTHING_PURPLE

/obj/item/clothing/suit/roguetown/shirt/robe/wizard/guardian/ocean
	name = "ocean onmyoji's warfare garb"
	desc = "The garbs used by Abyssariad magicians during times of warfare.  Marked in light blue for the expeditionary magicians and monks of Abyssanctum's faith, long married to the ocean."
	color = CLOTHING_MAJENTA

/obj/item/clothing/suit/roguetown/shirt/robe/wizard/guardian/island
	name = "island onmyoji's warfare garb"
	desc = "The garbs used by Abyssariad magicians during times of warfare. Marked in red for the soilgazers of Abyssanctum's faith, those bent in ensuring no plague shall reach their blessed islands. "
	color = CLOTHING_DARK_GREEN

/obj/item/clothing/suit/roguetown/shirt/izuma/robe
	slot_flags = ITEM_SLOT_ARMOR
	name = "лохмотья онмёдзи"
	desc = "Casual abyssariad garbs usually used by magicians, or those living on the frigid, treacherous mountains on the edges of the Fog islands."
	icon_state = "loosetunic"
	icon = 'modular_twilight/icons/roguetown/clothing/shirts.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/shirts.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_shirts.dmi'
	boobed = TRUE
	flags_inv = HIDEBOOB
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	allowed_sex = list(MALE)
	color = null

/obj/item/clothing/suit/roguetown/shirt/izuma/robe/Initialize()
	color = RANDOM_COLOUR
	..()

/obj/item/clothing/suit/roguetown/shirt/robe/shrinekeeper
	name = "роба хранителя святынь"
	desc = "Шелковые и переливающиеся, как приливы в сумерках, для тех, кто чтит волю бездны."
	icon_state = "shrinekeeper"
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	icon = 'modular_twilight/icons/roguetown/clothing/shirts.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/shirts.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_shirts.dmi'
	sleevetype = "shirt"
