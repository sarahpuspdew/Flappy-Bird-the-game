extends Control


func _ready():
	GameManager.game_started.connect(_on_game_started)
	GameManager.bird_crashed.connect(_on_bird_crashed)
	
	$Title.visible = true
	$GameOver.visible = false


func _on_game_started():
	$Title.visible = false


func _on_bird_crashed():
	$GameOver.visible = true
