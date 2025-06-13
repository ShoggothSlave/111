extends Node2D

func _ready() -> void:
	ManagerPlayer.controlable = true
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	ManagerPlayer.control_worldmap = false
	ManagerPlayer.control_level = true
	LevelCheckManager.worldmap_pause = true

func _on_traveling_timer_timeout() -> void:
	$black_screen.hide()
