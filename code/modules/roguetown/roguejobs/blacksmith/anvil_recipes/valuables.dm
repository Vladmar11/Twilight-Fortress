/datum/anvil_recipe/valuables
	i_type = "Ценности"
	appro_skill = /datum/skill/craft/blacksmithing
	skill_level = 2

/datum/anvil_recipe/valuables/special/ringf
	name = "Кольцо пламени (+1 Жир, +1 Камень, +1 Волокно)"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/ring/lantern
	additional_items = list(
		/obj/item/reagent_containers/food/snacks/fat,
		/obj/item/natural/stone,
		/obj/item/natural/fibers
		)

/datum/anvil_recipe/valuables/special/ringp
	name = "Кольцо благославления (+1 Псикросс)"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/clothing/ringP
	additional_items = list(
		/obj/item/clothing/neck/roguetown/psicross
		)

/datum/anvil_recipe/valuables/gold
	name = "Статуя"
	req_bar = /obj/item/ingot/gold
	created_item = /obj/item/roguestatue/gold

/datum/anvil_recipe/valuables/silver
	name = "Статуя"
	req_bar = /obj/item/ingot/silver
	created_item = /obj/item/roguestatue/silver

/datum/anvil_recipe/valuables/iron
	name = "Статуя"
	req_bar = /obj/item/ingot/iron
	created_item = /obj/item/roguestatue/iron

/datum/anvil_recipe/valuables/steel
	name = "Статуя"
	req_bar = /obj/item/ingot/steel
	created_item = /obj/item/roguestatue/steel

/*
/datum/anvil_recipe/valuables/eargol
	name = "gold earrings"
	req_bar = /obj/item/ingot/gold
	created_item = list(/obj/item/rogueacc/eargold,
						/obj/item/rogueacc/eargold,
						/obj/item/rogueacc/eargold)
	type = "Valuables"

/datum/anvil_recipe/valuables/earsil
	name = "silver earrings"
	req_bar = /obj/item/ingot/silver
	created_item = list(/obj/item/rogueacc/earsilver,
						/obj/item/rogueacc/earsilver,
						/obj/item/rogueacc/earsilver)*/
//	i_type = "Valuables"

/datum/anvil_recipe/valuables/gold/rings
	name = "Кольца 3x"
	req_bar = /obj/item/ingot/gold
	created_item = list(
		/obj/item/clothing/ring/gold, 
        /obj/item/clothing/ring/gold, 
        /obj/item/clothing/ring/gold
		)

/datum/anvil_recipe/valuables/silver/rings
	name = "Кольца 3x"
	req_bar = /obj/item/ingot/silver
	created_item = list(
		/obj/item/clothing/ring/silver, 
        /obj/item/clothing/ring/silver, 
        /obj/item/clothing/ring/silver
		)

/datum/anvil_recipe/valuables/copper/rings
	name = "Кольца 3x"
	req_bar = /obj/item/ingot/copper
	created_item = list(
		/obj/item/clothing/ring/copper, 
        /obj/item/clothing/ring/copper,
        /obj/item/clothing/ring/copper
		)

//Gold Rings
/datum/anvil_recipe/valuables/gold/emering
	name = "Изумрудное кольцо (+1 Изумруд)"
	req_bar = /obj/item/ingot/gold
	additional_items = list(/obj/item/roguegem/green)	
	created_item = /obj/item/clothing/ring/emerald

/datum/anvil_recipe/valuables/gold/ruby
	name = "Рубиновое кольцо (+1 Рубин)"
	req_bar = /obj/item/ingot/gold
	additional_items = list(/obj/item/roguegem)	
	created_item = /obj/item/clothing/ring/ruby

/datum/anvil_recipe/valuables/gold/topaz
	name = "Топазовое кольцо (+1 Топаз)"
	req_bar = /obj/item/ingot/gold
	additional_items = list(/obj/item/roguegem/yellow)	
	created_item = /obj/item/clothing/ring/topaz

/datum/anvil_recipe/valuables/gold/quartz
	name = "Кварцевое кольцо (+1 Кварц)"
	req_bar = /obj/item/ingot/gold
	additional_items = list(/obj/item/roguegem/blue)	
	created_item = /obj/item/clothing/ring/quartz

/datum/anvil_recipe/valuables/gold/sapphire
	name = "Сапфировое кольцо (+1 Сапфир)"
	req_bar = /obj/item/ingot/gold
	additional_items = list(/obj/item/roguegem/violet)	
	created_item = /obj/item/clothing/ring/sapphire

