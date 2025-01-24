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
	name = "ткань - (2 волокна)"
	result = /obj/item/natural/cloth
	reqs = list(/obj/item/natural/fibers = 2)
	skill_level = 0

/datum/crafting_recipe/roguetown/sewing/headband
	name = "повязка на голову - (1 ткань)"
	result = list(/obj/item/clothing/head/roguetown/headband)
	reqs = list(/obj/item/natural/cloth = 1)
	skill_level = 0

/datum/crafting_recipe/roguetown/sewing/loincloth
	name = "набедренная повязка - (1 ткань)"
	result = list(/obj/item/clothing/under/roguetown/loincloth)
	reqs = list(/obj/item/natural/cloth = 1)
	skill_level = 0

/datum/crafting_recipe/roguetown/sewing/rags
	name = "тряпье - (2 ткани)"
	result = list(/obj/item/clothing/suit/roguetown/shirt/rags)
	reqs = list(/obj/item/natural/cloth = 2)
	skill_level = 0

/datum/crafting_recipe/roguetown/sewing/ragmask
	name = "тряпичная маска - (1 ткань)"
	result = list(/obj/item/clothing/mask/rogue/rag)
	reqs = list(/obj/item/natural/cloth = 1)
	skill_level = 0

/datum/crafting_recipe/roguetown/sewing/ragglove
	name = "обмотки для рук - (1 ткань)"
	result = list(/obj/item/clothing/gloves/roguetown/wrap)
	reqs = list(/obj/item/natural/cloth = 1)
	skill_level = 0

/datum/crafting_recipe/roguetown/sewing/bag
	name = "мешок - (1 ткань, 1 волокно)"
	result = /obj/item/storage/roguebag/crafted
	reqs = list(/obj/item/natural/fibers = 1,
				/obj/item/natural/cloth = 1)
	skill_level = 0
	
/datum/crafting_recipe/roguetown/sewing/leash
	name = "поводок из веревки - (1 веревка)"
	result = list(/obj/item/leash = 1)
	reqs = list(/obj/item/rope = 1)
	skill_level = 0

/* craftdif of 1 = NOVICE */

/datum/crafting_recipe/roguetown/sewing/knitcap
	name = "вязаная кепка - (2 ткани, 1 волокно; NOVICE)"
	result = list(/obj/item/clothing/head/roguetown/knitcap)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	skill_level = 1

/datum/crafting_recipe/roguetown/sewing/Leyepatch
	name = "глазная повязка (левый) - (1 ткань, 1 волокно; NOVICE)"
	result = list(/obj/item/clothing/mask/rogue/eyepatch/left)
	reqs = list(/obj/item/natural/cloth = 1,
				/obj/item/natural/fibers = 1)
	skill_level = 1

/datum/crafting_recipe/roguetown/sewing/Reyepatch
	name = "глазная повязка (правый) - (1 ткань, 1 волокно; NOVICE)"
	result = list(/obj/item/clothing/mask/rogue/eyepatch)
	reqs = list(/obj/item/natural/cloth = 1,
				/obj/item/natural/fibers = 1)
	skill_level = 1

/datum/crafting_recipe/roguetown/sewing/clothgloves
	name = "перчатки (беспальцевые) - (1 ткань, 1 волокно; NOVICE)"
	result = list(/obj/item/clothing/gloves/roguetown/fingerless)
	reqs = list(/obj/item/natural/cloth = 1,
				/obj/item/natural/fibers = 1)
	skill_level = 1

/datum/crafting_recipe/roguetown/sewing/strawhat
	name = "соломенная шляпа - (3 волокна; NOVICE)"
	result = list(/obj/item/clothing/head/roguetown/strawhat)
	reqs = list(/obj/item/natural/fibers = 3)
	skill_level = 1

/datum/crafting_recipe/roguetown/sewing/basichood
	name = "капюшон - (2 ткани, 1 волокно; NOVICE)"
	result = list(/obj/item/clothing/head/roguetown/roguehood)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	skill_level = 1

/datum/crafting_recipe/roguetown/sewing/sack
	name = "капюшон из мешка - (2 ткани; NOVICE)"
	result = list(/obj/item/clothing/head/roguetown/menacing)
	reqs = list(/obj/item/natural/cloth = 2,)
	skill_level = 1

/datum/crafting_recipe/roguetown/sewing/clothtrou
	name = "брюки - (2 ткани, 1 волокно; NOVICE)"
	result = list(/obj/item/clothing/under/roguetown/trou)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	skill_level = 1

/datum/crafting_recipe/roguetown/sewing/tights
	name = "трико - (2 ткани, 1 волокно; NOVICE)"
	result = list(/obj/item/clothing/under/roguetown/tights)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	skill_level = 1

