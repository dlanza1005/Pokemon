extends Node2D



@onready var pause_menu = $Player/Camera2D2/PauseMenu
var paused = false

func _ready():
	pause_menu.set_process_input(false)
	
func _process(delta):
	if Input.is_action_just_pressed("pause"):
			pauseMenu()
	if paused and Input.is_action_just_pressed("cancel_key"):
		pauseMenu() # unpause with the cancel key!



func pauseMenu():
	if paused:
		pause_menu.hide()
		pause_menu.set_process_input(false)
		Engine.time_scale = 1
	else:
		pause_menu.show()
		pause_menu.set_process_input(true)
		Engine.time_scale = 0
	paused = !paused
