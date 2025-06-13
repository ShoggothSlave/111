extends Area2D

var collide = false

func _process(_delta: float) -> void:
	if collide == true:
		if Input.is_action_just_pressed("interact"):
			_interact()

func _on_body_entered(_body: Node2D) -> void:
	if _body is player:
		ManagerPlayer.interaction_possible = true
		collide = true

func _on_body_exited(_body: Node2D) -> void:
	if _body is player:
		ManagerPlayer.interaction_possible = false
		collide = false

func _interact():
	$AnimationPlayer.play("cueillir")
	ManagerPlayer.money = ManagerPlayer.money + 2
	$Timer.start()

func _on_timer_timeout() -> void:
	queue_free()
