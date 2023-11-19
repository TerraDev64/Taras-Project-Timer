@tool
extends PanelContainer


var time_started: bool = false
var time: float = 0.0
var render_timeout: float = 1.0

func convert_time_to_readable():
	var seconds = fmod(time, 60)
	var minutes = fmod(time, 60*60) / 60
	var hours = fmod(time, 60*60*60) / 60
	var translated_time = "%02d:%02d:%02d" % [hours, minutes, seconds]
	
	$VBoxContainer/TimeLabel.text = "" + str(translated_time)
	
func reset_time():
	time_started = false
	time = 0.0


func _ready():
	time_started = true


func _process(delta):
	if time_started:
		time += delta
	render_timeout -= delta
	if render_timeout < 0.0:
		convert_time_to_readable()
		render_timeout = 1.0


func _on_start_button_pressed():
	time_started = true


func _on_stop_button_pressed():
	time_started = false


func _on_reset_button_pressed():
	reset_time()
