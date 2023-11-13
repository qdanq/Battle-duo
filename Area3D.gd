extends Area3D


func _on_body_entered(body):
	print("test1")
	if body is Player:
		print("test")