/datum/crafting_recipe/roguetown/sewing/workervest
	name = "туника в полоску - (2 ткани, 2 волокна; NOVICE)"
	result = list(/obj/item/clothing/suit/roguetown/armor/workervest)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 2)
	skill_level = 1

/datum/crafting_recipe/roguetown/sewing/clothshirt
	name = "рубаха из ткани - (2 ткани, 1 волокно; NOVICE)"
	result = list(/obj/item/clothing/suit/roguetown/shirt/undershirt)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	skill_level = 1

/datum/crafting_recipe/roguetown/sewing/tunic
	name = "туника из ткани - (2 ткани, волокно; NOVICE)"
	result = list(/obj/item/clothing/suit/roguetown/shirt/tunic)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	skill_level = 1

/datum/crafting_recipe/roguetown/sewing/burial_shroud
	name = "погребальный саван - (2 ткани; NOVICE)"
	result = list(/obj/item/burial_shroud)
	reqs = list(/obj/item/natural/cloth = 2)
	skill_level = 1

/* craftdif of 2 = APPRENTICE */

/datum/crafting_recipe/roguetown/sewing/nocwrappings
	name = "лунные обмотки для рук - (2 ткани; APPRENTICE)"
	result = list(/obj/item/clothing/wrists/roguetown/nocwrappings)
	reqs = list(/obj/item/natural/cloth = 2)
	skill_level = 2

/datum/crafting_recipe/roguetown/sewing/wrappings
	name = "солнечные обмотки для рук - (2 ткани; APPRENTICE)"
	result = list(/obj/item/clothing/wrists/roguetown/wrappings)
	reqs = list(/obj/item/natural/cloth = 2)
	skill_level = 2

/datum/crafting_recipe/roguetown/sewing/sleepingbag
	name = "спальный мешок - (2 ткани, 1 волокно; APPRENTICE)"
	result = list(/obj/item/sleepingbag)
	reqs =  list(/obj/item/natural/cloth = 2,
                /obj/item/natural/fibers = 1)
	skill_level = 2

/datum/crafting_recipe/roguetown/sewing/fauld
	name = "самодельная юбка из ткани - (2 ткани, 1 волокно; APPRENTICE)"
	result = list(/obj/item/clothing/cloak/fauld)
	reqs =  list(/obj/item/natural/cloth = 2,
                /obj/item/natural/fibers = 1)
	skill_level = 2

/datum/crafting_recipe/roguetown/sewing/skirt
	name = "боевая юбка - (2 ткани, 1 волокно; APPRENTICE)"
	result = list(/obj/item/clothing/cloak/fauld/battleskirt)
	reqs =  list(/obj/item/natural/cloth = 2,
                /obj/item/natural/fibers = 1)
	skill_level = 2

/datum/crafting_recipe/roguetown/sewing/lgambeson
    name = "облегченный гамбезон - (3 ткани, 1 волокно; APPRENTICE)"
    result = list(/obj/item/clothing/suit/roguetown/armor/gambeson/light)
    reqs = list(/obj/item/natural/cloth = 3,
                /obj/item/natural/fibers = 1)
    skill_level = 2

/* craftdif of 3 = JOURNEYMAN */

