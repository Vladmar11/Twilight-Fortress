///Splashing blood makes a tiny bit of this
/datum/pollutant/metallic_scent
	name = "Металлический запах"
	pollutant_flags = POLLUTANT_SMELL
	smell_intensity = 1
	descriptor = "аромат"
	scent = "чего-то металлического"

/datum/pollutant/rot
	name = "Гнилой запах"
	pollutant_flags = POLLUTANT_SMELL
	smell_intensity = 1
	descriptor = "гнилостный запах"
	scent = "чего-то разложившегося"
	color = "#76b418"

/datum/pollutant/rot/breathe_act(mob/living/carbon/victim, amount)
	. = ..()
	victim.reagents.add_reagent(/datum/reagent/miasmagas , 1)
