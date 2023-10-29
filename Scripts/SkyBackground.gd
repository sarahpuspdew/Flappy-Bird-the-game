extends TextureRect


func _ready():
	#GameManager.game_started.connect(_on_game_started)
	GameManager.bird_crashed.connect(_on_bird_crashed)


#func _on_game_started():
#	material.set_shader_parameter("speed", 0.2)


func _on_bird_crashed():
	material.set_shader_parameter("speed", 0.0)
