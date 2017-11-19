extends RigidBody2D
onready  var state = game_menu_state.new(self)
onready var trash = utils.get_main_root().get_node("trash")
const menu =0
const running =1
const hit =2
const over =3

signal state_changed
func _ready():
	set_fixed_process(true)
	set_process_input(true)
	trash.add_to_group("enemy")
	connect("body_enter",self,"on_body_enter")
	pass
func on_body_enter(nini):
	if state.has_method("on_body_enter"):
		state.on_body_enter(nini)
	print("we have hit somethng")
	pass
func _fixed_process(delta):
	state.update(delta)
	pass
func _input(event):
	state.input(event)
	pass
func state_change(new_state):
	state.exit()# ua whatever state we was in.
	if new_state == menu:
		state = game_menu_state.new(self)
		pass
	elif new_state == running:
		state = game_running_state.new(self)
		pass 
	elif new_state == hit:
		state = game_hit_state.new(self)
		pass
	elif new_state == over:
		state = game_over_state.new(self)
		pass
	print(state)
	emit_signal("state_changed",self)
	pass
	
func get_state():
	if state extends game_menu_state:
		return menu
	if state extends game_hit_state:
		return hit
	if state extends game_running_state:
		return running
	if state extends game_over_state:
		return over
	pass
########################## game_menu ##################################3

class game_menu_state:
	var player
	func _init(player):
		self.player = player 
		player.set_pos(Vector2(512/2,288/2))
		pass
	func update(delta):
		
		pass
	func input(event):
		pass
	func exit():
		pass
		
########################## game_running ##################################3

class game_running_state:
	
	var player
	onready var jump_button = utils.get_main_root().get_node("RigidBody2D")
	func _init(player):
		self.player = player
		if jump_button:
			jump_button.show()
		else:
			print("not available")
		pass
	func update(delta):
		player.set_linear_velocity(Vector2(100,player.get_linear_velocity().y))
		if Input.is_action_pressed("jump"):
			print("you pressed jump")
			player.set_linear_velocity(Vector2(100,-100))
		pass
	func input(event):
		pass
	func exit():
		pass
	func on_body_enter(nini):
		if nini.is_in_group("enemy"):
			player.state_change(player.hit)
		pass
########################## hit_state ##################################3

class game_hit_state:
	
	var player
	func _init(player):
		self.player = player
		pass
	func update(delta):
		print("hit state")
		pass 
	func input(event):
		pass
	func exit():
		player.state_change(player.menu)
		pass
	func on_body_enter(nini):
		print("tumegonga kitu ingine")
		pass
########################## game_over ##################################3

class game_over_state:
	
	var player
	func _init(player):
		self.player = player
		pass
	func update(delta):
		pass
	func input(event):
		pass
	func exit():
		pass