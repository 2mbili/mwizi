extends Camera2D

onready var follow = utils.get_main_root().get_node("RigidBody2D")
func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_fixed_process(true)
	pass
func _fixed_process(delta):
	set_pos(Vector2(follow.get_pos().x , 288/2))
