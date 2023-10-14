@tool
class_name StatePlayAnimation extends StateBehaviour

@export var animation_name: String:
	set(value):
		animation_name = value
		update_configuration_warnings()
@export var animation_player: AnimationPlayer:
	set(value):
		animation_player = value
		update_configuration_warnings()


func _on_enter():
	animation_player.play("RESET")
	animation_player.play(animation_name)
	animation_player.seek(0)


func _get_configuration_warnings() -> PackedStringArray:
	if(animation_player == null):
		return ["Unassigned Animation Player"]
	if(not animation_player.get_animation_list().has(animation_name)):
		return ["Unfound Animation Name"]
	return []
