extends Node


func is_subset_of(subarr: Array, arr: Array) -> bool:
	var sub_len = len(subarr)
	if sub_len > len(arr):
		return false
	
	var first_i = arr.find(subarr[0])
	if first_i == -1:
		return false
	
	for i in range(first_i, first_i + sub_len):
		if len(arr) <= i:
			return false
		
		if subarr[i - first_i] != arr[i]:
			return false
	return true
	
func flip_keys(keys: Array) -> Array:
	var keys2 = keys.duplicate()
	for i in (len(keys2)):
		if keys2[i] == "move_right":
			print("Flipping move right")
			keys2[i] = "move_left"
		elif keys2[i] == "move_left":
			keys2[i] = "move_right"
			
	return keys2
