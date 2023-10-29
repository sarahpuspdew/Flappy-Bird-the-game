extends Control


func _ready():
	GameManager.game_started.connect(_on_game_started)
	GameManager.point_scored.connect(_on_point_scored)
	
	$Score.visible = false


func _on_game_started():
	$Score.visible = true
	$Score.text = "0"


func _on_point_scored():
	$Score.text = str(GameManager.score)
