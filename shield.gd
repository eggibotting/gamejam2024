extends Area2D

var screen_y_middle = (DisplayServer.window_get_size().y)/2
@onready var player = $"..".player
@export var offset: int = 20
var hand_offset : Vector2i = Vector2i(13, -146)

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func get_input() -> void:
	if Input.is_action_pressed("shield_up" + str(player)):
		position.y = lerpf(position.y, hand_offset.y - offset, 0.5)
	elif Input.is_action_pressed("shield_down" + str(player)):
		position.y = lerpf(position.y, hand_offset.y + offset, 0.5)
	else:
		position.y = lerpf(position.y, hand_offset.y, 0.5)


func _process(delta: float) -> void:
	get_input()
