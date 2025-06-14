extends Node2D

func _ready() -> void:
	ManagerPlayer.hp = ManagerPlayer.hpmax
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
		process_mode = PROCESS_MODE_DISABLED; # old method pauses the ENTIRE SCENE TREE including the level
	elif LevelCheckManager.worldmap_pause == false:
		process_mode = PROCESS_MODE_INHERIT; # old method pauses the ENTIRE SCENE TREE including the level

	if ManagerPlayer.dice1 != 0:
		ManagerPlayer.dice1 = 0

	if LevelCheckManager.home == true:
		$demi_point_home.play("checked")
	if LevelCheckManager.un_moins_un == true:
		$"point_1-1".play("checked")
	if LevelCheckManager.pique == true:
		$pique_popper.play("popped")
	if LevelCheckManager.un_1 == true:
		$point_1_1.play("checked")
	if LevelCheckManager.un_2 == true:
		$point_1_2.play("checked")
	if LevelCheckManager.un_3 == true:
		$point_1_3.play("checked")
	if LevelCheckManager.un_dunjeon == true:
		$dunjeon_sprite.play("destroyed")
