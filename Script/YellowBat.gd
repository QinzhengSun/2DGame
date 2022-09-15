extends "res://Script/Enemy.gd"


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (PackedScene) var teeth
signal shoot
var dir=0
var canshoot=true
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	catch()
	if !die:
		if health<=0:
			die(20)	
	if canshoot&&catch&&!die:
			shoot()
	pass

func shoot():
	if $Shoot.playing==false:
		$Shoot.playing=true
	canshoot=false
	$Timer.start()
	if $AnimatedSprite.flip_h ==true:
		dir=-90
		emit_signal("shoot",teeth,$Position2D.global_position,dir)
	else:
		dir=90
		emit_signal("shoot",teeth,$Position2D2.global_position,dir)		
	pass
# Replace with function body.
func _on_Area2D_body_entered(body):
	if body.name=="Player":
		catch=true
	pass # Replace with function body.
func _on_Area2D_body_exited(body):
	if body.name=="Player":
		catch=false	
	pass 


func _on_Timer_timeout():
	canshoot=true
	pass # Replace with function body.
