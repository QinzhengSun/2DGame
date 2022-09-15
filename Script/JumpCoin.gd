extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var motion=Vector2()
var speed=0
var d = 0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	motion.y+=20
	d=delta
	position+=motion*delta
	pass

func create(p):
	position=p
	$AudioStreamPlayer2D.playing=true
func _on_JumpCoin_body_entered(body):
	if body.name=="Player":
		get_node("/root/Attribution").setCoins(1)
		queue_free()
	pass # Replace with function body.
