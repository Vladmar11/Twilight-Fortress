/datum/intent/flail/strike/ranged/smash
	name = "smash"
	chargetime = 5
	no_early_release = TRUE
	penfactor = 80
	recovery = 10
	damfactor = 1.2
	chargedloop = /datum/looping_sound/flailswing
	keep_looping = TRUE
	icon_state = "insmash"
	blade_class = BCLASS_SMASH
	attack_verb = list("smashes")
	hitsound = list('sound/combat/hits/blunt/flailhit.ogg')
	misscost = 10

/datum/intent/flail/strike/ranged
	name = "strike"
	blade_class = BCLASS_BLUNT
	attack_verb = list("strikes", "hits")
	hitsound = list('sound/combat/hits/blunt/flailhit.ogg')
	swingdelay = 5
	penfactor = 5
	icon_state = "instrike"
	misscost = 5
	reach = 2
	recovery = 10
	chargedloop = /datum/looping_sound/flailswing
	keep_looping = TRUE
	chargetime = 10
	no_early_release = TRUE

/datum/intent/flail/cut
	name = "cut"
	blade_class = BCLASS_CUT
	attack_verb = list("cuts", "slashes")
	hitsound = list('sound/combat/hits/blunt/flailhit.ogg')
	swingdelay = 5
	penfactor = 20
	icon_state = "incut"
	misscost = 5
	reach = 2
	recovery = 10
	chargedloop = /datum/looping_sound/flailswing
	keep_looping = TRUE
	chargetime = 5
	no_early_release = TRUE

/datum/intent/flail/cut/chop
	name = "chop"
	chargetime = 5
	no_early_release = TRUE
	penfactor = 60
	recovery = 10
	damfactor = 1.2
	chargedloop = /datum/looping_sound/flailswing
	keep_looping = TRUE
	icon_state = "inchop"
	blade_class = BCLASS_CHOP
	attack_verb = list("chops")
	hitsound = list('sound/combat/hits/blunt/flailhit.ogg')
	misscost = 10
	chargetime = 10

/datum/intent/flail/strike/smash
	name = "smash"
	chargetime = 5
	no_early_release = TRUE
	penfactor = 80
	recovery = 10
	damfactor = 1.2
	chargedloop = /datum/looping_sound/flailswing
	keep_looping = TRUE
	icon_state = "insmash"
	blade_class = BCLASS_SMASH
	attack_verb = list("smashes")
	hitsound = list('sound/combat/hits/blunt/flailhit.ogg')
	misscost = 5

/obj/item/rogueweapon/flail/sflail/kusarifundo
	name = "кусари-фундо"
	icon = 'modular_twilight/icons/roguetown/weapons/32.dmi'
	desc = "Пара тяжелых стальных гирь, соединенных длинной цепью. Изначально это было оружие самообороны во смутные времена, \
	когда железо было на исходе, поэтому в качестве утяжелителя использовались свинцовые шарики."
	icon_state = "kusarifundo"

/obj/item/rogueweapon/flail/nunchaku
	force = 20
	w_class = WEIGHT_CLASS_SMALL
	name = "нунчаки"
	icon = 'modular_twilight/icons/roguetown/weapons/32.dmi'
	desc = "Пара деревянных прутьев, соединенных короткой цепью, предназначенных для маскировки и часто используемых изуминскими пахарями \
	- там, где мечи были только у самураев."
	icon_state = "nunchaku"

/obj/item/rogueweapon/flail/kusarigama
	force = 15
	possible_item_intents = list(/datum/intent/flail/strike/ranged, /datum/intent/flail/strike/ranged/smash, /datum/intent/flail/cut, /datum/intent/flail/cut/chop)
	name = "кусаригама"
	desc = "Рукоять с серповидным лезвием, украшенная цепью, заканчивающейся шипом. Универсальное оружие, приспособленное для поражения врагов с мечами."
	icon_state = "kusarigama"
	icon = 'modular_twilight/icons/roguetown/weapons/32.dmi'
	sharpness = IS_SHARP
	wlength = WLENGTH_NORMAL
	w_class = WEIGHT_CLASS_NORMAL
	slot_flags = ITEM_SLOT_HIP
	blade_dulling = DULLING_BASHCHOP
	associated_skill = /datum/skill/combat/whipsflails
	smeltresult = /obj/item/ingot/steel
	parrysound = list('sound/combat/parry/parrygen.ogg')
	swingsound = BLUNTWOOSH_MED

/obj/item/rogueweapon/flail/kusarigama/peasant
	force = 10
	name = "handmade kusarigama"
	desc = "A handle with a sickle-like blade and a chain with spiked ball, quickly assembled from an actual plowmen's sickle - it is clearly homemade."
	icon_state = "kusarigama_homemade"
	smeltresult = /obj/item/ingot/iron
