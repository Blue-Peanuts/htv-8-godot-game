@tool
class_name DirectionReactor extends Node


@export var direction_controller: DirectionController:
	set(value):
		direction_controller = value
		update_configuration_warnings()



func _ready():
	direction_controller.connect("updated", _update)


func _update(_direction: Vector3):
	push_error("Unimplemented")
	pass


func _get_configuration_warnings() -> PackedStringArray:
	if direction_controller == null:
		return ["Unassigned direction controller"]
	return []
