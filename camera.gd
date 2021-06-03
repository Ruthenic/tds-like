extends Camera2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var player = get_node("/root/Root/KinematicBody2D")
onready var lastLastKeyPressed = "w"
onready var num = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	make_current()
	print(player)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var newposition = Vector2(player.position)
	position = newposition
