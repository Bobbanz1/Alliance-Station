/datum/species/quarian
	name = "Quarian"
	id = "quarian"
	species_traits = list(MUTCOLORS,EYECOLOR,HAIR,FACEHAIR,LIPS,HAS_FLESH,HAS_BONE)
	inherent_traits = list(
		TRAIT_ADVANCEDTOOLUSER,
		TRAIT_CAN_STRIP,
		TRAIT_CAN_USE_FLIGHT_POTION,
		TRAIT_SPECIAL_TRAUMA_BOOST,
		TRAIT_QUICK_BUILD,
		TRAIT_MADNESS_IMMUNE,
		TRAIT_SUPERMATTER_SOOTHER,
	)
	mutant_bodyparts = list("wings" = "None")
	use_skintones = FALSE
	fixed_mut_color = "#9692BE"
	skinned_type = /obj/item/stack/sheet/animalhide/human
	disliked_food = GROSS | RAW | CLOTH | BUGS
	liked_food = JUNKFOOD | FRIED | DEXTRO
	toxic_food = LEVO
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | RACE_SWAP | SLIME_EXTRACT
	species_language_holder = /datum/language_holder/quarian
	payday_modifier = 0.75

	bodypart_overrides = list(
		BODY_ZONE_L_ARM = /obj/item/bodypart/l_arm,
		BODY_ZONE_R_ARM = /obj/item/bodypart/r_arm,
		BODY_ZONE_HEAD = /obj/item/bodypart/head,
		BODY_ZONE_L_LEG = /obj/item/bodypart/l_leg/quarian,
		BODY_ZONE_R_LEG = /obj/item/bodypart/r_leg/quarian,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest,
	)

/datum/species/quarian/equip_delay_self_check(obj/item/I, mob/living/carbon/human/H, bypass_equip_delay_self)
	//Checking for the special clothing of a quarian
	if(istype(I, /obj/item/clothing/under))
		if(!istype(I, /obj/item/clothing/under/modular_alliance/quarian))
			return FALSE
	if(istype(I, /obj/item/clothing/head))
		if(!istype(I, /obj/item/clothing/head/helmet/space/modular_alliance/quarian))
			return FALSE
	if(istype(I, /obj/item/clothing/shoes))
		if(!istype(I, /obj/item/clothing/shoes/modular_alliance/quarian))
			return FALSE

	if(!I.equip_delay_self || bypass_equip_delay_self)
		return TRUE
	H.visible_message(span_notice("[H] start putting on [I]..."), span_notice("You start putting on [I]..."))
	return do_after(H, I.equip_delay_self, target = H)

/datum/species/quarian/pre_equip_species_outfit(datum/job/job, mob/living/carbon/human/equipping, visuals_only = FALSE)
	if(job.quarian_outfit)
		equipping.equipOutfit(job.quarian_outfit, visuals_only)
	equipping.internal = equipping.get_item_for_held_index(2)
	equipping.update_internals_hud_icon(1)

/datum/species/quarian/prepare_human_for_preview(mob/living/carbon/human/human)
	human.hairstyle = "Business Hair"
	human.hair_color = "#bb9966" // brown
	human.update_hair()

/datum/species/quarian/get_scream_sound(mob/living/carbon/human/human)
	if(human.gender == MALE)
		if(prob(1))
			return 'sound/voice/human/wilhelm_scream.ogg'
		return pick(
			'sound/voice/human/malescream_1.ogg',
			'sound/voice/human/malescream_2.ogg',
			'sound/voice/human/malescream_3.ogg',
			'sound/voice/human/malescream_4.ogg',
			'sound/voice/human/malescream_5.ogg',
			'sound/voice/human/malescream_6.ogg',
		)

	return pick(
		'sound/voice/human/femalescream_1.ogg',
		'sound/voice/human/femalescream_2.ogg',
		'sound/voice/human/femalescream_3.ogg',
		'sound/voice/human/femalescream_4.ogg',
		'sound/voice/human/femalescream_5.ogg',
	)

/datum/species/quarian/get_species_description()
	return "The quarians are a nomadic species of humanoid aliens known for their skills with technology and synthetic intelligence. \
	Since their homeworld Rannoch was conquered, the quarians live aboard the Migrant Fleet, a huge collection of starships that travel as a single fleet. \
	Approximately three hundred years before the events of 2183, the quarians created the geth, a species of rudimentary artificial intelligences, \
	to serve as an efficient source of manual labor. However, when the geth gradually became sentient, the quarians became terrified of possible consequences \
	and tried to destroy their creations. The geth won the resulting war and forced their creators into exile. Now the quarians wander the galaxy in a flotilla \
	of salvaged ships, secondhand vessels, and recycled technology. "

/datum/species/quarian/get_species_lore()
	return list(
		"Quarians are generally shorter and of slighter build than humans. Quarians have an endoskeleton, lips, teeth, and two eyes with eyelids and tear ducts. \
		Their ears or ear analogues differ in a noticeable fashion from those of humans, with references made to \"what (passes) for the quarian version of an ear\", \
		Their eyes can see into the ultraviolet end of the spectrum; their suit HUDs can show information in those wavelengths. Quarian facial structure and hair actually \
		makes them the most similar to humans in physical appearance.",

		"They also have three thick fingers on both hands which include a thumb, an index finger, and a long finger, similar to the middle fingers for humans, as well \
		as three toes on each foot. Their lower legs are bowed backwards significantly, compared to asari or humans. Aside from hands and legs, their general body shape \
		and sexual dimorphism is similar to humans. Male quarians, however, appear to lack a third toe. Like humans, quarian blood is red.",

		"The most distinguishing feature of quarian biology is their weak immune system, compounded by centuries of living in sterile environments. As a result, all quarians \
		by necessity dress in highly sophisticated enviro-suits, to protect them from disease or infection if they are injured. Their suits can be compartmentalized in the \
		event of a tear or similar breach to prevent the spread of contaminants (similar to a ship sealing off bulkheads in the event of a hull breach). Along with their \
		suits, quarians also have extensive cybernetic augmentations integrated into their bodies. A quarian's lifespan is roughly equal to a human's, but is prone to be \
		less if infection breaks into the suit."
	)

/datum/species/quarian/create_pref_unique_perks()
	var/list/to_add = list()

	to_add += list(
		list(
			SPECIES_PERK_TYPE = SPECIES_NEUTRAL_PERK,
			SPECIES_PERK_ICON = "comment",
			SPECIES_PERK_NAME = "Knows Khelish",
			SPECIES_PERK_DESC = "Knows the Quarian language",
		),
		list(
			SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
			SPECIES_PERK_ICON = "toolbox",
			SPECIES_PERK_NAME = "A born mechanic",
			SPECIES_PERK_DESC = "Born on a crumbling spaceship, you unwittingly had to understand the structure of technology. \
			Your knowledge in this field is still far from that of Russian turners, but it is still enough to assemble a microwave oven with closed eyes.",
		),
		list(
			SPECIES_PERK_TYPE = SPECIES_NEGATIVE_PERK,
			SPECIES_PERK_ICON = "heart",
			SPECIES_PERK_NAME = "Bless you",
			SPECIES_PERK_DESC = "Constant life on spaceships has undermined the health of your race. Your health is weakened and your lack \
			of immunity makes it dangerous for you to be without a special spacesuit.",
		),
	)

	return to_add
