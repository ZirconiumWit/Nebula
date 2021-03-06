/material/pitchblende
	display_name = "pitchblende"
	ore_compresses_to = MAT_PITCHBLENDE
	icon_colour = "#917d1a"
	ore_smelts_to = MAT_URANIUM
	ore_result_amount = 5
	ore_spread_chance = 10
	ore_name = "pitchblende"
	ore_scan_icon = "mineral_uncommon"
	stack_origin_tech = "{'" + TECH_MATERIAL + "':5}"
	xarch_ages = list(
		"thousand" = 999,
		"million" = 704
		)
	xarch_source_mineral = "potassium"
	ore_icon_overlay = "nugget"
	chem_products = list(
		/datum/reagent/radium = 10,
		/datum/reagent/uranium = 10
		)
	sheet_singular_name = "brick"
	sheet_plural_name = "bricks"
	sale_price = 2

/material/graphite
	display_name = "graphite"
	ore_compresses_to = MAT_GRAPHITE
	icon_colour = "#444444"
	ore_name = "graphite"
	ore_result_amount = 5
	ore_spread_chance = 25
	ore_scan_icon = "mineral_common"
	ore_icon_overlay = "lump"
	chem_products = list(
		/datum/reagent/carbon = 15,
		/datum/reagent/toxin/plasticide = 5,
		/datum/reagent/acetone = 5
		)
	sale_price = 1

/material/quartz
	display_name = "quartz"
	ore_compresses_to = MAT_QUARTZ
	ore_name = "quartz"
	opacity = 0.5
	ore_result_amount = 10
	ore_spread_chance = 10
	ore_scan_icon = "mineral_common"
	ore_icon_overlay = "lump"
	icon_colour = "#effffe"
	chem_products = list(
		/datum/reagent/silicon = 20
		)
	door_icon_base = "stone"
	sheet_singular_name = "brick"
	sheet_plural_name = "bricks"
	icon_base = "stone"
	table_icon_base = "stone"
	icon_reinf = "reinf_stone"
	sale_price = 2
	reflectiveness = MAT_VALUE_SHINY

/material/pyrite
	display_name = "pyrite"
	ore_name = "pyrite"
	ore_result_amount = 10
	ore_spread_chance = 10
	ore_scan_icon = "mineral_common"
	ore_icon_overlay = "lump"
	icon_colour = "#ccc9a3"
	chem_products = list(
		/datum/reagent/sulfur = 15,
		/datum/reagent/iron = 5
		)
	door_icon_base = "stone"
	sheet_singular_name = "brick"
	sheet_plural_name = "bricks"
	icon_base = "stone"
	table_icon_base = "stone"
	icon_reinf = "reinf_stone"
	ore_compresses_to = MAT_PYRITE
	sale_price = 2
	reflectiveness = MAT_VALUE_SHINY

/material/spodumene
	display_name = "spodumene"
	ore_compresses_to = MAT_SPODUMENE
	ore_name = "spodumene"
	ore_result_amount = 10
	ore_spread_chance = 10
	ore_scan_icon = "mineral_common"
	ore_icon_overlay = "lump"
	icon_colour = "#e5becb"
	chem_products = list(
		/datum/reagent/lithium = 20
		)
	door_icon_base = "stone"
	sheet_singular_name = "brick"
	sheet_plural_name = "bricks"
	icon_base = "stone"
	table_icon_base = "stone"
	icon_reinf = "reinf_stone"
	sale_price = 2

/material/cinnabar
	display_name = "cinnabar"
	ore_compresses_to = MAT_CINNABAR
	ore_name = "cinnabar"
	ore_result_amount = 10
	ore_spread_chance = 10
	ore_scan_icon = "mineral_common"
	ore_icon_overlay = "lump"
	icon_colour = "#e54e4e"
	chem_products = list(
		/datum/reagent/mercury  = 20
	)
	door_icon_base = "stone"
	sheet_singular_name = "brick"
	sheet_plural_name = "bricks"
	icon_base = "stone"
	table_icon_base = "stone"
	icon_reinf = "reinf_stone"
	sale_price = 2

/material/phosphorite
	display_name = "phosphorite"
	ore_compresses_to = MAT_PHOSPHORITE
	ore_name = "phosphorite"
	ore_result_amount = 10
	ore_spread_chance = 10
	ore_scan_icon = "mineral_common"
	ore_icon_overlay = "lump"
	icon_colour = "#acad95"
	chem_products = list(
		/datum/reagent/phosphorus = 20
	)
	door_icon_base = "stone"
	sheet_singular_name = "brick"
	sheet_plural_name = "bricks"
	icon_base = "stone"
	table_icon_base = "stone"
	icon_reinf = "reinf_stone"
	sale_price = 2

/material/rocksalt
	display_name = "rock salt"
	ore_compresses_to = MAT_ROCK_SALT
	ore_name = "rock salt"
	ore_result_amount = 10
	ore_spread_chance = 10
	ore_scan_icon = "mineral_common"
	ore_icon_overlay = "lump"
	icon_colour = "#d1c0bc"
	chem_products = list(
		/datum/reagent/sodium = 20
	)
	door_icon_base = "stone"
	sheet_singular_name = "brick"
	sheet_plural_name = "bricks"
	icon_base = "stone"
	table_icon_base = "stone"
	icon_reinf = "reinf_stone"
	sale_price = 2

