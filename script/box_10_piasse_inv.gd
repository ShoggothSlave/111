extends Node2D

var kickable_left = false
var kickable_right = false
var vide = false

func _on_area_10_piasse_inv_body_entered(_body: Node2D) -> void:
	if vide == false:
		if _body is player:
			$AnimationPlayer.play("pop_up")
			ManagerPlayer.money = ManagerPlayer.money + 10
			ManagerPlayer.points = ManagerPlayer.points + 100
			vide = true

func _on_area_frappe_10_piasse_inv_left_body_entered(_body: Node2D) -> void:
	if vide == false:
		if _body is player:
			kickable_left = true

func _on_area_frappe_10_piasse_inv_left_body_exited(_body: Node2D) -> void:
	kickable_left = false

func _on_area_frappe_10_piasse_inv_right_body_entered(_body: Node2D) -> void:
	if vide == false:
		if _body is player:
			kickable_right = true

func _on_area_frappe_10_piasse_inv_right_body_exited(_body: Node2D) -> void:
	kickable_right = false

func _process(_delta: float) -> void:
	if kickable_left == true and Input.is_action_just_pressed("kick"):
		$AnimationPlayer.play("pop_left")
		kickable_left = false
		kickable_right = false
		vide = true
		ManagerPlayer.money = ManagerPlayer.money + 10
		ManagerPlayer.points = ManagerPlayer.points + 100
	if kickable_right == true and Input.is_action_just_pressed("kick"):
		$AnimationPlayer.play("pop_right")
		kickable_left = false
		kickable_right = false
		vide = true
		ManagerPlayer.money = ManagerPlayer.money + 10
		ManagerPlayer.points = ManagerPlayer.points + 100
