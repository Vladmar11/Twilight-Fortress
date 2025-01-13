//Removing sell prices, if one wishes to sell these things, just scavenge them for parts and sell that.
//Exempt lordly cloak due to it being a luxury item, for the vault or merchant to sell. (sticky fingers)
//Kingsfield decrees, "All holy items are now barred from vault scrying and merchant guild selling."

/datum/crafting_recipe/roguetown/sewing
	tools = list(/obj/item/needle)
	skillcraft = /datum/skill/misc/sewing
	verbage_simple = "sew"
	verbage = "sews"

/* craftdif of 0 = NONE */

/datum/crafting_recipe/roguetown/sewing/cloth
	name = "ткань (2 волокно; NONE)"
	result = /obj/item/natural/cloth
	reqs = list(/obj/item/natural/fibers = 2)
	skill_level = 0

/datum/crafting_recipe/roguetown/sewing/headband
	name = "повязка на голову (ткань)"
	result = list(/obj/item/clothing/head/roguetown/headband)
	reqs = list(/obj/item/natural/cloth = 1)
	skill_level = 0

/datum/crafting_recipe/roguetown/sewing/loincloth
	name = "набедренная повязка (ткань)"
	result = list(/obj/item/clothing/under/roguetown/loincloth)
	reqs = list(/obj/item/natural/cloth = 1)
	skill_level = 0

/datum/crafting_recipe/roguetown/sewing/rags
	name = "тряпье (2 ткань)"
	result = list(/obj/item/clothing/suit/roguetown/shirt/rags)
	reqs = list(/obj/item/natural/cloth = 2)
	skill_level = 0

/datum/crafting_recipe/roguetown/sewing/ragmask
	name = "маска из тряпки - (ткань)"
	result = list(/obj/item/clothing/mask/rogue/rag)
	reqs = list(/obj/item/natural/cloth = 1)
	skill_level = 0

/datum/crafting_recipe/roguetown/sewing/ragglove
	name = "обмотки для рук - (ткань)"
	result = list(/obj/item/clothing/gloves/roguetown/wrap)
	reqs = list(/obj/item/natural/cloth = 1)
	skill_level = 0

/datum/crafting_recipe/roguetown/sewing/bag
	name = "мешок (ткань, волокно)"
	result = /obj/item/storage/roguebag/crafted
	reqs = list(/obj/item/natural/fibers = 1,
				/obj/item/natural/cloth = 1)
	skill_level = 0
	
/datum/crafting_recipe/roguetown/sewing/leash
	name = "поводок из веревки - (1 веревка; NONE)"
	result = list(/obj/item/leash = 1)
	reqs = list(/obj/item/rope = 1)
	skill_level = 0

/* craftdif of 1 = NOVICE */

/datum/crafting_recipe/roguetown/sewing/knitcap
	name = "кепка (вязанная) - (2 ткань, волокно; NOVICE)"
	result = list(/obj/item/clothing/head/roguetown/knitcap)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	skill_level = 1

/datum/crafting_recipe/roguetown/sewing/Leyepatch
	name = "глазная повязка (левый) - (ткань, волокно; NOVICE)"
	result = list(/obj/item/clothing/mask/rogue/eyepatch/left)
	reqs = list(/obj/item/natural/cloth = 1,
				/obj/item/natural/fibers = 1)
	skill_level = 1

/datum/crafting_recipe/roguetown/sewing/Reyepatch
	name = "глазная повязка (правый) - (ткань, волокно; NOVICE)"
	result = list(/obj/item/clothing/mask/rogue/eyepatch)
	reqs = list(/obj/item/natural/cloth = 1,
				/obj/item/natural/fibers = 1)
	skill_level = 1

/datum/crafting_recipe/roguetown/sewing/clothgloves
	name = "перчатки (беспальцевые) - (ткань, волокно; NOVICE)"
	result = list(/obj/item/clothing/gloves/roguetown/fingerless)
	reqs = list(/obj/item/natural/cloth = 1,
				/obj/item/natural/fibers = 1)
	skill_level = 1

/datum/crafting_recipe/roguetown/sewing/strawhat
	name = "шляпа (соломенная) - (5 волокно; NOVICE)"
	result = list(/obj/item/clothing/head/roguetown/strawhat)
	reqs = list(/obj/item/natural/fibers = 3)
	skill_level = 1

/datum/crafting_recipe/roguetown/sewing/basichood
	name = "капюшон (2 ткань, волокно; NOVICE)"
	result = list(/obj/item/clothing/head/roguetown/roguehood)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	skill_level = 1

/datum/crafting_recipe/roguetown/sewing/sack
	name = "капюшон (мешок) - (2 ткань; NOVICE)"
	result = list(/obj/item/clothing/head/roguetown/menacing)
	reqs = list(/obj/item/natural/cloth = 2,)
	skill_level = 1

