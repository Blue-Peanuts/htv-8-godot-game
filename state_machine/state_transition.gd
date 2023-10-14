@icon("res://state_machine/state_transition_icon.svg")
class_name StateTransition extends Node

@export var ignore_enter_condition := false
@export var allow_self_transition := false
@export var end_states: Array[State]
@export var end_states_tags: Array[String]



func _get_state() -> State:
	return NodeUtil.find_ancestor(self, func(n): return n is State)


func try_transition():
	if not _can_transition():
		return
	var candidates := end_states
	for tag in end_states_tags:
		candidates.append_array(_get_state().get_state_machine()
				.get_states_with_tag(tag))
	for state in candidates:
		if (ignore_enter_condition or state.can_enter()) and (
					allow_self_transition or state != self):
			_transition(state)
			return


func _can_transition() -> bool:
	for condition in NodeUtil.find_all_children(self,
			func(n): return n is StateCondition):
		if not condition.is_true():
			return false
	return true


func _transition(state):
	_get_state().get_state_machine().transition(state)
