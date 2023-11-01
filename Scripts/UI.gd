extends Control


func _ready():
	GameManager.game_started.connect(_on_game_started)
	GameManager.bird_crashed.connect(_on_bird_crashed)
	
	$Countdown/GetReady.visible = false
	$GameOver.visible = false


func _on_game_started():
	$Title.visible = false
	$Countdown/Instructions.visible = false
	$Countdown/GetReady.visible = true
	$Countdown/CountdownTimer.start()


func _on_bird_crashed():
	$Countdown.visible = false
	$GameOver.visible = true


func _on_countdown_timer_timeout():
	$Countdown.visible = false


func _on_play_button_pressed():
	get_tree().reload_current_scene()
	GameManager.is_game_started = false
