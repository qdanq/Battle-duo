extends CharacterBody3D

const Gr = -20
const SPEED = 100
var vel = Vector3()

func _physics_process(delta):
	var dir = Vector3()
	
	if Input.is_action_pressed("Left"):
		dir.x = -1
	if Input.is_action_pressed("Right"):
		dir.x = 1	
	if Input.is_action_pressed("Down"):
		dir.z = 1
	if Input.is_action_pressed("Up"):
		dir.z = -1
		
	if dir:
		dir *= SPEED * delta
		
	vel.x = dir.x
	vel.z = dir.z
	
	vel.y += Gr * delta
	
	move_and_slide()

	
