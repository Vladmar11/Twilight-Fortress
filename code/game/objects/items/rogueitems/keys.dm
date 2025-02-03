
/obj/item/key
	name = "key"
	desc = "Непримечательный железный ключик."
	icon_state = "iron"
	icon = 'icons/roguetown/items/keys.dmi'
	lefthand_file = 'icons/mob/inhands/misc/food_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/misc/food_righthand.dmi'
	w_class = WEIGHT_CLASS_TINY
	dropshrink = 0.75
	throwforce = 0
	lockhash = 0
	lockid = null
	slot_flags = ITEM_SLOT_HIP|ITEM_SLOT_MOUTH|ITEM_SLOT_NECK
	drop_sound = 'sound/items/gems (1).ogg'
	anvilrepair = /datum/skill/craft/blacksmithing

	grid_height = 32
	grid_width = 32

/obj/item/key/Initialize()
	. = ..()
	if(lockid)
		if(GLOB.lockids[lockid])
			lockhash = GLOB.lockids[lockid]
		else
			lockhash = rand(100,999)
			while(lockhash in GLOB.lockhashes)
				lockhash = rand(100,999)
			GLOB.lockhashes += lockhash
			GLOB.lockids[lockid] = lockhash

/obj/item/lockpick
	name = "отмычка"
	desc = "Небольшой заостреннный кусок металла, помогающий открывать замки при отсутствии ключа."
	icon_state = "lockpick"
	icon = 'icons/roguetown/items/keys.dmi'
	lefthand_file = 'icons/mob/inhands/misc/food_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/misc/food_righthand.dmi'
	w_class = WEIGHT_CLASS_TINY
	dropshrink = 0.75
	throwforce = 0
	max_integrity = 10
	slot_flags = ITEM_SLOT_HIP|ITEM_SLOT_MOUTH|ITEM_SLOT_NECK
	destroy_sound = 'sound/items/pickbreak.ogg'

	grid_width = 32
	grid_height = 64

//custom key
/obj/item/key/custom
	name = "заказной ключ"
	desc = "ключ, выкованный в кузнице на заказ."
	icon_state = "brownkey"

/obj/item/key/custom/attackby(obj/item/I, mob/user, params)

	if(!istype(I, /obj/item/rogueweapon/hammer))
		return

	var/input = (input(user, "Как назовете этот ключ?", "", "") as text)

	if(!input)
		return

	name = input + " key"
	to_chat(user, span_notice("Вы прикрепляете на [I] бирку: [name]."))

//custom key blank
/obj/item/key_custom_blank//i'd prefer not to make a seperate item for this honestly
	name = "заготовка для ключа"
	desc = "ключ без вырезанных зубцов. Безграничные возможности..."
	icon = 'icons/roguetown/items/keys.dmi'
	icon_state = "brownkey"
	w_class = WEIGHT_CLASS_TINY
	dropshrink = 0.75
	lockhash = 0

/obj/item/key_custom_blank/attackby(obj/item/I, mob/user, params)

	if(!istype(I, /obj/item/rogueweapon/hammer))
		return

	var/input = input(user, "Какой идентификатор ключа вы хотите установить?", "", 0) as num

	if(!input)
		return

	input = max(0, input)
	to_chat(user, span_notice("Вы настроили идентификатор ключа для [input]."))
	lockhash = 10000 + input //having custom lock ids start at 10000 leaves it outside the range that opens normal doors, so you can't make a key that randomly unlocks existing key ids like the church

/obj/item/key_custom_blank/attack_right(mob/user)

	if(istype(user.get_active_held_item(), /obj/item/key))
		var/obj/item/key/held = user.get_active_held_item()
		src.lockhash = held.lockhash
		to_chat(user, span_notice("Вы прослеживаете зубцы от [held] до [src]."))
	else if(istype(user.get_active_held_item(), /obj/item/customlock))
		var/obj/item/customlock/held = user.get_active_held_item()
		src.lockhash = held.lockhash
		to_chat(user, span_notice("Вы растаиваете [src] так, чтобы тот подходил к замку."))
	else if(istype(user.get_active_held_item(), /obj/item/rogueweapon/hammer) && src.lockhash != 0)
		var/obj/item/key/custom/F = new (get_turf(src))
		F.lockhash = src.lockhash
		F.lockid = lockhash
		to_chat(user, span_notice("Вы закончили [F]."))
		qdel(src)


