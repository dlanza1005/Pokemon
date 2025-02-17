extends Area2D


@export var target_scene = preload("res://pokemon_center.tscn")
@export var spawn_position: Vector2 = Vector2.ZERO



func _on_body_entered(body):
	if body.is_in_group("player"):  # Ensure the player has this group
		GameManager.replace_state(target_scene)
		print("door! body entered")



func _on_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	GameManager.replace_state(target_scene)
	print("door! input event")
