extends RigidBody2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)
	set_pos(Vector2(get_pos().x + 1 , get_pos().y))
	pass

func _fixed_process(delta):
	pass