/obj/item/key/lord
	name = "величественный ключ"
	desc = "ключ Его Величества."
	icon_state = "bosskey"
	lockid = "lord"

/obj/item/key/lord/pre_attack(target, user, params)
	. = ..()
	if(istype(target, /obj/structure/closet))
		var/obj/structure/closet/C = target
		if(C.masterkey)
			lockhash = C.lockhash
	if(istype(target, /obj/structure/mineral_door))
		var/obj/structure/mineral_door/D = target
		if(D.masterkey)
			lockhash = D.lockhash

/obj/item/key/royal
	name = "королевский ключ"
	desc = "ключ от королевских покоев. Он даже чувствуется притязательным."
	icon_state = "ekey"
	lockid = "royal"

/obj/item/key/prince_rooms
	name = "княжеский ключ"
	desc = "ключ от покоев наследников."
	icon_state = "ekey"
	lockid = "prince"

/obj/item/key/vault
	name = "ключ от казны"
	desc = "Этот ключ открывает могучую королевскую казну."
	icon_state = "cheesekey"
	lockid = "vault"

/obj/item/key/councillor_rooms
	name = "ключ от комнаты советника"
	desc = "Этот ключ открывает комнаты советника."
	icon_state = "cheesekey"
	lockid = "councillor"

/obj/item/key/noble_guest_rooms
	name = "ключ от гостевых покоев"
	desc = "Этот ключ открывает покои благородных гостей Его Величества."
	icon_state = "cheesekey"
	lockid = "guestroom"

/obj/item/key/merchant
	name = "ключ торговца"
	desc = "ключ от лавки торговца."
	icon_state = "cheesekey"
	lockid = "merchant"

/obj/item/key/shop
	name = "ключ от магазина"
	desc = "Этот ключ открывает и закрывает дверь лавки."
	icon_state = "ekey"
	lockid = "shop"

/obj/item/key/townie // For use in round-start available houses in town. Do not use default lockID.
	name = "ключ горожанина"
	desc = "ключ от дома какого-то горожанина. Постарайтесь не потерять."
	icon_state ="brownkey"
	lockid = "townie"

/obj/item/key/tavern
	name = "ключ от тварены"
	desc = "Универсальный ключ, открывающий любую дверь в таверне."
	icon_state = "hornkey"
	lockid = "tavern"

/obj/item/key/mayor
	name = "ключ городского мэра"
	desc = "Этот ключ должен открывать и закрывать ратушу и дом мэра."
	icon_state = "brownkey"
	lockid = "mayor"

/obj/item/key/tavern/village
	lockid = "vtavern"

/obj/item/key/roomi/village
	lockid = "vroomi"

/obj/item/key/roomii/village
	lockid = "vroomii"

/obj/item/key/roomiii/village
	lockid = "vroomiii"

/obj/item/key/roomiv/village
	lockid = "vroomiv"

/obj/item/key/roomv/village
	lockid = "vroomv"

/obj/item/key/roomvi/village
	lockid = "vroomvi"

/obj/item/key/roomi
	name = "ключ от комнаты I"
	desc = "Открывает комнату #1 в городской таверне."
	icon_state = "brownkey"
	lockid = "roomi"

/obj/item/key/roomii
	name = "ключ от комнаты II"
	desc = "Открывает комнату #2 в городской таверне"
	icon_state = "brownkey"
	lockid = "roomii"

/obj/item/key/roomiii
	name = "ключ от комнаты III"
	desc = "Открывает комнату #3 в городской таверне."
	icon_state = "brownkey"
	lockid = "roomiii"

