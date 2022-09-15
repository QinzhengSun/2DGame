extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

var vector =Vector2()
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
	
func creat(p):
	position=p
func _on_Meat_body_entered(body):
	if body.name=="Player":
		get_node("/root/Attribution").setAtk(20)
		queue_free()
	pass # Replace with function body.
