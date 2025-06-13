extends Area2D

var player_in_collision = false

func _ready() -> void:
	get_tree().paused = false

func _process(_delta: float) -> void:
	if player_in_collision:
		if Input.is_action_just_pressed("up"):
			$"../../black_screen".show()
			$"../../cave_exit_timer".start()

func _on_body_entered(_body: Node2D) -> void:
	if _body is player:
		player_in_collision = true

func _on_body_exited(_body: Node2D) -> void:
	if _body is player:
		player_in_collision = false

func _on_cave_exit_timer_timeout() -> void:
	$"../../player".position = Vector2(1385, 550)
	$"../../traveling_timer".start()
