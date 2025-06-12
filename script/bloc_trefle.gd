extends Node2D

func _process(_delta: float) -> void:
	if WorldManager.trefle == false:
		$AnimationPlayer.play("vide")
	elif WorldManager.trefle == true:
		$AnimationPlayer.play("plein")
