extends Node2D

func _ready() -> void:
	$Sprite2D/AnimationPlayer.play("beat")
	if WorldManager.coeur1 == false:
		queue_free()

func _on_area_2d_body_entered(_body: Node2D) -> void:
	if _body is player:
		WorldManager.coeur1 = false
		_body._heart_find()
		queue_free()
		
