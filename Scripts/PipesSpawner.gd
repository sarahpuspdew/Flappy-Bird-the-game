extends Node
class_name PipesSpawner

@export var pipes_scene = preload("res://Scenes/Pipes.tscn")
@export var pipes_scroll_speed : float


func _ready():
	GameManager.game_started.connect(_on_game_started)
	GameManager.bird_crashed.connect(_on_bird_crashed)


func spawn_pipes():
	var pipes = pipes_scene.instantiate() as Pipes
	add_child(pipes)
	
	var viewport_rect = get_viewport().get_camera_2d().get_viewport_rect()
	var half_height = viewport_rect.size.y / 2
	pipes.position.x = viewport_rect.end.x
	pipes.position.y = randf_range(viewport_rect.size.y * 0.15 - half_height, viewport_rect.size.y * 0.65 - half_height)

	pipes.speed = pipes_scroll_speed


func stop():
	$SpawnTimer.stop()
	for pipe in get_children().filter(func (child): return child is Pipes):
		(pipe as Pipes).speed = 0


func _on_game_started():
	$SpawnTimer.start()


func _on_spawn_timer_timeout():
	spawn_pipes()


func _on_bird_crashed():
	stop()
