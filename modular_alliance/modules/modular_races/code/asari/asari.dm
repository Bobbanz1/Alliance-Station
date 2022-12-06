/datum/species/asari
	name = "Asari"
	id = "asari"
	species_traits = list(MUTCOLORS,EYECOLOR,LIPS,HAS_FLESH,HAS_BONE)
	inherent_traits = list(
		TRAIT_ADVANCEDTOOLUSER,
		TRAIT_CAN_STRIP,
		TRAIT_CAN_USE_FLIGHT_POTION,
		TRAIT_SPECIAL_TRAUMA_BOOST,
	)
	sexes = FALSE
	mutant_bodyparts = list("wings" = "None")
	use_skintones = FALSE
	skinned_type = /obj/item/stack/sheet/animalhide/human
	disliked_food = GROSS | RAW | CLOTH | BUGS | DEXTRO
	liked_food = JUNKFOOD | FRIED | LEVO
	changesource_flags = MIRROR_BADMIN | WABBAJACK | MIRROR_MAGIC | MIRROR_PRIDE | ERT_SPAWN | RACE_SWAP | SLIME_EXTRACT
	species_language_holder = /datum/language_holder/asari
	payday_modifier = 0.75

	bodypart_overrides = list(
		BODY_ZONE_L_ARM = /obj/item/bodypart/l_arm,
		BODY_ZONE_R_ARM = /obj/item/bodypart/r_arm,
		BODY_ZONE_HEAD = /obj/item/bodypart/head/asari,
		BODY_ZONE_L_LEG = /obj/item/bodypart/l_leg,
		BODY_ZONE_R_LEG = /obj/item/bodypart/r_leg,
		BODY_ZONE_CHEST = /obj/item/bodypart/chest,
	)

/datum/species/asari/prepare_human_for_preview(mob/living/carbon/human/human)
	//human.hairstyle = "Business Hair"
	//human.hair_color = "#bb9966" // brown
	//human.update_hair()

/datum/species/asari/get_scream_sound(mob/living/carbon/human/human)
	return pick(
		'sound/voice/human/femalescream_1.ogg',
		'sound/voice/human/femalescream_2.ogg',
		'sound/voice/human/femalescream_3.ogg',
		'sound/voice/human/femalescream_4.ogg',
		'sound/voice/human/femalescream_5.ogg',
	)

/datum/species/asari/get_species_description()
	return "The asari, native to the planet Thessia, are often considered the most influential and respected \
	sentient species in the galaxy, and are known for their elegance, diplomacy, and biotic aptitude. \
	This is partly due to the fact that the asari were among the earliest races to achieve interstellar flight after the Protheans, \
	and the first to discover and settle the Citadel."

/datum/species/asari/get_species_lore()
	return list(
		"A mono-gender race, the asari are distinctly feminine in appearance and possess maternal instincts. Their unique physiology, \
		expressed in a millennium-long lifespan and the ability to reproduce with a partner of any gender or species, gives them a \
		conservative yet convivial attitude toward other races. Favoring compromise and cooperation over conflict, the asari were instrumental \
		in proposing and founding the Citadel Council and have been at the heart of galactic society ever since."
	)

/datum/species/asari/create_pref_unique_perks()
	var/list/to_add = list()

	to_add += list(
		list(
			SPECIES_PERK_TYPE = SPECIES_NEUTRAL_PERK,
			SPECIES_PERK_ICON = "comment",
			SPECIES_PERK_NAME = "Knows High Thessian",
			SPECIES_PERK_DESC = "Knows the basic language of Asari",
		),
		list(
			SPECIES_PERK_TYPE = SPECIES_POSITIVE_PERK,
			SPECIES_PERK_ICON = "bolt",
			SPECIES_PERK_NAME = "Born to be biotic.",
			SPECIES_PERK_DESC = "The main thing is not to forget to wear an oxygen mask.",
		),
		list(
			SPECIES_PERK_TYPE = SPECIES_NEGATIVE_PERK,
			SPECIES_PERK_ICON = "heart",
			SPECIES_PERK_NAME = "Beauty requires sacrifice",
			SPECIES_PERK_DESC = "Every Asari is biotic. Here you have some of that power.",
		),
	)

	return to_add

/datum/species/asari/on_species_gain(mob/living/carbon/C, datum/species/old_species)
	. = ..()
	C.dna.add_mutation(/datum/mutation/human/telekinesis)
