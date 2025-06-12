extends Area2D

var player_in_collision = false

func _process(_delta: float) -> void:
	if player_in_collision:
		if Input.is_action_just_pressed("up"):
			get_tree().change_scene_to_file("res://levels/level_1_moins_1.tscn")

func _on_body_entered(_body: Node2D) -> void:
	if _body is player:
		player_in_collision = true

func _on_body_exited(_body: Node2D) -> void:
	if _body is player:
		player_in_collision = false
