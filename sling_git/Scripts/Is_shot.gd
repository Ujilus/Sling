extends Area2D


func die():
	Global.points += 5
	$"..".queue_free()
	
func _on_body_entered(body: Node2D) -> void:
	$"../AnimatedSprite2D".play("die")
	$"..".SPEED = 0
	$"../Killzone".queue_free()
	$Timer.start(1)

	


func _on_timer_timeout() -> void:
	die()