/material/potash
	display_name = "potash"
	ore_compresses_to = MAT_POTASH
	ore_name = "potash"
	ore_result_amount = 10
	ore_spread_chance = 10
	ore_scan_icon = "mineral_common"
	ore_icon_overlay = "lump"
	icon_colour = "#b77464"
	chem_products = list(
		/datum/reagent/potassium = 20
		)
	door_icon_base = "stone"
	sheet_singular_name = "brick"
	sheet_plural_name = "bricks"
	icon_base = "stone"
	table_icon_base = "stone"
	icon_reinf = "reinf_stone"
	sale_price = 2

/material/bauxite
	display_name = "bauxite"
	ore_name = "bauxite"
	ore_result_amount = 10
	ore_spread_chance = 10
	ore_scan_icon = "mineral_common"
	ore_icon_overlay = "lump"
	icon_colour = "#d8ad97"
	chem_products = list(
		/datum/reagent/aluminium = 15
		)
	door_icon_base = "stone"
	sheet_singular_name = "brick"
	sheet_plural_name = "bricks"
	icon_base = "stone"
	table_icon_base = "stone"
	icon_reinf = "reinf_stone"
	ore_smelts_to = MAT_ALUMINIUM
	ore_compresses_to = MAT_BAUXITE
	sale_price = 1

/material/sand
	display_name = "sand"
	stack_type = null
	icon_colour = "#e2dbb5"
	ore_smelts_to = MAT_GLASS
	ore_compresses_to = MAT_SANDSTONE
	ore_name = "sand"
	ore_icon_overlay = "dust"
	chem_products = list(
		/datum/reagent/silicon = 20
		)

/material/phoron
	display_name = "phoron"
	stack_type = /obj/item/stack/material/phoron
	ignition_point = PHORON_MINIMUM_BURN_TEMPERATURE
	icon_base = "stone"
	table_icon_base = "stone"
	icon_colour = "#e37108"
	shard_type = SHARD_SHARD
	hardness = MAT_VALUE_RIGID
	stack_origin_tech = "{'" + TECH_MATERIAL + "':2,'" + TECH_PHORON + "':2}"
	door_icon_base = "stone"
	sheet_singular_name = "crystal"
	sheet_plural_name = "crystals"
	is_fusion_fuel = 1
	chem_products = list(
		/datum/reagent/toxin/phoron = 20
		)
	construction_difficulty = MAT_VALUE_HARD_DIY
	ore_name = "phoron"
	ore_compresses_to = MAT_PHORON
	ore_result_amount = 5
	ore_spread_chance = 25
	ore_scan_icon = "mineral_uncommon"
	xarch_ages = list(
		"thousand" = 999,
		"million" = 999,
		"billion" = 13,
		"billion_lower" = 10
		)
	xarch_source_mineral = MAT_PHORON
	ore_icon_overlay = "gems"
	sale_price = 5
	value = 200
	//Note that this has a significant impact on TTV yield.
	//Because it is so high, any leftover phoron soaks up a lot of heat and drops the yield pressure.
	gas_specific_heat = 200	// J/(mol*K)
	//Hypothetical group 14 (same as carbon), period 8 element.
	//Using multiplicity rule, it's atomic number is 162
	//and following a N/Z ratio of 1.5, the molar mass of a monatomic gas is:
	gas_molar_mass = 0.405	// kg/mol
	gas_overlay_limit = 0.7
	gas_flags = XGM_GAS_FUEL | XGM_GAS_CONTAMINANT | XGM_GAS_FUSION_FUEL
	gas_breathed_product = /datum/reagent/toxin/phoron
	gas_symbol_html = "Ph"
	gas_symbol = "Ph"
	reflectiveness = MAT_VALUE_SHINY

/material/phoron/supermatter
	display_name = "exotic matter"
	lore_text = "Hypercrystalline supermatter is a subset of non-baryonic 'exotic' matter. It is found mostly in the heart of large stars, and features heavily in bluespace technology."
	icon_colour = "#ffff00"
	radioactivity = 20
	stack_origin_tech = "{'" + TECH_BLUESPACE + "':2,'" + TECH_MATERIAL + "':6,'" + TECH_PHORON + "':4}"
	stack_type = null
	luminescence = 3
	ore_compresses_to = null
	sale_price = null

//Controls phoron and phoron based objects reaction to being in a turf over 200c -- Phoron's flashpoint.
/material/phoron/combustion_effect(var/turf/T, var/temperature, var/effect_multiplier)
	if(isnull(ignition_point))
		return 0
	if(temperature < ignition_point)
		return 0
	var/totalPhoron = 0
	for(var/turf/simulated/floor/target_tile in range(2,T))
		var/phoronToDeduce = (temperature/30) * effect_multiplier
		totalPhoron += phoronToDeduce
		target_tile.assume_gas(MAT_PHORON, phoronToDeduce, 200+T0C)
		spawn (0)
			target_tile.hotspot_expose(temperature, 400)
	return round(totalPhoron/100)
