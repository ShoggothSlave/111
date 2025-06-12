extends Node2D

func _on_area_2d_body_entered(_body: Node2D) -> void:
	if _body is player:
		$AnimationPlayer.play("flipping")
		$flip_timer.start()

func _on_flip_timer_timeout() -> void:
	$AnimationPlayer.play("stable")
