extends Area2D

var player_in_collision = false

func _on_area_entered(_area: Area2D) -> void:
	if _area.is_in_group("explosion"):
		$Sprite2D.frame = 1
		$AudioStreamPlayer.play()

func _process(_delta: float) -> void:
	if player_in_collision:
		if $Sprite2D.frame == 1 and Input.is_action_just_pressed("up"):
			get_tree().quit()

func _on_body_entered(_body: Node2D) -> void:
	if _body is player:
		player_in_collision = true

func _on_body_exited(_body: Node2D) -> void:
	if _body is player:
		player_in_collision = false
