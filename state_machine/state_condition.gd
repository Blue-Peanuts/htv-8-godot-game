@icon("res://state_machine/state_condition_icon.svg")
class_name StateCondition extends Node

func is_true() -> bool:
	return _is_true()


func get_state() -> State:
	return NodeUtil.find_ancestor(self, func(n): return n is State) as State


func get_state_machine() -> StateMachine:
	return get_state().get_state_machine()


func _is_true() -> bool:
	push_error("Unimplemented")
	return false
