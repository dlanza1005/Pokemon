extends Control

#@onready var main = $"../../" # ???
#
@onready var PokedexScreen = preload("res://pokedex_menu.tscn")
@onready var PokemonScreen = preload("res://pokemon_menu.tscn")
@onready var BagScreen = preload("res://bag_menu.tscn")
#
func _on_menu_actioned(item) -> void:
	print("item: ", item.text)
	if item.text == "POKEDEX":
		$"..".add_child(PokedexScreen.instantiate())
	if item.text == "POKEMON":
		$"..".add_child(PokemonScreen.instantiate())
	if item.text == "BAG":
		$"..".add_child(BagScreen.instantiate())

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
		_on_menu_actioned(menu_items[selected_index])
