//All the items in this folder and its subdirectories are licensed under a proprietary agreement between client: [Vladmar] and artist: [SayonaraEcho].

//Redistribution, reproduction, or modification of these assets is prohibited without express permission from both licensors. 
//These assets are for use solely within this project and may not be extracted or repurposed for other projects or commercial use.

/obj/item/rogueweapon/sword/uchigatana
	name = "учигатана"
	desc = "Более короткая и простая, чем тачи, учигатана является основным оружием пехотинцев Изумы и Туманных островов. \
	Как и у дзатаны, изогнутый клинок позволяет наносить мощные рубящие удары, но не имеет защитной перекладины, а изгиб делает его менее эффективным при нанесении ударов."
	icon = 'modular_twilight/icons/roguetown/weapons/64.dmi'
	icon_state = "uchigatana"
	pixel_y = -16
	pixel_x = -16
	inhand_x_dimension = 64
	inhand_y_dimension = 64
	bigboy = TRUE
	smeltresult = /obj/item/ingot/steel

/obj/item/rogueweapon/sword/uchigatana/fire //Experimental weapon. Not to be found ingame.
	name = "fire uchigatana"
	desc = "Shorter and simpler than the Tachi, the Uchigatana is the primary sidearm for the Abyssariad and Heartfelt footsoldiers. Unlike other uchigatanas, this sword in specifically seems curiously improved with 'frigus' runes."

/obj/item/rogueweapon/sword/uchigatana/fire/attack(mob/M, mob/living/carbon/human/user)
	if(ismob(M))
		fire_effect(M, user)
		..()

/obj/item/rogueweapon/sword/uchigatana/fire/proc/fire_effect(mob/living/L, mob/user)
	L.adjust_fire_stacks(1)
	L.IgniteMob()
	addtimer(CALLBACK(L, TYPE_PROC_REF(/mob/living, ExtinguishMob)), 5 SECONDS)
	if(user)
		L.lastattacker = user.real_name
		L.lastattackerckey = user.ckey
		L.visible_message("<span class='danger'>[user] has ignited [L] with [src]!</span>", \
								"<span class='danger'>[user] has ignited you with [src]!</span>")
	playsound(loc, 'sound/blank.ogg', 50, TRUE, -1)
	return

/obj/item/rogueweapon/sword/long/tachi //this sword is all fucked. Oh God. Help me.
	name = "тачи"
	desc = "Длинный, изогнутый затан, появившийся после того, как рейдеры Вокоу вернулись на Туманные Острова с захваченными лошадьми и \
	начали разрабатывать собственную кавалерийскую тактику."
	icon = 'modular_twilight/icons/roguetown/weapons/64.dmi'
	icon_state = "tachi"
	item_state = "tachi"
	pixel_y = -16
	pixel_x = -18

/obj/item/rogueweapon/sword/long/greatsword/odachi
	name = "одати"
	desc = "Большой меч традиционно используется на открытых полях сражений, как и церемониальный клинок. \
	Непрактичный для дуэлей, он прихотливо ломает копья и щиты, требуя импульса при каждом ударе."
	icon_state = "odachi"
	icon = 'modular_twilight/icons/roguetown/weapons/64.dmi'
	parrysound = "bladedlarge"

/obj/item/rogueweapon/sword/iron/jian
	name = "железный цзянь"
	icon_state = "jian1"
	icon = 'modular_twilight/icons/roguetown/weapons/64.dmi'

  //Хуйня для всех, похуй Twilight Fortress//
/obj/item/rogueweapon/sword/iron/jian/Initialize()
	. = ..()
	var/design = rand(1, 6) //This system will be standardized to other weapons.
	switch(design)
		if(1)
			name = "monk jian"
			desc = "A simple, double-edged iron sword. With a short guard and slim grip, it is easier to use in martial arts that requires constant flick of the wrist."
		if(2)
			name = "frontierman jian"
			desc = "A simple, double-edged iron sword. With a thicker pommel and stretched guard, it becomes more proper as sideweapons during sieges for overhead attacks."
		if(3)
			name = "guardsman jian"
			desc = "A simple, double-edged iron sword with parrying hooks at cost of slashing effectiveness."
		if(4)
			name = "foreigner jian"
			desc = "A simple, double-edged iron sword with heartfelt influence, taking smithing standards from Zweihanders."
		if(5)
			name = "izuma's jian"
			desc = "A simple, double-edged iron sword with heartfelt influence. Keeping a rather imperial style of guard."
		if(6)
			name = "duelist jian"
			desc = "A simple, double-edged iron sword with hand protection that resembles one side of the firelance apparatus. Usually used for training."
	icon_state = "jian[design]"

/obj/item/rogueweapon/sword/scimitar/messer/dao
	name = "железный дао"
	desc = "Одноострая железная сабля для верховой езды. Подходит для рубки."
	icon_state = "dao"
	icon = 'modular_twilight/icons/roguetown/weapons/32.dmi'

/obj/item/rogueweapon/sword/scimitar/falchion/yuntoudao //this sprite disappeared by reasons unknown
	name = "юньтоудао"
	desc = "Дорогая сабля с широкой серединой и сужающимися концами в форме «ивового листа», она концентрирует силу удара в подобие топора, сохраняя при этом стремительность сабли."
	icon_state = "yuntoudao"
	icon = 'modular_twilight/icons/roguetown/weapons/32.dmi'

