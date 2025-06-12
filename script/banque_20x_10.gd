extends Node2D

var rest = 10
var kickable_left = false
var kickable_right = false
var vide = false

func _on_area_banque_20_piasse_body_entered(_body: Node2D) -> void:
	if vide == false:
		if rest <= 0:
			$AnimationPlayer.play("pop_up_end")
			vide = true
		if rest > 0:
			if _body is player:
				rest = rest - 1
				ManagerPlayer.money = ManagerPlayer.money + 20
				ManagerPlayer.points = ManagerPlayer.points + 200
				if rest == 10:
					$AnimationPlayer.play("pop_up")
				elif rest == 9:
					$AnimationPlayer.play("pop_up_2")
				elif rest == 8:
					$AnimationPlayer.play("pop_up_3")
				elif rest == 7:
					$AnimationPlayer.play("pop_up_4")
				elif rest == 6:
					$AnimationPlayer.play("pop_up_5")
				elif rest == 5:
					$AnimationPlayer.play("pop_up_3")
				elif rest == 4:
					$AnimationPlayer.play("pop_up_4")
				elif rest == 3:
					$AnimationPlayer.play("pop_up_5")
				elif rest == 2:
					$AnimationPlayer.play("pop_up_3")
				elif rest == 1:
					$AnimationPlayer.play("pop_up_4")

func _on_area_banque_frappe_20_piasse_left_body_entered(_body: Node2D) -> void:
	if vide == false:
		if _body is player:
			kickable_left = true

func _on_area_banque_frappe_20_piasse_left_body_exited(_body: Node2D) -> void:
	kickable_left = false

func _on_area_banque_frappe_20_piasse_right_body_entered(_body: Node2D) -> void:
	if vide == false:
		if _body is player:
			kickable_right = true

func _on_area_banque_frappe_20_piasse_right_body_exited(_body: Node2D) -> void:
	kickable_right = false

func _process(_delta: float) -> void:
	if kickable_left == true and Input.is_action_just_pressed("kick"):
		if rest <= 0:
			$AnimationPlayer.play("pop_left_end")
			vide = true
		if rest > 0:
			rest = rest - 1
			ManagerPlayer.money = ManagerPlayer.money + 20
			ManagerPlayer.points = ManagerPlayer.points + 200
			if rest == 10:
				$AnimationPlayer.play("pop_left")
			elif rest == 9:
				$AnimationPlayer.play("pop_left_2")
			elif rest == 8:
				$AnimationPlayer.play("pop_left_3")
			elif rest == 7:
				$AnimationPlayer.play("pop_left_4")
			elif rest == 6:
				$AnimationPlayer.play("pop_left_5")
			elif rest == 5:
				$AnimationPlayer.play("pop_left_3")
			elif rest == 4:
				$AnimationPlayer.play("pop_left_4")
			elif rest == 3:
				$AnimationPlayer.play("pop_left_5")
			elif rest == 2:
				$AnimationPlayer.play("pop_left_3")
			elif rest == 1:
				$AnimationPlayer.play("pop_left_4")

	if kickable_right == true and Input.is_action_just_pressed("kick"):
		if rest <= 0:
			$AnimationPlayer.play("pop_right_end")
			vide = true
		if rest > 0:
			rest = rest - 1
			ManagerPlayer.money = ManagerPlayer.money + 20
			ManagerPlayer.points = ManagerPlayer.points + 200
			if rest == 10:
				$AnimationPlayer.play("pop_right")
			elif rest == 9:
				$AnimationPlayer.play("pop_right_2")
			elif rest == 8:
				$AnimationPlayer.play("pop_right_3")
			elif rest == 7:
				$AnimationPlayer.play("pop_right_4")
			elif rest == 6:
				$AnimationPlayer.play("pop_right_5")
			elif rest == 5:
				$AnimationPlayer.play("pop_right_3")
			elif rest == 4:
				$AnimationPlayer.play("pop_right_4")
			elif rest == 3:
				$AnimationPlayer.play("pop_right_5")
			elif rest == 2:
				$AnimationPlayer.play("pop_right_3")
			elif rest == 1:
				$AnimationPlayer.play("pop_right_4")
