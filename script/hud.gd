extends CanvasLayer

@onready var hp_sprite = $hp_sprite
@onready var oxy_sprite = $oxy_sprite
@onready var label_vies = $label_vies
@onready var label_points = $label_points
@onready var label_time = $label_time
@onready var label_money = $label_money

var is_dead = false

func _process(_delta: float) -> void:

	if ManagerPlayer.control_level == true:
		if ManagerPlayer.bombes > ManagerPlayer.bombesmax:
			ManagerPlayer.bombes = ManagerPlayer.bombes
		if ManagerPlayer.bombes == 0:
			$bombe1.hide()
			$bombe2.hide()
			$bombe3.hide()
		elif ManagerPlayer.bombes == 1:
			$bombe1.show()
			$bombe2.hide()
			$bombe3.hide()
		elif ManagerPlayer.bombes == 2:
			$bombe1.show()
			$bombe2.show()
			$bombe3.hide()
		elif ManagerPlayer.bombes == 3:
			$bombe1.show()
			$bombe2.show()
			$bombe3.show()

	if ManagerPlayer.hud_time == false:
		label_time.hide()
	elif ManagerPlayer.hud_time == true:
		label_time.show()

	if ManagerPlayer.hp > ManagerPlayer.hpmax:
		ManagerPlayer.hp = ManagerPlayer.hpmax
	if ManagerPlayer.vies > ManagerPlayer.viesmax:
		ManagerPlayer.vies = ManagerPlayer.viesmax
	if ManagerPlayer.money > ManagerPlayer.moneymax:
		ManagerPlayer.money = ManagerPlayer.moneymax
	if ManagerPlayer.points > ManagerPlayer.pointsmax:
		ManagerPlayer.points = ManagerPlayer.pointsmax
	if ManagerPlayer.oxy > ManagerPlayer.oxymax:
		ManagerPlayer.oxy = ManagerPlayer.oxymax

	if ManagerPlayer.inwater == true and ManagerPlayer.oxy <= 0:
		is_dead = true

	if is_dead == true:
		$".."._mort()
		is_dead = false

#HUD HP manager
	if ManagerPlayer.hp == 0:
		hp_sprite.hide()
	else:
		hp_sprite.show()
		if ManagerPlayer.hp == 1:
			hp_sprite.play("01")
		elif ManagerPlayer.hp == 2:
			hp_sprite.play("02")
		elif ManagerPlayer.hp == 3:
			hp_sprite.play("03")
		elif ManagerPlayer.hp == 4:
			hp_sprite.play("04")
		elif ManagerPlayer.hp == 5:
			hp_sprite.play("05")
		elif ManagerPlayer.hp == 6:
			hp_sprite.play("06")
		elif ManagerPlayer.hp == 7:
			hp_sprite.play("07")
		elif ManagerPlayer.hp == 8:
			hp_sprite.play("08")
		elif ManagerPlayer.hp == 9:
			hp_sprite.play("09")
		elif ManagerPlayer.hp == 10:
			hp_sprite.play("10")
		elif ManagerPlayer.hp == 11:
			hp_sprite.play("11")
		elif ManagerPlayer.hp == 12:
			hp_sprite.play("12")
		elif ManagerPlayer.hp == 13:
			hp_sprite.play("13")
		elif ManagerPlayer.hp == 14:
			hp_sprite.play("14")
		elif ManagerPlayer.hp == 15:
			hp_sprite.play("15")
		elif ManagerPlayer.hp == 16:
			hp_sprite.play("16")
		elif ManagerPlayer.hp == 17:
			hp_sprite.play("17")
		elif ManagerPlayer.hp == 18:
			hp_sprite.play("18")
		elif ManagerPlayer.hp == 19:
			hp_sprite.play("19")
		elif ManagerPlayer.hp == 20:
			hp_sprite.play("20")
		elif ManagerPlayer.hp == 21:
			hp_sprite.play("21")
		elif ManagerPlayer.hp == 22:
			hp_sprite.play("22")
		elif ManagerPlayer.hp == 23:
			hp_sprite.play("23")
		elif ManagerPlayer.hp == 24:
			hp_sprite.play("24")
		elif ManagerPlayer.hp == 25:
			hp_sprite.play("25")

#oxy manager
	if ManagerPlayer.inwater == true:
		oxy_sprite.show()
		if $water_timer.is_stopped():
			$water_timer.start()
	elif ManagerPlayer.inwater == false:
		oxy_sprite.hide()
		$water_timer.stop()
		ManagerPlayer.oxy = ManagerPlayer.oxymax

	if ManagerPlayer.oxy == 0:
		oxy_sprite.play("00")
	elif ManagerPlayer.oxy == 1:
		oxy_sprite.play("01")
	elif ManagerPlayer.oxy == 2:
		oxy_sprite.play("02")
	elif ManagerPlayer.oxy == 3:
		oxy_sprite.play("03")
	elif ManagerPlayer.oxy == 4:
		oxy_sprite.play("04")
	elif ManagerPlayer.oxy == 5:
		oxy_sprite.play("05")
	elif ManagerPlayer.oxy == 6:
		oxy_sprite.play("06")
	elif ManagerPlayer.oxy == 7:
		oxy_sprite.play("07")
	elif ManagerPlayer.oxy == 8:
		oxy_sprite.play("08")
	elif ManagerPlayer.oxy == 9:
		oxy_sprite.play("09")
	elif ManagerPlayer.oxy == 10:
		oxy_sprite.play("10")

# Hud Vies manager
	label_vies.text = "Vies : " + str(ManagerPlayer.vies)
#HUD Points manager
	label_points.text = "Points Bonus : " + str(ManagerPlayer.points)
#HUD time manager
	label_time.text = "Décompte : " + str(ManagerPlayer.temps)
#HUD money manager
	label_money.text = "Finances : " + str(ManagerPlayer.money)

func _on_water_timer_timeout() -> void:
	if ManagerPlayer.inwater == true:
		ManagerPlayer.oxy -= ManagerPlayer.oxymax * 0.1