/datum/crafting_recipe/roguetown/sewing/armingjacket
	name = "гамбезон рыцаря - (4 ткани, 1 волокно; JOURNEYMAN)"
	result = /obj/item/clothing/suit/roguetown/armor/gambeson/lord
	reqs = list(/obj/item/natural/cloth = 4,
				/obj/item/natural/fibers = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/bedsheet
	name = "покрывало из ткани - (2 ткани; 1 волокно; JOURNEYMAN)"
	result = list(/obj/item/bedsheet/rogue/cloth)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/bedsheetpelt
	name = "покрывало из кожи - (2 кожи, 1 волокно; JOURNEYMAN)"
	result = list(/obj/item/bedsheet/rogue/pelt)
	reqs = list(/obj/item/natural/hide/cured = 2,
            	/obj/item/natural/fibers = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/paddedcap
	name = "стеганый колпак - (5 волокон; JOURNEYMAN)"
	result = /obj/item/clothing/head/roguetown/paddedcap
	reqs = list(/obj/item/natural/fibers = 5)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/cape
	name = "накидка - (2 ткани, 1 волокно; JOURNEYMAN)"
	result = list(/obj/item/clothing/cloak/cape)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/coif
	name = "койф - (2 ткани, 1 волокно; JOURNEYMAN)"
	result = list(/obj/item/clothing/neck/roguetown/coif)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/strapless_dress
	name = "платье (без бретелек) - (2 ткани, 1 волокно; JOURNEYMAN)"
	result = list(/obj/item/clothing/suit/roguetown/shirt/dress/gen/strapless)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/wizhatblue
	name = "шляпа волшебника - (2 ткани, 1 волокно; JOURNEYMAN)"
	result = list(/obj/item/clothing/head/roguetown/wizhat)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/gambeson
	name = "гамбезон - (4 ткани, 1 волокно; JOURNEYMAN)"
	result = /obj/item/clothing/suit/roguetown/armor/gambeson
	reqs = list(/obj/item/natural/cloth = 4,
				/obj/item/natural/fibers = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/robe
	name = "роба - (3 ткани, 1 волокно; JOURNEYMAN)"
	result = list(/obj/item/clothing/suit/roguetown/shirt/robe)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/wizrobeblue
	name = "роба волшебника - (3 ткани, 1 волокно; JOURNEYMAN)"
	result = list(/obj/item/clothing/suit/roguetown/shirt/robe/wizard)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/stockings_white
	name = "чулки - (1 ткань, 1 волокно; JOURNEYMAN)"
	result = list(/obj/item/clothing/under/roguetown/tights/stockings/white)
	reqs = list(/obj/item/natural/cloth = 1,
				/obj/item/natural/fibers = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/stockings_white_fishnet
	name = "сетчатые чулки - (2 волокна; JOURNEYMAN)"
	result = list(/obj/item/clothing/under/roguetown/tights/stockings/fishnet/white)
	reqs = list(/obj/item/natural/fibers = 2)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/stabard
	name = "сюрко - (2 ткани, 1 волокно; JOURNEYMAN)"
	result = list(/obj/item/clothing/cloak/stabard)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/stabard/guard
	name = "сюрко стражника - (2 ткани, 1 волокно; JOURNEYMAN)"
	result = list(/obj/item/clothing/cloak/stabard/guard)

/datum/crafting_recipe/roguetown/sewing/tabard
	name = "табард - (2 ткани, 1 волокно; JOURNEYMAN)"
	result = list(/obj/item/clothing/cloak/tabard)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/tabard/crusader
	name = "табард рыцаря - (2 ткани, 1 волокно; JOURNEYMAN)"
	result = list(/obj/item/clothing/cloak/tabard/crusader)

/datum/crafting_recipe/roguetown/sewing/templar/astratan
	name = "табард Астраты - (3 ткани, 1 волокно; JOURNEYMAN)"
	result = list(/obj/item/clothing/cloak/templar/astratan)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/crusader/noc
	name = "табард Нок - (3 ткани, 1 волокно; JOURNEYMAN)"
	result = list(/obj/item/clothing/cloak/tabard/crusader/noc)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/crusader/dendor
	name = "табард Дендора - (3 ткани, 1 волокно; JOURNEYMAN)"
	result = list(/obj/item/clothing/cloak/tabard/crusader/dendor)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/crusader/necra
	name = "табард Некры - (3 ткани, 1 волокно; JOURNEYMAN)"
	result = list(/obj/item/clothing/cloak/templar/necran)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/templar/malummite
	name = "табард Маллума - (3 ткани, 1 волокно; JOURNEYMAN)"
	result = list(/obj/item/clothing/cloak/templar/malummite)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/crusader/eora
	name = "табард Эоры - (3 ткани, 1 волокно; JOURNEYMAN)"
	result = list(/obj/item/clothing/cloak/tabard/crusader/eora)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/crusader/pestra
	name = "табард Пестры - (3 ткани, 1 волокно; JOURNEYMAN)"
	result = list(/obj/item/clothing/cloak/tabard/crusader/pestra)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/crusader/ravox
	name = "табард Равокса - (3 ткани, 1 волокно; JOURNEYMAN)"
	result = list(/obj/item/clothing/cloak/tabard/crusader/ravox)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/bardhat
	name = "шляпка барда - (2 кожи, 1 волокно, 1 перо; JOURNEYMAN)"
	result = list(/obj/item/clothing/head/roguetown/bardhat)
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/fibers = 1,
				/obj/item/natural/feather = 1)
	skill_level = 3

/* craftdif of 4 EXPERT */

/datum/crafting_recipe/roguetown/sewing/fancyhat
	name = "изысканная шляпа - (2 ткани, 1 волокно; EXPERT)"
	result = list(/obj/item/clothing/head/roguetown/fancyhat)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	skill_level = 4

// /datum/crafting_recipe/roguetown/sewing/bardhat
// 	name = "шляпка барда - (2 ткань, волокно; EXPERT)"
// 	result = list(/obj/item/clothing/head/roguetown/fancyhat)
// 	reqs = list(/obj/item/natural/cloth = 2,
// 				/obj/item/natural/fibers = 1,
// 				/obj/item/natural/feather = 1)
// 	skill_level = 4

/datum/crafting_recipe/roguetown/sewing/chaperon
	name = "шаперон - (2 ткани, 1 волокно; EXPERT)"
	result = list(/obj/item/clothing/head/roguetown/chaperon)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	skill_level = 4

/datum/crafting_recipe/roguetown/sewing/rhood
	name = "утепленный капюшон - (2 меха, 2 капюшона, 1 волокно; EXPERT)"
	result = list(/obj/item/clothing/head/roguetown/roguehood/reinforced)
	reqs = list(/obj/item/clothing/head/roguetown/roguehood = 2,
				/obj/item/natural/fibers = 1,
				/obj/item/natural/fur = 2)
	skill_level = 4

/datum/crafting_recipe/roguetown/sewing/stockdress
	name = "простое платье - (3 ткани, 1 волокно; EXPERT)"
	result = list(/obj/item/clothing/suit/roguetown/shirt/dress/gen)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/fibers = 1)
	skill_level = 4

/datum/crafting_recipe/roguetown/sewing/jupon
	name = "жиппон - (2 ткани, 1 волокно; EXPERT)"
	result = list(/obj/item/clothing/cloak/stabard/surcoat)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 1)
	skill_level = 4

/datum/crafting_recipe/roguetown/sewing/hgambeson
    name = "стеганый гамбезон - (6 тканей, 4 волокна; EXPERT)"
    result = list(/obj/item/clothing/suit/roguetown/armor/gambeson/heavy)
    reqs = list(/obj/item/natural/cloth = 6,
                /obj/item/natural/fibers = 4)
    skill_level = 4

/datum/crafting_recipe/roguetown/sewing/armordress
	name = "стеганое платье - (6 тканей, 4 волокна; EXPERT)"
	result = /obj/item/clothing/suit/roguetown/armor/armordress
	reqs = list(/obj/item/natural/cloth = 6,
				/obj/item/natural/fibers = 4)
	skill_level = 4

/* craftdif of 5 = MASTER */

/datum/crafting_recipe/roguetown/sewing/lordcloak
	name = "величественный плащ - (2 меха, 4 кожи; MASTER)"
	result = list(/obj/item/clothing/cloak/lordcloak)
	reqs = list(/obj/item/natural/fur = 2,
				/obj/item/natural/hide/cured = 4)
	skill_level = 5
	sellprice = 85

/datum/crafting_recipe/roguetown/sewing/stockings_white_silk
	name = "шелковые чулки - (1 волокно, 1 шелк; MASTER)"
	result = list(/obj/item/clothing/under/roguetown/tights/stockings/silk/white)
	reqs = list(/obj/item/natural/silk = 1,
				/obj/item/natural/fibers = 1)
	skill_level = 5

/datum/crafting_recipe/roguetown/sewing/nobledress
	name = "дворянское платье - (4 ткани, 2 шелка, 3 волокна; MASTER)"
	result = list(/obj/item/clothing/suit/roguetown/shirt/dress/nobledress)
	reqs = list(/obj/item/natural/cloth = 4,
				/obj/item/natural/fibers = 3,
				/obj/item/natural/silk = 2)
	skill_level = 5

/* craftdif of 6 = LEGENDARY */

/datum/crafting_recipe/roguetown/sewing/sexydress
	name = "откровенное платье - (6 тканей, 3 волокна; LEGENDARY)"
	result = list(/obj/item/clothing/suit/roguetown/shirt/dress/gen/sexy)
	reqs = list(/obj/item/natural/cloth = 6,
				/obj/item/natural/fibers = 3)
	skill_level = 6

/// LEATHER ///

/* craftdif of 0 = NONE */

/datum/crafting_recipe/roguetown/sewing/collarleather
	name = "кожаный ошейник - (1 кожа)"
	result = /obj/item/clothing/neck/roguetown/collar/leather
	reqs = list(/obj/item/natural/hide/cured = 1)
	skill_level = 0

/datum/crafting_recipe/roguetown/sewing/leashleather
	name = "кожаный поводок - (1 кожа)"
	result = /obj/item/leash/leather
	reqs = list(/obj/item/natural/hide/cured = 1)
	skill_level = 0

/* craftdif of 1 = NOVICE */

/datum/crafting_recipe/roguetown/sewing/shoes
	name = "простая обувь - (1 кожа; NOVICE)"
	result = list(/obj/item/clothing/shoes/roguetown/simpleshoes)
	reqs = list(/obj/item/natural/hide/cured = 1)
	skill_level = 1

/datum/crafting_recipe/roguetown/sewing/shortboots
	name = "полуботинки - (1 кожа, 1 ткань; NOVICE)"
	result = /obj/item/clothing/shoes/roguetown/shortboots
	reqs = list(/obj/item/natural/hide/cured = 1,
				/obj/item/natural/cloth = 1)
	skill_level = 1

/datum/crafting_recipe/roguetown/sewing/sandals
	name = "сандалии - (1 кожа, 1 волокно; NOVICE)"
	result = /obj/item/clothing/shoes/roguetown/sandals
	reqs = list(/obj/item/natural/hide/cured = 1,
				/obj/item/natural/fibers = 1)
	skill_level = 1

/* craftdif of 2 = APPRENTICE */

/datum/crafting_recipe/roguetown/sewing/pouch
	name = "кошель из кожи - (1 кожа; APPRENTICE)"
	result = list(/obj/item/storage/belt/rogue/pouch)
	reqs = list(/obj/item/natural/hide/cured = 1)
	skill_level = 2

/datum/crafting_recipe/roguetown/sewing/belt
	name = "кожаный пояс - (1 кожа; APPRENTICE)"
	result = /obj/item/storage/belt/rogue/leather
	reqs = list(/obj/item/natural/hide/cured = 1)
	skill_level = 2

/datum/crafting_recipe/roguetown/sewing/bandana
	name = "бандана из кожи - (1 кожа; APPRENTICE)"
	result = /obj/item/clothing/head/roguetown/helmet/bandana
	reqs = list(/obj/item/natural/hide/cured = 1)
	skill_level = 2

/datum/crafting_recipe/roguetown/sewing/hood
	name = "капюшон из кожи - (1 кожа; APPRENTICE)"
	result = /obj/item/clothing/head/roguetown/roguehood
	reqs = list(/obj/item/natural/hide/cured = 1)
	skill_level = 2

/datum/crafting_recipe/roguetown/sewing/tricorn
	name = "шляпа-треуголка - (1 кожа; APPRENTICE)"
	result = /obj/item/clothing/head/roguetown/helmet/tricorn
	reqs = list(/obj/item/natural/hide/cured = 1)
	skill_level = 2

/datum/crafting_recipe/roguetown/sewing/gladiator
	name = "гладиаторские сандалии - (1 кожа, 1 волокно; APPRENTICE)"
	result = /obj/item/clothing/shoes/roguetown/gladiator
	reqs = list(/obj/item/natural/hide/cured = 1,
				/obj/item/natural/fibers = 1)
	skill_level = 2

/datum/crafting_recipe/roguetown/sewing/ridingboots
	name = "сапоги всадника - (1 кожа, 1 ткань, 2 волокна; APPRENTICE)"
	result = /obj/item/clothing/shoes/roguetown/ridingboots
	reqs = list(/obj/item/natural/hide/cured = 1,
				/obj/item/natural/fibers = 2,
				/obj/item/natural/cloth = 1)
	skill_level = 2

/datum/crafting_recipe/roguetown/sewing/cloak
	name = "кожаный плащ - (2 кожи; APPRENTICE)"
	result = /obj/item/clothing/cloak/raincloak
	reqs = list(/obj/item/natural/hide/cured = 2)
	skill_level = 2

/datum/crafting_recipe/roguetown/sewing/apron/blacksmith
	name = "фартук кузнеца - (2 кожи, 1 волокно; APPRENTICE)"
	result = /obj/item/clothing/cloak/apron/blacksmith
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/fibers = 1)
	skill_level = 2

