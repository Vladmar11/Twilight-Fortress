//Love potion - Charged Pink
/obj/item/lovepotion
	name = "любовное снадобье"
	desc = "Розовое зелье со слабым сладковатым фруктовым ароматом, исходящим из флакона. На этикетке написано 'Любовное зелье. Заставит желать вас практически любого'..."
	icon = 'icons/roguetown/items/cooking.dmi'
	icon_state = "lovebottle"

	grid_height = 64
	grid_width = 32

/obj/item/lovepotion/attack(mob/living/carbon/human/M, mob/user)
	if(!isliving(M) || M.stat == DEAD)
		to_chat(user, span_warning("Любовное зелье может усваиваться только живыми существами. Лучше не тратить его зря!"))
		return ..()
	if(user == M)
		to_chat(user, span_warning("Слишком опасно принимать это зелье самому. Я должен напоить им того, кого захочу!"))
		return ..()
	if(M.has_status_effect(STATUS_EFFECT_INLOVE))
		to_chat(user, span_warning("[M] уже под одержимостью кем-то другим!"))
		return ..()

	M.visible_message(span_danger("[user] поит [M] любовным зельем!"),
		span_danger("[user] поит вас любовным зельем!"))

	if(!do_after(user, 50, target = M))
		return
	to_chat(user, span_notice("Я напоил [M] любовным зельем!"))
	to_chat(M, span_notice("Я чувствую вкус клубники, пока зелье льется мне в горло. Мое сердце колотится в груди, а разум затуманивается мыслями о [user]. Будь то настоящая любовь или одержимость, не имеет значения. Поскольку у меня есть [user]."))
	if(M.mind)
		M.mind.store_memory("Вы одержимы близостью к [user].")
	M.faction |= "[REF(user)]"
	M.apply_status_effect(STATUS_EFFECT_INLOVE, user)
	qdel(src)
