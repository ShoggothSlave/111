extends Area2D

var player_in_collision = false

func _ready() -> void:
	if PassageManager.un_moins_un_caverne == false:
		$Sprite2D.frame = 0
	elif PassageManager.un_moins_un_caverne == true:
		$Sprite2D.frame = 1

func _on_area_entered(_area: Area2D) -> void:
	if _area.is_in_group("explosion"):
		$Sprite2D.frame = 1
		PassageManager.un_moins_un_caverne = true

func _process(_delta: float) -> void:
	if player_in_collision:
		if $Sprite2D.frame == 1 and Input.is_action_just_pressed("up"):
			get_tree().change_scene_to_file("res://levels/caverne_1_un_moins_un.tscn")

func _on_body_entered(_body: Node2D) -> void:
	if _body is player:
		player_in_collision = true

func _on_body_exited(_body: Node2D) -> void:
	if _body is player:
		player_in_collision = false
