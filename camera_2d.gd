extends Camera2D

@export var BLOCK_SIZE :int = 16*5
var SCREEN_WIDTH :int = 14.75*BLOCK_SIZE
var SCREEN_HEIGHT :int = 11*BLOCK_SIZE
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	DisplayServer.window_set_size(Vector2(SCREEN_WIDTH, SCREEN_HEIGHT))


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
