extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Box_body_entered(body):
	if body.name=="Player":
		$AudioStreamPlayer.playing=true
		$AnimatedSprite.play("open")
		get_node("/root/Attribution").setCoins(10)
	pass # Replace with function body.


func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "open":
		queue_free()
	pass # Replace with function body.
