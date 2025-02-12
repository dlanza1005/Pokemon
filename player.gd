#extends CharacterBody2D
#
#@export var grid_size :int  = 16
#var frames_per_tile :int = 4
#var fps = 8
#var is_moving :bool = false
#var facing :int = 0 # 0 left, 1 right, 2 up, 3 down
#
#
#
#@onready var character = %AnimatedSprite2D
#
#
#func _process(delta):
	#var direction = Input.get_vector("move_left","move_right","move_up","move_down")
	#var velocity = direction*grid_size/frames_per_tile
	#print(velocity)
	#if direction[1]==-1:
		#facing = 2
		#is_moving = true
	#elif direction[1]==1:
		#facing = 3
		#is_moving = true
	#elif direction[0]==-1:
		#facing = 0
		#is_moving = true
	#elif direction[0]==1:
		#facing = 1
		#is_moving = true
#
	#if direction.length() > 0.0:
		#play_walk_animation(facing)
	#else:
		#play_idle_animation(facing)
	#
	#if is_moving:
		#character.global_position += velocity
	#
	#
	#
#func play_walk_animation(facing):
	#if facing==0:
		#character.play("walk_left")
	#elif facing==1:
		#character.play("walk_right")
	#elif facing==2:
		#character.play("walk_up")
	#elif facing==3:
		#character.play("walk_down")
#
#func play_idle_animation(facing):
	#if facing==0:
		#character.play("idle_left")
	#elif facing==1:
		#character.play("idle_right")
	#elif facing==2:
		#character.play("idle_up")
	#elif facing==3:
		#character.play("idle_down")
	#

extends CharacterBody2D

@export var grid_size :int  = 16
var frames_per_tile :int = 40
var fps = 8
var initial_position = Vector2(0,0)
var input_direction = Vector2(0,0)
var percent_moved_toward_next_tile = 0.0
var is_moving :bool = false
var facing :int = 0 # 0 left, 1 right, 2 up, 3 down

@onready var character = %AnimatedSprite2D

func _physics_process(delta):
	#print("physics process test")
	if is_moving == false:
		process_player_input()
	elif input_direction != Vector2.ZERO:
		move(delta)
	else:
		is_moving = false
	#print(input_direction)
	if input_direction.y<0:
		facing = 2
	elif input_direction.y>0:
		facing = 3
	elif input_direction.x<0:
		facing = 0
	elif input_direction.x>0:
		facing = 1
	
	if is_moving: # input_direction.length()
		play_walk_animation(facing)
	else:
		play_idle_animation(facing)

func process_player_input():
	#print("process player input test")
	if input_direction.y == 0:
		input_direction.x = int(Input.is_action_pressed("move_right")) - int(Input.is_action_pressed("move_left"))
	if input_direction.x == 0:
		input_direction.y = int(Input.is_action_pressed("move_down")) - int(Input.is_action_pressed("move_up"))
	
	if input_direction != Vector2.ZERO:
		initial_position = position
		is_moving = true
	
func move(delta):
	percent_moved_toward_next_tile += frames_per_tile*delta
	if percent_moved_toward_next_tile >= 1.0:
		position = initial_position + (grid_size*input_direction)
		percent_moved_toward_next_tile = 0.0
		is_moving = false
	else:
		position = initial_position + (grid_size*input_direction*percent_moved_toward_next_tile)

func play_walk_animation(facing):
	if facing==0:
		character.play("walk_left")
	elif facing==1:
		character.play("walk_right")
	elif facing==2:
		character.play("walk_up")
	elif facing==3:
		character.play("walk_down")

func play_idle_animation(facing):
	if facing==0:
		character.play("idle_left")
	elif facing==1:
		character.play("idle_right")
	elif facing==2:
		character.play("idle_up")
	elif facing==3:
		character.play("idle_down")
	
