/datum/migrant_wave/heartfelt
	name = "The Court of Heartfelt"
	max_spawns = 1
	shared_wave_type = /datum/migrant_wave/heartfelt
	weight = 50
	downgrade_wave = /datum/migrant_wave/heartfelt_down_one
	roles = list(
		/datum/migrant_role/heartfelt/lord = 1,
		/datum/migrant_role/heartfelt/lady = 1,
		/datum/migrant_role/heartfelt/hand = 1,
		/datum/migrant_role/heartfelt/knight = 1,
		/datum/migrant_role/heartfelt/magos = 1,
		/datum/migrant_role/heartfelt/prior = 1,
	)
	greet_text = "Спасаясь от катастрофы, вы собрались вместе, кто остался из придворных, объединившись в последней попытке восстановить былую славу и обещания Хартфелта.\
	Держитесь ближе и берегите друг друга, ради всех вас!"

/datum/migrant_wave/heartfelt_down_one
	name = "The Court of Heartfelt"
	shared_wave_type = /datum/migrant_wave/heartfelt
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/heartfelt_down_two
	roles = list(
		/datum/migrant_role/heartfelt/lord = 1,
		/datum/migrant_role/heartfelt/hand = 1,
		/datum/migrant_role/heartfelt/knight = 1,
		/datum/migrant_role/heartfelt/magos = 1,
		/datum/migrant_role/heartfelt/prior = 1,
	)
	greet_text = "Спасаясь от катастрофы, вы собрались вместе, кто остался из придворных, объединившись в последней попытке восстановить былую славу и обещания Хартфелта.\
	Держитесь ближе и берегите друг друга, ради всех вас! Некоторые из вас уже не успели добраться сюда..."

/datum/migrant_wave/heartfelt_down_two
	name = "The Court of Heartfelt"
	shared_wave_type = /datum/migrant_wave/heartfelt
	can_roll = FALSE
	downgrade_wave = /datum/migrant_wave/heartfelt_down_three
	roles = list(
		/datum/migrant_role/heartfelt/lord = 1,
		/datum/migrant_role/heartfelt/hand = 1,
		/datum/migrant_role/heartfelt/knight = 1,
		/datum/migrant_role/heartfelt/magos = 1,
	)
	greet_text = "Спасаясь от катастрофы, вы собрались вместе, кто остался из придворных, объединившись в последней попытке восстановить былую славу и обещания Хартфелта. \
	Держитесь ближе и берегите друг друга, ради всех вас! Некоторые из вас уже не успели добраться сюда..."


/datum/migrant_wave/heartfelt_down_three
	name = "The Court of Heartfelt"
	shared_wave_type = /datum/migrant_wave/heartfelt
	can_roll = FALSE
	roles = list(
		/datum/migrant_role/heartfelt/lord = 1,
		/datum/migrant_role/heartfelt/knight = 1,
		/datum/migrant_role/heartfelt/hand = 1,
	)
	greet_text = "Спасаясь от катастрофы, вы собрались вместе, кто остался из придворных, объединившись в последней попытке восстановить былую славу и обещания Хартфелта.\
	Держитесь ближе и берегите друг друга, ради всех вас! Некоторые из вас уже не успели добраться сюда..."