/datum/crafting_recipe/roguetown/sewing/clothtrou
	name = "брюки (2 ткань, волокно; NOVICE)"
	result = list(/obj/item/clothing/under/roguetown/trou)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	skill_level = 1

/datum/crafting_recipe/roguetown/sewing/tights
	name = "трико (2 ткань, волокно; NOVICE)"
	result = list(/obj/item/clothing/under/roguetown/tights)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	skill_level = 1

/datum/crafting_recipe/roguetown/sewing/workervest
	name = "туника в полоску - (2 ткань, 2 волокно; NOVICE)"
	result = list(/obj/item/clothing/suit/roguetown/armor/workervest)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 2)
	skill_level = 1

/datum/crafting_recipe/roguetown/sewing/clothshirt
	name = "рубаха из ткани - (2 ткань, волокно; NOVICE)"
	result = list(/obj/item/clothing/suit/roguetown/shirt/undershirt)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	skill_level = 1

/datum/crafting_recipe/roguetown/sewing/tunic
	name = "туника из ткани - (2 ткань, волокно; NOVICE)"
	result = list(/obj/item/clothing/suit/roguetown/shirt/tunic)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	skill_level = 1

/datum/crafting_recipe/roguetown/sewing/burial_shroud
	name = "погребальный саван (2 ткань; NOVICE)"
	result = list(/obj/item/burial_shroud)
	reqs = list(/obj/item/natural/cloth = 2)
	skill_level = 1

/* craftdif of 2 = APPRENTICE */

/datum/crafting_recipe/roguetown/sewing/nocwrappings
	name = "wrappings (Lunar/Noc) - (2 cloths; APPRENTICE)"
	result = list(/obj/item/clothing/wrists/roguetown/nocwrappings)
	reqs = list(/obj/item/natural/cloth = 2)
	skill_level = 2

/datum/crafting_recipe/roguetown/sewing/wrappings
	name = "wrappings (solar/Astrata) (2 cloths; APPRENTICE)"
	result = list(/obj/item/clothing/wrists/roguetown/wrappings)
	reqs = list(/obj/item/natural/cloth = 2)
	skill_level = 2

/datum/crafting_recipe/roguetown/sewing/sleepingbag
	name = "спальный мешок (2 ткань, волокно; APPRENTICE)"
	result = list(/obj/item/sleepingbag)
	reqs =  list(/obj/item/natural/cloth = 2,
                /obj/item/natural/fibers = 1)
	skill_level = 2

/datum/crafting_recipe/roguetown/sewing/fauld
	name = "самодельная юбка из полотна ткани - (2 ткань, волокно; APPRENTICE)"
	result = list(/obj/item/clothing/cloak/fauld)
	reqs =  list(/obj/item/natural/cloth = 2,
                /obj/item/natural/fibers = 1)
	skill_level = 2

/datum/crafting_recipe/roguetown/sewing/skirt
	name = "боевая юбка - (2 ткань, волокно; APPRENTICE)"
	result = list(/obj/item/clothing/cloak/fauld/battleskirt)
	reqs =  list(/obj/item/natural/cloth = 2,
                /obj/item/natural/fibers = 1)
	skill_level = 2

/datum/crafting_recipe/roguetown/sewing/lgambeson
    name = "облегченный гамбезон (3 ткань, волокно; APPRENTICE)"
    result = list(/obj/item/clothing/suit/roguetown/armor/gambeson/light)
    reqs = list(/obj/item/natural/cloth = 3,
                /obj/item/natural/fibers = 1)
    skill_level = 2

/* craftdif of 3 = JOURNEYMAN */

