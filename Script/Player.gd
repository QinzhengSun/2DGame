extends KinematicBody2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
export (PackedScene) var ball
export (PackedScene) var menu
export var speed = 0
export var gravity = 50
export var jumpHight = 0
onready var UP = Vector2(0,-1)
onready var LEFT = Vector2(-1,0)
var motion = Vector2()
var jumping = true
var canshoot = true
var canmove = true
signal shoot
var atk=50
var dir=0
var hurting = false
var canJump=false
var isDie=false
var isShoot=false
var isHurt=false
var soundPlaying=false
var canHurt=true
# Called when the node enters the scene tree for the first time.
func _ready():
	
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	atk=get_node("/root/Attribution").atk
	
	move()
	if Input.is_action_just_pressed("ui_select"):
		isShoot=true
		shoot()
	
	if get_node("/root/Attribution").life==0:
		die()
	pass
func move():
	if canmove==true:
		if Input.is_action_pressed("ui_right"):
			$AnimatedSprite.flip_h=false
			motion.x=speed
		elif Input.is_action_pressed("ui_left"):
			$AnimatedSprite.flip_h=true
			motion.x=-speed
		else:
			motion.x=0
		if is_on_floor():
			canJump=true
			if motion.x!=0:
				if !soundPlaying:
					$Sounds/Walk.playing=true
					soundPlaying=true
			if Input.is_action_just_pressed("ui_up"):
					motion.y=-jumpHight	
					if $Sounds/Jump.playing==false:
						$Sounds/Jump.playing=true
		else:
			
			if is_on_ceiling():
				motion.y+=3*gravity
			else:
				motion.y+=gravity
			if get_node("/root/Attribution").secondJump==true&&canJump==true:
				if Input.is_action_just_pressed("ui_up"):
					motion.y=-jumpHight	
					canJump=false
	if canmove==true:
		if motion.y<0:
			$AnimatedSprite.play("jump")
		elif motion.x>0||motion.x<0:
			$AnimatedSprite.play("run")	
		else:
			$AnimatedSprite.play("Idle")
	
	
	move_and_slide(motion,UP)
	pass
func shoot():
	if canshoot == true:
		motion.x=0
		isShoot=true
		canmove = false
		canshoot=false
		$Coldtime.start()
		$AnimatedSprite.play("Attack")	
	pass


func _on_Coldtime_timeout():
	canshoot=true
	pass # Replace with function body.


func _on_AnimatedSprite_animation_finished():
	if $AnimatedSprite.animation == "Attack":
		$Sounds/Shoot.playing=true
		if $AnimatedSprite.flip_h==true:
			dir=180
			emit_signal("shoot",ball,$Position2D2.global_position,dir,atk)
		else:
			dir=0
			emit_signal("shoot",ball,$Position2D.global_position,dir,atk)
		canmove=true
	if $AnimatedSprite.animation == "Die":
		get_tree().change_scene("res://Scence/Die.tscn")
	if $AnimatedSprite.animation=="Hurt":
		canmove=true
		isHurt=false
		get_node("/root/Attribution").hurting=false
	pass # Replace with function body.

func die():
	if $Sounds/Die.playing==false:
		$Sounds/Die.playing=true
	canmove=false
	isDie=true
	get_node("/root/Attribution").die=true
	$AnimatedSprite.play("Die")
	
func hurt():
	if canHurt==true:
		canHurt=false
		$NoHurt.start()
		if $Sounds/Hurt.playing==false&&isDie==false:
			$Sounds/Hurt.playing=true
		canmove = false
		motion=Vector2(0,0)
		isHurt=true
		get_node("/root/Attribution").hurting=true
		get_node("/root/Attribution").setLife(1)
		$AnimatedSprite.play("Hurt")
	pass	

func _on_Area2D_body_entered(body):
	
	pass # Replace with function body.



func _on_Walk_finished():
	soundPlaying=false
	pass # Replace with function body.


func _on_NoHurt_timeout():
	canHurt=true
	pass # Replace with function body.
