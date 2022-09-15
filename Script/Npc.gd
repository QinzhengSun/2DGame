extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var txt 

# Called when the node enters the scene tree for the first time.
func _ready():
	txt=$Label.text
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	$AnimatedSprite.play("Idle")
	pass


func _on_Area2D_body_entered(body):
	if body.name=="Player":
		$Label.visible=true
		$Selection.visible=true
		if $AudioStreamPlayer2D.playing==false:
			$AudioStreamPlayer2D.playing=true
	pass # Replace with function body.


func _on_Selection_refuse():
	$Upset.playing=true
	$Label.set_text("真是遗憾")
	$Selection.visible=true
	pass # Replace with function body.


func _on_Selection_coinNotEnough():
	$Upset.playing=true
	$Label.set_text("你的金币好像不够，去收集点金币再回来吧")
	pass # Replace with function body.


func _on_Area2D_body_exited(body):
	if body.name=="Player":
		$Selection.visible=true
		$Label.set_text(txt)
	pass # Replace with function body.


func _on_Selection_coinEnough():
	$Cheer.playing=true
	$Area2D.monitoring=false
	$Label.set_text("好了，现在试试在空中按空格吧")
	$Selection.queue_free()
	
	pass # Replace with function body.
