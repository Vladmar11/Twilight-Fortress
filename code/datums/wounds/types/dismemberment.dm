/datum/wound/dismemberment
	name = "кровоточащая культя"
	check_name = span_danger("<B>КУЛЬТЯ</B>")
	severity = WOUND_SEVERITY_CRITICAL
	whp = 75
	sewn_whp = 25
	bleed_rate = 25
	sewn_bleed_rate = 0.25
	clotting_threshold = null
	sewn_clotting_threshold = null
	woundpain = 100
	sewn_woundpain = 20
	sew_threshold = 100 //absolutely awful to sew up
	mob_overlay = "dis_head"
	can_sew = TRUE
	can_cauterize = TRUE
	critical = TRUE
	sleep_healing = 0

/datum/wound/dismemberment/can_stack_with(datum/wound/other)
	if(istype(other, /datum/wound/dismemberment) && (type == other.type))
		return FALSE
	return TRUE

/datum/wound/dismemberment/head
	name = "обезглавливание"
	check_name = span_danger("<B>КУЛЬТЯ: ШЕЯ</B>")
	mob_overlay = "dis_head"

/datum/wound/dismemberment/r_arm
	name = "отсечение правой руки"
	check_name = span_danger("<B>КУЛЬТЯ: ПРАВАЯ РУКА</B>")
	mob_overlay = "dis_ra"

/datum/wound/dismemberment/l_arm
	name = "отсечение левой руки"
	check_name = span_danger("<B>КУЛЬТЯ: ЛЕВАЯ РУКА</B>")
	mob_overlay = "dis_la"

/datum/wound/dismemberment/r_leg
	name = "отсечение правой ноги"
	check_name = span_danger("<B>КУЛЬТЯ: ПРАВАЯ НОГА</B>")
	mob_overlay = "dis_rl"

/datum/wound/dismemberment/l_leg
	name = "отсечение левой ноги"
	check_name = span_danger("<B>КУЛЬТЯ: ЛЕВАЯ НОГА</B>")
	mob_overlay = "dis_ll"
