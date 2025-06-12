extends Node2D

func _on_area_2d_body_entered(_body: Node2D) -> void:
	if _body is player:
		ManagerPlayer.inwater = true
		$AnimatedSprite2D.global_position.x = _body.global_position.x
		$AnimatedSprite2D.play("splash")
		$AudioStreamPlayer.play()
		_body._flat()

func _on_area_2d_body_exited(_body: Node2D) -> void:
	if _body is player:
		ManagerPlayer.inwater = false