/datum/crafting_recipe/roguetown/sewing/armingjacket
	name = "гамбезон рыцаря (4 ткань, волокно; JOURNEYMAN)"
	result = /obj/item/clothing/suit/roguetown/armor/gambeson/lord
	reqs = list(/obj/item/natural/cloth = 4,
				/obj/item/natural/fibers = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/bedsheet
	name = "простыня (2 ткань; волокно; JOURNEYMAN)"
	result = list(/obj/item/bedsheet/rogue/cloth)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/bedsheetpelt
	name = "простыня (кожа) - (2 кожа, волокно; JOURNEYMAN)"
	result = list(/obj/item/bedsheet/rogue/pelt)
	reqs = list(/obj/item/natural/hide/cured = 2,
            	/obj/item/natural/fibers = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/paddedcap
	name = "cap (padded) - (5 fibers; JOURNEYMAN)"
	result = /obj/item/clothing/head/roguetown/paddedcap
	reqs = list(/obj/item/natural/fibers = 5)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/cape
	name = "накидка (2 ткань, волокно; JOURNEYMAN)"
	result = list(/obj/item/clothing/cloak/cape)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/coif
	name = "койф (2 ткань, волокно; JOURNEYMAN)"
	result = list(/obj/item/clothing/neck/roguetown/coif)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/strapless_dress
	name = "платье (без бретелек) - (2 ткань, волокно; JOURNEYMAN)"
	result = list(/obj/item/clothing/suit/roguetown/shirt/dress/gen/strapless)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/wizhatblue
	name = "шляпа волшебника - (2 ткань, волокно; JOURNEYMAN)"
	result = list(/obj/item/clothing/head/roguetown/wizhat)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/gambeson
	name = "гамбезон (4 ткань, волокно; JOURNEYMAN)"
	result = /obj/item/clothing/suit/roguetown/armor/gambeson
	reqs = list(/obj/item/natural/cloth = 4,
				/obj/item/natural/fibers = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/robe
	name = "robes (3 cloths, fiber; JOURNEYMAN)"
	result = list(/obj/item/clothing/suit/roguetown/shirt/robe)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/wizrobeblue
	name = "Роба мага - (3 ткань, волокно; JOURNEYMAN)"
	result = list(/obj/item/clothing/suit/roguetown/shirt/robe/wizard)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/stockings_white
	name = "чулки (ткань, волокно; JOURNEYMAN)"
	result = list(/obj/item/clothing/under/roguetown/tights/stockings/white)
	reqs = list(/obj/item/natural/cloth = 1,
				/obj/item/natural/fibers = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/stockings_white_fishnet
	name = "чулки (в сетку) - (2 волокно; JOURNEYMAN)"
	result = list(/obj/item/clothing/under/roguetown/tights/stockings/fishnet/white)
	reqs = list(/obj/item/natural/fibers = 2)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/stabard
	name = "сюрко (2 ткань, волокно; JOURNEYMAN)"
	result = list(/obj/item/clothing/cloak/stabard)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/stabard/guard
	name = "сюрко стражника - (2 ткань, волокно; JOURNEYMAN)"
	result = list(/obj/item/clothing/cloak/stabard/guard)

/datum/crafting_recipe/roguetown/sewing/tabard
	name = "табард (2 ткань, волокно; JOURNEYMAN)"
	result = list(/obj/item/clothing/cloak/tabard)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/tabard/crusader
	name = "табард рыцаря - (2 cloths, fiber; JOURNEYMAN)"
	result = list(/obj/item/clothing/cloak/tabard/crusader)

/datum/crafting_recipe/roguetown/sewing/templar/astratan
	name = "astrata tabard (templar) - (3 cloths, fiber; JOURNEYMAN)"
	result = list(/obj/item/clothing/cloak/templar/astratan)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/crusader/noc
	name = "noc tabard (templar) - (3 cloths, fiber; JOURNEYMAN)"
	result = list(/obj/item/clothing/cloak/tabard/crusader/noc)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/crusader/dendor
	name = "dendor tabard (templar) - (3 cloths, fiber; JOURNEYMAN)"
	result = list(/obj/item/clothing/cloak/tabard/crusader/dendor)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/crusader/necra
	name = "necra tabard (templar) - (3 cloths, fiber; JOURNEYMAN)"
	result = list(/obj/item/clothing/cloak/templar/necran)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/templar/malummite
	name = "malum tabard (templar) - (3 cloths, fiber; JOURNEYMAN)"
	result = list(/obj/item/clothing/cloak/templar/malummite)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/crusader/eora
	name = "eora tabard (templar) - (3 cloths, fiber; JOURNEYMAN)"
	result = list(/obj/item/clothing/cloak/tabard/crusader/eora)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/crusader/pestra
	name = "pestra tabard (templar) - (3 cloths, fiber; JOURNEYMAN)"
	result = list(/obj/item/clothing/cloak/tabard/crusader/pestra)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/crusader/ravox
	name = "ravox tabard (templar) - (3 cloths, fiber; JOURNEYMAN)"
	result = list(/obj/item/clothing/cloak/tabard/crusader/ravox)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/bardhat
	name = "hat (bard) - (2 leather, fiber, feather; JOURNEYMAN)"
	result = list(/obj/item/clothing/head/roguetown/bardhat)
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/fibers = 1,
				/obj/item/natural/feather = 1)
	skill_level = 3

/* craftdif of 4 EXPERT */

/datum/crafting_recipe/roguetown/sewing/stockdress
	name = "обычное платье (3 ткань, волокно; EXPERT)"
	result = list(/obj/item/clothing/suit/roguetown/shirt/dress/gen)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	skill_level = 4

/datum/crafting_recipe/roguetown/sewing/fancyhat
	name = "изысканная шляпа - (2 ткань, волокно; EXPERT)"
	result = list(/obj/item/clothing/head/roguetown/fancyhat)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	skill_level = 4

/datum/crafting_recipe/roguetown/sewing/bardhat
	name = "шляпка барда - (2 ткань, волокно; EXPERT)"
	result = list(/obj/item/clothing/head/roguetown/fancyhat)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1,
				/obj/item/natural/feather = 1)
	skill_level = 4

/datum/crafting_recipe/roguetown/sewing/chaperon
	name = "шаперон - (2 ткань, волокно; EXPERT)"
	result = list(/obj/item/clothing/head/roguetown/chaperon)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	skill_level = 4

/datum/crafting_recipe/roguetown/sewing/rhood
	name = "hat (reinforced hood) - (2 fur, hood; EXPERT)"
	result = list(/obj/item/clothing/head/roguetown/roguehood/reinforced)
	reqs = list(/obj/item/clothing/head/roguetown/roguehood = 2,
				/obj/item/natural/fibers = 1,
				/obj/item/natural/fur = 2)
	skill_level = 4

/datum/crafting_recipe/roguetown/sewing/jupon
	name = "jupon (2 cloths, fiber; EXPERT)"
	result = list(/obj/item/clothing/cloak/stabard/surcoat)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	skill_level = 4

/datum/crafting_recipe/roguetown/sewing/hgambeson
    name = "стеганый гамбезон (6 ткань, 4 волокно; EXPERT)"
    result = list(/obj/item/clothing/suit/roguetown/armor/gambeson/heavy)
    reqs = list(/obj/item/natural/cloth = 6,
                /obj/item/natural/fibers = 4)
    skill_level = 4

/datum/crafting_recipe/roguetown/sewing/armordress
	name = "стеганое платье - (6 ткань, 4 волокно; EXPERT)"
	result = /obj/item/clothing/suit/roguetown/armor/armordress
	reqs = list(/obj/item/natural/cloth = 6,
				/obj/item/natural/fibers = 4)
	skill_level = 3

/* craftdif of 5 = MASTER */

/datum/crafting_recipe/roguetown/sewing/lordcloak
	name = "величественный плащ (2 мех, 4 обработанная кожа; MASTER)"
	result = list(/obj/item/clothing/cloak/lordcloak)
	reqs = list(/obj/item/natural/fur = 2,
				/obj/item/natural/hide/cured = 4)
	skill_level = 5
	sellprice = 85

/datum/crafting_recipe/roguetown/sewing/stockings_white_silk
	name = "шелковые чулки - (волокно, шелк; MASTER)"
	result = list(/obj/item/clothing/under/roguetown/tights/stockings/silk/white)
	reqs = list(/obj/item/natural/silk = 1,
				/obj/item/natural/fibers = 1)
	skill_level = 5

/datum/crafting_recipe/roguetown/sewing/nobledress
	name = "дворянское платье (4 ткань, 2 шелк, 3 волокно; MASTER)"
	result = list(/obj/item/clothing/suit/roguetown/shirt/dress/nobledress)
	reqs = list(/obj/item/natural/cloth = 4,
				/obj/item/natural/fibers = 3,
				/obj/item/natural/silk = 2)
	skill_level = 5

/* craftdif of 6 = LEGENDARY */

/datum/crafting_recipe/roguetown/sewing/sexydress
	name = "откровенное платье (6 ткань, 3 волокно; LEGENDARY)"
	result = list(/obj/item/clothing/suit/roguetown/shirt/dress/gen/sexy)
	reqs = list(/obj/item/natural/cloth = 6,
				/obj/item/natural/fibers = 3)
	skill_level = 6

/// LEATHER ///

/datum/crafting_recipe/roguetown/sewing/belt
	name = "кожаный пояс (кожа; APPRENTICE)"
	result = /obj/item/storage/belt/rogue/leather
	reqs = list(/obj/item/natural/hide/cured = 1)
	skill_level = 2

/datum/crafting_recipe/roguetown/sewing/collarleather
	name = "leather collar (1 leather; NONE)"
	result = /obj/item/clothing/neck/roguetown/collar/leather
	reqs = list(/obj/item/natural/hide/cured = 1)
	skill_level = 0

/datum/crafting_recipe/roguetown/sewing/leashleather
	name = "leather leash (1 leather; NONE)"
	result = /obj/item/leash/leather
	reqs = list(/obj/item/natural/hide/cured = 1)
	skill_level = 0

/datum/crafting_recipe/roguetown/sewing/bandana
	name = "leather bandana (leather; APPRENTICE)"
	result = /obj/item/clothing/head/roguetown/helmet/bandana
	reqs = list(/obj/item/natural/hide/cured = 1)
	skill_level = 2

/datum/crafting_recipe/roguetown/sewing/hood
	name = "leather hood (leather; APPRENTICE)"
	result = /obj/item/clothing/head/roguetown/roguehood
	reqs = list(/obj/item/natural/hide/cured = 1)
	skill_level = 2

/datum/crafting_recipe/roguetown/sewing/tricorn
	name = "leather tricorn (leather; APPRENTICE)"
	result = /obj/item/clothing/head/roguetown/helmet/tricorn
	reqs = list(/obj/item/natural/hide/cured = 1)
	skill_level = 2

/datum/crafting_recipe/roguetown/sewing/cloak
	name = "leather cloak (2 leather; APPRENTICE)"
	result = /obj/item/clothing/cloak/raincloak
	reqs = list(/obj/item/natural/hide/cured = 2)
	skill_level = 2

/datum/crafting_recipe/roguetown/sewing/vest
	name = "leather vest (2 leather; JOURNEYMAN)"
	result = /obj/item/clothing/suit/roguetown/armor/leather/vest
	reqs = list(/obj/item/natural/hide/cured = 2)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/vest/sailor
	name = "leather sea jacket (2 leather; JOURNEYMAN)"
	result = /obj/item/clothing/suit/roguetown/armor/leather/vest/sailor
	reqs = list(/obj/item/natural/hide/cured = 2)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/apron/blacksmith
	name = "leather apron (2 leather, fiber; APPRENTICE)"
	result = /obj/item/clothing/cloak/apron/blacksmith
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/fibers = 1)
	skill_level = 2

/datum/crafting_recipe/roguetown/sewing/hidearmor
	name = "hide armor (2 leather, fur; JOURNEYMAN)"
	result = /obj/item/clothing/suit/roguetown/armor/leather/hide
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/fur = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/heavygloves
	name = "hide gloves (fur; JOURNEYMAN)"
	result = /obj/item/clothing/gloves/roguetown/leather/angle
	reqs = list(/obj/item/natural/fur = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/cloakfur
	name = "меховой плащ (2 кожа, мех; JOURNEYMAN)"
	result = /obj/item/clothing/cloak/raincloak/furcloak/crafted
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/fur = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/shoes
	name = "simple shoes"
	result = list(/obj/item/clothing/shoes/roguetown/simpleshoes)
	reqs = list(/obj/item/natural/hide/cured = 1)
	skill_level = 1

/datum/crafting_recipe/roguetown/sewing/pouch
	name = "leather pouch (leather; APPRENTICE)"
	result = list(/obj/item/storage/belt/rogue/pouch)
	reqs = list(/obj/item/natural/hide/cured = 1)
	skill_level = 2

/datum/crafting_recipe/roguetown/sewing/satchel
	name = "leather satchel (2 leather, fiber; JOURNEYMAN)"
	result = list(/obj/item/storage/backpack/rogue/satchel)
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/fibers = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/backpack
	name = "leather backpack (3 leather, fiber; EXPERT)"
	result = /obj/item/storage/backpack/rogue/backpack
	reqs = list(/obj/item/natural/hide/cured = 3,
				/obj/item/natural/fibers = 1)
	skill_level = 4

/datum/crafting_recipe/roguetown/sewing/leathercoat
	name = "leather coat (4 leather, fur, fiber; JOURNEYMAN)"
	result = /obj/item/clothing/suit/roguetown/armor/leathercoat
	reqs = list(/obj/item/natural/hide/cured = 4,
				/obj/item/natural/fur = 1,
				/obj/item/natural/fibers = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/leathercoat/heavy
	name = "heavy leather coat (4 furs, leather, fiber; EXPERT)"
	result = /obj/item/clothing/suit/roguetown/armor/leathercoat/heavy
	reqs = list(/obj/item/natural/hide/cured = 1,
				/obj/item/natural/fur = 4,
				/obj/item/natural/fibers = 1)
	skill_level = 4

/datum/crafting_recipe/roguetown/sewing/shoes
	name = "simple shoes (leather; NOVICE)"
	result = list(/obj/item/clothing/shoes/roguetown/simpleshoes)
	reqs = list(/obj/item/natural/hide/cured = 1)
	skill_level = 1

/datum/crafting_recipe/roguetown/sewing/shortboots
	name = "shortboots (leather, cloth; NOVICE)"
	result = /obj/item/clothing/shoes/roguetown/shortboots
	reqs = list(/obj/item/natural/hide/cured = 1,
				/obj/item/natural/cloth = 1)
	skill_level = 1

/datum/crafting_recipe/roguetown/sewing/sandals
	name = "сандалии (обработанная кожа, волокно; NOVICE)"
	result = /obj/item/clothing/shoes/roguetown/sandals
	reqs = list(/obj/item/natural/hide/cured = 1,
				/obj/item/natural/fibers = 1)
	skill_level = 1

/datum/crafting_recipe/roguetown/sewing/gladiator
	name = "caligae (leather, fiber; APPRENTICE)"
	result = /obj/item/clothing/shoes/roguetown/gladiator
	reqs = list(/obj/item/natural/hide/cured = 1,
				/obj/item/natural/fibers = 1)
	skill_level = 2

/datum/crafting_recipe/roguetown/sewing/ridingboots
	name = "riding boots (leather, cloth, 2 fiber; APPRENTICE)"
	result = /obj/item/clothing/shoes/roguetown/ridingboots
	reqs = list(/obj/item/natural/hide/cured = 1,
				/obj/item/natural/fibers = 2,
				/obj/item/natural/cloth = 1)
	skill_level = 2

/datum/crafting_recipe/roguetown/sewing/blackboots
	name = "black boots (2 leather, cloth, 2 fiber; JOURNEYMAN)"
	result = /obj/item/clothing/shoes/roguetown/armor
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/fibers = 2,
				/obj/item/natural/cloth = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/nobleboot
	name = "noble boots (2 leather, 2 cloth, 2 fiber; MASTER)"
	result = /obj/item/clothing/shoes/roguetown/armor/nobleboot
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/fibers = 2,
				/obj/item/natural/cloth = 2)
	skill_level = 5

/// ADVANCED LEATHER

/datum/crafting_recipe/roguetown/sewing/leather/boots
	name = "укрепленные кожаные ботинки (leather, fiber; MASTER)"
	result = /obj/item/clothing/shoes/roguetown/armor/leather/advanced
	reqs = list(/obj/item/natural/hide/cured = 1,
				/obj/item/natural/fibers = 1)
	skill_level = 4

/datum/crafting_recipe/roguetown/sewing/leather/gloves
	name = "укрепленные кожаные перчатки (обработанная кожа, волокно; MASTER)"
	result = /obj/item/clothing/gloves/roguetown/leather/advanced
	reqs = list(/obj/item/natural/hide/cured = 1,
				/obj/item/natural/fibers = 1)
	skill_level = 4

/datum/crafting_recipe/roguetown/sewing/leather/braces
	name = "укрепленные кожаные наручи (обработанная кожа, волокно; MASTER)"
	result = /obj/item/clothing/wrists/roguetown/bracers/leather/advanced
	reqs = list(/obj/item/natural/hide/cured = 1,
				/obj/item/natural/fibers = 1)
	skill_level = 4

/datum/crafting_recipe/roguetown/sewing/leather/coat
	name = "укрепленная кожаная куртка (2 обработанная кожа, волокно; MASTER)"
	result = /obj/item/clothing/suit/roguetown/armor/leather/advanced
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/fibers = 1)
	skill_level = 4

/datum/crafting_recipe/roguetown/sewing/leather/helmet
	name = "укрепленный кожаный шлем (обработанная кожа, волокно; MASTER)"
	result = /obj/item/clothing/head/roguetown/helmet/leather/advanced
	reqs = list(/obj/item/natural/hide/cured = 1,
				/obj/item/natural/fibers = 1)
	skill_level = 4

/datum/crafting_recipe/roguetown/sewing/leather/neck
	name = "укрепленный кожаный горжет (обработанная кожа, волокно; MASTER)"
	result = /obj/item/clothing/neck/roguetown/leather
	reqs = list(/obj/item/natural/hide/cured = 1,
				/obj/item/natural/fibers = 1)
	skill_level = 4

/datum/crafting_recipe/roguetown/sewing/leather/chausses
	name = "hardened leather chausses (2 leather, fiber; MASTER)"
	result = /obj/item/clothing/under/roguetown/trou/leather/advanced
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/fibers = 1)
	skill_level = 4

