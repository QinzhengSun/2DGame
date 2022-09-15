extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var catch = false
var speed = 20
var falling=Vector2()
var UP =Vector2(0,-1)
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if catch==true:
		fall(delta)
	pass


func _on_Area2D_body_entered(body):
	if body.name=="Player":
		body.die()
		queue_free()
	pass # Replace with function body.
func fall(d):
	falling.y+=speed
	if $AudioStreamPlayer.playing==false:
		$AudioStreamPlayer.playing=true
	move_and_slide(falling)
	
	


func _on_AudioStreamPlayer_finished():
	queue_free()
	pass # Replace with function body.
