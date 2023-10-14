@tool
class_name StateConditionAnimationEnd extends StateCondition

@export var animation_player : AnimationPlayer:
	set(value):
		animation_player = value
		update_configuration_warnings()

func _is_true() -> bool:
	return (animation_player.current_animation_position >=
			animation_player.current_animation_length)


func _get_configuration_warnings() -> PackedStringArray:
	if animation_player == null:
		return ["Unassigned direction controller"]
	return []
