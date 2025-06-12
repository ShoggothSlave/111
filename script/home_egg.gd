extends Area2D

func _ready() -> void:
	if WorldManager.home_egg == false:
		queue_free()

func _on_body_entered(_body: Node2D) -> void:
	WorldManager.home_egg = false
	ManagerPlayer.points = ManagerPlayer.points + 2500
	_body._easter()
	queue_free()
	WorldManager.easter_egg = WorldManager.easter_egg + 1
