extends Node2D

@export var pokemon_name = "Bulbasaur"
@export var level = 5



# learned moveset
# current HP
# battle stats

# held item

# front battle sprite
# back battle sprite
# box sprite


func calc_stats():
	pass # calculate stats from base stats, level, IV, EV

func calc_xp_from_lv():
	pass # given the level of a (wild, caught) pokemon, how much XP do they have?

func calc_lv_from_xp():
	pass # given an amount of xp and this pokemon's growth rate, what level are they?

func calc_xp_rewarded():
	pass # xp rewarded when you defeat this pokemon

func get_initial_moves():
	pass # what moves does this caught pokemon have?

func reset_battle_stats():
	pass # just the stats! HP and battle conditions and PP stay

func pkmn_center():
	pass # heal completely!

func gain_xp():
	pass

func gain_lv():
	pass

func evolve():
	pass

func save_to_dict():
	pass # for the save function. collapse the pokemon to a dict for saving.
	


#########################################
# create the variables
var PKMN_name: String
var internal_name: String
var type1: String
var type2: String
var base_stats: Array
var gender_rate: String
var growth_rate: String
var base_exp: int
var effort_points: Array
var rareness: int
var happiness: int
var abilities: Array
var hidden_ability: String
var moves: Array
var egg_moves: Array
var compatibility: Array
var steps_to_hatch: int
var height: float
var weight: float
var color: String
var shape: int
var regional_numbers: Array
var kind: String
var pokedex: String
var battler_player_y: int
var battler_enemy_y: int
var battler_altitude: int
var evolutions: Array

# ... look up the dictionary items after defining the variables you want to define...

# fill the variables from the dictionary if not defined, choose random otherwise..?
func _init(data: Dictionary):
	PKMN_name = data.get("Name", "")
	internal_name = data.get("InternalName", "")
	type1 = data.get("Type1", "")
	type2 = data.get("Type2", "")
	base_stats = data.get("BaseStats", "").split(",")
	gender_rate = data.get("GenderRate", "")
	growth_rate = data.get("GrowthRate", "")
	base_exp = int(data.get("BaseEXP", "0"))
	effort_points = data.get("EffortPoints", "").split(",")
	rareness = int(data.get("Rareness", "0"))
	happiness = int(data.get("Happiness", "0"))
	abilities = data.get("Abilities", "").split(",")
	hidden_ability = data.get("HiddenAbility", "")
	moves = data.get("Moves", "").split(",")
	egg_moves = data.get("EggMoves", "").split(",")
	compatibility = data.get("Compatibility", "").split(",")
	steps_to_hatch = int(data.get("StepsToHatch", "0"))
	height = float(data.get("Height", "0.0"))
	weight = float(data.get("Weight", "0.0"))
	color = data.get("Color", "")
	shape = int(data.get("Shape", "0"))
	regional_numbers = data.get("RegionalNumbers", "").split(",")
	kind = data.get("Kind", "")
	pokedex = data.get("Pokedex", "")
	battler_player_y = int(data.get("BattlerPlayerY", "0"))
	battler_enemy_y = int(data.get("BattlerEnemyY", "0"))
	battler_altitude = int(data.get("BattlerAltitude", "0"))
	evolutions = data.get("Evolutions", "").split(",")

func load_pokemon_data(file_path: String, target_name: String) -> void:
	var file = FileAccess.open(file_path, FileAccess.READ)
	if not file:
		print("Error opening file")


	var data = {}
	var found = false
	while not file.eof_reached():
		var line = file.get_line().strip_edges()
		if line.begins_with("#") or line.is_empty():
			continue
		
		if line.begins_with("[") and line.ends_with("]"):
			if found:
				break
			data.clear()
			continue
		
		var key_value = line.split("=", false, 1)
		if key_value.size() == 2:
			data[key_value[0].strip_edges()] = key_value[1].strip_edges()
		
		if data.has("Name") and data["Name"].to_lower() == target_name.to_lower():
			found = true
	
	file.close()
	
	if found:
		_init(data)
	else:
		print("Pokemon not found")
		
############################################


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_pokemon_data("res://PBS/pokemon.txt","Bulbasaur")
	print(PKMN_name)
	print(evolutions)
	#%icon.texture = preload("res://icons/icon001.png")
	#%battle_front.texture = preload("res://Battlers/001.png")
	#%battle_back.texture = preload("res://Battlers/001b.png")
	# get xp or level, 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
