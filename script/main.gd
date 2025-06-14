extends Node

func _ready() -> void:
	#get_tree().change_scene_to_file("res://levels/worldmap.tscn")
	pass

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("switch_level"):
		LevelCheckManager.worldmap_pause = not LevelCheckManager.worldmap_pause
		
	# i dont know where else to put this 
		
	update_worldmap_pause_state($worldmap, $level_1_intro)
	pass
	
func update_worldmap_pause_state(_worldmap, _level1) -> void:
	# the reason why this is also here and in the worldmap.gd is because
	# once the worldmap is paused, we can never unpause it without external help
	# feel free to delete the one in worldmap.gd, hopefully it still works
	if LevelCheckManager.worldmap_pause == true:
		_worldmap.process_mode = PROCESS_MODE_DISABLED;
		_level1.process_mode = PROCESS_MODE_INHERIT;
		
		ManagerPlayer.control_worldmap = false
		ManagerPlayer.control_level = true
		
	elif LevelCheckManager.worldmap_pause == false:

		_worldmap.process_mode = PROCESS_MODE_INHERIT;
		_level1.process_mode = PROCESS_MODE_DISABLED;
		
		ManagerPlayer.control_worldmap = true
		ManagerPlayer.control_level = false