/// MASTERWORK

/datum/crafting_recipe/roguetown/sewing/leather/boots/masterwork
	name = "шедевральные кожаные ботинки"
	result = /obj/item/clothing/shoes/roguetown/armor/leather/masterwork
	reqs = list(/obj/item/clothing/shoes/roguetown/armor/leather = 1,
				/obj/item/natural/cured/essence = 1,
				/obj/item/natural/fibers = 1)
	skill_level = 5

/datum/crafting_recipe/roguetown/sewing/leather/gloves/masterwork
	name = "шедевральные кожаные перчатки(обработанная кожа, эссенция, волокно)"
	result = /obj/item/clothing/gloves/roguetown/leather/masterwork
	reqs = list(/obj/item/clothing/gloves/roguetown/leather = 1,
				/obj/item/natural/cured/essence = 1,
				/obj/item/natural/fibers = 1)
	skill_level = 5

/datum/crafting_recipe/roguetown/sewing/leather/bracers/masterwork
	name = "шедевральные кожаные наручи (наручи из кожи, эссенция, волокно)"
	result = /obj/item/clothing/wrists/roguetown/bracers/leather/masterwork
	reqs = list(/obj/item/clothing/wrists/roguetown/bracers/leather = 1,
				/obj/item/natural/cured/essence = 1,
				/obj/item/natural/fibers = 1)
	skill_level = 5

