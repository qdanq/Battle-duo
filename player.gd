extends MeshInstance3D

const ROT = 2
const Gr = -20
const SPEED = 120
var vel = Vector3()

func _physics_process(delta):
	var dir = Vector3()
	
	if Input.is_action_pressed("Left"):
		rotate_y(ROT*delta)
			
	if Input.is_action_pressed("Right"):
		rotate_y(-ROT*delta)	

	if Input.is_action_pressed("Down"):
		dir.z = 1

	if Input.is_action_pressed("Up"):
		dir.z = -1
		
	if dir:
		dir *= SPEED * delta
		dir = dir.rotated(Vector3(0,1,0), rotation.y)

	vel.x = dir.x
	vel.z = dir.z
	
	vel.y = Gr * delta
	
	vel = move_and_slide(vel, Vector3(0, 1, 0))
