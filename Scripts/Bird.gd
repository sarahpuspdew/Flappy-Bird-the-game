extends CharacterBody2D
class_name Bird

@export var jump_force : float
@export var max_speed : float
@export var rotation_speed : float

var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _ready():
	velocity = Vector2.ZERO
	$AnimationPlayer.play("idle")
	set_physics_process(false)
	GameManager.game_started.connect(_on_game_started)
	GameManager.bird_crashed.connect(_on_bird_crashed)


func _physics_process(delta):
	velocity.y += gravity * delta
	velocity.y = min(velocity.y, max_speed)
	
	rotating()
	move_and_collide(velocity * delta)


func _input(event):
	if event.is_action_pressed("jump"):
		jumping()


func _on_game_started():
	$AnimationPlayer.play("flap_wings")
	set_physics_process(true)


func _on_bird_crashed():
	#set_physics_process(false)
	set_process_input(false)
	stop()


func jumping():
	velocity.y = -jump_force
	rotation = deg_to_rad(-30)
	

func rotating():
	# Rotate downwards
	if velocity.y > 0 and rad_to_deg(rotation) < 90:
		rotation += rotation_speed * deg_to_rad(1)
	# Rotate upwards
	elif velocity.y < 0 and rad_to_deg(rotation) > -30:
		rotation += rotation_speed * deg_to_rad(1)


func stop():
	$AnimationPlayer.stop()
