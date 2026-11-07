extends CharacterBody2D

@onready var r_right: RayCast2D = $Ray_right
@onready var r_left: RayCast2D = $Ray_left
var dir = 1
@export var SPEED = 60

func _process(delta: float) -> void:
	if r_right.is_colliding():
		dir = -1
	if r_left.is_colliding():
		dir = 1
		
	$AnimatedSprite2D.flip_h = dir < 1
	position.x += delta * SPEED * dir
	
	
