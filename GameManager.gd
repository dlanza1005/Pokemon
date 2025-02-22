extends Node

#@export var state_stack: Array = []  ## STOP USING THIS VARIABLE, USE THE SCENE TREE ITSELF!
#var pkmn = preload("res://pokemon_object.tscn")
#p1 = pkmn.instantiate()
#p1.set_info(pkmn_name = "Bulbasaur", level = 5)
#p2 = pkmn.instantiate()
#p2.set_info(pkmn_name = "Bulbasaur", level = 5)
##var party = [p1, p2]
# var box_pokemon
#var item = preload()
# var bag = []
# var pokedex will be a dict with pokemon names as keys, and true/false as the values; caught=true/false
# var checkpoints = ? # checkpoints will be the checkpoints in the story that unlock different events 
#	in order to control the progression of the story
# var 


# Function to push a new state (scene) onto the stack
func push_state(state_scene: PackedScene):
	if get_child_count() > 0:
		get_child(get_child_count()-1).set_process(false)  # Pause previous state

	var new_state = state_scene.instantiate()
	add_child(new_state)
	#state_stack.append(new_state)

	print("State pushed:", new_state.name, "| Stack size:", get_child_count())

# Function to pop the current state
func pop_state():
	if get_child_count() > 0:
		var top_state = get_child(get_child_count()-1)
		top_state.queue_free()  # Remove from scene tree
		print("State popped:", top_state.name, "| Stack size:", get_child_count())

		# Resume previous state
		if get_child_count() > 0:
			get_child(get_child_count()-1).set_process(true)

# Function to replace the current state
func replace_state(new_state_scene: PackedScene):
	pop_state()  # Remove the current state
	push_state(new_state_scene)  # Push the new state

# Function to peek at the current state
func get_current_state():
	if get_child_count() > 0:
		return get_child(get_child_count()-1)
	return null







# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


##############################
## make this the autoload script/scene. 
## load a titlescreen with an animation while loading all of the files and stuff.
##############################
