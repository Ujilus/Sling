extends Node2D

@onready var area_2d: Area2D = $Area2D


@export var ID : String = "ID 1"
@export_color_no_alpha var color


func _ready():
	Global.Button_IDS[ID]=false
	Global.Button_Colors[ID]=color

func send_pressed():
	Global.Button_IDS[ID]=true
	
func _process(_delta: float):
	$AnimatedSprite2D.modulate = color
	
func _on_body_entered(body: Node2D) -> void:
	$AnimatedSprite2D.play("Pressed")
	send_pressed()
	
