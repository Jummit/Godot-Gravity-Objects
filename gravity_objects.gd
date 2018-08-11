tool
extends EditorPlugin

func _enter_tree():
	add_custom_type(
		"GravityObject",
		"KinematicBody",
		preload("gravity_object_node.gd"),
		preload("icon.png")
	)

	add_custom_type(
		"SpaceShip",
		"KinematicBody",
		preload("space_ship_node.gd"),
		preload("icon.png")
	)

func _exit_tree():
	remove_custom_type("GravityObject")
	remove_custom_type("SpaceShip")