/* craftdif of 3 = JOURNEYMAN */

/datum/crafting_recipe/roguetown/sewing/satchel
	name = "сумка из кожи - (2 кожи, 1 волокно; JOURNEYMAN)"
	result = list(/obj/item/storage/backpack/rogue/satchel)
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/fibers = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/vest
	name = "жилет из кожи - (2 кожи; JOURNEYMAN)"
	result = /obj/item/clothing/suit/roguetown/armor/leather/vest
	reqs = list(/obj/item/natural/hide/cured = 2)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/vest/sailor
	name = "кожаная жилетка моряка - (2 кожи; JOURNEYMAN)"
	result = /obj/item/clothing/suit/roguetown/armor/leather/vest/sailor
	reqs = list(/obj/item/natural/hide/cured = 2)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/heavygloves
	name = "меховые перчатки - (1 мех; JOURNEYMAN)"
	result = /obj/item/clothing/gloves/roguetown/leather/angle
	reqs = list(/obj/item/natural/fur = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/hidearmor
	name = "меховая куртка - (2 кожи, 1 мех; JOURNEYMAN)"
	result = /obj/item/clothing/suit/roguetown/armor/leather/hide
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/fur = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/cloakfur
	name = "меховой плащ - (2 кожи, 1 мех; JOURNEYMAN)"
	result = /obj/item/clothing/cloak/raincloak/furcloak/crafted
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/fur = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/blackboots
	name = "черные сапоги - (2 кожи, 1 ткань, 2 волокна; JOURNEYMAN)"
	result = /obj/item/clothing/shoes/roguetown/armor
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/fibers = 2,
				/obj/item/natural/cloth = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/leathercoat
	name = "кожаное пальто - (3 кожи, 1 мех, 1 волокно; JOURNEYMAN)"
	result = /obj/item/clothing/suit/roguetown/armor/leathercoat
	reqs = list(/obj/item/natural/hide/cured = 3,
				/obj/item/natural/fur = 1,
				/obj/item/natural/fibers = 1)
	skill_level = 3

/* craftdif of 4 = EXPERT */

/datum/crafting_recipe/roguetown/sewing/leathercoat/heavy
	name = "тяжелое кожаное пальто - (2 меха, 2 кожи, 1 волокно; EXPERT)"
	result = /obj/item/clothing/suit/roguetown/armor/leathercoat/heavy
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/fur = 2,
				/obj/item/natural/fibers = 1)
	skill_level = 4

