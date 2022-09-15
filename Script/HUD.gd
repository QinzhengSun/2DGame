extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if get_node("/root/Attribution").life==3:
		$CanvasLayer/Heart4.visible=false
		$CanvasLayer/Heart3.visible=true
		$CanvasLayer/Heart2.visible=true
		$CanvasLayer/Heart.visible=true	
	elif get_node("/root/Attribution").life ==2:
		$CanvasLayer/Heart4.visible=false
		$CanvasLayer/Heart3.visible=false
		$CanvasLayer/Heart2.visible=true
		$CanvasLayer/Heart.visible=true	
	elif get_node("/root/Attribution").life ==1:
		$CanvasLayer/Heart4.visible=false
		$CanvasLayer/Heart3.visible=false
		$CanvasLayer/Heart2.visible=false
		$CanvasLayer/Heart.visible=true	
	elif get_node("/root/Attribution").life == 0 :
		$CanvasLayer/Heart.visible=false
		$CanvasLayer/Heart2.visible=false
		$CanvasLayer/Heart3.visible=false
		$CanvasLayer/Heart4.visible=false
	else :
		$CanvasLayer/Heart4.visible=true
		$CanvasLayer/Heart3.visible=true
		$CanvasLayer/Heart2.visible=true
		$CanvasLayer/Heart.visible=true	
		to_string()
		$CanvasLayer/Atk.set_text("ATK: "+ str(get_node("/root/Attribution").atk))
	$CanvasLayer/Coins.set_text(str(get_node("/root/Attribution").coin))
	$CanvasLayer/Score.set_text("Score: "+str(get_node("/root/Attribution").score))
	pass


