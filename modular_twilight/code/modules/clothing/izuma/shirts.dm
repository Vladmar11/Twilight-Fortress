/obj/item/clothing/suit/roguetown/shirt/tunic/kimono
	name = "traditional kimono"
	desc = "A front-wrapped garment with long sleeves made from a long, narrow bolt of cloth used as a formal garment by the poor and rich alike."
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
	name = "monk samue"
	desc = "The Samue is the clothing used by Abyssanctum monks engaged on the act of Samu, most proper for those performing temple maintenance and mountain hiking."
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
	name = "kataginu"
	desc = "A formal kimono used by men, a short sleeveless garment made of hemp which usually comes together with a hakama, and worn on top of a kosode or kimono. To use one without cloth underneath, conveys a ronin nature."
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
	name = "kimono jinbei"
	desc = "A summer shirt that goes along with a tobi, used during the hot summers on Fog islands."
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

/obj/item/clothing/suit/roguetown/shirt/looseshirt/Initialize()
	color = RANDOM_COLOUR
	..()

/obj/item/clothing/suit/roguetown/shirt/looseshirt/shinobi
	color = CLOTHING_BLACK

/obj/item/clothing/suit/roguetown/shirt/looseshirt/dragonslayer
	resistance_flags = FIRE_PROOF | ACID_PROOF

/obj/item/clothing/suit/roguetown/shirt/rags/tribal
	name = "tribal garbs"
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
	name = "onmyoji's warfare garb"
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

/obj/item/clothing/suit/roguetown/shirt/kaizoku/robe
	slot_flags = ITEM_SLOT_ARMOR
	name = "onmyoji's garb"
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

/obj/item/clothing/suit/roguetown/shirt/kaizoku/robe/Initialize()
	color = RANDOM_COLOUR
	..()

/obj/item/clothing/suit/roguetown/shirt/robe/shrinekeeper
	name = "shrinekeeper robe"
	desc = "Silk-woven and shimmering like tides at dusk, for those who honors the will of the abyss."
	icon_state = "shrinekeeper"
	r_sleeve_status = SLEEVE_NORMAL
	l_sleeve_status = SLEEVE_NORMAL
	icon = 'modular_twilight/icons/roguetown/clothing/shirts.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/shirts.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_shirts.dmi'
	sleevetype = "shirt"