/obj/item/rogueweapon/sword/short/jian
	name = "короткая стальная цзянь"
	desc = "Простая, укороченная версия обоюдоострого цзяня. Обычно выдается гражданам Изумы в качестве права на самооборону по воле императора."
	icon = 'modular_twilight/icons/roguetown/weapons/32.dmi'
	icon_state = "shortjian"

/obj/item/rogueweapon/sword/short/wakizashi
	name = "вакидзаси"
	icon_state = "wakizashi1"
	icon = 'modular_twilight/icons/roguetown/weapons/32.dmi'
	possible_item_intents = list(/datum/intent/sword/cut/sorii, /datum/intent/sword/thrust/sorii)

/obj/item/rogueweapon/sword/short/wakizashi/Initialize()
	. = ..()
	var/design = rand(1, 3) //This system will be standardized to other weapons.
	switch(design)
		if(1)
			name = "wakizashi katana"
			desc = "A shorter katana design with circular handguard. The curveness of the blade makes it better at cutting than thrusting."
		if(2)
			name = "traditional wakizashi"
			desc = "The traditional wakizashi used by abyssariads for centuries, with a lack of a pommel and a broader handguard for hand protection. \
			The sorii of the blade improves the cutting power."
		if(3)
			name = "shirasaya wakizashi"
			desc = "The cheaper adaptation of the Wakizashi with an complete lack of handguard and no tsuka ito covering the "
	icon_state = "wakizashi[design]"

/datum/intent/sword/cut/sorii //It is the reverse of the Shortsword.
	clickcd = 10
	penfactor = 30

/datum/intent/sword/thrust/sorii
	clickcd = 10
	damfactor = 0.85

/obj/item/rogueweapon/sword/sabre/piandao
	name = "пиандао"
	desc = "Изогнутый меч с широким одноострым клинком, который заканчивается более тяжелым изгибом для мощных и быстрых разящих ударов."
	icon_state = "piandao"
	icon = 'modular_twilight/icons/roguetown/weapons/32.dmi'

/obj/item/rogueweapon/sword/sabre/piandao/dec
	name = "украшенный пиандао"
	desc = "Сабля с рукоятью, покрытой золотом и буквами, отражающими родословную пользователя."
	icon_state = "piandaodec"
	max_integrity = 550
	sellprice = 140

/obj/item/rogueweapon/sword/dragonslayer //It's a sword, yes. It will be used as a sword? My dudes we moving that one like warhammers at this point. So it's blunt at this point.
	name = "dragonslayer eclipse sword"
	desc = "Dragonslayers uses swords too big to be called a sword. Massive, thick, heavy and far too rough. Indeed, they use a heap of raw iron. These are not crafted for fnesse, but for raw carnage in steel to obliterate Dragon's almost impenetrable skin."
	gripped_intents = list(/datum/intent/dragonslayer/smash, /datum/intent/polearm/chop) //This is practically a mace... that can chop off heads since it's sharp.
	icon_state = "eclipse_sword"
	resistance_flags = FIRE_PROOF
	smeltresult = /obj/item/ingot/steel
	max_integrity = 500
	force = 5 //You won't get ANYTHING by using in one hand. Trust me. EVEN IF YOU COULD.
	force_wielded = 40 // I thought Gundam would nerf it. He buffed it instead. What a World!
	slowdown = 1
	wbalance = -1
	sellprice = 300
	w_class = WEIGHT_CLASS_HUGE
	wbalance = -1 //haha... yeah.
	wdefense = 3
	minstr = 14
	associated_skill = /datum/skill/combat/swords //if you tell me that fighting with this sword is LIKE a sword, I will kill you (ingame)-Mono
	icon = 'modular_twilight/icons/roguetown/weapons/64.dmi'
	slot_flags = ITEM_SLOT_BACK
	parrysound = "largeblade"
	pickup_sound = "brandish_blade"
	bigboy = TRUE

/datum/intent/dragonslayer/smash
	name = "smash"
	icon_state = "insmash"
	attack_verb = list("clangs")
	animname = "smash"
	blade_class = BCLASS_CHOP
	hitsound = list('modular_twilight/sound/izuma/combat/hits/dragonslayer.ogg', 'modular_twilight/sound/izuma/combat/hits/dragonslayer2.ogg')
	penfactor = 30
	damfactor = 1.2
	chargetime = 5
	swingdelay = 5
	misscost = 35
	warnie = "mobwarning"

/datum/intent/polearm/chop
	name = "chop"
	icon_state = "inchop"
	attack_verb = list("chops", "hacks")
	animname = "chop"
	blade_class = BCLASS_CHOP
	hitsound = list('sound/combat/hits/bladed/genchop (1).ogg', 'sound/combat/hits/bladed/genchop (2).ogg', 'sound/combat/hits/bladed/genchop (3).ogg')
	penfactor = 30
	chargetime = 1.5
	damfactor = 1.2
	swingdelay = 2
	misscost = 20
	warnie = "mobwarning"
