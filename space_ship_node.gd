tool
extends "res://addons/gravity_objects/gravity_object_node.gd"

var speed = 1

func _physics_process(delta):
	# left right forward back
	var to_move = Vector3(0,0,0)
	if Input.is_action_pressed("move_forward"):
		to_move+=Vector3(0,0,1)
	if Input.is_action_pressed("move_back"):
		to_move+=Vector3(0,0,-1)
	if Input.is_action_pressed("move_left"):
		to_move+=Vector3(1,0,0)
	if Input.is_action_pressed("move_right"):
		to_move+=Vector3(-1,0,0)
	# up and down
	if Input.is_action_pressed("move_up"):
		to_move+=Vector3(0,-1,0)
	if Input.is_action_pressed("move_down"):
		to_move+=Vector3(0,1,0)
	
	to_move = to_move.rotated(Vector3(1,0,0),$Camera.rotation.x)
	to_move = to_move.rotated(Vector3(0,1,0),$Camera.rotation.y)
	to_move = to_move.rotated(Vector3(0,0,1),$Camera.rotation.z)
	
	direction-=to_move*speed*delta

func _unhandled_input(event):
	if event is InputEventMouseMotion and Input.is_mouse_button_pressed(BUTTON_RIGHT):
		event.speed/=10000
		$Camera.rotation.x-=event.speed.y
		$Camera.rotation.y-=event.speed.x
