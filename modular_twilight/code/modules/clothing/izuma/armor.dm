/obj/item/clothing/suit/roguetown/armor/leather/vest/muneate //exists only for the drip.
	name = "muneate"
	desc = "A simple leather chest protector for casual archers. Barely protective- almost useless."
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
	name = "nanban-dou-sode"
	desc = "Abyssariad steel cuirass, refined and with additional sode for protection. Rare and prized by High-ranking zamurais, this design has been acquired from raided humen settlements."
	icon = 'modular_twilight/icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	icon_state = "nanbando"
	item_state = "nanbando"

/obj/item/clothing/suit/roguetown/armor/plate/half/nanbando
	name = "nanban-dou"
	desc = "The Abyssariad steel cuirass that only protects the chest. Relatively common among the ones from the lower Zamurai caste."
	icon = 'modular_twilight/icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	icon_state = "nanbandoc"
	item_state = "nanbandoc"

/obj/item/clothing/suit/roguetown/armor/plate/full/nanbando
	name = "nanban-do-gusoku"
	desc = "A complete set of abyssariad steel armor, refined and with additional auxiliary parts for protection."
	icon = 'modular_twilight/icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	icon_state = "nanbandofull"

/obj/item/clothing/suit/roguetown/armor/chainmail/tatami
	name = "lamellae-tatami do"
	desc = "a foldable, lightweight armor for convenient motion and manufacturing ease.\
	It is made of rectangular steel lamellae sewn into chainmail and is a massforged armor.\
	Considered the backbone of abyssariad military armor, often used below mirror-armor and o-yoroi."
	icon = 'modular_twilight/icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	icon_state = "laminartatami"

/obj/item/clothing/suit/roguetown/armor/chainmail/iron/tatami
	name = "tatami karuta-gane"
	desc = "a foldable, lightweight armor for convenient motion and manufacturing ease.\
	It is made of lacquered, card-like iron squares sewn into a padded cloth or leather backing."
	icon = 'modular_twilight/icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	icon_state = "tatami"

/obj/item/clothing/suit/roguetown/armor/chainmail/hauberk/kusari
	name = "kusari katabira"
	desc = "Or simply 'single-layer chainmail robe', this armor is made of riveted steel rings \
	patched together with slim plates protecting elbows. The armor reaches down to the legs and arms."
	icon = 'modular_twilight/icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	icon_state = "kusari"
	item_state = "kusari"

