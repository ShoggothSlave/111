extends Area2D

func _on_body_entered(_body: Node2D) -> void:
	if _body is player:
		ManagerPlayer.laddering = true

func _on_body_exited(_body: Node2D) -> void:
	if _body is player:
		ManagerPlayer.laddering = false
