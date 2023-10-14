class_name NodeUtil extends Object


## Static method to find all descendants of a node that satisfy a condition.
## Parameters:
## - node: The starting node to search from.
## - condition: A Callable function that determines if a node should be included.
## - penetrate_scenes: A boolean flag to indicate whether to search across scene boundaries.
## Returns: An array of nodes that meet the condition.
static func find_all_descendants(node: Node,
		condition: Callable = func(_n): return true,
		penetrate_scenes := false) -> Array[Node]:
	var found: Array[Node] = []
	var queue: Array[Node] = []
	queue.append(node)
	while not queue.is_empty():
		var curr: Node = queue.front()
		if condition.call(curr) and curr != node:
			found.append(curr)
		queue.pop_front()
		for child in curr.get_children():
			if child.owner == node or child.owner == node.owner or penetrate_scenes:
				queue.push_back(child)
	return found


## Static method to find the first descendant of a node that satisfies a condition.
## Parameters:
## - node: The starting node to search from.
## - condition: A Callable function that determines if a node should be included.
## - penetrate_scenes: A boolean flag to indicate whether to search across scene boundaries.
## Returns: The first node found that meets the condition, or null if none is found.
static func find_descendant(node: Node, condition: Callable,
		penetrate_scenes := false) -> Node:
	var queue: Array[Node] = []
	queue.append(node)
	while not queue.is_empty():
		var curr: Node = queue.front()
		if condition.call(curr) and curr != node:
			return curr
		queue.pop_front()
		for child in curr.get_children():
			if child.owner == node or child.owner == node.owner or penetrate_scenes:
				queue.push_back(child)
	return null


## Static method to find the first child of a node that satisfies a condition.
## Parameters:
## - node: The node whose children are searched.
## - condition: A Callable function that determines if a child node should be included.
## Returns: The first child node found that meets the condition, or null if none is found.
static func find_child(node: Node, condition: Callable) -> Node:
	for child in node.get_children():
		if(condition.call(child)):
			return child
	return null


## Static method to find all children of a node that satisfy a condition.
## Parameters:
## - node: The node whose children are searched.
## - condition: A Callable function that determines if a child node should be included.
## Returns: An array of child nodes that meet the condition.
static func find_all_children(node: Node, condition: Callable) -> Array[Node]:
	var children: Array[Node] = []
	for child in node.get_children():
		if(condition.call(child)):
			children.append(child)
	return children


## Static method to find the first ancestor of a node that satisfies a condition.
## Parameters:
## - node: The starting node to search from.
## - condition: A Callable function that determines if an ancestor node should be included.
## Returns: The first ancestor node found that meets the condition, or null if none is found.
static func find_ancestor(node: Node, condition: Callable) -> Node:
	while(node.get_parent() != null):
		if condition.call(node.get_parent()):
			return node.get_parent()
		node = node.get_parent()
	return null


## Static method to find the first relative (nodes within the same owner) of a node
## that satisfies a condition.
## Parameters:
## - node: The starting node to search from.
## - condition: A Callable function that determines if a relative node should be included.
## - penetrate_scenes: A boolean flag to indicate whether to search across scene boundaries.
## Returns: The first relative node found that meets the condition, or null if none is found.
static func find_relative(node: Node, condition: Callable,
		penetrate_scenes := false) -> Node:
	return find_descendant(node.owner, condition, penetrate_scenes)


## Static method to find all relatives (nodes within the same owner) of a node
## that satisfy a condition.
## Parameters:
## - node: The starting node to search from.
## - condition: A Callable function that determines if a relative node should be included.
## - penetrate_scenes: A boolean flag to indicate whether to search across scene boundaries.
## Returns: An array of relative nodes that meet the condition.
static func find_all_relatives(node: Node, condition: Callable,
		penetrate_scenes := false) -> Array[Node]:
	return find_all_descendants(node.owner,
			func(n): return condition.call(n) and n != node, penetrate_scenes)
