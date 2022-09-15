extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var motion = Vector2()

export var speed=0
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.
func start(p,d):
	$Timer.start()
	position=p
	rotation_degrees=d
	

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if rotation_degrees==90:
		motion.x=speed
	else:
		motion.x=-speed
	position+=motion*delta
		
	pass


func _on_Timer_timeout():
	queue_free()
	pass # Replace with function body.


func _on_Area2D_body_entered(body):
	if body.name=="Player":
		body.hurt()
		queue_free()
	pass # Replace with function body.
