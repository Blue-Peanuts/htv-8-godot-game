class_name StateBehaviour extends Node

var state : State

func build(state: State):
	self.state = state


func _setup():
	pass


func _on_enter():
	pass


func _on_leave():
	pass


func _active_process(delta: float):
	pass


func _ghost_process(delta: float):
	pass
	
	
func _active_physics_process(delta: float):
	pass


func _key_frame_event_step(index: int):
	pass
