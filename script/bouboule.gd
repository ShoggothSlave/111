extends CharacterBody2D

const SPEED = 150.0
const gravity = 1000
const UP = Vector2(0, -1)

var bouboule = 4
var speed = 25
var dirx = 0
var dead = false

@onready var bouboule_sprite = $AnimationPlayer

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
		if bouboule == 4:
			bouboule_sprite.play("walk")
		elif bouboule == 3:
			bouboule_sprite.play("walk3")
		elif bouboule == 2:
			bouboule_sprite.play("walk2")
		elif bouboule == 1:
			bouboule_sprite.play("walk1")
		if right:
			$Sprite2D.flip_h = true
		if left:
			$Sprite2D.flip_h = false

func _on_death_timer_timeout() -> void:
	queue_free()

func _on_killzone_1_body_entered(_body: Node2D) -> void:
	if _body is player:
		ManagerPlayer.hp = ManagerPlayer.hp -1
		if ManagerPlayer.hp < 1:
			_body._mort()
		elif ManagerPlayer.hp > 0:
			_body._ouch()
	if _body.is_in_group("frappe"):
		bouboule = bouboule - 1
		if bouboule > 0:
			pass
		elif bouboule == 0:
			ManagerPlayer.points = ManagerPlayer.points + 200
			bouboule_sprite.play("mort")
			queue_free()

func _on_killzone_2_body_entered(_body: Node2D) -> void:
	if _body is player:
		ManagerPlayer.hp = ManagerPlayer.hp -1
		if ManagerPlayer.hp < 1:
			_body._mort()
		elif ManagerPlayer.hp > 0:
			_body._ouch()
	if _body.is_in_group("frappe"):
		bouboule = bouboule - 1
		if bouboule > 0:
			pass
		elif bouboule == 0:
			ManagerPlayer.points = ManagerPlayer.points + 200
			bouboule_sprite.play("mort")
			queue_free()

func _on_killzone_3_body_entered(_body: Node2D) -> void:
	if _body is player:
		ManagerPlayer.hp = ManagerPlayer.hp -1
		if ManagerPlayer.hp < 1:
			_body._mort()
		elif ManagerPlayer.hp > 0:
			_body._ouch()
	if _body.is_in_group("frappe"):
		bouboule = bouboule - 1
		if bouboule > 0:
			pass
		elif bouboule == 0:
			ManagerPlayer.points = ManagerPlayer.points + 200
			bouboule_sprite.play("mort")
			queue_free()

func _on_stompzone_body_entered(_body: Node2D) -> void:
	if _body is player:
		bouboule = bouboule - 1
		_body._bounce()
		if bouboule > 0:
			pass
		elif bouboule == 0:
			ManagerPlayer.points = ManagerPlayer.points + 200
			bouboule_sprite.play("mort")
			queue_free()

func _kill():
	queue_free()