/datum/crafting_recipe/roguetown/sewing/leather/coat/masterwork
	name = "шедевральное кожаное пальто (обработанная кожа, эссенция, волокно)"
	result = /obj/item/clothing/suit/roguetown/armor/leather/masterwork
	reqs = list(/obj/item/clothing/suit/roguetown/armor/leather = 1,
				/obj/item/natural/cured/essence = 1,
				/obj/item/natural/fibers = 1)
	skill_level = 5

/datum/crafting_recipe/roguetown/sewing/leather/helmet/masterwork
	name = "шедевральный кожаный шлем (кожаный шлем, эссенция, волокно)"
	result = /obj/item/clothing/head/roguetown/helmet/leather/masterwork
	reqs = list(/obj/item/clothing/head/roguetown/helmet/leather = 1,
				/obj/item/natural/cured/essence = 1,
				/obj/item/natural/fibers = 1)
	skill_level = 5

/datum/crafting_recipe/roguetown/sewing/leather/chausses/masterwork
	name = "шедевральные кожаные шоссы (обработанная кожа, эссенция, волокно)"
	result = /obj/item/clothing/under/roguetown/trou/leather/masterwork
	reqs = list(/obj/item/clothing/under/roguetown/trou/leather = 1,
				/obj/item/natural/cured/essence = 1,
				/obj/item/natural/fibers = 1)
	skill_level = 5

