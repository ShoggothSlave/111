extends Node2D

func _ready() -> void:
	ManagerPlayer.controlable = true
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	ManagerPlayer.control_worldmap = false
	ManagerPlayer.control_level = true
	LevelCheckManager.worldmap_pause = true
