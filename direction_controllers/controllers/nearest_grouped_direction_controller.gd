class_name NearestGroupedDirectionController extends DirectionController


@export var group: String


func _get_target_direction() -> Vector3:
	return (_nearest_grouped_position() - owner.position).normalized()
	

func _nearest_grouped_position() -> Vector3:
	var nearest: Node = null
	for node in get_tree().get_nodes_in_group(group):
		if node is Node3D and (nearest == null or
				owner.position.distance_to(node.position) < owner.position.distance_to(
				nearest.position)):
			nearest = node
	if nearest == null:
		return owner.position
	return nearest.position
