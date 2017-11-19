extends CanvasLayer
var is_changing = false
func _ready():
	pass
func  change_stage(stage_path):
	if is_changing: return
	get_node("trans").play("ingia")
	yield(get_node("trans"),"finished") 
	print("changing scene")
	get_tree().change_scene(stage_path)
	get_node("trans").play("toka")
	yield(get_node("trans"),"finished")
	is_changing = false
	pass