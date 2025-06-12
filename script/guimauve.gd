extends Node2D

var jump_speed = 200

@onready var anim = $AnimationPlayer

func _on_area_left_body_entered(_body: Node2D) -> void:
	if _body is player:
		anim.play("pop_left")
		_body.velocity.x = -jump_speed * 1

func _on_area_right_body_entered(_body: Node2D) -> void:
	if _body is player:
		anim.play("pop_right")
		_body.velocity.x = jump_speed * 1

func _on_area_down_body_entered(_body: Node2D) -> void:
	if _body is player:
		anim.play("pop_up")
		_body.velocity.y = jump_speed * 1

func _on_area_up_body_entered(_body: Node2D) -> void:
	if _body is player:
		anim.play("pop_down")
		_body.velocity.y = -jump_speed * 1
