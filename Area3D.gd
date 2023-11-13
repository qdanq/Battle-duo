extends Area3D


func _on_body_entered(body):
	if body is CharacterBody3D:
		print("TEST")
		Player.receive_damage()

