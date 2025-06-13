extends Node

var I = ManagerPlayer.dice1
var II = ManagerPlayer.dice2
var III = ManagerPlayer.dice3
var IV = ManagerPlayer.dice4
var V = ManagerPlayer.dice5

func _process(_delta: float) -> void:
	if I != 0 and II != 0 and III != 0 and IV != 0 and V != 0:
		if I == II and II == III and III == IV and IV == V:
			ManagerPlayer.vies = ManagerPlayer.vies + I
			ManagerPlayer.points = ManagerPlayer.points + (5 * (I * 100))
			ManagerPlayer.dice1 = 0
			ManagerPlayer.dice2 = 0
			ManagerPlayer.dice3 = 0
			ManagerPlayer.dice4 = 0
			ManagerPlayer.dice5 = 0
		else:
			ManagerPlayer.points = ManagerPlayer.points + (100 * (I + II + III + IV + V))
			ManagerPlayer.dice1 = 0
			ManagerPlayer.dice2 = 0
			ManagerPlayer.dice3 = 0
			ManagerPlayer.dice4 = 0
			ManagerPlayer.dice5 = 0
