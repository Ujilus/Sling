extends Node

var points = 0
var volume = 50
var aim_direction : Vector2:
	get:
		get_aim_direction()
		return aim_direction
var mouse_pos:=Vector2(0,0)
	
func get_aim_direction():
	aim_direction = Input.get_vector(
			"aim_left",
			"aim_right",
			"aim_up",
			"aim_down"
			)
	if control_type >0:
		aim_direction=mouse_pos.limit_length(50)/50
	
	
var control_type = 0

var Button_IDS = {}
var Button_Colors = {}


	