/// SILKS

/* craftdif of 1 = NOVICE */

/datum/crafting_recipe/roguetown/sewing/shepardmask
	name = "полумаска (ткань, шелк; LOOM, NOVICE)"
	result = list(/obj/item/clothing/mask/rogue/shepherd)
	reqs = list(/obj/item/natural/cloth = 1,
				/obj/item/natural/silk = 1)
	skill_level = 1

/datum/crafting_recipe/roguetown/sewing/rags
	name = "рубашка паутинка - (silk; LOOM, NOVICE)"
	result = list(/obj/item/clothing/suit/roguetown/shirt/undershirt/webs)
	reqs = list(/obj/item/natural/silk = 1)
	skill_level = 1

/datum/crafting_recipe/roguetown/sewing/webbing
	name = "перепончатые штаны из шелка - (2 шелк; LOOM, NOVICE)"
	result = list(/obj/item/clothing/under/roguetown/webs)
	reqs = list(/obj/item/natural/silk = 2)
	skill_level = 1

/datum/crafting_recipe/roguetown/sewing/shadowgloves
	name = "перчатки из шелка - (ткань, шелк; LOOM, NOVICE)"
	result = list(/obj/item/clothing/gloves/roguetown/shadow)
	reqs = list(/obj/item/natural/cloth = 1,
				/obj/item/natural/silk = 1)
	skill_level = 1

