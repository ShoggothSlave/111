extends Area2D

func _on_body_entered(_body: Node2D) -> void:
	if _body is player:
		$AnimatedSprite2D.play("popped")
		WorldManager.pique = true
		$AudioStreamPlayer.play()
		ManagerPlayer.points = ManagerPlayer.points + 1000
		ManagerPlayer.vies = ManagerPlayer.vies + 1