/datum/crafting_recipe/roguetown/sewing/leather/boots
	name = "крепкие кожаные ботинки - (1 кожа, 1 волокно; EXPERT)"
	result = /obj/item/clothing/shoes/roguetown/armor/leather/advanced
	reqs = list(/obj/item/natural/hide/cured = 1,
				/obj/item/natural/fibers = 1)
	skill_level = 4

/datum/crafting_recipe/roguetown/sewing/leather/gloves
	name = "крепкие кожаные перчатки - (1 кожа, 1 волокно; EXPERT)"
	result = /obj/item/clothing/gloves/roguetown/leather/advanced
	reqs = list(/obj/item/natural/hide/cured = 1,
				/obj/item/natural/fibers = 1)
	skill_level = 4

/datum/crafting_recipe/roguetown/sewing/leather/braces
	name = "крепкие кожаные наручи - (1 кожа, 1 волокно; EXPERT)"
	result = /obj/item/clothing/wrists/roguetown/bracers/leather/advanced
	reqs = list(/obj/item/natural/hide/cured = 1,
				/obj/item/natural/fibers = 1)
	skill_level = 4

/datum/crafting_recipe/roguetown/sewing/leather/coat
	name = "крепкая кожаная куртка - (2 кожи, 1 волокно; EXPERT)"
	result = /obj/item/clothing/suit/roguetown/armor/leather/advanced
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/fibers = 1)
	skill_level = 4

