extends Area2D

var collide = false
var openable = true

func _process(_delta: float) -> void:
	if collide == true:
		if ManagerPlayer.interaction_possible == true:
			if Input.is_action_just_pressed("interact"):
				_interact()

func _interact():
	if openable == true:
		$Sprite2D.show()
		$audio_open.play()
		openable = false
		if $Timer.is_stopped():
			$Timer.start()
			$StaticBody2D.set_collision_layer_value(2, false)
			$StaticBody2D.set_collision_layer_value(3, false)
			$StaticBody2D.set_collision_layer_value(4, false)
			$StaticBody2D.set_collision_mask_value(1, false)
			$StaticBody2D.set_collision_mask_value(2, false)
			$StaticBody2D.set_collision_mask_value(3, false)

func _on_timer_timeout() -> void:
	$Sprite2D.hide()
	$audio_close.play()
	openable = true
	$StaticBody2D.set_collision_layer_value(2, true)
	$StaticBody2D.set_collision_layer_value(3, true)
	$StaticBody2D.set_collision_layer_value(4, true)
	$StaticBody2D.set_collision_mask_value(1, true)
	$StaticBody2D.set_collision_mask_value(5, true)
	$StaticBody2D.set_collision_mask_value(7, true)

func _on_body_entered(_body: Node2D) -> void:
	if _body is player:
		ManagerPlayer.interaction_possible = true
		collide = true

func _on_body_exited(_body: Node2D) -> void:
	if _body is player:
		ManagerPlayer.interaction_possible = false
		collide = false
