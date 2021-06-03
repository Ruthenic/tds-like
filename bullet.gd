extends RigidBody2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var mouse = get_global_mouse_position()
onready var player = get_node("/root/Root/KinematicBody2D")
var velocity = Vector2(0, 0)
var speed = 1000
# Called when the node enters the scene tree for the first time.
func _ready():
	set_contact_monitor(true)
	var e = player.position
	set_global_position(e)
	look_at(mouse)
	var newmouse = (mouse - self.global_position).normalized()
	self.set_linear_velocity(newmouse * speed)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var coliBodies = get_colliding_bodies()
	print(coliBodies)
	if coliBodies.size() > 0:
		if coliBodies[0].get_groups()[0] == "zombie":
			get_parent().remove_child(self)
