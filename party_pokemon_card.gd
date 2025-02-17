extends Control


@export var pokemon_name :String = "NAME"
@export var level :int = 101
@export var current_hp :int = 42
@export var max_hp :int = 100
@export var sprite :Texture


@onready var name_label = %NAME_Label
@onready var level_label = %LEVEL_Label
@onready var hp_label = %HP_Label

var is_selected = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_focus_entered() -> void:
	pass # Replace with function body.
	# change the ball icon
	# change the card background
	# animate the pokemon icon