/datum/crafting_recipe/roguetown/sewing/leather/helmet
	name = "крепкий кожаный шлем - (1 кожа, 1 волокно; EXPERT)"
	result = /obj/item/clothing/head/roguetown/helmet/leather/advanced
	reqs = list(/obj/item/natural/hide/cured = 1,
				/obj/item/natural/fibers = 1)
	skill_level = 4

/datum/crafting_recipe/roguetown/sewing/leather/neck
	name = "крепкий кожаный горжет - (1 кожа, 1 волокно; EXPERT)"
	result = /obj/item/clothing/neck/roguetown/leather
	reqs = list(/obj/item/natural/hide/cured = 1,
				/obj/item/natural/fibers = 1)
	skill_level = 4

/datum/crafting_recipe/roguetown/sewing/leather/chausses
	name = "крепкие кожаные шоссы - (2 кожи, 1 волокно; EXPERT)"
	result = /obj/item/clothing/under/roguetown/trou/leather/advanced
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/fibers = 1)
	skill_level = 4

/datum/crafting_recipe/roguetown/sewing/backpack
	name = "рюкзак из кожи - (3 кожи, 1 волокно; EXPERT)"
	result = /obj/item/storage/backpack/rogue/backpack
	reqs = list(/obj/item/natural/hide/cured = 3,
				/obj/item/natural/fibers = 1)
	skill_level = 4

/* craftdif of 5 = MASTER */

/datum/crafting_recipe/roguetown/sewing/leather/boots/masterwork
	name = "шедевральные кожаные ботинки - (кожаные ботинки, 1 эссенция, 1 волокно; MASTER)"
	result = /obj/item/clothing/shoes/roguetown/armor/leather/masterwork
	reqs = list(/obj/item/clothing/shoes/roguetown/armor/leather = 1,
				/obj/item/natural/cured/essence = 1,
				/obj/item/natural/fibers = 1)
	skill_level = 5

/datum/crafting_recipe/roguetown/sewing/leather/gloves/masterwork
	name = "шедевральные кожаные перчатки - (кожаные перчатки, 1 эссенция, 1 волокно; MASTER)"
	result = /obj/item/clothing/gloves/roguetown/leather/masterwork
	reqs = list(/obj/item/clothing/gloves/roguetown/leather = 1,
				/obj/item/natural/cured/essence = 1,
				/obj/item/natural/fibers = 1)
	skill_level = 5

/datum/crafting_recipe/roguetown/sewing/leather/bracers/masterwork
	name = "шедевральные кожаные наручи - (наручи из кожи, 1 эссенция, 1 волокно; MASTER)"
	result = /obj/item/clothing/wrists/roguetown/bracers/leather/masterwork
	reqs = list(/obj/item/clothing/wrists/roguetown/bracers/leather = 1,
				/obj/item/natural/cured/essence = 1,
				/obj/item/natural/fibers = 1)
	skill_level = 5