/obj/item/key/roomiv
	name = "ключ от комнаты IV"
	desc = "Открывает комнату #4 в городской таверне."
	icon_state = "brownkey"
	lockid = "roomiv"

/obj/item/key/roomv
	name = "ключ от комнаты V"
	desc = "Открывает комнату #5 в городской таверне."
	icon_state = "brownkey"
	lockid = "roomv"

/obj/item/key/roomvi
	name = "ключ от комнаты VI"
	desc = "Открывает комнату #6 в городской таверне."
	icon_state = "brownkey"
	lockid = "roomvi"

/obj/item/key/fancyroomi
	name = "ключ от большой комнаты I"
	desc = "Открывает роскошную комнату #1 в городской таверне."
	icon_state = "brownkey"
	lockid = "fancyroomi"

/obj/item/key/fancyroomii
	name = "ключ от большой комнаты II"
	desc = "Открывает роскошную комнату #2 в городской таверне."
	icon_state = "brownkey"
	lockid = "fancyroomii"

/obj/item/key/fancyroomiii
	name = "ключ от большой комнаты III"
	desc = "Открывает роскошную комнату #3 в городской таверне."
	icon_state = "brownkey"
	lockid = "fancyroomiii"

//wth is this from??
/obj/item/key/roomhunt
	name = "room HUNT key"
	desc = "This is the HUNT key!"
	icon_state = "brownkey"
	lockid = "roomhunt"

//vampire mansion//
/obj/item/key/vampire
	name = "ключ от особняка"
	desc = "ключ от замка лорда-вампира."
	icon_state = "vampkey"
	lockid = "mansionvampire"
//

/obj/item/key/blacksmith
	name = "ключ от кузницы"
	desc = "Этот ключ открывает кузницу."
	icon_state = "brownkey"
	lockid = "blacksmith"

/obj/item/key/blacksmith/town
	name = "ключ от городской кузницы"
	lockid = "townblacksmith"

/obj/item/key/seamster
	name = "ключ от ателье"
	desc = "Этот ключ открывает дверь в мастерскую портного."
	icon_state = "brownkey"
	lockid = "seamster"

/obj/item/key/walls
	name = "ржавый ключ"
	desc = "Это старый ржавый ключ."
	icon_state = "rustkey"
	lockid = "walls"

/obj/item/key/farm
	name = "фермерский ключ"
	desc = "Этот ржавый ключ открывает двери фермы."
	icon_state = "rustkey"
	lockid = "farm"

/obj/item/key/butcher
	name = "ключ мясника"
	desc = "Этот ржавый ключ, открывает двери дома мясника."
	icon_state = "rustkey"
	lockid = "butcher"

/obj/item/key/church
	name = "церковный ключ"
	desc = "Этот бронзовый ключ должен открывать почти все двери в церкви."
	icon_state = "brownkey"
	lockid = "church"

/obj/item/key/priest
	name = "ключ священника"
	desc = "Это главный ключ церкви."
	icon_state = "cheesekey"
	lockid = "priest"

/obj/item/key/tower
	name = "ключ от башни"
	desc = "Этот ключ должен открыть все, что находится внутри башни."
	icon_state = "greenkey"
	lockid = "tower"

/obj/item/key/mage
	name = "ключ придворного мага"
	desc = "Это ключ придворного волшебника. Он наблюдает за тобой..."
	icon_state = "eyekey"
	lockid = "mage"

/obj/item/key/graveyard
	name = "ключ от кладбища"
	desc = "Этот ржавый ключ принадлежит могильщику."
	icon_state = "rustkey"
	lockid = "graveyard"

/obj/item/key/artificer
	name = "ключ ремесленника"
	desc = "Этот бронзовый ключ должен открыть гильдию ремесленников."
	icon_state = "brownkey"
	lockid = "artificer"

/obj/item/key/nightman
	name = "ключ сутенера"
	desc = "Этот ржавый ключ открывает бордель."
	icon_state = "greenkey"
	lockid = "nightman"

