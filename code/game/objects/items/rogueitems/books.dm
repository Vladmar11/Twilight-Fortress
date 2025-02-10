/obj/item/book/rogue
	var/open = FALSE
	icon = 'icons/roguetown/items/books.dmi'
	icon_state = "basic_book_0"
	slot_flags = ITEM_SLOT_HIP
	var/base_icon_state = "basic_book"
	unique = TRUE
	firefuel = 2 MINUTES
	dropshrink = 0.6
	drop_sound = 'sound/foley/dropsound/book_drop.ogg'
	force = 5
	associated_skill = /datum/skill/misc/reading
	w_class = WEIGHT_CLASS_SMALL

/obj/item/book/rogue/getonmobprop(tag)
	. = ..()
	if(tag)
		if(open)
			switch(tag)
				if("gen")
					return list("shrink" = 0.4,
	"sx" = -2,
	"sy" = -3,
	"nx" = 10,
	"ny" = -2,
	"wx" = 1,
	"wy" = -3,
	"ex" = 5,
	"ey" = -3,
	"northabove" = 0,
	"southabove" = 1,
	"eastabove" = 1,
	"westabove" = 0,
	"nturn" = 0,
	"sturn" = 0,
	"wturn" = 0,
	"eturn" = 0,
	"nflip" = 0,
	"sflip" = 0,
	"wflip" = 0,
	"eflip" = 0)
				if("onbelt")
					return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)
		else
			switch(tag)
				if("gen")
					return list("shrink" = 0.4,
	"sx" = -2,
	"sy" = -3,
	"nx" = 10,
	"ny" = -2,
	"wx" = 1,
	"wy" = -3,
	"ex" = 5,
	"ey" = -3,
	"northabove" = 0,
	"southabove" = 1,
	"eastabove" = 1,
	"westabove" = 0,
	"nturn" = 0,
	"sturn" = 0,
	"wturn" = 0,
	"eturn" = 0,
	"nflip" = 0,
	"sflip" = 0,
	"wflip" = 0,
	"eflip" = 0)
				if("onbelt")
					return list("shrink" = 0.3,"sx" = -2,"sy" = -5,"nx" = 4,"ny" = -5,"wx" = 0,"wy" = -5,"ex" = 2,"ey" = -5,"nturn" = 0,"sturn" = 0,"wturn" = 0,"eturn" = 0,"nflip" = 0,"sflip" = 0,"wflip" = 0,"eflip" = 0,"northabove" = 0,"southabove" = 1,"eastabove" = 1,"westabove" = 0)


/obj/item/book/rogue/attack_self(mob/user)
	if(!open)
		attack_right(user)
		return
	..()
	user.update_inv_hands()

/obj/item/book/rogue/rmb_self(mob/user)
	attack_right(user)
	return

/obj/item/book/rogue/read(mob/user)
	if(!open)
		to_chat(user, span_info("Сперва открой."))
		return FALSE
	. = ..()

/obj/item/book/rogue/attackby(obj/item/I, mob/user, params)
	return

/obj/item/book/rogue/attack_right(mob/user)
	if(!open)
		slot_flags &= ~ITEM_SLOT_HIP
		open = TRUE
		playsound(loc, 'sound/items/book_open.ogg', 100, FALSE, -1)
	else
		slot_flags |= ITEM_SLOT_HIP
		open = FALSE
		playsound(loc, 'sound/items/book_close.ogg', 100, FALSE, -1)
	curpage = 1
	update_icon()
	user.update_inv_hands()

/obj/item/book/rogue/update_icon()
	icon_state = "[base_icon_state]_[open]"


/obj/item/book/rogue/secret/ledger
	name = "catatoma"
	icon_state = "ledger_0"
	base_icon_state = "ledger"
	title = "Catatoma"
	desc = "A ledger for shipping orders. It can be combined with a papyrus to create a shipping order."

