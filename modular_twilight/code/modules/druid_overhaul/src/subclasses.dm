#define CTAG_DRUIDS "CAT_DRUIDS"


/datum/outfit/job/roguetown/druid_twilight
	mask = /obj/item/clothing/mask/rogue/briar_mask
	neck = /obj/item/clothing/neck/roguetown/psicross/dendor
	armor = /obj/item/clothing/suit/roguetown/shirt/robe/dendor


/datum/job/roguetown/druid
	subclass_cat_rolls = list(CTAG_DRUIDS = 20)
	outfit = /datum/outfit/job/roguetown/druid_twilight

/datum/job/roguetown/druid/after_spawn(mob/living/L, mob/M, latejoin = TRUE)
	..()
	if(L)
		var/mob/living/carbon/human/druid = L
		druid.advsetup = 1
		druid.invisibility = INVISIBILITY_MAXIMUM
		druid.become_blind("advsetup")

/datum/subclass/wild_heart_trail_druid
	name = "Тропа дикого серцда"
	tutorial = "Говорят, что сердца таят в себе некую силу, которую заложил Дендор, дикий бог, когда \
	ступал по выбранной тобой тропе. Твое сердце бьется как зверь, и когда придет нужный час - \
	ты обрушишь его ярость на недругов!"
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_VERY_SHUNNED_UP
	category_tags = list(CTAG_DRUIDS)
	outfit = /datum/outfit/job/roguetown/druid/wild_heart_trail_druid
	torch = FALSE

/datum/subclass/blooming_trail_druid
	name = "Тропа цветущей жизни"
	tutorial = "Когда-то Дендор, лесной бог, ступал по выбранной тобой тропе, оставляя за собой \
	следы в виде растущих деревьев, кустов и цветов. Слушай сердцебиение земли, изучай цветующие дары, \
	поддерживай Рощу в здравии."
	allowed_sexes = list(MALE, FEMALE)
	allowed_races = RACES_VERY_SHUNNED_UP
	category_tags = list(CTAG_DRUIDS)
	outfit = /datum/outfit/job/roguetown/druid/blooming_trail_druid
	torch = FALSE

/datum/outfit/job/roguetown/druid/wild_heart_trail_druid/pre_equip(mob/living/carbon/human/druid)
	..()
	druid.change_stat("intelligence", -1)
	druid.change_stat("strength", 1)
	if(druid.mind)
		druid.mind.AddSpell(new /obj/effect/proc_holder/spell/self/beast_rage)
		druid.mind.AddSpell(new /obj/effect/proc_holder/spell/self/beast_claws)

/datum/outfit/job/roguetown/druid/blooming_trail_druid/pre_equip(mob/living/carbon/human/druid)
	..()
	if(druid.mind)
		druid.mind.AddSpell(new /obj/effect/proc_holder/spell/targeted/create_seed)
		druid.mind.AddSpell(new /obj/effect/proc_holder/spell/invoked/wood_skin)
