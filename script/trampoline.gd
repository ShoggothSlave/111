extends CharacterBody2D

const gravity = 1000

var jump_force = 300
var speed = 25.0
var pumped = false

func _physics_process(_delta):
	velocity.x = 0
	velocity.y += gravity * _delta
	move_and_slide()

func _on_area_2d_body_entered(_body: Node2D) -> void:
	$AnimationPlayer.play("pompe")
	pumped = true
	ManagerPlayer.megajump = true

func _on_area_2d_body_exited(_body: Node2D) -> void:
	if pumped == true:
		$AnimationPlayer.play("depompe")
		pumped = false
		ManagerPlayer.megajump = false

func _process(_delta: float) -> void:
	if pumped == true and Input.is_action_just_pressed("jump"):
		$AnimationPlayer.play("spring")
		pumped = false
		$Timer.start()

func _on_timer_timeout() -> void:
	ManagerPlayer.megajump = false

func _on_area_2d_2_body_entered(_body: Node2D) -> void:
	if _body is player:
		velocity.y = -jump_force * 1
		$trampoline_spring.play()