/datum/crafting_recipe/roguetown/sewing/leather/coat/masterwork
	name = "шедевральное кожаное пальто - (кожаное пальто, 1 эссенция, 1 волокно; MASTER)"
	result = /obj/item/clothing/suit/roguetown/armor/leather/masterwork
	reqs = list(/obj/item/clothing/suit/roguetown/armor/leather = 1,
				/obj/item/natural/cured/essence = 1,
				/obj/item/natural/fibers = 1)
	skill_level = 5

/datum/crafting_recipe/roguetown/sewing/leather/helmet/masterwork
	name = "шедевральный кожаный шлем - (кожаный шлем, 1 эссенция, 1 волокно; MASTER)"
	result = /obj/item/clothing/head/roguetown/helmet/leather/masterwork
	reqs = list(/obj/item/clothing/head/roguetown/helmet/leather = 1,
				/obj/item/natural/cured/essence = 1,
				/obj/item/natural/fibers = 1)
	skill_level = 5

/datum/crafting_recipe/roguetown/sewing/leather/chausses/masterwork
	name = "шедевральные кожаные шоссы - (кожаные шоссы, 1 эссенция, 1 волокно; MASTER)"
	result = /obj/item/clothing/under/roguetown/trou/leather/masterwork
	reqs = list(/obj/item/clothing/under/roguetown/trou/leather = 1,
				/obj/item/natural/cured/essence = 1,
				/obj/item/natural/fibers = 1)
	skill_level = 5

/datum/crafting_recipe/roguetown/sewing/nobleboot
	name = "дворянские сапоги - (2 кожи, 2 ткани, 2 волокна; MASTER)"
	result = /obj/item/clothing/shoes/roguetown/armor/nobleboot
	reqs = list(/obj/item/natural/hide/cured = 2,
				/obj/item/natural/fibers = 2,
				/obj/item/natural/cloth = 2)
	skill_level = 5

/// SILKS

/* craftdif of 1 = NOVICE */

/datum/crafting_recipe/roguetown/sewing/shepardmask
	name = "шелковая полумаска - (1 ткань, 1 шелк; NOVICE)"
	result = list(/obj/item/clothing/mask/rogue/shepherd)
	reqs = list(/obj/item/natural/cloth = 1,
				/obj/item/natural/silk = 1)
	skill_level = 1

/datum/crafting_recipe/roguetown/sewing/rags
	name = "рубашка-паутинка - (1 шелк; NOVICE)"
	result = list(/obj/item/clothing/suit/roguetown/shirt/undershirt/webs)
	reqs = list(/obj/item/natural/silk = 1)
	skill_level = 1

/datum/crafting_recipe/roguetown/sewing/webbing
	name = "перепончатые штаны из шелка - (2 шелка; NOVICE)"
	result = list(/obj/item/clothing/under/roguetown/webs)
	reqs = list(/obj/item/natural/silk = 2)
	skill_level = 1

/datum/crafting_recipe/roguetown/sewing/shadowgloves
	name = "перчатки из шелка - (1 ткань, 1 шелк; NOVICE)"
	result = list(/obj/item/clothing/gloves/roguetown/shadow)
	reqs = list(/obj/item/natural/cloth = 1,
				/obj/item/natural/silk = 1)
	skill_level = 1

/* craftdif of 2 = APPRENTICE */

/* craftdif of 3 = JOURNEYMAN */

//UPD: sewing/cloak is already occupied by leather cloak
/datum/crafting_recipe/roguetown/sewing/halfcloak
	name = "полуплащ из шелка - (1 ткань, 1 шелк; JOURNEYMAN)"
	result = list(/obj/item/clothing/cloak/half)
	reqs = list(/obj/item/natural/cloth = 1,
				/obj/item/natural/silk = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/nochood
	name = "капюшон Нок - (2 ткани, 1 шелк; JOURNEYMAN)"
	result = list(/obj/item/clothing/head/roguetown/roguehood/nochood)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/silk = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/necrahood
	name = "капюшон Некры - (2 ткани, 1 шелк; JOURNEYMAN)"
	result = list(/obj/item/clothing/head/roguetown/necrahood)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/silk = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/astratahood
	name = "капюшон Астраты - (2 ткани, 1 шелк; JOURNEYMAN)"
	result = list(/obj/item/clothing/head/roguetown/roguehood/astrata)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/silk = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/eoramask
	name = "эоранская маска - (3 шелка, 1 слиток серебра; EXPERT)"
	result = list(/obj/item/clothing/mask/rogue/eoran_mask)
	reqs = list(/obj/item/ingot/silver = 1,
				/obj/item/natural/silk = 3)
	skill_level = 3
	sellprice = 75

/datum/crafting_recipe/roguetown/sewing/eorarobes
	name = "эоранская ряса - (3 ткани, 1 шелк; EXPERT)"
	result = list(/obj/item/clothing/suit/roguetown/shirt/robe/eora)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/silk = 1)
	skill_level = 3

