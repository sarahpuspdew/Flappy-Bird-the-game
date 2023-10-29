extends Node

signal game_started
signal bird_crashed
signal point_scored

var is_game_started : bool = false
var score : int = 0
var best_score : int


func _ready():
	game_started.connect(_on_game_started)
	point_scored.connect(_on_point_scored)
	bird_crashed.connect(_on_bird_crashed)


func _on_game_started():
	is_game_started = true
	score = 0


func _on_bird_crashed():
	is_game_started = false


func _on_point_scored():
	score += 1
