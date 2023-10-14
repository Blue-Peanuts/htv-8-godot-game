class_name StateKeyFrameEventHandler extends StateBehaviour


func _key_frame_event_step(index: int):
	get_children()[index].trigger()
