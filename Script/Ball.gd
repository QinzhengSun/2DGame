extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export var speed = 0
var dam = 0
var motion = Vector2()
signal touch
# Called when the node enters the scene tree for the first time.
func start(var _postion,var direction, var damage):
	$Shoot.playing=true
	$Timer.start()
	rotation_degrees=direction
	dam=damage
	position=_postion
	pass
func _ready():
	pass # Replace with function body.
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if rotation_degrees == 0:
		motion.x=speed
	if rotation_degrees == 180:
		motion.x=-speed
	position+=delta*motion


func _on_Ball_body_entered(body):
	queue_free()
	if body.has_method("take_damage"):
		body.take_damage(dam)
	pass # Replace with function body.


func _on_Timer_timeout():
	queue_free()
	pass # Replace with function body.
