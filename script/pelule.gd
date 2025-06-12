extends Node2D

func _on_area_2d_body_entered(_body: Node2D) -> void:
	if _body is player:
		ManagerPlayer.hp = ManagerPlayer.hp +1
		ManagerPlayer.points = ManagerPlayer.points + 50
		_body._itemsound()
		queue_free()
