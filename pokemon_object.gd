extends Node2D



#################PLAN################################
## to use this tscn:
# var pkmn = preload("res://pokemon_object.tscn")
#p1 = pkmn.instantiate()
#p1.set_info(pkmn_name = "Bulbasaur", instance_data: dict)

# instance_data has things like level:5, moves = ["tackle","vine whip", "solar beam", "growl"]

# 


#####################################################

# learned moveset
# current HP
# battle stats

# held item

# front battle sprite
# back battle sprite
# box sprite


func calc_stats():
	pass # calculate stats from base stats, level, IV, EV
## stats and stuff
#var base_stats: Array
#var ATT: int
#var DEF: int
#var SPATT: int
#var SPDEF: int
#var SPD: int
#var HP: int
#var currentHP: int
#var accuracy: int
#var evasiveness: int
#var battle_ATT: int
#var battle_DEF: int
#var battle_SPATT: int
#var battle_SPDEF: int
#var battle_SPD: int
#var battle_accuracy: int # is this needed? is accuracy just reset to 1 after a battle?
#var battle_evasiveness: int # is this needed? is evasiveness just reset to 1 after a battle?

func calc_xp_from_lv():
	pass # given the level of a (wild, caught) pokemon, how much XP do they have?

func calc_lv_from_xp():
	pass # given an amount of xp and this pokemon's growth rate, what level are they?

func calc_xp_rewarded():
	pass # xp rewarded when you defeat this pokemon

func get_initial_moves():
	pass # what moves does this caught pokemon have?

func instantiate_move(move):
	pass # create a move instance by assigning the name, type, power, PP, priority, effects, etc.

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
# create the variables.
# Base Data:
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

## Instance Data:
var experience: int
var level: int
var EV: Array
var IV: Array
var item: String

## stats and stuff
var ATT: int
var DEF: int
var SPATT: int
var SPDEF: int
var SPD: int
var HP: int
var currentHP: int
var accuracy: int
var evasiveness: int
var battle_ATT: int
var battle_DEF: int
var battle_SPATT: int
var battle_SPDEF: int
var battle_SPD: int
var battle_accuracy: int # is this needed? is accuracy just reset to 1 after a battle?
var battle_evasiveness: int # is this needed? is evasiveness just reset to 1 after a battle?





# first you need PKMN_name in order to find its base data in the PBS file.
# then you need instance data that defines level OR experience, and maybe other stuff.
# then you can build the pokemon object.

func set_info(pkmn_name: String, instance_data: Dictionary):
	load_pokemon_base_data("res://PBS/pokemon.txt",pkmn_name) # base data
	load_pokemon_instance_data(instance_data) # loads instance data and instantiates moves, items, etc.
	calc_stats()

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

func load_pokemon_base_data(file_path: String, target_name: String) -> void:
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
		print("Pokemon base data found for ", data["Name"])#_init(data)
	else:
		print("Pokemon not found")


func load_pokemon_instance_data(instance_data: Dictionary):
	if instance_data.has("experience"): 
		experience = instance_data.experience
		level = calc_lv_from_xp()
	elif instance_data.has("level"):
		level = instance_data.level
		experience = calc_xp_from_lv()
	else:
		print("pokemon instance data missing a level or experience!")
	
	if instance_data.has("EV"):
		EV = instance_data.EV
	else:
		EV = [0,0,0,0,0,0] # if there are no EVs defined, then we should assume it has none.
	
	if instance_data.has("IV"):
		IV = instance_data.IV
	else:
		pass # if no IV defined, we should look it up or define it.
	
	if instance_data.has("item"):
		item = instance_data.item
	else:
		item = "" # is that the right way to do this? define it as an empty string?
	
	if instance_data.has("moves"):
		for move in instance_data.moves:
			moves.append(instantiate_move(move))

		
		
############################################



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#load_pokemon_base_data("res://PBS/pokemon.txt","Bulbasaur") # base data
	#print(PKMN_name)
	print("pokemon.tscn _ready() called!")
	#pass #print(evolutions)
	#%icon.texture = preload("res://icons/icon001.png")
	#%battle_front.texture = preload("res://Battlers/001.png")
	#%battle_back.texture = preload("res://Battlers/001b.png")
	# get xp or level, 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
