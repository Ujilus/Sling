extends RigidBody2D

const STRENGTH = 450
var rng = RandomNumberGenerator.new()

func shoot(Strength):
	linear_velocity = Strength
	

func _on_tree_entered(source: Node) -> void:
	shoot(Global.aim_direction * STRENGTH)


func _on_timer_timeout() -> void:
	queue_free()
