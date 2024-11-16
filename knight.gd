extends CharacterBody2D

@export var player: Global.Player
@export var speed = 200
var min_x = 0
var max_x = DisplayServer.window_get_size().x

func _ready() -> void:
	if (player == Global.Player.TWO):
		scale.x = -1
	
func get_input():
	var horizontal = Input.get_action_strength("knight_forward" + str(player)) - Input.get_action_strength("knight_backward" + str(player))
	velocity.x = horizontal * speed
	position.x = clampi(position.x, min_x, max_x)
	
	
func _process(delta: float) -> void:
	get_input()
	move_and_slide()


func _on_lance_body_entered(body: Node2D) -> void:
	if body.is_in_group("Player") && body != self:
		print("killed")
		body.queue_free()
		$Crown.visible = true
		await get_tree().create_timer(5.0).timeout
		get_tree().reload_current_scene()
	
