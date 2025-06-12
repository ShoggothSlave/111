extends Node2D

func _on_area_2d_body_entered(_body: Node2D) -> void:
	if _body is player:
		$StaticBody2D/AnimationPlayer.play("receive_force")

func _on_area_2d_body_exited(_body: Node2D) -> void:
	if _body is player:
		$StaticBody2D/AnimationPlayer.play("retire_force")