/* craftdif of 2 = APPRENTICE */

/* craftdif of 3 = JOURNEYMAN */

/datum/crafting_recipe/roguetown/sewing/cloak
	name = "полуплащ из шелка - (ткань, шелк; LOOM, JOURNEYMAN)"
	result = list(/obj/item/clothing/cloak/half)
	reqs = list(/obj/item/natural/cloth = 1,
				/obj/item/natural/silk = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/shadowcloak
	name = "плащ авангарда - (ткань, 3 шелк; LOOM, JOURNEYMAN)"
	result = list(/obj/item/clothing/cloak/shadow)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/silk = 3)
	skill_level = 4

/datum/crafting_recipe/roguetown/sewing/shadowrobe
	name = "униформа авангарда - (2 ткань, 3 шелк; LOOM, JOURNEYMAN)"
	result = list(/obj/item/clothing/suit/roguetown/shirt/shadow)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/silk = 3)
	skill_level = 4

/datum/crafting_recipe/roguetown/sewing/nochood
	name = "капюшон луны - (2 ткань, шелк; LOOM, JOURNEYMAN)"
	result = list(/obj/item/clothing/head/roguetown/roguehood/nochood)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/silk = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/necrahood
	name = "капюшон (Некра) - (2 cloths, silk; LOOM, JOURNEYMAN)"
	result = list(/obj/item/clothing/head/roguetown/necrahood)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/silk = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/astratahood
	name = "капюшон (солнца/Астарты) - (2 ткань, шелк; LOOM, JOURNEYMAN)"
	result = list(/obj/item/clothing/head/roguetown/roguehood/astrata)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/silk = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/shirt
	name = "рубаха (формальная, шелк) - (5 шелк; LOOM, JOURNEYMAN)"
	result = list(/obj/item/clothing/suit/roguetown/shirt/grenzelhoft)
	reqs = list(/obj/item/natural/silk = 5)
	skill_level = 3

