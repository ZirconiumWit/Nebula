
////////////////////////////////////////////////////////////////////////////////
/// (Mixing)Glass.
////////////////////////////////////////////////////////////////////////////////
/obj/item/chems/glass
	name = " "
	var/base_name = " "
	desc = ""
	icon = 'icons/obj/chemical.dmi'
	icon_state = "null"
	item_state = "null"
	amount_per_transfer_from_this = 10
	possible_transfer_amounts = @"[5,10,15,25,30,60]"
	volume = 60
	w_class = ITEM_SIZE_SMALL
	atom_flags = ATOM_FLAG_OPEN_CONTAINER
	unacidable = 1 //glass doesn't dissolve in acid


	var/list/can_be_placed_into = list(
		/obj/machinery/chem_master/,
		/obj/machinery/chemical_dispenser,
		/obj/machinery/reagentgrinder,
		/obj/structure/table,
		/obj/structure/closet,
		/obj/structure/hygiene/sink,
		/obj/item/storage,
		/obj/item/grenade/chem_grenade,
		/mob/living/bot/medbot,
		/obj/item/storage/secure/safe,
		/obj/structure/iv_drip,
		/obj/machinery/disposal,
		/mob/living/simple_animal/cow,
		/mob/living/simple_animal/hostile/retaliate/goat,
		/obj/machinery/sleeper,
		/obj/machinery/smartfridge/,
		/obj/machinery/biogenerator,
		/obj/machinery/constructable_frame,
		/obj/machinery/radiocarbon_spectrometer
	)

/obj/item/chems/glass/Initialize()
	. = ..()
	base_name = name

/obj/item/chems/glass/examine(mob/user, distance)
	. = ..()
	if(distance > 2)
		return
	
	if(reagents && reagents.reagent_list.len)
		to_chat(user, "<span class='notice'>It contains [reagents.total_volume] units of liquid.</span>")
	else
		to_chat(user, "<span class='notice'>It is empty.</span>")
	if(!ATOM_IS_OPEN_CONTAINER(src))
		to_chat(user, "<span class='notice'>The airtight lid seals it completely.</span>")

/obj/item/chems/glass/attack_self()
	..()
	if(ATOM_IS_OPEN_CONTAINER(src))
		to_chat(usr, "<span class = 'notice'>You put the lid on \the [src].</span>")
		atom_flags ^= ATOM_FLAG_OPEN_CONTAINER
	else
		to_chat(usr, "<span class = 'notice'>You take the lid off \the [src].</span>")
		atom_flags |= ATOM_FLAG_OPEN_CONTAINER
	update_icon()

/obj/item/chems/glass/attack(mob/M, mob/user, def_zone)
	if(force && !(item_flags & ITEM_FLAG_NO_BLUDGEON) && user.a_intent == I_HURT)
		return	..()
	if(standard_feed_mob(user, M))
		return
	return 0

/obj/item/chems/glass/standard_feed_mob(var/mob/user, var/mob/target)
	if(!ATOM_IS_OPEN_CONTAINER(src))
		to_chat(user, "<span class='notice'>You need to open \the [src] first.</span>")
		return 1
	if(user.a_intent == I_HURT)
		return 1
	return ..()

/obj/item/chems/glass/self_feed_message(var/mob/user)
	to_chat(user, "<span class='notice'>You swallow a gulp from \the [src].</span>")
	if(user.has_personal_goal(/datum/goal/achievement/specific_object/drink))
		for(var/datum/reagent/R in reagents.reagent_list)
			user.update_personal_goal(/datum/goal/achievement/specific_object/drink, R.type)

