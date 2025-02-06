
/datum/charflaw/limbloss
	var/lost_zone

/datum/charflaw/limbloss/on_mob_creation(mob/user)
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/H = user
	var/obj/item/bodypart/O = H.get_bodypart(lost_zone)
	if(O)
		O.drop_limb()
		qdel(O)
	return

/datum/charflaw/limbloss/arm_r
	name = "Деревянная рука (Правая)"
	desc = "Я давно потерял правую руку, зато деревянный протез не кровоточит. Но эта стерва так легко воспламеняется..."
	lost_zone = BODY_ZONE_R_ARM

/datum/charflaw/limbloss/arm_r/on_mob_creation(mob/user)
	..()
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/H = user
	var/obj/item/bodypart/r_arm/prosthetic/wood/L = new()
	L.attach_limb(H)

/datum/charflaw/limbloss/arm_l
	name = "Деревянная рука (Левая)"
	desc = "Я давно потерял левую руку, зато деревянный протез не кровоточит. Но эта стерва так легко воспламеняется..."
	lost_zone = BODY_ZONE_L_ARM

/datum/charflaw/limbloss/arm_l/on_mob_creation(mob/user)
	..()
	if(!ishuman(user))
		return
	var/mob/living/carbon/human/H = user
	var/obj/item/bodypart/l_arm/prosthetic/wood/L = new()
	L.attach_limb(H)