/obj/item/book/rogue/secret/ledger/attackby(obj/item/I, mob/user, params)
	if(istype(I, /obj/item/paper/scroll/cargo))
		if(!open)
			to_chat(user, "<span class='info'>Open me first.</span>")
			return FALSE
		var/obj/item/paper/scroll/cargo/C = I
		if(C.orders.len > 6)
			to_chat(user, "<span class='warning'>Too much order.</span>")
			return
		var/picked_cat = input(user, "Categories", "Shipping Ledger") as null|anything in sortList(SSmerchant.supply_cats)
		if(!picked_cat)
			testing("yeye")
			return
		var/list/pax = list()
		for(var/pack in SSmerchant.supply_packs)
			var/datum/supply_pack/PA = SSmerchant.supply_packs[pack]
			if(PA.group == picked_cat)
				pax += PA
		var/datum/supply_pack/picked_pack = input(user, "Shipments", "Shipping Ledger") as null|anything in sortList(pax)
		if(!picked_pack)
			return

		C.orders += picked_pack
		C.rebuild_info()
		return
	if(istype(I, /obj/item/paper/scroll))
		if(!open)
			to_chat(user, "<span class='info'>Open me first.</span>")
			return FALSE
		var/obj/item/paper/scroll/P = I
		if(P.info)
			to_chat(user, "<span class='warning'>Something is written here already.</span>")
			return
		var/picked_cat = input(user, "Categories", "Shipping Ledger") as null|anything in sortList(SSmerchant.supply_cats)
		if(!picked_cat)
			return
		var/list/pax = list()
		for(var/pack in SSmerchant.supply_packs)
			var/datum/supply_pack/PA = SSmerchant.supply_packs[pack]
			if(PA.group == picked_cat)
				pax += PA
		var/datum/supply_pack/picked_pack = input(user, "Shipments", "Shipping Ledger") as null|anything in sortList(pax)
		if(!picked_pack)
			return
		var/obj/item/paper/scroll/cargo/C = new(user.loc)

		C.orders += picked_pack
		C.rebuild_info()
		user.dropItemToGround(P)
		qdel(P)
		user.put_in_active_hand(C)
	..()

/obj/item/book/rogue/bibble
	name = "The Book"
	icon_state = "bibble_0"
	base_icon_state = "bibble"
	title = "bible"
	dat = "gott.json"
	var/uses_remaining = 10 // Define uses_remaining

/obj/item/book/rogue/bibble/read(mob/user)
	if(!open)
		to_chat(user, span_info("Сперва открой."))
		return FALSE
	if(!user.client || !user.hud_used)
		return
	if(!user.hud_used.reads)
		return
	if(!user.can_read(src))
		return
	if(in_range(user, src) || isobserver(user))
		user.changeNext_move(CLICK_CD_MELEE)
		var/m
		var/list/verses = world.file2list("strings/bibble.txt")
		m = pick(verses)
		if(m)
			user.say(m)

/obj/item/book/rogue/bibble/attack(mob/living/M, mob/user)
	if(user.mind && user.mind.assigned_role == "Priest")
		if(!user.can_read(src))
			to_chat(user, span_warning("Я не понимаю этих линий из черных каракулей."))
			return
		if (uses_remaining <= 0)
			to_chat(user, span_warning("Все заряды израсходованы, надеюсь, последний бедняга того стоил."))
			qdel(src) // Delete the book
			user << "Книга превращается в пепел в твоих руках..."
			return
		if (uses_remaining == 1)
			to_chat(user, span_notice("Это последний заряд. Используй с умом!"))
		if (M.has_status_effect(/datum/status_effect/debuff/death_weaken))
			M.remove_status_effect(/datum/status_effect/debuff/death_weaken)
		M.apply_status_effect(/datum/status_effect/buff/blessed)
		M.add_stress(/datum/stressevent/blessed)
		user.visible_message(span_notice("[user] благословляет [M]."))
		playsound(user, 'sound/magic/bless.ogg', 100, FALSE)
		return

/datum/status_effect/buff/blessed
	id = "blessed"
	alert_type = /atom/movable/screen/alert/status_effect/buff/blessed
	effectedstats = list("fortune" = 1)
	duration = 20 MINUTES

/atom/movable/screen/alert/status_effect/buff/blessed
	name = "Благословлен"
	desc = ""
	icon_state = "buff"


/obj/item/book/rogue/law
	name = "Книга Правосудия"
	desc = "Выпущен Королевской Канцелярией в качестве правовой основы для государства."
	icon_state ="lawtome_0"
	base_icon_state = "lawtome"
	bookfile = "law.json"

/obj/item/book/rogue/cooking
	name = "Вкусы, достойные Его Величества"
	desc = ""
	icon_state ="book_0"
	base_icon_state = "book"
	bookfile = "cooking.json"

		//no more theif stole the books