/obj/item/chems/glass/afterattack(var/obj/target, var/mob/user, var/proximity)
	if(!ATOM_IS_OPEN_CONTAINER(src) || !proximity) //Is the container open & are they next to whatever they're clicking?
		return 1 //If not, do nothing.
	for(var/type in can_be_placed_into) //Is it something it can be placed into?
		if(istype(target, type))
			return 1
	if(standard_dispenser_refill(user, target)) //Are they clicking a water tank/some dispenser?
		return 1
	if(standard_pour_into(user, target)) //Pouring into another beaker?
		return
	if(user.a_intent == I_HURT)
		if(standard_splash_mob(user,target))
			return 1
		if(reagents && reagents.total_volume)
			to_chat(user, "<span class='notice'>You splash the contents of \the [src] onto [target].</span>") //They are on harm intent, aka wanting to spill it.
			reagents.splash(target, reagents.total_volume)
			return 1
	..()

/obj/item/chems/glass/beaker
	name = "beaker"
	desc = "A beaker."
	icon = 'icons/obj/chemical.dmi'
	icon_state = "beaker"
	item_state = "beaker"
	center_of_mass = @"{'x':15,'y':10}"
	material = MAT_GLASS
	applies_material_name = TRUE
	material_force_multiplier = 0.25

/obj/item/chems/glass/beaker/Initialize()
	. = ..()
	desc += " It can hold up to [volume] units."

/obj/item/chems/glass/beaker/on_reagent_change()
	update_icon()

/obj/item/chems/glass/beaker/pickup(mob/user)
	..()
	update_icon()

/obj/item/chems/glass/beaker/dropped(mob/user)
	..()
	update_icon()

/obj/item/chems/glass/beaker/attack_hand()
	..()
	update_icon()

/obj/item/chems/glass/beaker/on_update_icon()
	overlays.Cut()

	if(reagents.total_volume)
		var/image/filling = image('icons/obj/reagentfillings.dmi', src, "[icon_state]10")

		var/percent = round((reagents.total_volume / volume) * 100)
		switch(percent)
			if(0 to 9)		filling.icon_state = "[icon_state]-10"
			if(10 to 24) 	filling.icon_state = "[icon_state]10"
			if(25 to 49)	filling.icon_state = "[icon_state]25"
			if(50 to 74)	filling.icon_state = "[icon_state]50"
			if(75 to 79)	filling.icon_state = "[icon_state]75"
			if(80 to 90)	filling.icon_state = "[icon_state]80"
			if(91 to INFINITY)	filling.icon_state = "[icon_state]100"

		filling.color = reagents.get_color()
		overlays += filling

	if (!ATOM_IS_OPEN_CONTAINER(src))
		var/image/lid = image(icon, src, "lid_[initial(icon_state)]")
		overlays += lid

/obj/item/chems/glass/beaker/large
	name = "large beaker"
	desc = "A large beaker."
	icon_state = "beakerlarge"
	center_of_mass = @"{'x':16,'y':10}"
	volume = 120
	amount_per_transfer_from_this = 10
	possible_transfer_amounts = @"[5,10,15,25,30,60,120]"
	atom_flags = ATOM_FLAG_OPEN_CONTAINER
	material_force_multiplier = 2.5

/obj/item/chems/glass/beaker/bowl
	name = "mixing bowl"
	desc = "A large mixing bowl."
	icon = 'icons/obj/kitchen.dmi'
	icon_state = "mixingbowl"
	center_of_mass = @"{'x':16,'y':10}"
	volume = 180
	amount_per_transfer_from_this = 10
	possible_transfer_amounts = @"[5,10,15,25,30,60,180]"
	atom_flags = ATOM_FLAG_OPEN_CONTAINER
	unacidable = 0
	material = MAT_STEEL
	material_force_multiplier = 0.2

/obj/item/chems/glass/beaker/noreact
	name = "cryostasis beaker"
	desc = "A cryostasis beaker that allows for chemical storage without reactions."
	icon_state = "beakernoreact"
	center_of_mass = @"{'x':16,'y':8}"
	volume = 60
	amount_per_transfer_from_this = 10
	atom_flags = ATOM_FLAG_NO_TEMP_CHANGE | ATOM_FLAG_OPEN_CONTAINER | ATOM_FLAG_NO_REACT
	material = null

