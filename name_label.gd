extends Control

# There is one label node in white,
# and then 3 labels in dark gray used as the drop shadow.
# this script lets me treat all of these as the same text object.

var labels: Array = []

func _ready():
	# Find all Label nodes automatically
	for child in get_children():
		if child is Label:
			labels.append(child)

# Function to update all label texts at once
func set_text(value: String):
	for label in labels:
		label.text = value
