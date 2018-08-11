tool
extends KinematicBody

var G = 6.67*pow(10,-11)
export var direction = Vector3(0,0,0)
export var active = true
export var mass = 100000000

func _enter_tree():
	active = true

func _ready():
	active = true

func get_pulled_towards_object(object, delta):
	if "mass" in object and "translation" in object:
		var distanceToObject = translation.distance_to(object.translation)
		if object.mass>0 and distanceToObject>0:
			var gravitationalPull = sqrt(G*(object.mass/distanceToObject))
			
			var gravityDirection = (object.translation-translation).normalized()
			direction+=gravityDirection*gravitationalPull
			
			var collision = move_and_collide(direction*delta)
			if collision != null:
				direction-=collision.remainder*100
			
	for obj in object.get_children():
		get_pulled_towards_object(obj, delta)

func _physics_process(delta):
	if active:
		get_pulled_towards_object(get_parent(), delta)
