class_name pause_menu
extends Control

func _notification(what: int) -> void:
	match what:
		Node.NOTIFICATION_PAUSED:
			hide()

			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
		Node.NOTIFICATION_UNPAUSED:
			show()
			Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
