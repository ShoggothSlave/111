extends Node2D

func _process(_delta: float) -> void:
	if WorldManager.coeur == false:
		$AnimationPlayer.play("vide")
	elif WorldManager.coeur == true:
		$AnimationPlayer.play("plein")
