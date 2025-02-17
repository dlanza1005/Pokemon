extends Node2D

@export var status_condition = "none"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func set_status_condition(status: String):
	if status == "none":
		%StatusCondition.visible = false
	elif status == "sleep":
		%StatusCondition.set_frame_and_progress(0,0)
		%StatusCondition.visible = true
	elif status == "poison":
		%StatusCondition.set_frame_and_progress(1,0)
		%StatusCondition.visible = true
	elif status == "burn":
		%StatusCondition.set_frame_and_progress(2,0)
		%StatusCondition.visible = true
	elif status == "paralyze":
		%StatusCondition.set_frame_and_progress(3,0)
		%StatusCondition.visible = true
	elif status == "freeze":
		%StatusCondition.set_frame_and_progress(4,0)
		%StatusCondition.visible = true
	
func set_level(level: String):
	%"Level Label".set_text(level)

func set_pkmn_name(pkmn_name: String):
	%NAME_Label.set_text(pkmn_name)

func set_hp(current_hp: int, max_hp: int):
	$"HP progress bar".value = float(current_hp/max_hp)
	%"HP Label".set_text(str(current_hp)+"/"+str(max_hp))

func set_xp_bar(current_xp: int, level_min: int, level_max: int):
	$"experience bar".value = float((current_xp-level_min)/(level_max-level_min))
