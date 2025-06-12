extends Node2D

func _ready() -> void:
	$AnimatedSprite2D.play("rotate")

func _on_area_2d_body_entered(_body: Node2D) -> void:
	if _body is player:
		ManagerPlayer.money = ManagerPlayer.money + 20
		ManagerPlayer.points = ManagerPlayer.points + 200
		_body._cashsound()
		queue_free()
