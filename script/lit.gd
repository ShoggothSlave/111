extends Area2D

var collide = false
var dormable = true

func _process(_delta: float) -> void:
	if collide == true:
		if ManagerPlayer.interaction_possible == true:
			if Input.is_action_just_pressed("interact"):
				_interact()

func _interact():
	if dormable == true:
		ManagerPlayer.interaction_possible = false
		ManagerPlayer.music_pause = true
		ManagerPlayer.hp = ManagerPlayer.hpmax
		$AudioStreamPlayer.play()
		$music_timer.start()
		dormable = false
		if $Timer.is_stopped():
			$Timer.start()
			self.set_collision_mask_value(1, false)

func _on_timer_timeout() -> void:
	$AnimatedSprite2D.play("fermé")
	dormable = true
	self.set_collision_mask_value(1, true)

func _on_body_entered(_body: Node2D) -> void:
	if _body is player:
		if dormable == true:
			ManagerPlayer.interaction_possible = true
			collide = true

func _on_body_exited(_body: Node2D) -> void:
	if _body is player:
		ManagerPlayer.interaction_possible = false
		collide = false

func _on_music_timer_timeout() -> void:
	ManagerPlayer.music_pause = false
