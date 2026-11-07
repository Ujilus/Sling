extends HSlider




func _on_value_changed(value: float) -> void:
	Global.volume = value
	$"../Label".text = str(int(value*100)) + "% Volume"
	var bus_idx = AudioServer.get_bus_index("Master")
	AudioServer.set_bus_volume_db(bus_idx, linear_to_db(value))
