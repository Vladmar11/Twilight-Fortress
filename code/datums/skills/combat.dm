/datum/skill/combat
	abstract_type = /datum/skill/combat
	name = "Combat"
	desc = ""
	dream_cost_base = 2
	dream_cost_per_level = 1

/datum/skill/combat/proc/get_skill_parry_modifier(level) //added parry drain/neg in parries and dodges
	switch(level)
		if(SKILL_LEVEL_NONE)
			return 0
		if(SKILL_LEVEL_NOVICE)
			return 5
		if(SKILL_LEVEL_APPRENTICE)
			return 10
		if(SKILL_LEVEL_JOURNEYMAN)
			return 15
		if(SKILL_LEVEL_EXPERT)
			return 20
		if(SKILL_LEVEL_MASTER)
			return 25
		if(SKILL_LEVEL_LEGENDARY)
			return 35

/datum/skill/combat/proc/get_skill_dodge_drain(level) //added parry drain/neg in parries and dodges
	switch(level)
		if(SKILL_LEVEL_NONE)
			return 30
		if(SKILL_LEVEL_NOVICE)
			return 60
		if(SKILL_LEVEL_APPRENTICE)
			return 90
		if(SKILL_LEVEL_JOURNEYMAN)
			return 120
		if(SKILL_LEVEL_EXPERT)
			return 180
		if(SKILL_LEVEL_MASTER)
			return 240
		if(SKILL_LEVEL_LEGENDARY)
			return 300

/datum/skill/combat/knives
	name = "Ножи"
	dreams = list(
		"...ваше сердце бьется так же быстро, как ваши удары ножом достигают их ног, паха и выше. Вы бросаете кинжалы и окольным движением сбиваете недруга с пола под ноги тех, кто пытается увернуться и парировать, застав их врасплох. Как раз в нужный момент, вы атакуете их напрямую. Удары проходят, пока они не успевают от их уклоняться, медленно истекая кровью сквозь сколы в броне и дыша все медленнее. Они пытаются парировать, что еще хуже для них - вы исполняете финт, обнажая защиту противника, чтобы обрушить ярость своих ударов сквозь их кожаные доспехи, прежде чем перевернуть нож в руке, чтобы начать пробивать как кольчугу, так и пластинчатые доспехи, полностью игнорируя вражескую защиту. С вашей стремительностью, легкостью и точностью, у них нет шансов противостоять вашей быстрой и коварной мощи..."
	)

/datum/skill/combat/swords
	name = "Мечи"
	dreams = list(
		"...сердце бешено бьется, когда ваши мечи звенят друг о друга, вы парируете удар противника и добиваете его решающим выпадом..."
	)

/datum/skill/combat/polearms
	name = "Древковое"
	dreams = list(
		"...the air blows against your body in the open field, as your opponent's whole body is at range with the polearm's great length, regaining your focus you'd start to pull the polearm with a firm grip to ready up for a proper instead of a half-hearted hasty half-forced strike and thrusting it forth, keeping your opponent at a distance, striking where they move or at when close and with proper precision when they're at range, with double the said range came the advantage when chasing and tactically falling back from them, piercing through padded-cloth and leather armor like they were nothing with the spear, throwing it towards someone unarmored before rolling towards an heavier polearm and reaching for the heavens and with the added polearm range unleashed a slow but crashing blow through that plated armor making them scream for pain and slowly crawl towards and away, never being able to reach you back until they were properly subdued..."
	)

/datum/skill/combat/maces
	name = "Булавы"
	dreams = list(
		"...булавы, булавы, булавы, они повсюду, наносят медленные удары или же мощный, заряженный удар, чтобы полностью пробить защиту, оглушая недруга на короткое время, а затем ошеломляя, делать их отступление или отчаянное наступление еще более чем бесполезными, разбивая их, когда они сломлены, и из-за этого они слишком смиренны, чтобы стоять на ногах. Какое забавное зрелище..."
	)

/datum/skill/combat/axes
	name = "Топоры"
	dreams = list(
		"...берете случайный топор, используете его, чтобы резать и рубить, почувствовать его и, наконец, осознаете, что он неплохо управляется и одной рукой, практически не добавляя веса при использовании, будь то перед вами железный или стальной. Пока дело не доходит до боевого топора, и все меняется. Очень громоздкое оружие, чтобы держать его в одной руке, но с уверенной хваткой двумя им можно прорубать конечности так же хорошо, как разбивать щиты на щепки и сгибать латы одни за другими, доставая до ног, паха и выше. Какая удобная штука, чтобы поднять острую тему..."
	)

/datum/skill/combat/whipsflails
	name = "Кнуты и цепы"
	dreams = list(
		"..."
	)

/datum/skill/combat/bows
	name = "Луки"
	dreams = list(
		"..вы стоите в чистом поле, держа на прицеле соломенную мишень. Достаете рукой в кожаной перчатке стрелу из колчана, прикладываете поудобнее, прицеливаетесь, выпускаете в цель и...  промахиваетесь. Этот цикл продолжается некоторое время, пока вы не прицелились как следует, а мышцы не окрепли, что облегчило натягивание лука. Навыки постепенно совершенствуются, помогая в выполнении поставленной задачи, а на ум приходит новый трюк - отвести руку назад и схватить стрелу, рукой удерживая лук, чтобы натянуть его в воздухе, прежде чем прицелиться как следует. Наклонить голову, прищурить глаз, сделать глубокий вдох и, наконец, выпустить стрелу в свободный полет. В яблочко, однако вы тут же хотите убежать от сильно ругающегося садовника..."
	)

/datum/skill/combat/crossbows
	name = "Арбалеты"
	dreams = list(
		"..."
	)

/datum/skill/combat/wrestling
	name = "Борьба"
	dreams = list(
		"..."
	)

/datum/skill/combat/unarmed
	name = "Кулачный бой"
	dreams = list(
		"..твое тело в синяках, дыхание затруднено, но твои закаленные кулаки и голени отказываются сдаваться, переходя к активным действиям, нанося яростные удары от паха до макушки, которыми удалось сломать несколько костей, прежде чем нанести решающий нокаут. Тут же последовал мощный удар, повредивший спину. Переводя свои усилия на другого противника, решаешь нанести заторможенный удар по незащищенной ноге, избегая ударов в шею и выше, до которых невозможно дотянуться, ударяешь одного о стену, другого - о стол, третьего - о несколько предметов, и четвертого - о пятого, начав давить так, что вывихнулась, а затем и раздробилась кость. Ты стоишь там, хватая ртом воздух, весь в синяках и побоях, но все же одержал победу..."
	)

/datum/skill/combat/firearms
	name = "Огнестрельное"
	dreams = list(
		"..."
	)
