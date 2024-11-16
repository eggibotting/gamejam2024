extends CharacterBody2D
enum Position {UP, DOWN, DEFAULT} 

@export var SPEED = 300.0

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("ui_left", "ui_right")
	if direction:
		velocity.x = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)

	move_and_slide()

func _process(delta) -> void:
	if Input.is_action_pressed("shield_up0"):
		shield_to_pos(Position.UP)
	elif Input.is_action_pressed("shield_down0"):
		shield_to_pos(Position.DOWN)
	else:
		shield_to_pos(Position.DEFAULT)
	
	
func shield_to_pos(pos : Position) -> void:
	match pos:
		Position.UP:
			print("raised")
		Position.DOWN:
			print("lowered")
		_:
			print("default")