/* craftdif of 4 = EXPERT */

/datum/crafting_recipe/roguetown/sewing/shadowpant
	name = "брюки (шелк) - (ткань, 3 шелк; LOOM, EXPERT)"
	result = list(/obj/item/clothing/under/roguetown/shadow)
	reqs = list(/obj/item/natural/cloth = 1,
				/obj/item/natural/silk = 3)
	skill_level = 4

/datum/crafting_recipe/roguetown/sewing/astratarobe
	name = "одеяние (Астарта) - (3 ткань, шелк; LOOM, EXPERT)"
	result = list(/obj/item/clothing/suit/roguetown/shirt/robe/astrata)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/silk = 1)
	skill_level = 4

/datum/crafting_recipe/roguetown/sewing/dendorrobe
	name = "одеяние (Дендор) - (3 ткань, шелк; LOOM, EXPERT)"
	result = list(/obj/item/clothing/suit/roguetown/shirt/robe/dendor)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/silk = 1)
	skill_level = 4

/datum/crafting_recipe/roguetown/sewing/necrarobe
	name = "одеяние (Некра) - (3 ткань, шелк; LOOM, EXPERT)"
	result = list(/obj/item/clothing/suit/roguetown/shirt/robe/necra)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/silk = 1)
	skill_level = 4

/datum/crafting_recipe/roguetown/sewing/nocrobe
	name = "одеяние (Нок) - (3 ткань, шелк; LOOM, EXPERT)"
	result = list(/obj/item/clothing/suit/roguetown/shirt/robe/noc)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/silk = 1)
	skill_level = 4

/* craftdif of 5 = MASTER */

/datum/crafting_recipe/roguetown/sewing/silkcoat
	name = "пальто (шелк) - (ткань, 2 мех, 3 шелк; LOOM, MASTER)"
	result = list (/obj/item/clothing/suit/roguetown/armor/silkcoat)
	reqs = list(/obj/item/natural/cloth = 1,
				/obj/item/natural/silk = 3,
				/obj/item/natural/fur = 2)
	skill_level = 5
	sellprice = 60

/datum/crafting_recipe/roguetown/sewing/barkeep
	name = "платье (барное, шелк) - (2 ткань, 2 шелк; LOOM, MASTER)"
	result = list (/obj/item/clothing/suit/roguetown/shirt/dress)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/silk = 2)
	skill_level = 5

/datum/crafting_recipe/roguetown/sewing/silkdress
	name = "платье (сорочка, шелк) - (2 волокно, 3 шелк; LOOM, MASTER)"
	result = list (/obj/item/clothing/suit/roguetown/shirt/dress/silkdress/random)
	reqs = list(/obj/item/natural/fibers = 2,
				/obj/item/natural/silk = 3)
	skill_level = 5

/datum/crafting_recipe/roguetown/sewing/nmjacket
	name = "куртка Новолуния - (2 кожа, 2 ткань, 2 шелк, amulet of noc, LOOM, EXPERT)"
	result = list (/obj/item/clothing/suit/roguetown/armor/leather/newmoon_jacket)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/silk = 2,
				/obj/item/natural/hide/cured = 2,
				/obj/item/clothing/neck/roguetown/psicross/noc = 1)
	skill_level = 4

/datum/crafting_recipe/roguetown/sewing/eoramask
	name = "эоранская маска - (3 шелк, серебрянный слиток; EXPERT)"
	result = list(/obj/item/clothing/head/roguetown/eoramask)
	reqs = list(/obj/item/ingot/silver = 1,
				/obj/item/natural/silk = 3)
	skill_level = 3
	sellprice = 75

/datum/crafting_recipe/roguetown/sewing/eorarobes
	name = "ряса Эоры - (3 ткань, шелк; EXPERT)"
	result = list(/obj/item/clothing/suit/roguetown/shirt/robe/eora)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/silk = 1)
	skill_level = 3


/* craftdif of 6 = LEGENDARY */

/datum/crafting_recipe/roguetown/sewing/velvetdress
	name = "платье (бархатное) (2 ткань, 4 шелк, 3 волокно; LOOM, LEGENDARY)"
	result = list(/obj/item/clothing/suit/roguetown/shirt/dress/velvetdress)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 3,
				/obj/item/natural/silk = 4)
	skill_level = 6
