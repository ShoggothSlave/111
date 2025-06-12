extends Area2D

func _process(_delta: float) -> void:
	if ManagerPlayer.interaction_possible == true:
		if Input.is_action_just_pressed("interact"):
			_interact()

func _interact():
	$Sprite2D.show()
	$audio_open.play()
	if $Timer.is_stopped():
		$Timer.start()

func _on_timer_timeout() -> void:
	$Sprite2D.hide()
	$audio_close.play()

func _on_body_entered(_body: Node2D) -> void:
	if _body is player:
		ManagerPlayer.interaction_possible = true

func _on_body_exited(_body: Node2D) -> void:
	if _body is player:
		ManagerPlayer.interaction_possible = false
