extends CharacterBody2D

const gravity = 1000
const UP = Vector2(0, -1)

var speed = 25
var dirx = 0
var dead = false

@onready var carni_sprite = $AnimatedSprite2D

func _on_timer_timeout() -> void:
	var m = int(randf_range(0, 10))
	if dead == false:
		if m < 5:
			dirx = -1
		elif m > 5:
			dirx = 1
		else:
			dirx = 0

func _physics_process(_delta):
	if dead == false:
		velocity.x = 0
		velocity.y += gravity * _delta
		_movement_loop()
		move_and_slide()

func _movement_loop():
	if dead == false:
		var right = (dirx == 1)
		var left = (dirx == -1)
		if dirx == -1:
			velocity.x -= speed
		if dirx == 1:
			velocity.x += speed

		if is_on_wall():
			dirx += -1
		if right:
			carni_sprite.flip_h = true
			carni_sprite.play("walk")
		if left:
			carni_sprite.flip_h = false
			carni_sprite.play("walk")

func _on_killzone_body_entered(_body: Node2D) -> void:
	if _body is player:
		ManagerPlayer.hp = ManagerPlayer.hp -1
		if ManagerPlayer.hp < 1:
			_body._mort()
		elif ManagerPlayer.hp > 0:
			_body._ouch()
	if _body.is_in_group("frappe"):
		dead = true
		ManagerPlayer.points = ManagerPlayer.points + 100
		$death_timer.start()
		carni_sprite.play("dead")
		pass

func _on_stompable_body_entered(_body: Node2D) -> void:
	if _body is player:
		dead = true
		_body._bounce()
		ManagerPlayer.points = ManagerPlayer.points + 100
		$death_timer.start()
		carni_sprite.play("dead")

func _on_death_timer_timeout() -> void:
	queue_free()

func _kill():
	queue_free()
