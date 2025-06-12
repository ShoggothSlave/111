extends CharacterBody2D
class_name wm_player

#places
var home = true
var un_moins_un = false
var pique = false
var un_1 = false
var un_2 = false
var un_3 = false
var un_dunjeon = false
var dive = false

var destination_marker : Marker2D
var vitesse_mouvement: Vector2 = Vector2(50, 50)
var marge_precision = 1 # Pixels

@onready var hero_sprite = $AnimationPlayer

func _ready() -> void:
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	$HUD/label_time.hide()

func _physics_process(_delta):

	if destination_marker == null:
		return

	var distance_au_marquer = global_position.distance_to(destination_marker.global_position)

	if distance_au_marquer < marge_precision:
		velocity = Vector2.ZERO
	else:
		var direction = (destination_marker.global_position - global_position).normalized()
		velocity = direction * vitesse_mouvement
		if velocity.x < 0:
			$hero_sprite.flip_h = true
		elif velocity.x > 0:
			$hero_sprite.flip_h = false
	move_and_slide()

func _process(_delta: float) -> void:

	if dive == false:
		if velocity.x == 0 and velocity.y == 0:
			hero_sprite.play("idle")
		if velocity.y != 0:
			if velocity.y < 0:
				if velocity.x == 0:
					hero_sprite.play("walk_up")
				if velocity.x > 0:
					if abs(velocity.y) > abs(velocity.x):
						hero_sprite.play("walk_up")
				if velocity.x < 0:
					if abs(velocity.y) > abs(velocity.x):
						hero_sprite.play("walk_up")
					if abs(velocity.y) < abs(velocity.x):
						hero_sprite.play("walk_side")

			if velocity.y > 0:
				if velocity.x > 0:
					if velocity.y > velocity.x:
						hero_sprite.play("walk_down")
				if velocity.x < 0:
					if abs(velocity.y) > abs(velocity.x):
						hero_sprite.play("walk_down")
					if abs(velocity.y) < abs(velocity.x):
						hero_sprite.play("walk_side")
				if velocity.x == 0:
					hero_sprite.play("walk_down")

		if velocity.x != 0:
			if abs(velocity.x) > abs(velocity.y):
				hero_sprite.play("walk_side")

	if dive == true:
		if velocity.x == 0 and velocity.y == 0:
			hero_sprite.play("dive_idle")
		if velocity.y != 0:
			if velocity.y < 0:
				if velocity.x == 0:
					hero_sprite.play("dive_up")
				if velocity.x > 0:
					if abs(velocity.y) > abs(velocity.x):
						hero_sprite.play("dive_up")
				if velocity.x < 0:
					if abs(velocity.y) > abs(velocity.x):
						hero_sprite.play("dive_up")
					if abs(velocity.y) < abs(velocity.x):
						hero_sprite.play("dive_side")

			if velocity.y > 0:
				if velocity.x > 0:
					if velocity.y > velocity.x:
						hero_sprite.play("dive_down")
				if velocity.x < 0:
					if abs(velocity.y) > abs(velocity.x):
						hero_sprite.play("dive_down")
					if abs(velocity.y) < abs(velocity.x):
						hero_sprite.play("dive_side")
				if velocity.x == 0:
					hero_sprite.play("dive_down")

		if velocity.x != 0:
			if abs(velocity.x) > abs(velocity.y):
				hero_sprite.play("dive_side")

	if home == true:
		if LevelCheckManager.home == true:
			if Input.is_action_just_pressed("interact"):
				get_tree().change_scene_to_file("res://levels/level_1_intro.tscn")
			elif Input.is_action_just_pressed("left"):
				destination_marker = $"../point_1-1/1-1_mark"
			elif Input.is_action_just_pressed("right"):
				destination_marker = $"../point_1_1/1_1_mark"
	if un_moins_un == true:
		if Input.is_action_just_pressed("interact"):
			get_tree().change_scene_to_file("res://levels/level_1_moins_1.tscn")
		if LevelCheckManager.un_moins_un == true:
			if Input.is_action_just_pressed("up"):
				destination_marker = $"../pique_popper/pique_mark"
		if Input.is_action_just_pressed("right"):
			destination_marker = $"../demi_point_home/home_mark"
	if pique == true:
		if Input.is_action_just_pressed("down"):
			destination_marker = $"../point_1-1/1-1_mark"
	if un_1 == true:
		if Input.is_action_just_pressed("left"):
			destination_marker = $"../demi_point_home/home_mark"
		if LevelCheckManager.un_1 == true:
			if Input.is_action_just_pressed("up"):
				destination_marker = $"../point_1_2/1_2_mark"
	if un_2 == true:
		if Input.is_action_just_pressed("down"):
			destination_marker = $"../point_1_1/1_1_mark"
		if LevelCheckManager.un_2 == true:
			if Input.is_action_just_pressed("right"):
				destination_marker = $"../point_1_3/1_3_mark"
	if un_3 == true:
		if Input.is_action_just_pressed("down"):
			destination_marker = $"../point_1_2/1_2_mark"
		if LevelCheckManager.un_3 == true:
			if Input.is_action_just_pressed("up"):
				destination_marker = $"../dunjeon_1_mark"
	if un_dunjeon == true:
		if Input.is_action_just_pressed("right"):
			destination_marker = $"../point_1_3/1_3_mark"
		if LevelCheckManager.un_dunjeon == true:
			if Input.is_action_just_pressed("up"):
				pass

func _on_area_home_body_entered(_body: Node2D) -> void:
	if _body is wm_player:
		home = true

func _on_area_home_body_exited(_body: Node2D) -> void:
	if _body is wm_player:
		home = false

func _on_area_11_body_entered(_body: Node2D) -> void:
	if _body is wm_player:
		un_moins_un = true

func _on_area_11_body_exited(_body: Node2D) -> void:
	if _body is wm_player:
		un_moins_un = false

func _on_area_pique_body_entered(_body: Node2D) -> void:
	if _body is wm_player:
		pique = true

func _on_area_pique_body_exited(_body: Node2D) -> void:
	if _body is wm_player:
		pique = false

func _on_area_1_1_body_entered(_body: Node2D) -> void:
	if _body is wm_player:
		un_1 = true

func _on_area_1_1_body_exited(_body: Node2D) -> void:
	if _body is wm_player:
		un_1 = false

func _on_area_1_2_body_entered(_body: Node2D) -> void:
	if _body is wm_player:
		un_2 = true

func _on_area_1_2_body_exited(_body: Node2D) -> void:
	if _body is wm_player:
		un_2 = false

func _on_area_1_3_body_entered(_body: Node2D) -> void:
	if _body is wm_player:
		un_3 = true
		dive = true

func _on_area_1_3_body_exited(_body: Node2D) -> void:
	if _body is wm_player:
		un_3 = false
		dive = false

func _on_area_dunjeon_1_body_entered(_body: Node2D) -> void:
	if _body is wm_player:
		un_dunjeon = true

func _on_area_dunjeon_1_body_exited(_body: Node2D) -> void:
	if _body is wm_player:
		un_dunjeon = false


func _on_flaque_1_body_entered(_body: Node2D) -> void:
	dive = true

func _on_flaque_1_body_exited(_body: Node2D) -> void:
	dive = false
