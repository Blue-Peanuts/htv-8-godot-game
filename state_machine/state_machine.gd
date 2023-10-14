@icon("res://state_machine/state_machine_icon.svg")
class_name StateMachine extends Node


var current_state: State = null


func _ready():
	transition(_get_default_state())


func _get_default_state() -> State:
	return _get_states()[0]


func keyframe_event_step():
	current_state.keyframe_event_step()


func _get_states() -> Array[State]:
	var states: Array[State] = []
	states.append_array(NodeUtil.find_all_children(self,
			func(n): return n is State) as Array[State])
	return states


func get_states_with_tag(tag: String) -> Array[State]:
	var states: Array[State] = []
	for state in _get_states():
		if state.is_tagged(tag):
			states.append(state)
	return states


func transition(state: State):
	if current_state != null:
		current_state.on_leave()
	current_state = state
	current_state.on_enter()
