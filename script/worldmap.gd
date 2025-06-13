extends Node2D

func _ready() -> void:
	ManagerPlayer.control_worldmap = true
	ManagerPlayer.control_level = false
	ManagerPlayer.controlable = false
	ManagerPlayer.dead = false
	LevelCheckManager.worldmap_pause = false
	if LevelCheckManager.home == true:
		$worldmap_player.global_position = $demi_point_home/home_mark.global_position
	if LevelCheckManager.un_moins_un == true:
		$worldmap_player.global_position = $"point_1-1/1-1_mark".global_position
	if LevelCheckManager.pique == true:
		$worldmap_player.global_position = $pique_popper/pique_mark.global_position
	if LevelCheckManager.un_1 == true:
		$worldmap_player.global_position = $"point_1_1/1_1_mark".global_position
	if LevelCheckManager.un_2 == true:
		$worldmap_player.global_position = $"point_1_2/1_2_mark".global_position
	if LevelCheckManager.un_3 == true:
		$worldmap_player.global_position = $"point_1_3/1_3_mark".global_position
	if LevelCheckManager.un_dunjeon == true:
		$worldmap_player.global_position = $dunjeon_1_mark.global_position

func _process(_delta: float) -> void:
	if LevelCheckManager.worldmap_pause == true:
		get_tree().paused = true;
	elif LevelCheckManager.worldmap_pause == false:
		get_tree().paused = false;

	if ManagerPlayer.dice1 != 0:
		ManagerPlayer.dice1 = 0
	if ManagerPlayer.dice2 != 0:
		ManagerPlayer.dice2 = 0
	if ManagerPlayer.dice3 != 0:
		ManagerPlayer.dice3 = 0
	if ManagerPlayer.dice4 != 0:
		ManagerPlayer.dice4 = 0
	if ManagerPlayer.dice5 != 0:
		ManagerPlayer.dice5 = 0
