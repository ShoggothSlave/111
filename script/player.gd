extends CharacterBody2D
class_name player

var sprint = false
var blessure = false
var kicking = false
var protect = false

@export var gravity = 350
@export var speed = 100
@export var jump_force = 170
@export var rebound_force = 170

@export var acceleration = 0.05

@onready var hero_sprite = $hero_sprite/AnimationPlayer

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	$HUD/label_time.show()
	ManagerPlayer.controlable = true

func _physics_process(_delta):
	if ManagerPlayer.control_level == true:
		if kicking == true:
			$kick.set_collision_mask_value(5, true)
		elif kicking == false:
			$kick.set_collision_mask_value(5, false)
		if ManagerPlayer.dead == false:
			if ManagerPlayer.controlable == true:
				if !is_on_floor():
					if ManagerPlayer.laddering == false:
						velocity.y = clamp(velocity.y + gravity * _delta, -500, 500)

				var direction = Input.get_axis("left", "right")
				if direction != 0:
					$hero_sprite.flip_h = (direction == -1)


				if ManagerPlayer.laddering == false:
					if ManagerPlayer.inwater == false:
						if Input.is_action_pressed("sprint"):
							sprint = true
							speed = 150
						elif Input.is_action_just_released("sprint"):
							sprint = false
							speed = 100
							jump_force = 170
						if Input.is_action_just_pressed("kick"):
							kicking = true
							$kick/kick_timer.start()
							hero_sprite.play("kick")
							$audio_kick.play()
							$kick/kick_coll.disabled = false
							$kick.set_collision_mask_value(5, true)
							$kick.set_collision_mask_value(6, true)
						elif !Input.is_action_pressed("kick"):
							kicking = false
						if Input.is_action_pressed("down"):
							hero_sprite.play("protect")
							protect = true
						else:
							protect = false
				if ManagerPlayer.laddering == false:
					if ManagerPlayer.inwater == false:
						if Input.is_action_just_pressed("jump") and is_on_floor():
							if sprint == true and velocity.x > 0:
								jump_force = 200
						if Input.is_action_just_pressed("jump") and is_on_floor():
							velocity.y = -jump_force
							$audio_jump.play()
					elif ManagerPlayer.inwater == true:
						if Input.is_action_just_pressed("jump"):
							velocity.y = -jump_force
							$audio_dive.play()
				elif ManagerPlayer.laddering == true:
					gravity = 0
					if Input.is_action_pressed("up"):
						hero_sprite.play("climb")
						velocity.y = -speed * 10 * _delta
					elif Input.is_action_pressed("down"):
						hero_sprite.play("climb")
						velocity.y = speed * 10 * _delta
					else:
						hero_sprite.play("climb_pause")
						velocity.y = 0
				else:
					gravity = 350

				velocity.x = lerp(velocity.x, direction * speed, acceleration)
				_update_animations(direction)
				move_and_slide()

	elif ManagerPlayer.control_worldmap == true:
		pass

func _update_animations(direction):
	if ManagerPlayer.control_level == true:
		if ManagerPlayer.dead == false:
			if blessure == false:
				if ManagerPlayer.controlable == true:
					if ManagerPlayer.laddering == false:
						if ManagerPlayer.inwater == false:
							if kicking == false:
								if is_on_floor():
									if direction == 0:
										if Input.is_action_pressed("ui_up"):
											hero_sprite.play("walk_back")
										elif Input.is_action_pressed("ui_down"):
											hero_sprite.play("walk_face")
										else:
											if protect == false:
												hero_sprite.play("idle")
									elif direction != 0 and sprint == false:
										hero_sprite.play("walk")
									elif direction != 0 and sprint == true:
										hero_sprite.play("run")
								elif !is_on_floor():
									if velocity.y < 0:
										hero_sprite.play("jump")
									elif velocity.y > 0:
										hero_sprite.play("fall")
						elif ManagerPlayer.inwater == true:
							hero_sprite.play("dive")

	elif ManagerPlayer.control_worldmap == true:
		pass

