@icon("res://state_machine/state_enter_condition_icon.svg")
class_name StateEnterCondition extends Node


func can_enter() -> bool:
	for condition in NodeUtil.find_all_children(self, func(n): return n is StateCondition):
		if not condition.is_true():
			return false
	return true
