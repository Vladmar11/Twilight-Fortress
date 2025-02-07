/obj/item/reagent_containers/glass/bottle/waterskin
	name = "бурдюк"
	desc = "Кожаный бурдюк для воды или вина. Пробка от него висит на коротком отрезке шпагата."
	icon_state = "waterskin"
	amount_per_transfer_from_this = 6
	possible_transfer_amounts = list(3,6,9)
	volume = 64
	dropshrink = 0.5
	sellprice = 5
	closed = FALSE
	slot_flags = ITEM_SLOT_HIP|ITEM_SLOT_NECK
	obj_flags = CAN_BE_HIT
	reagent_flags = OPENCONTAINER
	w_class =  WEIGHT_CLASS_SMALL
	drinksounds = list('sound/items/drink_bottle (1).ogg','sound/items/drink_bottle (2).ogg')
	fillsounds = list('sound/items/fillcup.ogg')
	poursounds = list('sound/items/fillbottle.ogg')
	sewrepair = TRUE

/obj/item/reagent_containers/glass/bottle/waterskin/rmb_self(mob/user)
	. = ..()
	closed = !closed
	user.changeNext_move(CLICK_CD_RAPID)
	if(closed)
		reagent_flags = TRANSPARENT
		reagents.flags = reagent_flags
		desc = "Кожаный бурдюк для воды или вина. Пробка плотно закрывает горлышко."
		spillable = FALSE
		to_chat(usr, span_notice("Вы запечатали бурдюк пробкой."))
	else
		reagent_flags = OPENCONTAINER
		reagents.flags = reagent_flags
		playsound(user.loc,'sound/items/uncork.ogg', 100, TRUE)
		desc = "Кожаный бурдюк с открытым горлышком для воды или вина. Пробка от него висит на коротком отрезке шпагата."
		spillable = TRUE
		to_chat(usr, span_notice("Вы сняли пробку с горлышка."))
	update_icon()