/obj/item/book/rogue/knowledge1
	name = "Книга знаний"
	desc = ""
	icon_state ="book5_0"
	base_icon_state = "book5"
	bookfile = "knowledge.json"

/obj/item/book/rogue/secret/xylix
	name = "Книга золота"
	desc = "{<font color='red'><blink>Зловещая книга с неисчислимой силой.</blink></font>}"
	icon_state ="xylix_0"
	base_icon_state = "xylix"
	bookfile = "xylix.json"

/obj/item/book/rogue/xylix/attack_self(mob/user)
	if(!open)
		attack_right(user)
		return
	..()
	user.update_inv_hands()
	to_chat(user, span_notice("Вы чувствуете, как смех отражается эхом в вашей голове."))

//player made books
/obj/item/book/rogue/tales1
	name = "Разные сказки от Йестер Йилс"
	desc = "За авторством Аламер Дж. Уэвенсворт"
	icon_state ="book_0"
	base_icon_state = "book"
	bookfile = "tales1.json"

/obj/item/book/rogue/festus
	name = "Книга пиров"
	desc = "Автор неизвестен"
	icon_state ="book2_0"
	base_icon_state = "book2"
	bookfile = "tales2.json"


/obj/item/book/rogue/tales3
	name = "Мифы и легенды Рокхилла и за его пределами, том I"
	desc = "Автор - Арбалиус Младший"
	icon_state ="book3_0"
	base_icon_state = "book3"
	bookfile = "tales3.json"

/obj/item/book/rogue/bookofpriests
	name = "Священная книга Сафрии"
	desc = ""
	icon_state ="knowledge_0"
	base_icon_state = "knowledge"
	bookfile = "holyguide.json"

/obj/item/book/rogue/robber
	name = "Чтение для разбойников"
	desc = "Автор - Флавий Дендорский"
	icon_state ="basic_book_0"
	base_icon_state = "basic_book"
	bookfile = "tales4.json"

/obj/item/book/rogue/cardgame
	name = "Основные правила пыточного мастерства Грейстоуна"
	desc = "Автор - Джонус Доу"
	icon_state ="basic_book_0"
	base_icon_state = "basic_book"
	bookfile = "tales5.json"

/obj/item/book/rogue/blackmountain
	name = "Забрекалрек, Сага о Черной горе: Часть первая"
	desc = "Автор - Горрек-Летописец, переведено Харгридом-Сказочником."
	icon_state ="book6_0"
	base_icon_state = "book6"
	bookfile = "tales6.json"

/obj/item/book/rogue/beardling
	name = "Булыжник и камень — Алфавит и сказки для бородатых"
	desc = "Распространяется Федерацией дворфов по всей Гримории."
	icon_state ="book8_0"
	base_icon_state = "book8"
	bookfile = "tales7.json"

/obj/item/book/rogue/abyssor
	name = "Повесть о тех, кто в море живет"
	desc = "Написано Беллумром Эгиром"
	icon_state ="book2_0"
	base_icon_state = "book2"
	bookfile = "tales8.json"

/obj/item/book/rogue/necra
	name = "Погребальные обряды Некры"
	desc = "Автор: Хунлаф, Могильщик. Отредактировано Ленорой, жрецом Некры."
	icon_state ="book6_0"
	base_icon_state = "book6"
	bookfile = "tales9.json"

/obj/item/book/rogue/noc
	name = "Искатель снов"
	desc = ""
	icon_state ="book6_0"
	base_icon_state = "book6"
	bookfile = "tales10.json"

/obj/item/book/rogue/fishing
	name = "Расширенное руководство Фонтейна по рыболовству"
	desc = "Книга Форда Фонтейна"
	icon_state ="book2_0"
	base_icon_state = "book2"
	bookfile = "tales11.json"

/obj/item/book/rogue/sword
	name = "Шесть глупостей: Как выжить с помощью меча"
	desc = "Автор - Сэр Теодор"
	icon_state ="book5_0"
	base_icon_state = "book5"
	bookfile = "tales12.json"

/obj/item/book/rogue/arcyne
	name = "Скрытое волшебство: Откуда берется Древняя Магия?"
	desc = "Автор - Килдрен Берчвуд, специалист по магии"
	icon_state ="book4_0"
	base_icon_state = "book4"
	bookfile = "tales13.json"

