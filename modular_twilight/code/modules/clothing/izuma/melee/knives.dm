//All the items in this folder and its subdirectories are licensed under a proprietary agreement between client: [Vladmar] and artist: [SayonaraEcho].

//Redistribution, reproduction, or modification of these assets is prohibited without express permission from both licensors. 
//These assets are for use solely within this project and may not be extracted or repurposed for other projects or commercial use.


/obj/item/rogueweapon/huntingknife/kunai //Practically a villager knife with more utility. It helps others to climb walls.
	name = "кунай"
	desc = "Простое колющее оружие из железа, которое возникло как инструмент для кладки или садоводства, полезный для лазания по стенам, подобно питонам."
	icon = 'modular_twilight/icons/roguetown/weapons/32.dmi'
	icon_state = "kunai"
	force = 8

/obj/item/rogueweapon/knife/kaiken
	name = "железный кайкен"
	desc = "Это оружие когда-то было запрещено в Изуме, однако времена меняются."
	icon = 'modular_twilight/icons/roguetown/weapons/32.dmi'
	icon_state = "kaiken"
	possible_item_intents = list(/datum/intent/dagger/thrust, /datum/intent/dagger/cut)
	force = 12
	smeltresult = /obj/item/ingot/iron
	sellprice = 15

/obj/item/rogueweapon/huntingknife/idagger/tanto
	name = "стальной танто"
	desc = "Изначально танто был клинком-компаньоном тачи в дайсё самурая, но затем был заменен вакидзаси с переходом к пехотной тактике."
	icon = 'modular_twilight/icons/roguetown/weapons/32.dmi'
	icon_state = "tanto"
	possible_item_intents = list(/datum/intent/dagger/cut, /datum/intent/dagger/thrust, /datum/intent/dagger/chop)
	force = 15
	smeltresult = /obj/item/ingot/steel
	wdefense = 3
	wbalance = 1
	sellprice = 20

/obj/item/rogueweapon/huntingknife/sai //I love gundam for helping me on my request on this sai. I love HIM!!!!!!!!!!!!! -Monochrome
	name = "сай"
	desc = "Узнаваемый по своей уникальности и обычно носимый в паре, саи имеет остроконечный центральный стержень с двумя зубцами на поперечных гардах. \
	У него нет лезвия для рубки, но он отлично подходит для нанесения ударов и защиты от других видов оружия."
	icon = 'modular_twilight/icons/roguetown/weapons/32.dmi'
	icon_state = "sai"
	possible_item_intents = list(/datum/intent/dagger/thrust,/datum/intent/dagger/thrust/pick)
	w_class = WEIGHT_CLASS_NORMAL
	smeltresult = /obj/item/ingot/steel
	force = 12
	wdefense = 5
