extends OptionButton
	
func _ready():
	get_popup().add_theme_font_size_override("font_size",28)

func _on_item_selected(index: int) -> void:
	#ask wether playing on Controller or Keyboard
	Global.control_type = index
