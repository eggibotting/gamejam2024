extends CharacterBody2D

var screen_y_middle = (DisplayServer.window_get_size().y)/2
@onready var player = $"..".player
@export var offset: int = 50
@export var max_x : int = 50
@export var min_x : int = 50
@onready var knight_pos_x = $"..".position.x

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func set_raised() -> void:
	var lower_pos = screen_y_middle + offset
	var upper_pos = screen_y_middle - offset
	var default_pos = screen_y_middle
	
	if Input.is_action_pressed("lance_up" + str(player)):
		position.y = upper_pos
	elif Input.is_action_pressed("lance_down" + str(player)):
		position.y = lower_pos
	else:
		position.y = default_pos
	
func set_forward() -> void:
	if Input.is_action_pressed("lance_forward" + str(player)):
		position.x = knight_pos_x + max_x
	elif Input.is_action_pressed("lance_backward" + str(player)):
		position.x = knight_pos_x - min_x
	else:
		position.x = knight_pos_x

func _process(delta: float) -> void:
	set_raised()
	set_forward()
