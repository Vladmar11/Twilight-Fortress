/obj/item/signal_horn
	name = "сигнальный рог"
	desc = "Используется для сбора войск и подачи сигналов тревоги."
	icon = 'icons/roguetown/items/misc.dmi'
	icon_state = "signal_horn"
	slot_flags = ITEM_SLOT_HIP|ITEM_SLOT_NECK
	w_class = WEIGHT_CLASS_NORMAL
	var/last_horn


	grid_height = 32
	grid_width = 64

/obj/item/signal_horn/attack_self(mob/living/user)
	. = ..()
	if(world.time < last_horn + 30 SECONDS)
		to_chat(user, "Мои легкие должны отдохнуть, прежде чем я смогу дуть в [src]!")
		return
	user.visible_message("<span class='warning'>[user] вот-вот дунет в [src]!</span>")
	if(do_after(user, 15))
		last_horn = world.time
		sound_horn(user)

/obj/item/signal_horn/proc/sound_horn(mob/living/user)
	user.visible_message("<span class='warning'>[user] дует в рог!</span>")
	playsound(src, 'sound/items/signalhorn.ogg', 100, TRUE)
	var/turf/origin_turf = get_turf(src)

	for(var/mob/living/player in GLOB.player_list)
		if(player.stat == DEAD)
			continue
		if(isbrain(player))
			continue

		var/distance = get_dist(player, origin_turf)
		if(distance <= 7)
			continue
		var/dirtext = " к "
		var/direction = get_dir(player, origin_turf)
		switch(direction)
			if(NORTH)
				dirtext += "северу"
			if(SOUTH)
				dirtext += "югу"
			if(EAST)
				dirtext += "востоку"
			if(WEST)
				dirtext += "западу"
			if(NORTHWEST)
				dirtext += "северозападу"
			if(NORTHEAST)
				dirtext += "северовостоку"
			if(SOUTHWEST)
				dirtext += "югозападу"
			if(SOUTHEAST)
				dirtext += "юговостоку"
			else //Where ARE you.
				dirtext = ", но я не могу определить, откуда он раздался"
		var/disttext
		switch(distance)
			if(0 to 20)
				disttext = " очень близко"
			if(20 to 40)
				disttext = " близко"
			if(40 to 80)
				disttext = ""
			if(80 to 160)
				disttext = " далеко"
			else
				disttext = " очень далеко"

		//sound played for other players
		player.playsound_local(get_turf(player), 'sound/items/signalhorn.ogg', 35, FALSE, pressure_affected = FALSE)
		to_chat(player, "<span class='warning'>Я слышу рёв сигнального рога где-то[disttext][dirtext]!</span>")