/datum/crafting_recipe/roguetown/sewing/shirt
	name = "рубаха из шелка - (5 шелка; JOURNEYMAN)"
	result = list(/obj/item/clothing/suit/roguetown/shirt/grenzelhoft)
	reqs = list(/obj/item/natural/silk = 5)
	skill_level = 3

/* craftdif of 4 = EXPERT */

/datum/crafting_recipe/roguetown/sewing/shadowpant
	name = "брюки из шелка - (1 ткань, 3 шелка; EXPERT)"
	result = list(/obj/item/clothing/under/roguetown/shadow)
	reqs = list(/obj/item/natural/cloth = 1,
				/obj/item/natural/silk = 3)
	skill_level = 4

/datum/crafting_recipe/roguetown/sewing/shadowcloak
	name = "плащ авангарда - (1 ткань, 3 шелка; JOURNEYMAN)"
	result = list(/obj/item/clothing/cloak/shadow)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/silk = 3)
	skill_level = 4

/datum/crafting_recipe/roguetown/sewing/shadowrobe
	name = "униформа авангарда - (2 ткани, 3 шелка; JOURNEYMAN)"
	result = list(/obj/item/clothing/suit/roguetown/shirt/shadow)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/silk = 3)
	skill_level = 4

/datum/crafting_recipe/roguetown/sewing/astratarobe
	name = "одеяние Астраты - (3 ткани, 1 шелк; EXPERT)"
	result = list(/obj/item/clothing/suit/roguetown/shirt/robe/astrata)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/silk = 1)
	skill_level = 4

/datum/crafting_recipe/roguetown/sewing/dendorrobe
	name = "одеяния Дендора - (3 ткани, 1 шелк; EXPERT)"
	result = list(/obj/item/clothing/suit/roguetown/shirt/robe/dendor)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/silk = 1)
	skill_level = 4

/datum/crafting_recipe/roguetown/sewing/necrarobe
	name = "одеяния Некры - (3 ткани, 1 шелк; EXPERT)"
	result = list(/obj/item/clothing/suit/roguetown/shirt/robe/necra)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/silk = 1)
	skill_level = 4

/datum/crafting_recipe/roguetown/sewing/nocrobe
	name = "одеяния Нок - (3 ткани, 1 шелк; EXPERT)"
	result = list(/obj/item/clothing/suit/roguetown/shirt/robe/noc)
	reqs = list(/obj/item/natural/cloth = 3,
				/obj/item/natural/silk = 1)
	skill_level = 4

/datum/crafting_recipe/roguetown/sewing/nmjacket
	name = "куртка Новолуния - (2 кожи, 2 ткани, 2 шелка, амулет Нок, EXPERT)"
	result = list (/obj/item/clothing/suit/roguetown/armor/leather/newmoon_jacket)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/silk = 2,
				/obj/item/natural/hide/cured = 2,
				/obj/item/clothing/neck/roguetown/psicross/noc = 1)
	skill_level = 4

/* craftdif of 5 = MASTER */

/datum/crafting_recipe/roguetown/sewing/silkcoat
	name = "пальто из шелка - (ткань, 2 мех, 3 шелк; MASTER)"
	result = list (/obj/item/clothing/suit/roguetown/armor/silkcoat)
	reqs = list(/obj/item/natural/cloth = 1,
				/obj/item/natural/silk = 3,
				/obj/item/natural/fur = 2)
	skill_level = 5
	sellprice = 60

/datum/crafting_recipe/roguetown/sewing/barkeep
	name = "барное платье (шелк) - (2 ткань, 2 шелк; MASTER)"
	result = list (/obj/item/clothing/suit/roguetown/shirt/dress)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/silk = 2)
	skill_level = 5

/datum/crafting_recipe/roguetown/sewing/silkdress
	name = "платье-сорочка (шелк) - (2 волокна, 3 шелка; MASTER)"
	result = list (/obj/item/clothing/suit/roguetown/shirt/dress/silkdress/random)
	reqs = list(/obj/item/natural/fibers = 2,
				/obj/item/natural/silk = 3)
	skill_level = 5

/* craftdif of 6 = LEGENDARY */

/datum/crafting_recipe/roguetown/sewing/velvetdress
	name = "бархатное платье - (2 ткани, 4 шелка, 3 волокна; LEGENDARY)"
	result = list(/obj/item/clothing/suit/roguetown/shirt/dress/velvetdress)
	reqs = list(/obj/item/natural/cloth = 2,
				/obj/item/natural/fibers = 3,
				/obj/item/natural/silk = 4)
	skill_level = 6
