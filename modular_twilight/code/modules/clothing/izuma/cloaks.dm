/obj/item/clothing/cloak/raincloak/mino
	name = "mino cloak"
	desc = "An abyssariad raincoat made out of straw that covers the entire body."
	icon_state = "mino"
	inhand_mod = FALSE
	hoodtype = null
	icon = 'modular_twilight/icons/roguetown/clothing/cloak.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/cloak.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/cloak.dmi'
	sleevetype = "shirt"
	body_parts_covered = CHEST|GROIN|VITALS|ARMS

/obj/item/clothing/cloak/raincloak/guardiancloak
	name = "guardian cloak"
	desc = "The design of cloaks from Guardians of old. The symbol of the Eternity Eagle remains binding the cloth on the user, for those who protects the skies and oceans."
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
	name = "horo cloak"
	desc = "A billowing cloak of war designed to catch the wind and scatter arrows that hit its user from the back."
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
	name = "senior sohei odoshi"
	desc = "Tightly packed lacing patterns usually used for binding leather and metal scales, now used to show affiliation to clans or shrines."
	icon_state = "odoshisohei"
	icon = 'modular_twilight/icons/roguetown/clothing/cloak.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/cloak.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/cloak.dmi'
	body_parts_covered = CHEST|GROIN|VITALS|ARMS
	slot_flags = ITEM_SLOT_CLOAK
	nodismemsleeves = TRUE
	flags_inv = HIDECROTCH|HIDEBOOB

/obj/item/clothing/cloak/newheartfelt
	name = "heartfelt cloak"
	desc = "Luxurious silk cloak adorned in regal red, the protective garment that has long portrayed the fiery spirit of the Heartfelt people, and their dutiful lords."
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
	name = "haramaki"
	desc = "Tightly packed lacing patterns usually used for binding leather and metal scales."
	icon_state = "haramaki"
	item_state = "haramaki"
	icon = 'modular_twilight/icons/roguetown/clothing/cloak.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/cloak.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/cloak.dmi'

/obj/item/clothing/cloak/stabard/haramaki/odoshi
	name = "odoshi"
	icon_state = "odoshi"
	item_state = "odoshi"

/obj/item/clothing/cloak/stabard/haramaki/jinbaori
	name = "jinbaori"
	desc = "Cloth piece meant to portray the user's loyalty to an lord."
	icon_state = "jinbaori"
	item_state = "jinbaori"

/obj/item/clothing/cloak/stabard/haramaki/jinbaori/jizamurai
	desc = "The odoshi used by Foglander Zamurais bond to Rockhill's lords. It uses said lord's heraldic colors."
	color = CLOTHING_BLACK
	detail_tag = "_spl"
	detail_color = CLOTHING_RED

/obj/item/clothing/cloak/stabard/haramaki/jinbaori/guard
	desc = "A jinbaori with the lord's heraldic colors. This one is worn typically by ashigarus retainers adquired by the lords of rockhill from a pact with the Fog Islands."
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
	name = "raider jinbaori"
	desc = "A jinbaori used by the traditional abyssanctum ashigaru retainers. Relentless as the ocean who brew them."
	color = CLOTHING_BLACK
	detail_tag = "_spl"
	detail_color = CLOTHING_PURPLE

/obj/item/clothing/cloak/stabard/haramaki/odoshi/zamurai
	desc = "The odoshi used by Foglander Zamurais bond to Rockhill's lords. It uses said lord's heraldic colors."
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
	name = "raider odoshi"
	desc = "A odoshi used by the traditional abyssanctum zamurai retainers. Relentless as the ocean who brew them."
	color = CLOTHING_BLACK
	detail_tag = "_spl"
	detail_color = CLOTHING_PURPLE

/obj/item/clothing/cloak/raincloak/dragonslayer
	name = "dragonslayer guardian cloak"
	desc = "Fireproof asbestos cloak processed in copal and frankincense resin, enclosed within dragonscales to prevent direct contact with asbestos fibers. \
	The cloak almost completely prevents warmth from reaching the user."
	heat_protection = FULL_BODY
	body_parts_covered = FULL_BODY
	resistance_flags = FIRE_PROOF | LAVA_PROOF
	color = "#7e0707"
