extends Node2D

var random_value = 0
var kickable_left = false
var kickable_right = false
var vide4 = false
@onready var dice = $dice

func _on_area_roll_dice_4_body_entered(_body: Node2D) -> void:
	if vide4 == false:
		if _body is player:
			_dice()
			vide4 = true

func _on_area_roll_dice_4_left_body_entered(_body: Node2D) -> void:
	if vide4 == false:
		if _body is player:
			kickable_left = true

func _on_area_roll_dice_4_left_body_exited(_body: Node2D) -> void:
	kickable_left = false

func _on_area_roll_dice_4_right_body_entered(_body: Node2D) -> void:
	if vide4 == false:
		if _body is player:
			kickable_right = true

func _on_area_roll_dice_4_right_body_exited(_body: Node2D) -> void:
	kickable_right = false

func _dice():
	randomize()
	random_value = int(randf_range(0, 7))

func _process(_delta: float) -> void:
	if random_value == 0:
		$dice.play("idle")
	if random_value == 1:
		dice.play("1")
		ManagerPlayer.dice4 = 1
	elif random_value == 2:
		dice.play("2")
		ManagerPlayer.dice4 = 2
	elif random_value == 3:
		dice.play("3")
		ManagerPlayer.dice4 = 3
	elif random_value == 4:
		dice.play("4")
		ManagerPlayer.dice4 = 4
	elif random_value == 5:
		dice.play("5")
		ManagerPlayer.dice4 = 5
	elif random_value == 6:
		dice.play("6")
		ManagerPlayer.dice4 = 6

	if kickable_left == true and Input.is_action_just_pressed("kick"):
		_dice()
		kickable_left = false
		kickable_right = false
		vide4 = true

	if kickable_right == true and Input.is_action_just_pressed("kick"):
		_dice()
		kickable_left = false
		kickable_right = false
		vide4 = true
