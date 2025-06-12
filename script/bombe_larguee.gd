extends CharacterBody2D

var gravity = 350

func _ready() -> void:
	$AnimationPlayer.play("decompte")
	$Timer.start()

func _physics_process(_delta):
	velocity.x = 0
	velocity.y += gravity * _delta
	move_and_slide()

func _on_area_2d_body_entered(_body: Node2D) -> void:
	if _body is player:
		_body._ouch()
		ManagerPlayer.hp = ManagerPlayer.hp -1
	if _body.is_in_group("ennemies"):
		_body.kill()
	if _body.is_in_group("passage_secret"):
		_body.ouverture()
	if _body.is_in_group("item"):
		_body.queue_free()
	if _body.is_in_group("pnj"):
		_body.queue_free()

func _on_timer_timeout() -> void:
	queue_free()
