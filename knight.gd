extends CharacterBody2D

@export var player: Global.Player
@export var speed = 200
var min_x = 0
var max_x = DisplayServer.window_get_size().x

	
func get_input():
	var horizontal = Input.get_action_strength("knight_forward" + str(player)) - Input.get_action_strength("knight_backward" + str(player))
	velocity.x = horizontal * speed
	position.x = clampi(position.x, min_x, max_x)
	
func _process(delta: float) -> void:
	print(str(player))
	get_input()
	move_and_slide()
