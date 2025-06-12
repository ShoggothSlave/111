extends StaticBody2D

var collide = false

func _process(_delta: float) -> void:
	if collide == true:
		if ManagerPlayer.warpable == true:
			if Input.is_action_just_pressed("interact"):
				_interact(_delta)

func _interact(_delta):
	ManagerPlayer.warpable = false
	$warp_timer.start()
	$black_screen.show()

func _on_area_2d_body_entered(_body: Node2D) -> void:
	if _body is player:
		ManagerPlayer.warpable = true
		ManagerPlayer.interaction_possible = true
		collide = true

func _on_area_2d_body_exited(_body: Node2D) -> void:
	if _body is player:
		ManagerPlayer.warpable = false
		ManagerPlayer.interaction_possible = false
		collide = false

func _on_warp_timer_timeout() -> void:
	ManagerPlayer.controlable = false
	LevelCheckManager.worldmap_pause = false
	get_tree().change_scene_to_file("res://levels/worldmap.tscn")