/datum/anvil_recipe/valuables/gold/diamond
	name = "Алмазное кольцо (+1 Алмаз)"
	req_bar = /obj/item/ingot/gold
	additional_items = list(/obj/item/roguegem/diamond)	
	created_item = /obj/item/clothing/ring/diamond

//Silver rings

/datum/anvil_recipe/valuables/silver/emering
	name = "Изумрудное кольцо (+1 Изумруд)"
	req_bar = /obj/item/ingot/silver
	additional_items = list(/obj/item/roguegem/green)	
	created_item = /obj/item/clothing/ring/emeralds

/datum/anvil_recipe/valuables/silver/ruby
	name = "Рубиновое кольцо (+1 Рубин)"
	req_bar = /obj/item/ingot/silver
	additional_items = list(/obj/item/roguegem)	
	created_item = /obj/item/clothing/ring/rubys

/datum/anvil_recipe/valuables/silver/topaz
	name = "Топазовое кольцо (+1 Топаз)"
	req_bar = /obj/item/ingot/silver
	additional_items = list(/obj/item/roguegem/yellow)	
	created_item = /obj/item/clothing/ring/topazs

/datum/anvil_recipe/valuables/silver/quartz
	name = "Кварцевое кольцо (+1 Кварц)"
	req_bar = /obj/item/ingot/silver
	additional_items = list(/obj/item/roguegem/blue)	
	created_item = /obj/item/clothing/ring/quartzs

/datum/anvil_recipe/valuables/silver/sapphire
	name = "Сапфировое кольцо (+1 Сапфир)"
	req_bar = /obj/item/ingot/silver
	additional_items = list(/obj/item/roguegem/violet)	
	created_item = /obj/item/clothing/ring/sapphires

/datum/anvil_recipe/valuables/silver/diamond
	name = "Алмазное кольцо (+1 Алмаз)"
	req_bar = /obj/item/ingot/silver
	additional_items = list(/obj/item/roguegem/diamond)	
	created_item = /obj/item/clothing/ring/diamonds

// Copper rings

/datum/anvil_recipe/valuables/copper/emering
	name = "Изумрудное кольцо (+1 Изумруд)"
	req_bar = /obj/item/ingot/copper
	additional_items = list(/obj/item/roguegem/green)	
	created_item = /obj/item/clothing/ring/emeraldc

/datum/anvil_recipe/valuables/copper/ruby
	name = "Рубиновое кольцо (+1 Рубин)"
	req_bar = /obj/item/ingot/copper
	additional_items = list(/obj/item/roguegem)	
	created_item = /obj/item/clothing/ring/rubyc

/datum/anvil_recipe/valuables/copper/topaz
	name = "Топазовое кольцо (+1 Топаз)"
	req_bar = /obj/item/ingot/copper
	additional_items = list(/obj/item/roguegem/yellow)	
	created_item = /obj/item/clothing/ring/topazc

/datum/anvil_recipe/valuables/copper/quartz
	name = "Кварцевое кольцо (+1 Кварц)"
	req_bar = /obj/item/ingot/copper
	additional_items = list(/obj/item/roguegem/blue)	
	created_item = /obj/item/clothing/ring/quartzc

/datum/anvil_recipe/valuables/copper/sapphire
	name = "Сапфировое кольцо (+1 Сапфир)"
	req_bar = /obj/item/ingot/copper
	additional_items = list(/obj/item/roguegem/violet)	
	created_item = /obj/item/clothing/ring/sapphirec

/datum/anvil_recipe/valuables/copper/diamond
	name = "Алмазное кольцо (+1 Алмаз)"
	req_bar = /obj/item/ingot/copper
	additional_items = list(/obj/item/roguegem/diamond)	
	created_item = /obj/item/clothing/ring/diamondc

/datum/anvil_recipe/valuables/dragon
	name = "Драконье кольцо (+ Секреты)"
	req_bar = /obj/item/ingot/steel
	additional_items = list(
			/obj/item/ingot/gold, 
			/obj/item/ingot/silver, 
			/obj/item/roguegem/blue, 
			/obj/item/roguegem/violet, 
			/obj/item/clothing/neck/roguetown/psicross
		)	
	created_item = /obj/item/clothing/ring/dragon_ring
