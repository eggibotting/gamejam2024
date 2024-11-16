extends CharacterBody2D

var screen_y_middle = (DisplayServer.window_get_size().y)/2
@onready var player = $"..".player
@export var offset: int

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func get_input() -> void:
	var lower_pos = screen_y_middle + offset
	var upper_pos = screen_y_middle - offset
	var default_pos = screen_y_middle
	
	if Input.is_action_pressed("shield_up" + str(player)):
		position.y = upper_pos
	elif Input.is_action_pressed("shield_down" + str(player)):
		position.y = lower_pos
	else:
		position.y = default_pos


func _process(delta: float) -> void:
	get_input()
