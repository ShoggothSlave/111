extends Node2D

func _process(_delta: float) -> void:
	if WorldManager.carreau == false:
		$AnimationPlayer.play("vide")
	elif WorldManager.carreau == true:
		$AnimationPlayer.play("plein")
