extends Node2D


@onready var TestParty = GameManager.party # test
@onready var slots = [%Slot1,%Slot2,%Slot3,%Slot4,%Slot5,%Slot6]
var selected_index: int = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var i=0
	for pkmn in TestParty:
		slots[i].visible = true
		# populate healthcard:
		slots[i].get_node("NAME_Label").set_text("BULBASAUR1")
		slots[i].get_node("LEVEL_Label").set_text("101")
		i+=1
	update_cursor()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func populate_healthcard(PKMN,index):
	pass
	#set icon, set name, set level, set hp bar, set hp, set item

# get input so we can move the cursor
	# Highlight the first slot
	

# Handle input to move through the slots
func _unhandled_input(event):
	if event.is_action_pressed("ui_down"):
		move_cursor(1)
	elif event.is_action_pressed("ui_up"):
		move_cursor(-1)

func move_cursor(direction: int):
	# Deselect the current slot
	slots[selected_index].modulate = Color(1, 1, 1, 1)  # Reset color
	
	# Move selection up or down
	selected_index += direction

	# Wrap around to keep within party size
	if selected_index < 0:
		selected_index = TestParty.size() - 1
	elif selected_index >= TestParty.size():
		selected_index = 0
	
	# Update cursor highlight
	update_cursor()

func update_cursor():
	# Highlight the currently selected slot
	if TestParty.size() > 0:
		slots[selected_index].modulate = Color(1, 1, 0.5, 1)  # Yellow tint for selection
