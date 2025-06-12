extends Area2D

var jump_force = 300
var speed = 25.0

func _ready() -> void:
	$AnimationPlayer.play("spin")

func _on_body_entered(_body: Node2D) -> void:
	if _body is player:
		if $Sprite2D.frame == 0:
			_body.velocity.y = -jump_force * 1
		elif $Sprite2D.frame == 1:
			_body.velocity.y = -jump_force * 1
			_body.velocity.x = jump_force * 1
		elif $Sprite2D.frame == 2:
			_body.velocity.x = jump_force * 1
		elif $Sprite2D.frame == 3:
			_body.velocity.y = jump_force * 1
			_body.velocity.x = -jump_force * 1
		elif $Sprite2D.frame == 4:
			_body.velocity.y = jump_force * 1
		elif $Sprite2D.frame == 5:
			_body.velocity.y = jump_force * 1
			_body.velocity.x = -jump_force * 1
		elif $Sprite2D.frame == 6:
			_body.velocity.x = -jump_force * 1
		elif $Sprite2D.frame == 7:
			_body.velocity.y = -jump_force * 1
			_body.velocity.x = -jump_force * 1