/obj/item/book/rogue/nitebeast
	name = "Легенда о Ночном звере"
	desc = "Рассказано и написано Пакетто, ученым"
	icon_state ="book8_0"
	base_icon_state = "book8"
	bookfile = "tales14.json"

/obj/item/book/rogue/playerbook
	var/player_book_text
	var/player_book_title
	var/player_book_author
	var/player_book_icon
	var/player_book_author_ckey
	var/is_in_round_player_generated
	var/list/player_book_titles
	var/list/player_book_content
	var/list/book_icons = list(
	"Sickly green with embossed bronze" = "book8",
	"White with embossed obsidian" = "book7",
	"Black with embossed blortz" = "book6",
	"Blue with embossed rontz" = "book5",
	"Green with embossed amethyst" = "book4",
	"Purple with embossed gemerald" = "book3",
	"Red with embossed saffira" = "book2",
	"Brown with embossed gold" = "book1",
	"Brown without embossed material" = "basic_book")
	name = "безымянная книга"
	desc = "Автор - Неизвестно"
	icon_state = "basic_book_0"
	base_icon_state = "basic_book"
	override_find_book = TRUE

/obj/item/book/rogue/playerbook/Initialize(loc, in_round_player_generated, var/mob/living/in_round_player_mob, text)
	. = ..()
	is_in_round_player_generated = in_round_player_generated
	if(is_in_round_player_generated)
		player_book_text = text
		while(!player_book_author_ckey) // doesn't have to be this, but better than defining a bool.
			player_book_title = dd_limittext(capitalize(sanitize_hear_message(input(in_round_player_mob, "Как назовете вашу книгу? (не более 42 символов)", "Название", "Unknown"))), MAX_NAME_LEN)
			player_book_author = "[dd_limittext(sanitize_hear_message(input(in_round_player_mob, "Кто будет автором этой книги? (не более 42 символов)", "Автор", "")), MAX_NAME_LEN)]"
			player_book_icon = book_icons[input(in_round_player_mob, "Выберите стиль обложки:", "Обложка") as anything in book_icons]
			player_book_author_ckey = in_round_player_mob.ckey
			if(alert("Подтвердить?:\nНазвание: [player_book_title]\nАвтор: [player_book_author]\nОбложка: [player_book_icon]", "", "Да", "Нет") == "Нет")
				player_book_author_ckey = null
		message_admins("[player_book_author_ckey]([in_round_player_mob.real_name]) has generated the player book: [player_book_title]")
	else
		player_book_titles = SSlibrarian.pull_player_book_titles()
		player_book_content = SSlibrarian.file2playerbook(pick(player_book_titles))
		player_book_title = player_book_content["book_title"]
		player_book_author = player_book_content["author"]
		player_book_author_ckey = player_book_content["author_ckey"]
		player_book_icon = player_book_content["icon"]
		player_book_text = player_book_content["text"]
		// no longer required.
		player_book_titles = null
		player_book_content = null

	name = "[player_book_title]"
	desc = "By [player_book_author]"
	icon_state = "[player_book_icon]_0"
	base_icon_state = "[player_book_icon]"
	pages = list("<b3><h3>Название: [player_book_title]<br>Автор: [player_book_author]</b><h3>[player_book_text]")

/obj/item/manuscript
	name = "рукопись из 2 страниц"
	desc = "Произведение на 2 страницах, мечтающее стать полноценной книгой."
	icon = 'icons/roguetown/items/misc.dmi'
	icon_state = "manuscript"
	dir = 2
	resistance_flags = FLAMMABLE
	var/number_of_pages = 2
	var/compiled_pages = null
	var/list/page_texts = list()
	var/qdel_source = FALSE

