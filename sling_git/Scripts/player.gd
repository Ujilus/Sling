extends CharacterBody2D

const SPEED = 160.0
const JUMP_VELOCITY = -300.0
const min_height = 300
var jumped = false
const DASH_SPEED := 1000.0
@onready var cooldown: Timer = $Cooldown
var rng = RandomNumberGenerator.new()

#projectile
@onready var rock = preload("res://Scenes/projectile.tscn")
func _ready():
	rng.randomize()

func _draw()->void:
	var dir := Global.aim_direction * 5
	draw_circle(dir*10,3.0,lerp(Color.RED,Color.YELLOW,dir.length()/5),true)

#shoot
func shoot(position,scene = self):
	if not cooldown.time_left:
		var Projectile = rock.instantiate()
		var col = Color.from_hsv(rng.randf_range(0,255)/255,0.7,1)
		Projectile.modulate = col
		Projectile.global_position= position
		scene.get_tree().root.add_child(Projectile)
		cooldown.start()
		$AudioStreamPlayer.play(0.28) #0.28s offset to the throw soundeffect
	
	
func _physics_process(delta: float) -> void:
	Global.mouse_pos = get_global_mouse_position()-global_position
	# Add the gravity.
	if not is_on_floor():
		jumped = true
		velocity += get_gravity() * delta
		if velocity.y < 0 :
			$AnimatedSprite2D.play("jump_up")
		elif velocity.y == 0:
			$AnimatedSprite2D.play("jump_peak")
		elif velocity.y > 0:
			$AnimatedSprite2D.play("jump_fall")
			
	

	# Handle jump.
	if Input.is_action_just_pressed("jump") and is_on_floor():
		velocity.y = JUMP_VELOCITY
		$AnimatedSprite2D.play("jump")
	
		
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_axis("left", "right")
	if direction:
		velocity.x = direction * SPEED
		if not jumped:
			if abs(velocity.x) <= SPEED / 2:
				$AnimatedSprite2D.play("walk", (velocity.x/SPEED))
			else:
				$AnimatedSprite2D.play("sprint")
		$AnimatedSprite2D.flip_h = direction <  0
	else:
		velocity.x = move_toward(velocity.x, 0,SPEED)
		if not jumped:
			$AnimatedSprite2D.play("idle")
	if Input.is_action_pressed("shoot"):
		shoot(position)
	
	if is_on_floor() and jumped:
		$AnimatedSprite2D.play("land")
		jumped = false	
	
	move_and_slide()
	queue_redraw()


	
