extends AnimatableBody2D

@export var ID := "My ID"
@export var pos_active := Vector2.UP*64
@export var time := 100.0

@onready var sprite: Sprite2D = $Sprite2D
@onready var collision: CollisionShape2D = $CollisionShape2D

func _ready():
	pos_active += position
	
func _process(_delta: float) -> void:
	if Global.Button_IDS[ID] == true:
		if not $Timer.time_left:
			$Timer.start(time)
		position = position.lerp(pos_active,1.0-$Timer.time_left / time)
	modulate = Global.Button_Colors[ID]



func _on_timer_timeout() -> void:
	Global.Button_IDS[ID] = false