/obj/item/manuscript/attackby(obj/item/I, mob/living/user)
	// why is a book crafting kit using the craft system, but crafting a book isn't? Well the crafting system for *some reason* is made in such a way as to make reworking it to allow you to put reqs vars in the crafted item near *impossible.*
	if(istype(I, /obj/item/book_crafting_kit))
		qdel(I)
		var/obj/item/book/rogue/playerbook/PB = new /obj/item/book/rogue/playerbook(get_turf(loc), TRUE, user, compiled_pages)
		if(user.Adjacent(PB))
			PB.add_fingerprint(user)
			user.put_in_hands(PB)
		return qdel(src)

	if(!istype(I, /obj/item/paper))
		return
	var/obj/item/paper/P = I
	if(!(P.info))
		to_chat(user, "Страница должна содержать текст, который будет добавлен в рукопись!")
		return
	if(number_of_pages == 8)
		to_chat(user, "Стопка рукописей не может превышать 8 страниц!")
		return

	++number_of_pages
	name = "рукопись из [number_of_pages] страниц"
	desc = "Произведение на [number_of_pages] страницах, мечтающее стать полноценной книгой."
	page_texts += P.info
	compiled_pages += "<p>[P.info]</p>"
	qdel(P)

	update_icon()
	return ..()

/obj/item/manuscript/examine(mob/user)
	. = ..()
	. += "<a href='?src=[REF(src)];read=1'>Читать</a>"

/obj/item/manuscript/Topic(href, href_list)
	..()

	if(!usr)
		return

	if(href_list["close"])
		var/mob/user = usr
		if(user?.client && user.hud_used)
			if(user.hud_used.reads)
				user.hud_used.reads.destroy_read()
			user << browse(null, "window=reading")

	var/literate = usr.is_literate()
	if(!usr.canUseTopic(src, BE_CLOSE, literate))
		return

	if(href_list["read"])
		read(usr)

/obj/item/manuscript/attack_self(mob/user)
	read(user)

/obj/item/manuscript/proc/read(mob/user)
	user << browse_rsc('html/book.png')
	if(!user.client || !user.hud_used)
		return
	if(!user.hud_used.reads)
		return
	if(!user.can_read(src))
		return
	if(in_range(user, src) || isobserver(user))
		var/dat = {"<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">
			<html>
			<head>
				<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
				<style type=\"text/css\">
					body { background-image:url('book.png');background-repeat: repeat; }
				</style>
			</head>
			<body scroll=yes>"}
		for(var/I in page_texts)
			dat += "<p>[I]</p>"
		dat += "<br>"
		dat += "<a href='?src=[REF(src)];close=1' style='position:absolute;right:50px'>Закрыть</a>"
		dat += "</body></html>"
		user << browse(dat, "window=reading;size=1000x700;can_close=1;can_minimize=0;can_maximize=0;can_resize=0;titlebar=0")
		onclose(user, "reading", src)
	else
		return span_warning("Я слишком далеко, чтобы прочитать.")

/obj/item/manuscript/update_icon()
	. = ..()
	switch(number_of_pages)
		if(2)
			dir = SOUTH
		if(3)
			dir = NORTH
		if(4)
			dir = EAST
		if(5)
			dir = WEST
		if(6)
			dir = SOUTHEAST
		if(7)
			dir = SOUTHWEST
		if(8)
			dir = NORTHWEST

/obj/item/manuscript/fire_act(added, maxstacks)
	..()
	if(!(resistance_flags & FIRE_PROOF))
		add_overlay("paper_onfire_overlay")

/obj/item/manuscript/attack_hand(mob/user)
	if(istype(user, /mob/living) && src.loc == user)
		var/mob/living/L = user
		var/obj/item/paper/P = new /obj/item/paper(get_turf(src.loc))
		L.put_in_active_hand(P)
		L.put_in_inactive_hand(src)
		P.icon_state = "paperwrite"
		P.info = page_texts[length(page_texts)]
		page_texts -= page_texts[length(page_texts)]
		--number_of_pages
		if(number_of_pages == 1)
			var/obj/item/paper/P_two = new /obj/item/paper(get_turf(src.loc))
			P_two.icon_state = "paperwrite"
			P_two.info = page_texts[length(page_texts)]
			qdel_source = TRUE
			. = ..()
			src.loc = get_turf(src.loc)
			L.put_in_hands(P_two)
			qdel(src)
			return
		else
			update_icon()
			name = "рукопись из [number_of_pages] страниц"
			desc = "Произведение на [number_of_pages] страницах, мечтающее стать полноценной книгой."
			return

	. = ..()

/obj/item/book_crafting_kit
	name = "набор для создания книги"
	desc = "Соедините с рукописью для создания новой книги"
	icon = 'icons/roguetown/items/misc.dmi'
	icon_state = "book_crafting_kit"
