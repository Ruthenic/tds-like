extends RigidBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var mouse = get_global_mouse_position()
onready var player = get_node("/root/Root/KinematicBody2D")
var speed = 250
# Called when the node enters the scene tree for the first time.
func _ready():
	set_contact_monitor(true)
	set_global_position(Vector2(0,0))
	look_at(player.position)
	var newmouse = (player.position - self.global_position).normalized()
	self.set_linear_velocity(newmouse * speed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var coliBodies = get_colliding_bodies()
	print(coliBodies)
	if coliBodies.size() > 0:
		if coliBodies[0].get_groups()[0] == "bullet":
			get_parent().remove_child(self)

func _integrate_forces(state):
	look_at(player.position)
	var newmouse = (player.position - self.global_position).normalized()
	self.set_linear_velocity(newmouse * speed)
	
