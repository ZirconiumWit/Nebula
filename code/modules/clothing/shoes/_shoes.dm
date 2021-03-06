/obj/item/clothing/shoes
	name = "shoes"
	icon = 'icons/obj/clothing/obj_feet.dmi'
	desc = "Comfortable-looking shoes."
	gender = PLURAL
	siemens_coefficient = 0.9
	body_parts_covered = FEET
	slot_flags = SLOT_FEET
	permeability_coefficient = 0.50
	force = 2
	blood_overlay_type = "shoeblood"
	var/overshoes = 0
	var/can_add_cuffs = TRUE
	var/obj/item/handcuffs/attached_cuffs = null
	var/can_add_hidden_item = TRUE
	var/hidden_item_max_w_class = ITEM_SIZE_SMALL
	var/obj/item/hidden_item = null

/obj/item/clothing/shoes/Destroy()
	. = ..()
	if (hidden_item)
		QDEL_NULL(hidden_item)
	if (attached_cuffs)
		QDEL_NULL(attached_cuffs)

/obj/item/clothing/shoes/examine(mob/user)
	. = ..()
	if (attached_cuffs)
		to_chat(user, SPAN_WARNING("They are connected by \the [attached_cuffs]."))
	if (hidden_item)
		if (loc == user)
			to_chat(user, SPAN_ITALIC("\An [hidden_item] is inside."))
		else if (get_dist(src, user) == 1)
			to_chat(user, SPAN_ITALIC("Something is hidden inside."))

/obj/item/clothing/shoes/attack_hand(var/mob/living/user)
	if (remove_hidden(user))
		return
	..()

/obj/item/clothing/shoes/attack_self(var/mob/user)
	remove_cuffs(user)
	..()

/obj/item/clothing/shoes/attackby(var/obj/item/I, var/mob/user)
	if (istype(I, /obj/item/handcuffs))
		add_cuffs(I, user)
		return
	else
		add_hidden(I, user)
		return
	. = ..()

/obj/item/clothing/shoes/proc/add_cuffs(var/obj/item/handcuffs/cuffs, var/mob/user)
	if (!can_add_cuffs)
		to_chat(user, SPAN_WARNING("\The [cuffs] can't be attached to \the [src]."))
		return
	if (attached_cuffs)
		to_chat(user, SPAN_WARNING("\The [src] already has [attached_cuffs] attached."))
		return
	if (do_after(user, 5 SECONDS))
		if(!user.unEquip(cuffs, src))
			return
		user.visible_message(SPAN_ITALIC("\The [user] attaches \the [cuffs] to \the [src]."), range = 2)
		verbs |= /obj/item/clothing/shoes/proc/remove_cuffs
		slowdown_per_slot[slot_shoes] += cuffs.elastic ? 10 : 15
		attached_cuffs = cuffs

/obj/item/clothing/shoes/proc/remove_cuffs(var/mob/user)
	set name = "Remove Shoe Cuffs"
	set desc = "Get rid of those limiters and lengthen your stride."
	set category = "Object"
	set src in usr

	user = user || usr
	if (!user)
		return
	if (!attached_cuffs)
		return
	if (user.incapacitated())
		return
	if (do_after(user, 5 SECONDS))
		if (!user.put_in_hands(attached_cuffs))
			to_chat(usr, SPAN_WARNING("You need an empty, unbroken hand to remove the [attached_cuffs] from the [src]."))
			return
		user.visible_message(SPAN_ITALIC("\The [user] removes \the [attached_cuffs] from \the [src]."), range = 2)
		attached_cuffs.add_fingerprint(user)
		slowdown_per_slot[slot_shoes] -= attached_cuffs.elastic ? 10 : 15
		verbs -= /obj/item/clothing/shoes/proc/remove_cuffs
		attached_cuffs = null

/obj/item/clothing/shoes/proc/add_hidden(var/obj/item/I, var/mob/user)
	if (!can_add_hidden_item)
		to_chat(user, SPAN_WARNING("\The [src] can't hold anything."))
		return
	if (hidden_item)
		to_chat(user, SPAN_WARNING("\The [src] already holds \an [hidden_item]."))
		return
	if (!(I.item_flags & ITEM_FLAG_CAN_HIDE_IN_SHOES) || (I.slot_flags & SLOT_DENYPOCKET))
		to_chat(user, SPAN_WARNING("\The [src] can't hold the [I]."))
		return
	if (I.w_class > hidden_item_max_w_class)
		to_chat(user, SPAN_WARNING("\The [I] is too large to fit in the [src]."))
		return
	if (do_after(user, 1 SECONDS))
		if(!user.unEquip(I, src))
			return
		user.visible_message(SPAN_ITALIC("\The [user] shoves \the [I] into \the [src]."), range = 1)
		verbs |= /obj/item/clothing/shoes/proc/remove_hidden
		hidden_item = I

/obj/item/clothing/shoes/proc/remove_hidden(var/mob/user)
	set name = "Remove Shoe Item"
	set desc = "Pull out whatever's hidden in your foot gloves."
	set category = "Object"
	set src in usr

	user = user || usr
	if (!user)
		return
	if (!hidden_item)
		return FALSE
	if (user.incapacitated())
		return FALSE
	if (loc != user)
		return FALSE
	if (do_after(user, 2 SECONDS))
		if (!user.put_in_hands(hidden_item))
			to_chat(usr, SPAN_WARNING("You need an empty, unbroken hand to pull the [hidden_item] from the [src]."))
			return TRUE
		user.visible_message(SPAN_ITALIC("\The [user] pulls \the [hidden_item] from \the [src]."), range = 1)
		playsound(get_turf(src), 'sound/effects/holster/tactiholsterout.ogg', 25)
		verbs -= /obj/item/clothing/shoes/proc/remove_hidden
		hidden_item = null
	return TRUE

/obj/item/clothing/shoes/proc/handle_movement(var/turf/walking, var/running)
	if (attached_cuffs && running)
		if (attached_cuffs.health)
			attached_cuffs.health -= 1
			if (attached_cuffs.health < 1)
				visible_message(SPAN_WARNING("\The [attached_cuffs] attached to \the [src] snap and fall away!"), range = 1)
				verbs -= /obj/item/clothing/shoes/proc/remove_cuffs
				slowdown_per_slot[slot_shoes] -= attached_cuffs.elastic ? 10 : 15
				QDEL_NULL(attached_cuffs)
	return

/obj/item/clothing/shoes/update_clothing_icon()
	if (ismob(src.loc))
		var/mob/M = src.loc
		M.update_inv_shoes()