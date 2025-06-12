extends Area2D

var collide = false
var openable = true
var vide = false

func _process(_delta: float) -> void:
	if collide == true:
		if ManagerPlayer.interaction_possible == true:
			if Input.is_action_just_pressed("interact"):
				_interact()

func _interact():
	if openable == true:
		$AnimatedSprite2D.play("ouvert")
		openable = false
		if vide == false:
			ManagerPlayer.hp = ManagerPlayer.hp + 1
			ManagerPlayer.points = ManagerPlayer.points + 25
			$bouffe.play()
			ManagerPlayer.interaction_possible = false
			vide = true

func _on_body_entered(_body: Node2D) -> void:
	if _body is player:
		if vide == false:
			ManagerPlayer.interaction_possible = true
			collide = true

func _on_body_exited(_body: Node2D) -> void:
	if _body is player:
		ManagerPlayer.interaction_possible = false
		collide = false
