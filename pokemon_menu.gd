extends Node2D

@onready var PKMN = preload("res://pokemon_object.tscn") # test
@onready var TestParty = [PKMN.instantiate()] # test
# @onready 


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	var slots = [%Slot1,%Slot2,%Slot3,%Slot4,%Slot5,%Slot6]
	slots[0].get_node("NAME_Label").set_text("BULBASAUR1")
	slots[0].get_node("LEVEL_Label").set_text("101")


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func populate_healthcard(PKMN,index):
	pass