/obj/item/clothing/suit/roguetown/armor/plate/mirror/iron
	name = "iron mirror armor"
	desc = "Polished iron plates defines the frame of this armor with a metal disk at its center. This is the armor design used by the Islander army together with a kusari katabira."
	icon = 'modular_twilight/icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	icon_state = "imirrorarmor"
	max_integrity = 200
	armor = list("melee" = 80, "bullet" = 60, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	smeltresult = /obj/item/ingot/iron
	armor_class = ARMOR_CLASS_MEDIUM

/obj/item/clothing/suit/roguetown/armor/plate/mirror
	name = "steel mirror armor"
	icon_state = "mirrorarmor"
	desc = "Polished steel plates defines the frame of this armor with a metal disk at its center. This is the armor design used by the Islander army together with a kusari katabira."
	icon = 'modular_twilight/icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	icon_state = "mirrorarmor"

/obj/item/clothing/suit/roguetown/armor/brigandine/oyoroi //I did everything I could to fix this shit. I couldn't. So the entire 'colourscheme overlay' ordeal went to hell.
	name = "o-yoroi"
	desc = "Heavy-duty lamellar armor esteemed high-ranking zamurais on horseback or on land."
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
	name = "o-yoroi gusoku"
	desc = "Heavy-duty, complete set of lamellar armor esteemed by high-ranking zamurais on horseback or on land."
	icon_state = "oyoroi"
	body_parts_covered = CHEST|GROIN|VITALS|LEGS|ARMS

/obj/item/clothing/suit/roguetown/armor/plate/half/iron/sanmaido
	name = "san mai-do"
	desc = "A cheap cuirass with three main plates riveted together with cloth. Flexible and dynamic, integral for many poor footsoldiers"
	icon = 'modular_twilight/icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	icon_state = "sanmaido"

/obj/item/clothing/suit/roguetown/armor/leather/abyssal
	name = "leather lamellar armor"
	desc = "Also know as 'Tiejia', this islander leather armor features small rectangular leather plates laced together to cover vital organs."
	icon = 'modular_twilight/icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	icon_state = "tiejia"

/obj/item/clothing/suit/roguetown/armor/leather/hide/dustwalker
	name = "leather cavalry armor"
	desc = "The Khatag Teghelgah designed to be used by abyssariad light cavalry and horse archers on the heart of Fog Island."
	icon = 'modular_twilight/icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	icon_state = "arisan_khuyag"

/obj/item/clothing/suit/roguetown/armor/leather/splint/kikko //This one is more realistic than Studded Leather armor. A reminder that Studded leather armor is a misinterpretation of a Brigandine.
	name = "kikko jacket"
	desc = "A cheaper and lighter version of Kikko Tatami, a leather jacket with metal hexagon plates in a turtle-shell pattern."
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
	name = "shozoku"
	desc = "The main garment used by Ninjas and Kunoichis to blend into the night. Not viable during daylight, but it is easy to store anywhere, and any time."
	icon = 'modular_twilight/icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	icon_state = "shinobi"
	item_state = "shinobi"
	blocksound = SOFTHIT

/obj/item/clothing/suit/roguetown/armor/chainmail/iron/rattan //New armor; Iron-to-steel tier.
	slot_flags = ITEM_SLOT_ARMOR
	name = "rattan armor"
	desc = "A flexible and durable full body coat made from oil-boiled rattan and layered iron wires. Used by LinYou Raiders, it can be easily repaired."
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
	name = "haori"
	desc = "a traditional jacket meant to be worn over a kimono."
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
	name = "izuma kikko gusoku"
	desc = "The Heartfelt design reforged in the ways of Fog Islands to better supply quick-moving zamurai cavalry, replacing the heavier and costier O-Yoroi lamellar."
	body_parts_covered = CHEST|GROIN|VITALS|LEGS //does not protect the arms. Countering the Brigandine that protects the arms, but not legs.
	icon = 'modular_twilight/icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	sellprice = 65 //not unique.

/obj/item/clothing/suit/roguetown/armor/leather/vest/kaizoku
	name = "izuma's waitao"
	icon_state = "waitao_coat"
	color = null
	desc = "A silken coat of Heartfelt making used by the Abyssariad Kaizoku, those who brought the name of Fog Islands to the outsiders by accident. Or just artistic folk."
	icon = 'modular_twilight/icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	body_parts_covered = CHEST|VITALS|LEGS
	sellprice = 45

/obj/item/clothing/suit/roguetown/armor/brigandine/shanwenkai //I dislike overused armor in unique roles. so I just made an "Officer" armor based on the chinese actual officer armor. Brigadine.
	slot_flags = ITEM_SLOT_ARMOR
	name = "weeper-patterned championage armor" //This is the Shan Wen Kia armor, but the downwards 'Y' is upwards now, so I can't name it <mountain patterned armor>
	desc = "The ancient godwenkai, a heavy armor made with overlapping arrangement of armor plates, assembled with the symbol of the Weeping God. This is used by Abyssariad Champions who still lingers on this world, honoring the Weeper who fed Abyssor."
	icon_state = "shanwenkai"
	icon = 'modular_twilight/icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'

/obj/item/clothing/suit/roguetown/armor/brigandine/shanwenkai/update_icon()
	return

/obj/item/clothing/suit/roguetown/armor/gambeson/ruankai
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_SHIRT
	name = "padded ruankai"
	desc = "made of layered cotton or silk, it is quilted together to absorb shock from blows to protect wearer as a cushioning layer. Enough to survive a horse's kick."
	icon_state = "ruankai"
	icon = 'modular_twilight/icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'

/obj/item/clothing/suit/roguetown/armor/gambeson/light/hitatare
	name = "yoroi hitatare"
	desc = "A traditional Abyssariad padded robe with wide sleeves, made to be worn beneath armor. It is comfortable and thick, but not very protective compared to a ruankai, but can be used all the time without raising suspicion."
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

// Randomized color Hitatare
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
	name = "reinforced deel coat"
	desc = "A loose-fitting abyssariad tunic usually made with horse leather, traditionally used by the Dustwalkers. The dense padding greatly protects the user against blunt trauma."
	icon_state = "deel"
	icon = 'modular_twilight/icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'

/obj/item/clothing/suit/roguetown/armor/leather/splint/ninjakappa //same as studded leather armor
	name = "tribalistic bronze cuirass"
	desc = "A layered armor with oil-boiled leather reinforced with bronze plates sew into the fabric. Light and flexible, it is used by Undines who became part of underground shinobi operations to destroy illegal gangs, drugdealers and centers of prostitution."
	icon_state = "ninjakappa"
	item_state = "ninjakappa"
	icon = 'modular_twilight/icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'

/obj/item/clothing/suit/roguetown/armor/rare/myrmidon
	name = "myrmidon mingguang kai" // that's "明光铠", not the genshin character.
	desc = "Ocean-blessed overlapping steel plates joined by butchered demonhide threads and orichalcum infusion, \
	long purified with abyssor sigils and symbols of the Weeper. Each steel layer is engraved:\
	By the Heavenly Emperor's command. For the abyss against all odds."
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
	armor = list("melee" = 90, "bullet" = 85, "laser" = 0, "energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_BLUNT, BCLASS_TWIST)

/obj/item/clothing/suit/roguetown/armor/rare/Initialize()
	. = ..()
	AddComponent(/datum/component/squeak, list('sound/foley/footsteps/armor/fullplate (1).ogg',\
												'sound/foley/footsteps/armor/fullplate (2).ogg',\
												'sound/foley/footsteps/armor/fullplate (3).ogg'), 80)

/obj/item/clothing/suit/roguetown/armor/ceramic
	name = "tribal coverings"
	desc = "A more well-designed armor made with sturdy animal bones. Suitable for tribals whom uses little mettalurgy."
	icon_state = "nacre_covering"
	icon = 'modular_twilight/icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	armor = list("melee" = 60, "bullet" = 50, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
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
	name = "marauder trollhunter armor"
	desc = "The heavy armor used by the tribalistic Undine marauder forces under the flag of Abyssariads from the Fog Islands. Made of ceramic-like material from lava forges."
	icon_state = "marauder_chest"
	icon = 'modular_twilight/icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	prevent_crits = list(BCLASS_CUT, BCLASS_CHOP, BCLASS_STAB) // Bones are ceramic-like. These are horrible against blunt.
	blade_dulling = DULLING_BASHCHOP
	body_parts_covered = CHEST|VITALS|ARMS|GROIN //Protects an acceptable large range of places for such relatively cost-y armor. I hope.
	armor = list("melee" = 60, "bullet" = 60, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	max_integrity = 250
	equip_delay_self = 40
	armor_class = ARMOR_CLASS_MEDIUM

/obj/item/clothing/suit/roguetown/armor/ceramic/light
	name = "bone coverings"
	desc = "An simple, primitive armor made of chiseled bones bound with fibers and sinews. Stronger than gambesons, but requires conquering tough dendor's creatures to make."
	icon = 'modular_twilight/icons/roguetown/clothing/armor.dmi'
	mob_overlay_icon = 'modular_twilight/icons/roguetown/clothing/onmob/armor.dmi'
	sleeved = 'modular_twilight/icons/roguetown/clothing/onmob/helpers/sleeves_armor.dmi'
	armor = list("melee" = 40, "bullet" = 30, "laser" = 0,"energy" = 0, "bomb" = 0, "bio" = 0, "rad" = 0, "fire" = 0, "acid" = 0)
	icon_state = "ivory_coverings"
	slot_flags = ITEM_SLOT_ARMOR|ITEM_SLOT_SHIRT
	blocksound = SOFTHIT
	blade_dulling = DULLING_BASHCHOP
	body_parts_covered = CHEST|GROIN
	max_integrity = 100 //breaks quickly
	prevent_crits = list(BCLASS_CUT, BCLASS_STAB) //Bones acts similar to ceramics, it will crack with blunt damage.
	armor_class = ARMOR_CLASS_LIGHT
