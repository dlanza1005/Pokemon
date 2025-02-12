extends Control

#@onready var main = $"../../" # ???
#
## @onready var PokedexScreen = preload()
## @onready var PokedexScreen = preload()
#@onready var BagScreen = preload("res://bag_menu.tscn")
#
#func _on_menu_actioned(item) -> void:
	#print("item: ", item.text)
	#if item.text == "POKEDEX":
		#var bag = BagScreen.instantiate()
		#$"..".add_child(bag)
	#if item.text == "BAG":
		#var bag = BagScreen.instantiate()
		#$"..".add_child(bag)
	#if item.text == "BAG":
		#var bag = BagScreen.instantiate()
		#$"..".add_child(bag)

@onready var menu_items = $Menu.get_children()
var selected_index: int = 0
var normal_color = Color(1, 1, 1)  # White
var highlight_color = Color(1, 1, 0)  # Yellow

func _ready():
	update_menu_highlight()

func update_menu_highlight():
	for i in range(menu_items.size()):
		if menu_items[i] is Label:
			if i == selected_index:
				menu_items[i].add_theme_color_override("font_color", highlight_color)
			else:
				menu_items[i].add_theme_color_override("font_color", normal_color)

func _input(event):
	if event.is_action_pressed("move_down"):
		selected_index = (selected_index + 1) % menu_items.size()
		update_menu_highlight()
	elif event.is_action_pressed("move_up"):
		selected_index = (selected_index - 1 + menu_items.size()) % menu_items.size()
		update_menu_highlight()
	elif event.is_action_pressed("select_key"):
		print("Selected:", menu_items[selected_index].text)
