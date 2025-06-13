extends Node2D

var random_value = 0
var kickable_left = false
var kickable_right = false
var vide1 = false
@onready var dice = $dice

func _on_area_roll_dice_1_body_entered(_body: Node2D) -> void:
	if vide1 == false:
		if _body is player:
			_dice()

func _on_area_roll_dice_1_left_body_entered(_body: Node2D) -> void:
	if vide1 == false:
		if _body is player:
			kickable_left = true

func _on_area_roll_dice_1_left_body_exited(_body: Node2D) -> void:
	kickable_left = false

func _on_area_roll_dice_1_right_body_entered(_body: Node2D) -> void:
	if vide1 == false:
		if _body is player:
			kickable_right = true

func _on_area_roll_dice_1_right_body_exited(_body: Node2D) -> void:
	kickable_right = false

func _dice():
	randomize()
	$AudioStreamPlayer.play()
	random_value = int(randf_range(0, 7))
	ManagerPlayer.fin_de_level = true

func _process(_delta: float) -> void:
	if vide1 == true:
		random_value = 7
	if random_value == 0:
		$dice.play("idle")
	if random_value == 1:
		dice.play("1")
		ManagerPlayer.points = ManagerPlayer.points + 100
		vide1 = true
	elif random_value == 2:
		dice.play("2")
		ManagerPlayer.points = ManagerPlayer.points + 200
		vide1 = true
	elif random_value == 3:
		dice.play("3")
		ManagerPlayer.points = ManagerPlayer.points + 300
		vide1 = true
	elif random_value == 4:
		dice.play("4")
		ManagerPlayer.points = ManagerPlayer.points + 400
		vide1 = true
	elif random_value == 5:
		dice.play("5")
		ManagerPlayer.points = ManagerPlayer.points + 500
		vide1 = true
	elif random_value == 6:
		dice.play("6")
		ManagerPlayer.points = ManagerPlayer.points + 600
		ManagerPlayer.vies = ManagerPlayer.vies + 1
		$AudioStreamPlayer2.play()
		vide1 = true

	if kickable_left == true and Input.is_action_just_pressed("kick"):
		_dice()
		kickable_left = false
		kickable_right = false

	if kickable_right == true and Input.is_action_just_pressed("kick"):
		_dice()
		kickable_left = false
		kickable_right = false
