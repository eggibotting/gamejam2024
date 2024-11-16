extends Area2D

@onready var player = $"..".player
@export var offset_y: int = 50
@export var offset_x : int = 50
@onready var knight_pos = $"..".position

var hand_offset: Vector2i = Vector2i(110, -116)
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func set_raised() -> void:	
	if Input.is_action_pressed("lance_up" + str(player)):
		position.y = lerpf(position.y, hand_offset.y - offset_y, 0.5)
	elif Input.is_action_pressed("lance_down" + str(player)):
		position.y = lerpf(position.y, hand_offset.y + offset_y, 0.5)
	else:
		position.y = lerpf(position.y, hand_offset.y, 0.5)
	
func set_forward() -> void:
	if Input.is_action_pressed("lance_forward" + str(player)):
		position.x = lerpf(position.x, hand_offset.x + offset_x, 0.5)
	elif Input.is_action_pressed("lance_backward" + str(player)):
		position.x = lerpf(position.x, hand_offset.x - offset_x, 0.5)
	else:
		position.x = lerpf(position.x, hand_offset.x, 0.5)

func _process(delta: float) -> void:
	set_raised()
	set_forward()