/obj/item/chems/glass/beaker/bluespace
	name = "bluespace beaker"
	desc = "A bluespace beaker, powered by experimental bluespace technology."
	icon_state = "beakerbluespace"
	center_of_mass = @"{'x':16,'y':10}"
	volume = 300
	amount_per_transfer_from_this = 10
	possible_transfer_amounts = @"[5,10,15,25,30,60,120,150,200,250,300]"
	atom_flags = ATOM_FLAG_OPEN_CONTAINER
	material_force_multiplier = 2.5

/obj/item/chems/glass/beaker/vial
	name = "vial"
	desc = "A small glass vial."
	icon_state = "vial"
	center_of_mass = @"{'x':15,'y':8}"
	volume = 30
	w_class = ITEM_SIZE_TINY //half the volume of a bottle, half the size
	amount_per_transfer_from_this = 10
	possible_transfer_amounts = @"[5,10,15,30]"
	atom_flags = ATOM_FLAG_OPEN_CONTAINER
	material_force_multiplier = 0.1

/obj/item/chems/glass/beaker/insulated
	name = "insulated beaker"
	desc = "A glass beaker surrounded with black insulation."
	icon_state = "insulated"
	center_of_mass = @"{'x':15,'y':8}"
	matter = list(MAT_GLASS = 500, MAT_PLASTIC = 250)
	possible_transfer_amounts = @"[5,10,15,30]"
	atom_flags = null
	temperature_coefficient = 1
	material = null

/obj/item/chems/glass/beaker/insulated/large
	name = "large insulated beaker"
	icon_state = "insulatedlarge"
	center_of_mass = @"{'x':16,'y':10}"
	matter = list(MAT_GLASS = 5000, MAT_PLASTIC = 2500)
	volume = 120

/obj/item/chems/glass/beaker/sulphuric/Initialize()
	. = ..()
	reagents.add_reagent(/datum/reagent/acid, 60)
	update_icon()

/obj/item/chems/glass/bucket
	name = "bucket"
	desc = "It's a bucket."
	icon = 'icons/obj/janitor.dmi'
	icon_state = "bucket"
	item_state = "bucket"
	center_of_mass = @"{'x':16,'y':9}"
	w_class = ITEM_SIZE_NORMAL
	amount_per_transfer_from_this = 20
	possible_transfer_amounts = @"[10,20,30,60,120,150,180]"
	volume = 180
	atom_flags = ATOM_FLAG_OPEN_CONTAINER
	unacidable = 0
	material = MAT_PLASTIC
	material_force_multiplier = 0.2

/obj/item/chems/glass/bucket/wood
	name = "bucket"
	desc = "It's a wooden bucket. How rustic."
	icon_state = "wbucket"
	item_state = "wbucket"
	volume = 200
	material = MAT_WOOD

/obj/item/chems/glass/bucket/attackby(var/obj/D, mob/user)
	if(istype(D, /obj/item/mop))
		if(reagents.total_volume < 1)
			to_chat(user, "<span class='warning'>\The [src] is empty!</span>")
		else
			reagents.trans_to_obj(D, 5)
			to_chat(user, "<span class='notice'>You wet \the [D] in \the [src].</span>")
			playsound(loc, 'sound/effects/slosh.ogg', 25, 1)
		return
	else
		return ..()

/obj/item/chems/glass/bucket/on_update_icon()
	var/new_overlays
	if (!ATOM_IS_OPEN_CONTAINER(src))
		var/image/lid = image(icon, src, "lid_[initial(icon_state)]")
		LAZYADD(new_overlays, lid)
	else if(reagents && reagents.total_volume && round((reagents.total_volume / volume) * 100) > 80)
		var/image/filling = image('icons/obj/reagentfillings.dmi', src, "bucket")
		filling.color = reagents.get_color()
		LAZYADD(new_overlays, filling)
	overlays = new_overlays
