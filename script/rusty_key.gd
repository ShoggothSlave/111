extends Area2D

func _on_body_entered(_body: Node2D) -> void:
	if _body is player:
		_body.get_key()
		ManagerPlayer.rustykey = true
		queue_free()