/obj/item/key/mercenary
	name = "ключ наемника"
	desc = "Да, ведь наемник не станет выбивать двери, верно?"
	icon_state = "greenkey"
	lockid = "merc"

/obj/item/key/mercenary_boss
	name = "ключ капитана наемников"
	desc = "Да, ведь наемник не станет выбивать двери, верно?"
	icon_state = "greenkey"
	lockid = "merc_boss"

/obj/item/key/physician
	name = "ключ лекаря"
	desc = "ключ пахнет травами. Приятный на ощупь."
	icon_state = "greenkey"
	lockid = "physician"

/obj/item/key/puritan
	name = "инквизиторский ключ"
	desc = "Это ключ сложной формы." // i have no idea what is this key about
	icon_state = "mazekey"
	lockid = "puritan"

/obj/item/key/confession
	name = "ключ от исповедальни"
	desc = "Этот ключ открывает двери исповедальни."
	icon_state = "brownkey"
	lockid = "confession"

/obj/item/key/hand
	name = "ключ десницы"
	desc = "Этот королевский ключ принадлежит правой руке герцога."
	icon_state = "cheesekey"
	lockid = "hand"

/obj/item/key/steward
	name = "ключ казначея"
	desc = "Этот ключ принадлежит жадному королевскому казначею."
	icon_state = "cheesekey"
	lockid = "steward"

/obj/item/key/archive
	name = "ключ от архивов"
	desc = "Похоже, этот ключ редко используют..."
	icon_state = "ekey"
	lockid = "archive"

/obj/item/key/manor
	name = "ключ от поместья"
	desc = "Этот ключ открывает большинство дверей в поместье герцога."
	icon_state = "mazekey"
	lockid = "manor"

/obj/item/key/bog_gatehouse
	name = "ключ от Бастиона"
	desc = "Этот ключ открывает двери Бастиона у городских стен."
	icon_state = "spikekey"
	lockid = "bog_gatehouse"

/obj/item/key/bog_master
	name = "ключ смотрителя"
	desc = "Этот ключ открывает кабинет смотрителя Бастиона."
	icon_state = "spikekey"
	lockid = "bog_master"

/obj/item/key/town_barracks
	name = "ключ от городских казарм"
	desc = "Этот ключ открывает городские казармы."
	icon_state = "spikekey"
	lockid = "town_barracks"

/obj/item/key/town_dungeon
	name = "ключ от городской темницы"
	desc = "Этот ключ открывает городскую темницу."
	icon_state = "spikekey"
	lockid = "town_dungeon"

/obj/item/key/town_armory
	name = "ключ от городского арсенала"
	desc = "Этот ключ открывает городской арсенал."
	icon_state = "spikekey"
	lockid = "town_armory"

/obj/item/key/sheriff_office
	name = "ключ от офиса шерифа"
	desc = "Этот ключ открывает офис шерифа городской стражи."
	icon_state = "spikekey"
	lockid = "sheriff_office"

/obj/item/key/keep_gatehouse
	name = "ключ от крепостной сторожки"
	desc = "Этот ключ открывает двери в сторожке крепости."
	icon_state = "spikekey"
	lockid = "keep_gatehouse"

/obj/item/key/keep_barracks
	name = "ключ от крепостных казарм"
	desc = "Этот ключ открывает двери в казармах крепости."
	icon_state = "spikekey"
	lockid = "keep_barracks"

/obj/item/key/keep_dungeon
	name = "ключ от крепостной темницы"
	desc = "ключ открывает двери в темнице под крепостью."
	icon_state = "spikekey"
	lockid = "keep_dungeon"

/obj/item/key/keep_dungeon_torture
	name = "ключ от пыточной"
	desc = "Этот ключ открывает комнату для пыток в крепостной темнице."
	icon_state = "spikekey"
	lockid = "keep_dungeon_torture"

/obj/item/key/keep_armory
	name = "ключ от крепостного арсенала"
	desc = "Этот ключ открывает арсенал внутри крепости."
	icon_state = "spikekey"
	lockid = "keep_armory"

