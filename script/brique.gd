extends Node2D

func _on_area_2d_body_entered(_body: Node2D) -> void:
	if _body is player:
		$AnimationPlayer.play("explode")
		$Timer.start()
		ManagerPlayer.points = ManagerPlayer.points + 5

func _on_timer_timeout() -> void:
	queue_free()
