/obj/item/thermometer
	name = "термоскоп"
	desc = "спользуется для определения того, насколько горяч или холоден тот или иной предмет, но понять это сможет только алхимик."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "thermometer"
	item_state = "pen"
	lefthand_file = 'icons/mob/inhands/items_lefthand.dmi'
	righthand_file = 'icons/mob/inhands/items_righthand.dmi'
	w_class = WEIGHT_CLASS_TINY
	possible_item_intents = list(/datum/intent/use)

/obj/item/thermometer/attack_obj(obj/target, mob/living/user)
	if(target.is_open_container())
		if(user.mind.get_skill_level(/datum/skill/misc/treatment) < 1) //Show each individual reagent
			to_chat(user, span_warning("Я не умею пользоваться термоскопом..."))
			return
		if(!target.reagents.total_volume)
			to_chat(user, span_warning("В [target] ничего нет!"))
		if(user.mind.get_skill_level(/datum/skill/misc/treatment) <= 3)
			if(target.reagents.chem_temp >= 300)
				to_chat(user, span_notice("Температура смеси - где-то на [abs(round(target.reagents.chem_temp, 10) - 300)] градусов выше комнатной."))
			if(target.reagents.chem_temp < 300)
				to_chat(user, span_notice("Температура смеси - где-то на [abs(round(target.reagents.chem_temp, 10) - 300)] градусов ниже комнатной."))
		else
			if(target.reagents.chem_temp >= 300)
				to_chat(user, span_notice("Температура смеси - на [abs(target.reagents.chem_temp - 300)] градусов выше комнатной."))
			if(target.reagents.chem_temp < 300)
				to_chat(user, span_notice("Температура смеси - на [abs(target.reagents.chem_temp - 300)] градусов ниже комнатной."))
		return
	return
	
