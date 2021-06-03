extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
#onready var rigidbody = get_node("RigidBody2D")
#onready var collider = get_node("RigidBody2D/CollisionShape2D")
onready var lastKeyPressed = "n"
onready var bullet = preload("res://bullet.tscn")
onready var zombie = preload("res://zombie.tscn")
var timeSinceZombie = 0
var timeSinceShoot = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	look_at(get_global_mouse_position())
	var nposition = Vector2(0, 0)
	if Input.is_key_pressed(KEY_W):
		nposition.y -=500
		lastKeyPressed = "w"
	if Input.is_key_pressed(KEY_A):
		nposition.x -=500
		lastKeyPressed = "a"
	if Input.is_key_pressed(KEY_S):
		nposition.y +=500
		lastKeyPressed = "s"
	if Input.is_key_pressed(KEY_D):
		nposition.x +=500
		lastKeyPressed = "d"
	if Input.is_mouse_button_pressed(BUTTON_LEFT) and timeSinceShoot > 0.25:
		var b = bullet.instance()
		add_child(b)
		timeSinceShoot = 0
	else:
		timeSinceShoot += delta
	if timeSinceZombie > 5:
		print("Spawning zombie!")
		var z = zombie.instance()
		add_child(z)
		timeSinceZombie = 0
	else:
		timeSinceZombie += delta
	#print(position)
	move_and_slide(nposition, Vector2(0,0))
