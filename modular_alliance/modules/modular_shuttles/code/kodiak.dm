#define ICON_KODIAK_ALLIANCE_TEXTURES_PATH 'modular_alliance/modules/modular_shuttles/icons/kodiak_alliance.dmi'
#define ICON_KODIAK_CERBERUS_TEXTURES_PATH 'modular_alliance/modules/modular_shuttles/icons/kodiak_cerberus.dmi'

/turf/closed/wall/mineral/titanium/shuttle_wall
	name = "shuttle wall"
	desc = "A light-weight titanium wall used in shuttles."
	icon = ICON_KODIAK_CERBERUS_TEXTURES_PATH
	icon_state = ""
	base_icon_state = ""
	smoothing_flags = null
	smoothing_groups = null
	canSmoothWith = null

/turf/closed/wall/mineral/titanium/shuttle_wall/AfterChange(flags, oldType)
	. = ..()
	// Manually add space underlay, in a way similar to turf_z_transparency,
	// but we actually show the old content of the same z-level, as desired for shuttles

	var/turf/underturf_path

	// Grab previous turf icon
	if(!ispath(oldType, /turf/closed/wall/mineral/titanium/shuttle_wall))
		underturf_path = oldType
	else
		// Else use whatever SSmapping tells us, like transparent open tiles do
		underturf_path = SSmapping.level_trait(z, ZTRAIT_BASETURF) || /turf/open/space

	var/mutable_appearance/underlay_appearance = mutable_appearance(
		initial(underturf_path.icon),
		initial(underturf_path.icon_state),
		layer = TURF_LAYER - 0.02, plane = initial(underturf_path.plane))
	underlay_appearance.appearance_flags = RESET_ALPHA | RESET_COLOR
	underlays += underlay_appearance

/*/turf/closed/wall/mineral/titanium/shuttle_wall/window
	opacity = FALSE
	icon = ICON_SHUTTLE_TEXTURES_PATH
*/

/turf/closed/wall/mineral/titanium/shuttle_wall/kodiak/alliance
	icon = ICON_KODIAK_ALLIANCE_TEXTURES_PATH

/turf/closed/wall/mineral/titanium/shuttle_wall/kodiak/cerberus
	icon = ICON_KODIAK_CERBERUS_TEXTURES_PATH

/area/shuttle/modular_shuttle/kodiak/alliance
	name = "Alliance UT-47 Kodiak"

/area/shuttle/modular_shuttle/kodiak/cerberus
	name = "Cerberus UT-47 Kodiak"

/datum/map_template/shuttle/ruin/modular_shuttle/kodiak
	prefix = "modular_alliance/modules/modular_shuttles/maps/"

/datum/map_template/shuttle/ruin/modular_shuttle/kodiak/alliance
	suffix = "kodiak_alliance"
	name = "Alliance UT-47 Kodiak"
	shuttle_id = "kodiak_alliance"

/datum/map_template/shuttle/ruin/modular_shuttle/kodiak/cerberus
	suffix = "kodiak_cerberus"
	name = "Cerberus UT-47 Kodiak"
	shuttle_id = "kodiak_cerberus"

/obj/machinery/computer/shuttle/modular_shuttle/kodiak/alliance
	name = "UT-47 Kodiak Control"
	desc = "Used to control the UT-47 Kodiak"
	circuit = /obj/item/circuitboard/computer/kodiak_alliance
	shuttleId = "kodiak_alliance"
	possible_destinations = "kodiak_alliance_custom;whiteship_home"

/obj/machinery/computer/shuttle/modular_shuttle/kodiak/cerberus
	name = "UT-47 Kodiak Control"
	desc = "Used to control the UT-47 Kodiak"
	circuit = /obj/item/circuitboard/computer/kodiak_cerberus
	shuttleId = "kodiak_cerberus"
	possible_destinations = "kodiak_cerberus_custom;whiteship_home"

/obj/machinery/computer/camera_advanced/shuttle_docker/kodiak/alliance
	name = "UT-47 Kodiak Navigation Computer"
	desc = "The Navigation console for the UT-47 Kodiak Control"
	shuttleId = "kodiak_alliance"
	lock_override = NONE
	shuttlePortId = "kodiak_alliance_custom"
	jump_to_ports = list("whiteship_home" = 1)
	view_range = 0

/obj/machinery/computer/camera_advanced/shuttle_docker/kodiak/cerberus
	name = "UT-47 Kodiak Navigation Computer"
	desc = "The Navigation console for the UT-47 Kodiak Control"
	shuttleId = "kodiak_cerberus"
	lock_override = NONE
	shuttlePortId = "kodiak_cerberus_custom"
	jump_to_ports = list("whiteship_home" = 1)
	view_range = 0

/obj/item/circuitboard/computer/kodiak_alliance
	name = "UT-47 Kodiak Control Console (Computer Board)"
	build_path = /obj/machinery/computer/shuttle/modular_shuttle/kodiak/alliance

/obj/item/circuitboard/computer/kodiak_cerberus
	name = "UT-47 Kodiak Control Console (Computer Board)"
	build_path = /obj/machinery/computer/shuttle/modular_shuttle/kodiak/cerberus

#undef ICON_KODIAK_ALLIANCE_TEXTURES_PATH
#undef ICON_KODIAK_CERBERUS_TEXTURES_PATH