//grenchensnacker
/obj/item/key/porta
	name = "странный ключ"
	desc = "Был ли этот ключ зачарован волшебником-слесарем...?"//what is grenchensnacker.
	icon_state = "eyekey"
	lockid = "porta"

//Goblins
/obj/item/key/goblin
	name = "гоблинский ключ"
	desc = "Этот ключ открывает обычные двери в форте."
	icon_state = "mazekey"
	lockid = "gobbo"

/obj/item/key/goblinguard
	name = "ключ гоблина-стражника"
	desc = "Этот ключ открывает казармы форта."
	icon_state = "spikekey"
	lockid = "gobbo_guards"

/obj/item/key/goblinchief
	name = "ключ гоблина-вожака"
	desc = "Этот ключ открывает комнату главаря и его хранилище."
	icon_state = "spikekey"
	lockid = "gobbo_chief"

//grenchensnacker
/obj/item/key/porta
	name = "странный ключ"
	desc = "Был ли этот ключ зачарован волшебником-слесарем...?"//what is grenchensnacker.
	icon_state = "eyekey"
	lockid = "porta"

// Ship key
/obj/item/key/ship
	name = "корабельный ключ"
	desc = "Этот ржавый ключ должен открыть нижний док корабля в портовой гавани."
	icon_state = "rustkey"
	lockid = "ship"

// Harbor key
/obj/item/key/harbor
	name = "ключ от гавани"
	desc = "Этот железный ключ должен открыть портовый офис, казармы и сторожевую башню.."
	icon_state = "spikekey"
	lockid = "harbor"

//Shop Keys
/obj/item/key/portshop
	name = "ключ от портового магазина"
	desc = "Этот старый ключ открывает магазин в портовом районе."
	icon_state = "rustkey"
	lockid = "portshop"

/obj/item/key/street_smithshop01
	name = "ключ от кузнечной мастерской"
	desc = "Этот старый ключ открывает магазин на торговой улице."
	icon_state = "rustkey"
	lockid = "street_smithshop01"

/obj/item/key/street_shop01
	name = "ключ от лавки #1"
	desc = "Этот старый ключ открывает магазин на торговой улице."
	icon_state = "rustkey"
	lockid = "street_shop01"

/obj/item/key/street_shop02
	name = "ключ от лавки #1"
	desc = "Этот старый ключ открывает магазин за домом мэра."
	icon_state = "rustkey"
	lockid = "street_shop02"

/obj/item/key/smallstreet_shop01
	name = "Stall shop key #1"
	desc = "This key opens peddler #1 at the market square."
	icon_state = "rustkey"
	lockid = "smallstreet_shop01"

/obj/item/key/smallstreet_shop02
	name = "Stall shop key #2"
	desc = "This key opens stall peddler #2 at the market square."
	icon_state = "rustkey"
	lockid = "smallstreet_shop02"

/obj/item/key/smallstreet_shop03
	name = "Stall shop key #3"
	desc = "This key opens stall peddler #3 at the market square."
	icon_state = "rustkey"
	lockid = "smallstreet_shop03"

/obj/item/key/smallstreet_shop04
	name = "Stall shop key #4"
	desc = "This key opens stall peddler #4 at the market square."
	icon_state = "rustkey"
	lockid = "smallstreet_shop04"

/obj/item/key/smallstreet_shop05
	name = "Stall shop key #5"
	desc = "This key opens stall peddler #5 at the market square."
	icon_state = "rustkey"
	lockid = "smallstreet_shop05"

/obj/item/key/smallstreet_shop06
	name = "Stall shop key #6"
	desc = "This key opens stall peddler #6 at the market square."
	icon_state = "rustkey"
	lockid = "smallstreet_shop06"

/obj/item/key/smallstreet_master01
	name = "Stall shop master key"
	desc = "This key opens peddler selling shop keys."
	icon_state = "rustkey"
	lockid = "smallstreet_master01"
