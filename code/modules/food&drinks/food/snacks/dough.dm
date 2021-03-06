

/////////////////// Dough Ingredients ////////////////////////

// Flour + egg = dough
/obj/item/weapon/reagent_containers/attackby(obj/item/weapon/W as obj, mob/user as mob)
	if(istype(W,/obj/item/weapon/reagent_containers/food/snacks/egg))
		var/obj/item/weapon/reagent_containers/food/snacks/egg/E = W
		if(flags & OPENCONTAINER)
			if(reagents)
				if(reagents.has_reagent("flour"))
					if(reagents.get_reagent_amount("flour") >= 15)
						var/obj/item/weapon/reagent_containers/food/snacks/S = new /obj/item/weapon/reagent_containers/food/snacks/dough(get_turf(src))
						user << "<span class='notice'>You mix egg and flour to make some dough.</span>"
						reagents.remove_reagent("flour", 15)
						if(E.reagents)
							E.reagents.trans_to(S,E.reagents.total_volume)
						qdel(E)
					else
						user << "<span class='notice'>Not enough flour to make dough.</span>"
			return
	..()

/obj/item/weapon/reagent_containers/food/snacks/dough
	name = "dough"
	desc = "A piece of dough."
	icon = 'icons/obj/food_ingredients.dmi'
	icon_state = "dough"
	cooked_type = /obj/item/weapon/reagent_containers/food/snacks/store/bread/plain
	list_reagents = list("nutriment" = 3)
	w_class = 3
	flags = OPENCONTAINER


// Dough + rolling pin = flat dough
/obj/item/weapon/reagent_containers/food/snacks/dough/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/weapon/kitchen/rollingpin))
		if(isturf(loc))
			new /obj/item/weapon/reagent_containers/food/snacks/flatdough(loc)
			user << "<span class='notice'>You flatten [src].</span>"
			qdel(src)
		else
			user << "<span class='notice'>You need to put [src] on a surface to roll it out!</span>"
	else
		..()


// sliceable into 3xdoughslices
/obj/item/weapon/reagent_containers/food/snacks/flatdough
	name = "flat dough"
	desc = "A flattened dough."
	icon = 'icons/obj/food_ingredients.dmi'
	icon_state = "flat dough"
	slice_path = /obj/item/weapon/reagent_containers/food/snacks/doughslice
	slices_num = 3
	cooked_type = /obj/item/weapon/reagent_containers/food/snacks/pizzabread
	list_reagents = list("nutriment" = 3)
	w_class = 3
	flags = OPENCONTAINER

/obj/item/weapon/reagent_containers/food/snacks/pizzabread
	name = "pizza bread"
	desc = "Add ingredients to make a pizza"
	icon = 'icons/obj/food_ingredients.dmi'
	icon_state = "pizzabread"
	custom_food_type = /obj/item/weapon/reagent_containers/food/snacks/customizable/pizza
	list_reagents = list("nutriment" = 1)
	w_class = 3


/obj/item/weapon/reagent_containers/food/snacks/doughslice
	name = "dough slice"
	desc = "A slice of dough. Can be cooked into a bun."
	icon = 'icons/obj/food_ingredients.dmi'
	icon_state = "doughslice"
	cooked_type = /obj/item/weapon/reagent_containers/food/snacks/bun
	filling_color = "#CD853F"
	flags = OPENCONTAINER


/obj/item/weapon/reagent_containers/food/snacks/bun
	name = "bun"
	desc = "A base for any self-respecting burger."
	icon = 'icons/obj/food.dmi'
	icon_state = "bun"
	list_reagents = list("nutriment" = 1)
	custom_food_type = /obj/item/weapon/reagent_containers/food/snacks/customizable/burger
	filling_color = "#CD853F"

/obj/item/weapon/reagent_containers/food/snacks/cakebatter
	name = "cake batter"
	desc = "Cook it to get a cake."
	icon = 'icons/obj/food_ingredients.dmi'
	icon_state = "cakebatter"
	cooked_type = /obj/item/weapon/reagent_containers/food/snacks/store/cake/plain
	list_reagents = list("nutriment" = 1)
	w_class = 3

// Cake batter + rolling pin = pie dough
/obj/item/weapon/reagent_containers/food/snacks/cakebatter/attackby(obj/item/I, mob/user)
	if(istype(I, /obj/item/weapon/kitchen/rollingpin))
		if(isturf(loc))
			new /obj/item/weapon/reagent_containers/food/snacks/piedough(loc)
			user << "<span class='notice'>You flatten [src].</span>"
			qdel(src)
		else
			user << "<span class='notice'>You need to put [src] on a surface to roll it out!</span>"
	else
		..()

/obj/item/weapon/reagent_containers/food/snacks/piedough
	name = "pie dough"
	desc = "Cook it to get a pie."
	icon = 'icons/obj/food_ingredients.dmi'
	icon_state = "piedough"
	slice_path = /obj/item/weapon/reagent_containers/food/snacks/rawpastrybase
	slices_num = 3
	cooked_type = /obj/item/weapon/reagent_containers/food/snacks/pie/plain
	list_reagents = list("nutriment" = 1)
	w_class = 3

/obj/item/weapon/reagent_containers/food/snacks/rawpastrybase
	name = "raw pastry base"
	desc = "Must be cooked before use."
	icon = 'icons/obj/food_ingredients.dmi'
	icon_state = "rawpastrybase"
	cooked_type = /obj/item/weapon/reagent_containers/food/snacks/pastrybase
	filling_color = "#CD853F"

/obj/item/weapon/reagent_containers/food/snacks/pastrybase
	name = "pastry base"
	desc = "A base for any self-respecting pastry"
	icon = 'icons/obj/food_ingredients.dmi'
	icon_state = "pastrybase"
	list_reagents = list("nutriment" = 1)
	filling_color = "#CD853F"

