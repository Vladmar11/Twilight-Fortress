/*!
This subsystem mostly exists to populate and manage the skill singletons.
*/

SUBSYSTEM_DEF(skills)
	name = "Skills"
	flags = SS_NO_FIRE
	init_order = INIT_ORDER_SKILLS
	///Dictionary of skill.type || skill ref
	var/list/all_skills = list()
	///Static assoc list of levels (ints) - strings
	var/static/list/level_names = list(
		SKILL_LEVEL_NOVICE = span_info("<span class='small'>Новичок</span>"), 
		SKILL_LEVEL_APPRENTICE = span_info("Ученик"), 
		SKILL_LEVEL_JOURNEYMAN = span_biginfo("Умелец"), 
		SKILL_LEVEL_EXPERT = span_biginfo("Профессионал"), 
		SKILL_LEVEL_MASTER = "<b>Мастер</b>", 
		SKILL_LEVEL_LEGENDARY = span_greentext("<b>ЛЕГЕНДА</b>"),
	)//This list is already in the right order, due to indexing

/datum/controller/subsystem/skills/Initialize(timeofday)
	InitializeSkills()
	return ..()

///Ran on initialize, populates the skills dictionary
/datum/controller/subsystem/skills/proc/InitializeSkills(timeofday)
	for(var/type in typesof(/datum/skill))
		if(is_abstract(type))
			continue
		var/datum/skill/ref = new type
		all_skills[type] = ref
