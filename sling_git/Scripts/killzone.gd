extends Area2D

var tween = create_tween()
const respawn_time = 0.5 #seconds

@export_color_no_alpha var color

func die():
	get_tree().reload_current_scene()
	Global.points=0



func _on_body_entered(body: Node2D) -> void:
	body.get_tree().root.add_theme_color_override("modulate",Color.RED)
	Engine.time_scale = 0.5
	#tween.tween_property(root, "modulate", Color.DARK_RED, .2)
	$Timer.start(respawn_time/2)


func _on_timer_timeout() -> void:
	Engine.time_scale = 1.0
	die()
