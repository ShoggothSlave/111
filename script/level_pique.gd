extends Node2D

func _ready() -> void:
	ManagerPlayer.controlable = true
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	ManagerPlayer.control_worldmap = false
	ManagerPlayer.control_level = true
	LevelCheckManager.worldmap_pause = true
	ManagerPlayer.temps = 261

func _process(_delta: float) -> void:
	ManagerPlayer.hud_time = true
	if ManagerPlayer.fin_de_level == false:
		ManagerPlayer.temps = ManagerPlayer.temps - 1 * (_delta)
	if ManagerPlayer.fin_de_level == true:
		_fin_de_level()
		ManagerPlayer.fin_de_level = false
	if LevelCheckManager.pique == false:
		if ManagerPlayer.dead == true:
			WorldManager.pique = false

func _fin_de_level():
	if ManagerPlayer.fin_de_level == true:
		ManagerPlayer.points = ManagerPlayer.points + ManagerPlayer.temps
		LevelCheckManager.pique = true
		$timer_fin.start()

func _on_timer_fin_timeout() -> void:
	get_tree().change_scene_to_file("res://levels/worldmap.tscn")
