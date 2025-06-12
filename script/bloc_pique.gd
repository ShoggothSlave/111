extends Node2D

func _process(_delta: float) -> void:
	if WorldManager.pique == false:
		$AnimationPlayer.play("vide")
	elif WorldManager.pique == true:
		$AnimationPlayer.play("plein")
