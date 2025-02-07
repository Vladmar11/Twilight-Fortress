//All the items in this folder and its subdirectories are licensed under a proprietary agreement between client: [Vladmar] and artist: [SayonaraEcho].

//Redistribution, reproduction, or modification of these assets is prohibited without express permission from both licensors. 
//These assets are for use solely within this project and may not be extracted or repurposed for other projects or commercial use.

/datum/migrant_wave/izumawave
	name = "The Izuma Warriors"
	max_spawns = 1
	shared_wave_type = /datum/migrant_wave/izumawave
	weight = 50
	downgrade_wave = /datum/migrant_wave/izumawave_down_one
	
	roles = list(
		/datum/migrant_role/izumawave/samurai = 1,
		/datum/migrant_role/izumawave/acolyte = 1,
		/datum/migrant_role/izumawave/acigaruwave = 3,
	)
	greet_text = "Вы потерпели кораблекрушение на Туманных Островах из-за шторма во время дипломатической миссии, однако волны занесли вас на берега \
	Энигмы. Ваша команда уцелела, однако вам предстоит выжить и отыскать местное поселение. "

/datum/migrant_wave/izumawave_down_one
	name = "The Izuma Warriors"
	shared_wave_type = /datum/migrant_wave/izumawave
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/izumawave_down_two
	roles = list(
		/datum/migrant_role/izumawave/samurai = 1,
		/datum/migrant_role/izumawave/acolyte = 1,
		/datum/migrant_role/izumawave/acigaruwave = 2,
	)
	greet_text = "Вы потерпели кораблекрушение на Туманных Островах из-за шторма во время дипломатической миссии, однако волны занесли вас на берега \
	Энигмы. Ваша команда почти уцелела, однако вам предстоит выжить и отыскать местное поселение. "

/datum/migrant_wave/izumawave_down_two
	name = "The Izuma Warriors"
	shared_wave_type = /datum/migrant_wave/izumawave
	can_roll = FALSE
	roles = list(
		/datum/migrant_role/izumawave/samurai = 1,
		/datum/migrant_role/izumawave/acolyte = 1,
		/datum/migrant_role/izumawave/acigaruwave = 1,
	)
	greet_text = "Вы потерпели кораблекрушение на Туманных Островах из-за шторма во время дипломатической миссии, однако волны занесли вас на берега \
	Энигмы. Ваша команда почти уцелела, однако вам предстоит выжить и отыскать местное поселение. "
