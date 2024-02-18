class_name global_clock extends Node

var paused := false
var timer : Timer

func _ready():
	timer = Timer.new()
	timer.wait_time = 0.5
	timer.autostart = true
	add_child(timer)

func toggle_pause():
	paused = !paused
	timer.paused = paused

func set_pause(value : bool):
	paused = value
	timer.paused = value