func _process(_delta: float) -> void:

	if ManagerPlayer.control_level == true:

		if $hero_sprite.flip_h == false:
			$bomb_marker.position.x = 16
		if $hero_sprite.flip_h == true:
			$bomb_marker.position.x = -16
		if (ManagerPlayer.bombes > 0) and (Input.is_action_just_pressed("bombing")):
			_bombing(scene_file_path)

		if ManagerPlayer.megajump == true :
			if Input.is_action_just_pressed("jump"):
				velocity.y = -jump_force * 2.25
				ManagerPlayer.megajump = false

		if ManagerPlayer.interaction_possible == true:
			$interact_sprite.show()
		elif ManagerPlayer.interaction_possible == false:
			$interact_sprite.hide()

		if ManagerPlayer.oxy == 0:
			ManagerPlayer.dead = true
		if ManagerPlayer.dead == true:
			_controls_off()

		if ManagerPlayer.inwater == true:
			gravity = 50
			speed = 50
			jump_force = 35
			acceleration = 0.025
		elif ManagerPlayer.inwater == false:
			gravity = 350
			speed = 100
			jump_force = 170
			acceleration = 0.05

	#mask changing
		if Input.is_action_just_pressed("ui_down"):
			if get_collision_mask_value(2) == true:
				set_collision_mask_value(2, false)
				set_collision_mask_value(3, true)
				z_index = 3
			elif get_collision_mask_value(3) == true:
				set_collision_mask_value(3, false)
				set_collision_mask_value(4, true)
				z_index = 4

		if Input.is_action_just_pressed("ui_up"):
			if get_collision_mask_value(4) == true:
				set_collision_mask_value(4, false)
				set_collision_mask_value(3, true)
				z_index = 3
			elif get_collision_mask_value(3) == true:
				set_collision_mask_value(3, false)
				set_collision_mask_value(2, true)
				z_index = 2

		if ManagerPlayer.hp > ManagerPlayer.hpmax:
			ManagerPlayer.hp = ManagerPlayer.hpmax
		if ManagerPlayer.vies > ManagerPlayer.viesmax:
			ManagerPlayer.vies = ManagerPlayer.viesmax
		if ManagerPlayer.money > ManagerPlayer.moneymax:
			ManagerPlayer.money = ManagerPlayer.moneymax
		if ManagerPlayer.points > ManagerPlayer.pointsmax:
			ManagerPlayer.points = ManagerPlayer.pointsmax

	elif ManagerPlayer.control_worldmap == true:
		pass

func _mort():
	if ManagerPlayer.inwater == false:
		ManagerPlayer.dead = true
		if $timer_mort.is_stopped():
			$timer_mort.start()
		if $timer_cris_mort.is_stopped():
			$timer_cris_mort.start()
		$cris_mort_1.play()
		hero_sprite.play("mort")
		$Music_mort.play()
		ManagerPlayer.vies = ManagerPlayer.vies - 1
	elif ManagerPlayer.inwater == true:
		ManagerPlayer.dead = true
		hero_sprite.play("noye")
		if $timer_mort.is_stopped():
			$timer_mort.start()
		ManagerPlayer.vies = ManagerPlayer.vies - 1

func _controls_on():
	ManagerPlayer.controlable = true

func _controls_off():
	ManagerPlayer.controlable = false

func _bounce():
	if !Input.is_action_just_pressed("jump"):
		velocity.y = -jump_force * 0.8
	elif Input.is_action_just_pressed("jump"):
		velocity.y = -jump_force * 1
	$boing.play()

func _kick():
	$audio_kick_hit.play()

func _ouch():
	blessure = true
	$blessure_timer.start()
	$ouch.play()
	hero_sprite.play("hurt")

func _coinsound():
	$audio_coin.play()

func _cashsound():
	$audio_cash.play()

func _itemsound():
	$audio_item.play()

func _on_timer_cris_mort_timeout() -> void:
	$cris_mort_2.play()

func _on_timer_mort_timeout() -> void:
	if ManagerPlayer.vies >= 0:
		ManagerPlayer.control_level = false
		ManagerPlayer.control_worldmap = true
		get_tree().change_scene_to_file("res://levels/worldmap.tscn")
	elif ManagerPlayer.vies < 0:
		get_tree().quit()

func _on_blessure_timer_timeout() -> void:
	blessure = false

func _on_kick_timer_timeout() -> void:
	kicking = false
	$kick/kick_coll.disabled = true
	$kick.set_collision_mask_value(5, false)
	$kick.set_collision_mask_value(6, false)

func _flat():
	velocity.y = velocity.y / 10
	velocity.x = velocity.x / 10

func _heart_find():
	$AudioStreamPlayer.play()
	ManagerPlayer.hpmax = ManagerPlayer.hpmax + 1
	ManagerPlayer.hp = ManagerPlayer.hpmax
	ManagerPlayer.points = ManagerPlayer.points + 2000

func _easter():
	$audio_easter.play()

func _bombing(_scene_file_path):
	var scene_resource = load("res://misc/bombe_larguee.tscn")
	var object = scene_resource.instantiate()
	var new_position = $"bomb_marker".global_position
	object.global_position = new_position
	get_parent().add_child(object)
	ManagerPlayer.bombes = ManagerPlayer.bombes - 1
