/obj/item/clothing/head/roguetown/takuhatsugasa
	name = "takuhatsugasa"
	icon_state = "takuhatsugasa"
	desc = "A type of hat worn by monks during their begging rounds - or when punching demons into submission."
	icon = 'modular_twilight/icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/head.dmi'
	flags_inv = HIDEEARS|HIDEHAIR
	armor = list("blunt" = 25, "slash" = 25, "stab" = 15, "bullet" = 10, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	body_parts_covered = HEAD|HAIR|EARS
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	max_integrity = 150

/obj/item/clothing/head/roguetown/tengai
	name = "tengai"
	icon_state = "tengai"
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	desc = "A wide-brimmed hat traditionally worn by wandering monks of the Abyssanctum fold."
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
	name = "yamabushi tengai"
	icon_state = "stengai"
	desc = "A tengai painted in black tar traditionally worn by Abyssanctum yamabushis."
	bloody_icon_state = "helmetblood"

/obj/item/clothing/head/roguetown/tengai/gasa
	name = "gasa"
	icon_state = "gasa"
	desc = "A conical straw hat used to protect from the sun and rain. Commonly used by commoners, or casually by the Zamurais and their retainers."
	flags_inv = HIDEEARS

/obj/item/clothing/head/roguetown/lilly
	name = "small lilypad gasa"
	icon_state = "lilypad_small"
	desc = "a small lilypad used by Undines to protect from sun and rain. This comes as a intercultural exchange mimicking Abyssariad's gasas."
	icon = 'modular_twilight/icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/head.dmi'

/obj/item/clothing/head/roguetown/lilly/medium
	name = "medium lilypad gasa"
	icon_state = "lilypad_medium"
	desc = "a medium lilypad used by Undines to protect from sun and rain. This comes as a intercultural exchange mimicking Abyssariad's gasas."

/obj/item/clothing/head/roguetown/lilly/big
	name = "big lilypad gasa"
	icon_state = "lilypad_big"
	desc = "a big lilypad used by Undines to protect from sun and rain. This comes as a intercultural exchange mimicking Abyssariad's gasas."

/obj/item/clothing/head/roguetown/tengai/roningasa
	name = "roningasa"
	icon_state = "roningasa"
	flags_inv = HIDEEARS|HIDEFACE
	desc = "A hat typically worn by the masterless zamurais - the ronins."
	bloody_icon_state = null

/obj/item/clothing/head/roguetown/tengai/torioigasa
	name = "torioigasa"
	icon_state = "torioigasa"
	desc = "A traditional Abyssariad hat designed for long travels on the murklands. Most used by commoners."
	bloody_icon_state = null

/obj/item/clothing/head/roguetown/tengai/sandogasa
	name = "sandogasa"
	icon_state = "sandogasa"
	flags_inv = HIDEEARS
	desc = "A large hat providing ample shade and protection from the elements, including rain."
	bloody_icon_state = null

/obj/item/clothing/head/roguetown/tengai/sandogasa/yamabushi
	name = "yamabushi sandogasa"
	icon_state = "ssandogasa"
	desc = "A sandogasa painted in black tar traditionally worn by Abyssanctum yamabushis."
	bloody_icon_state = null

/obj/item/clothing/head/roguetown/soheicloth
	name = "sohei coverings"
	desc = "Blessed fabric bathed in holy water, keeping a sohei protected from corruptive gases - and providing anonymity. Their symbol of devotion that manifests their humbleness."
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
	name = "shinobi hood"
	icon_state = "shinobi_zukin"
	flags_inv = HIDEEARS|HIDEFACE|HIDEHAIR|HIDEFACIALHAIR
	desc = "A hood worn by members of Shinobi clans to conceal their identity and blend into the shadows. Unsuitable for espionage for being too obvious."
	icon = 'modular_twilight/icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/head.dmi'

/obj/item/clothing/head/roguetown/helmet/skullcap/hachigane
	name = "hachi-gane"
	desc = "Simple, lamellar head protection made for humble monks, ronins and the poor - with the material often gathered from iron panning."
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
	name = "zijinguan" //This is actually a ming dynasty helmet
	desc = "A cheaper version of the Myrmidon helmet that dates back to the age of guardianship,\
	yet still remains efficient. This helmet has became the symbol of abyssariad military culture\
	of the commoner class alongside the jingasa."
	icon_state = "zijinguan"
	flags_inv = HIDEEARS|HIDEHAIR
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
	name = "jingasa"
	desc = "A metal gasa in conical shape. Mainly worn by Ashigarus, it protects against\
	arrows and direct blow. Most efficient together with padding underneath due to the\
	large space for the helmet to move after hit, easing impact."
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
	name = "tosei kabuto"
	desc = "Made from multiple steel plates riveted together, arranged in a radial pattern,\
	having great balance and weight distribution - protecting even against round balls from firearms.\
	Often used by the Zamurai class, this helmet is no rare find on a battlefield."
	icon_state = "tosei_kabuto"
	icon = 'modular_twilight/icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/64x64/head.dmi'
	bloody_icon = 'icons/effects/blood.dmi'
	bloody_icon_state = "helmetblood"
	worn_x_dimension = 64
	worn_y_dimension = 64

/obj/item/clothing/head/roguetown/helmet/sallet/visored/tosei_kabuto
	name = "masked tosei kabuto"
	desc = "Made from multiple steel plates riveted together, arranged in a radial pattern.\
	This one has a mask to protect the face of whoever uses it, albeit it does make sight difficult."
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
	name = "zunari kabuto"
	desc = "An Etchu Zunari Kabuto with the front end of its longitudinal plate\
	overlapping the brows, over the eyes, rather than being riveted beneath it\
	to efficiently reflect blows and arrows - and protect against the sun and sweat."
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
	name = "izuma's zunari kabuto"
	desc = "An Etchu Zunari kabuto with Heartfelt markings. It lacks a demonic\
	mask for intimidation purposes - yet remains just as effective, besides showing\
	the incredible artistic value that upholds Heartfelt's culture."
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
	armor_class = ARMOR_CLASS_HEAVY
	armor = list("blunt" = 90, "slash" = 100, "stab" = 80, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)
	max_integrity = 250

/obj/item/clothing/head/roguetown/helmet/leather/malgai
	name = "leather malgai"
	desc = "A abyssariad leather helmet usually used by those who dwells\
	on the center of Fog islands, where great steppes exists, or your common hunter."
	icon_state = "malgai"
	icon = 'modular_twilight/icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/head.dmi'

/obj/item/clothing/head/roguetown/helmet/leather/malgai/duulga //same changes of 'leather' to 'hide' has been brought over to this hat + mouth protection, because Mongol hat go brrtt
	name = "arisan duulga"
	desc = "The thick, oil-boiled layered leather helmet used by Abyssariads Dustriders\
	from the arid, steppelands on the heart of the Fog Islands."
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
	name = "tengpai dou"
	icon_state = "rattan_helmet"
	desc = "A cheap abyssariad helmet made from stripped, oil boiled rattan and iron.\
	Used only by militia and the humble LinYou raiders. Less protective, but can be easily repaired."
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
	name = "relic of urn"
	icon_state = "bronzeb"
	desc = "The eternal relic of the Champions of the Urn, used by Eidolon Skylancers,\
	the Demonslayers of the Abyssal order. It cannot be removed, forever one with the user\
	- molten and grafted into skin, but the infused arcane bends light upon itself for clear sight."
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
	name = "izuma's hat"
	desc = "A distinguished hat with three sides of the brim turned up and laced,\
	forming a triangle. Usually used by the Fog Island's privateer navy - or rich fellows on Heartfelt."
	icon_state = "tricorn"

/obj/item/clothing/head/roguetown/sallet/visored/abyssalchampion //hounskull tier.
	name = "winged abyssal helmet"
	desc = "The traditional winged helmet of ancient design with a protective mask covering it.\
	It has foundations on the ancient myrmidon guardian helmets.\
	The mask can be lifted internally for higher visibility, but it leaves the eyes exposed."
	icon_state = "abyssal_champion"
	item_state = "abyssal_champion"
	icon = 'modular_twilight/icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/head.dmi'
	emote_environment = 3
	block2add = FOV_RIGHT|FOV_LEFT
	armor = list("blunt" = 90, "slash" = 100, "stab" = 80, "bullet" = 100, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)

/obj/item/clothing/head/roguetown/helmet/heavy/bucket/soheidemon
	name = "armored sohei cowl"
	desc = "A fabric blessed both in holy water and steel. A mask-like metal reinforcement\
	covered with yellow silk protects the skull of these Sohei warriors."
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
	name = "onmyoji warhat"
	desc = "Surprisingly huge hats used by Onmyojis whom take part of the abyssal championage in warfare. The hat shadows hides the eyes from the lower castes."
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
	name = "eboshi hat"
	desc = "traditional Onmyoji hats for those who desires to practice natural sciences and divinations rather than warfare."
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
	name = "myrmidon helmet"
	desc = "The warrior-priests bound to divine oath, consecrated to fight in the abyss as\
	extensions of the Heavenly Emperor. It became reference for the current day zijinguan and winged helmets."
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
	desc = "The hallmark of the Dragonslayers, those born to endure the blazing infernos from\
	the sons of magma. The asbestos materials excels in resisting the intense heat of dragonfire and wizardry."
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
	name = "scrapped hat"
	desc = "A heartfeltean hat that has been scrapped with sharp tools and hardened in oil,\
	meant to convey one's status to not only destroy such expensive piece - but to keep it raised like thorns."
	icon_state = "bloodhunter"
	icon = 'modular_twilight/icons/roguetown/clothing/head.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/head.dmi'

/obj/item/clothing/head/roguetown/helmet/leather/malgai/izuma/female
	name = "lady hat"
	desc = "A hat produced by abyssariad and heartfeltean hands for the most beautiful of ladies. Or rich, that is."
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
