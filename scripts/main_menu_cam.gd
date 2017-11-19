extends Camera2D

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	set_fixed_process(true)
	set_pos(Vector2(512/2,288/2))
	pass

func _fixed_process(delta):
	set_pos(Vector2(get_pos().x+1,288/2))
	pass
