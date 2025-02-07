//All the items in this folder and its subdirectories are licensed under a proprietary agreement between client: [Vladmar] and artist: [SayonaraEcho].

//Redistribution, reproduction, or modification of these assets is prohibited without express permission from both licensors. 
//These assets are for use solely within this project and may not be extracted or repurposed for other projects or commercial use.

/obj/item/rogueweapon/mace/goden/otsuchi
	force = 10
	force_wielded = 25
	possible_item_intents = list(/datum/intent/mace/strike)
	gripped_intents = list(/datum/intent/mace/strike, /datum/intent/mace/smash)
	name = "оцути"
	desc = "Деревянный молот, достаточно тяжелый, чтобы заставить задуматься любого воина. Часто используется воинами Изумы."
	icon_state = "otsuchi"
	icon = 'modular_twilight/icons/roguetown/weapons/64.dmi'
	sharpness = IS_BLUNT
	wlength = WLENGTH_GREAT
	w_class = WEIGHT_CLASS_BULKY
	slot_flags = ITEM_SLOT_BACK
	associated_skill = /datum/skill/combat/maces
	smeltresult = /obj/item/ash
	swingsound = BLUNTWOOSH_HUGE
	max_integrity = 250
	minstr = 10
	wdefense = 3
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	bigboy = TRUE
	gripsprite = TRUE

/obj/item/rogueweapon/mace/goden/kanabo
	name = "канабо"
	desc = "Тяжелая двуручная булава, усиленная железной втулкой. Чаще всего встречается в руках изуминцев."
	icon_state = "kanabo"
	possible_item_intents = list(/datum/intent/mace/strike)
	gripped_intents = list(/datum/intent/mace/smash) //Can't spear people, but can make them bleed due to spikes.
	sharpness = IS_SHARP
	icon = 'modular_twilight/icons/roguetown/weapons/64.dmi'
	parrysound = "parrywood"
	swingsound = BLUNTWOOSH_MED
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	bigboy = TRUE
	gripsprite = TRUE
	slowdown = 1

/obj/item/rogueweapon/mace/goden/steel/tetsubo
	name = "тецубо"
	desc = "Более тяжелый вариант канабо, оснащенный стальной втулкой с грозными шипами и любимый военачальниками огруна. \
	Требует огромной силы для использования, но бьет как разъяренный бык."
	icon_state = "tetsubo"
	possible_item_intents = list(/datum/intent/mace/strike)
	gripped_intents = list(/datum/intent/mace/smash) //Can't spear people, but can make them bleed due to spikes.
	sharpness = IS_SHARP
	icon = 'modular_twilight/icons/roguetown/weapons/64.dmi'
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64

/obj/item/rogueweapon/mace/ararebo
	name = "араребо"
	icon = 'modular_twilight/icons/roguetown/weapons/32.dmi'
	icon_state = "ararebo"
	desc = "Большая дубина с железным наконечником, используемая абиссарийцами в качестве орудия для пробивания доспехов. \
	Больше всего подходит для того, чтобы пробивать грензельхофтские кирасы, держа при этом в свободной руке щит."

/obj/item/rogueweapon/mace/ararebo/obsidian
	name = "обсидиановая дубинка"
	icon_state = "obsidian_club"
	desc = "Большая деревянная дубина с острыми чешуйками обсидиана, вделанными в нее. Внешне она похожа на булаву с фланцем, но наносит глубокие порезы."
	max_integrity = 150
	wlength = WLENGTH_SHORT
	w_class = WEIGHT_CLASS_NORMAL
	sharpness = IS_SHARP
	wbalance = -1
	minstr = 0
	wdefense = 3

/obj/item/rogueweapon/mace/steel/ararebo
	name = "стальной араребо"
	icon = 'modular_twilight/icons/roguetown/weapons/32.dmi'
	icon_state = "sararebo"
	desc = "Большая дубина со стальным наконечником, используемая в качестве орудия для пробивания доспехов. \
	Больше всего подходит для того, чтобы пробивать грезельхофтские кирасы, держа при этом щит в свободной руке."

/obj/item/rogueweapon/mace/cudgel/rungu
	force = 15
	force_wielded = 20
	name = "дубинка рунгу"
	desc = "Деревянная дубина с более четкими очертаниями, выточенная и покрытая пеплом, которую можно метать во врагов."
	icon_state = "rungu"
	icon = 'modular_twilight/icons/roguetown/weapons/32.dmi'
	wbalance = 0
	wdefense = 1
	wlength = WLENGTH_NORMAL
	w_class = WEIGHT_CLASS_NORMAL
	max_integrity = 150
	possible_item_intents = list(/datum/intent/mace/strike/wood)
	gripped_intents = list(/datum/intent/mace/strike/wood, /datum/intent/mace/smash/wood)
	smeltresult = /obj/item/ash
	minstr = 0
	throwforce = 25

/obj/item/rogueweapon/mace/cudgel/jitte
	name = "джитта"
	desc = "Охранное оружие асигару. Крюк вдоль древка позволяет булаве задерживать клинок, увеличивая защитную эффективность простой дубинки."
	icon = 'modular_twilight/icons/roguetown/weapons/32.dmi'
	icon_state = "jitte"
	wdefense = 4
