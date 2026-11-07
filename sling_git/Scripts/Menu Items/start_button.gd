extends Button

func _ready():
	grab_focus()

func _on_pressed() -> void:
	get_tree().change_scene_to_file("res://Scenes/Levels/level1.tscn")
	Global.points = 0
