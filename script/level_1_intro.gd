extends Node2D

func _ready() -> void:
	ManagerPlayer.control_level = true
	ManagerPlayer.control_worldmap = false
	LevelCheckManager.worldmap_pause = true
	if ManagerPlayer.music_pause == false:
		$level_music.play()

func _on_area_2d_body_entered(_body: Node2D) -> void:
	if _body is player:
		$house_front.hide()
		$ladder4.show()

func _on_area_2d_body_exited(_body: Node2D) -> void:
	if _body is player:
		$house_front.show()
		$ladder4.hide()

func _process(_delta: float) -> void:
	if ManagerPlayer.dead == true:
		$level_music.stop()
	if ManagerPlayer.music_pause == true:
		$music_pause_timer.start()
		$level_music.stop()

func _on_music_pause_timer_timeout() -> void:
	if ManagerPlayer.music_pause == false:
		$level_music.play()
