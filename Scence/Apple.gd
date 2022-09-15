extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal heartTouch

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Apple_body_entered(body):
	if body.name=="Player":
		if get_node("/root/Attribution").life<4:
			get_node("/root/Attribution").setLife(-1)
			emit_signal("heartTouch")
		queue_free()
	pass # Replace with function body.
