extends Button

func _process(_delta):
	if Input.is_action_just_pressed("exit"):
		get_tree().change_scene_to_file("res://Scenes/Menus/main_menu.tscn")

func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Menus/main_menu.tscn")
