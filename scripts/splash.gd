extends Node

# class member variables go here, for example:
# var a = 2
# var b = "textvar"

func _ready():
	get_node("AnimationPlayer").play("start")
	yield(get_node("AnimationPlayer"),"finished") 
	transition.change_stage("res://activities/main_menu.tscn")
	pass
