extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	call_deferred("play_cutscene")

func top1():
	$Viewport/Background/AnimationPlayer.play("scroll")
	$TextureRect/Viewport/Ship/Camera1.current = 1
	$TextureRect/Viewport/Ship/fightership/fire/Particles4.show()
	$TextureRect/Viewport/Ship/fightership/fire/Particles5.hide()
	$Viewport/Background.show()
	$Viewport/ParallaxBackground.hide()
	
func side1():
	$TextureRect/Viewport/Ship/Camera3.current = 1
	$TextureRect/Viewport/Ship/fightership/fire/Particles4.hide()
	$TextureRect/Viewport/Ship/fightership/fire/Particles5.show()
	$Viewport/Background.hide()
	$Viewport/ParallaxBackground.show()

func top2():
	$SecondShip/Ship/Camera2.current=1
	$SecondShip/Ship/fightership/fire/Particles4.show()
	$SecondShip/Ship/fightership/fire/Particles5.hide()

func side2():
	$SecondShip/Ship/Camera3.current=1
	$SecondShip/Ship/fightership/fire/Particles4.hide()
	$SecondShip/Ship/fightership/fire/Particles5.show()


func move1():
	var tween = create_tween()
	$TextureRect.rect_position = Vector2(0,300)
	tween.tween_property($TextureRect, "rect_position", Vector2(0,100), 3.0).set_ease(Tween.EASE_OUT)
	

func move2():
	var tween = create_tween()
	$TextureRect.rect_position = Vector2(0,0)
	$SecondaryContainer/TextureRect2.rect_position = Vector2(-128,300)
	tween.set_parallel()
	tween.tween_property($TextureRect, "rect_position", Vector2(150,-150), 3.0).set_ease(Tween.EASE_OUT)
	tween.tween_property($SecondaryContainer/TextureRect2, "rect_position", Vector2(0,0), 3.0).set_ease(Tween.EASE_OUT)
	
func play_cutscene():
	clear_dialog()
	portrait1()
	top1()
	move1()
	yield(get_tree().create_timer(4.0), "timeout")
	side1()
	side2()
	$TextureRect.rect_position = Vector2(0,0)
	move2()
	var speech_len = 0.5
	yield(get_tree().create_timer(speech_len), "timeout")
	set_dialogue_left("Look who decided to join us!")
	yield(get_tree().create_timer(speech_len), "timeout")
	set_dialogue_right("I wouldn't miss the party!")
	yield(get_tree().create_timer(speech_len), "timeout")
	set_dialogue_left("We get one more shot at this.")
	yield(get_tree().create_timer(speech_len), "timeout")
	set_dialogue_right("I know, the clock is ticking.")
	yield(get_tree().create_timer(speech_len), "timeout")
	set_dialogue_left("It is now or never")
	yield(get_tree().create_timer(speech_len), "timeout")
	set_dialogue_right("Let's do it then!")
	yield(get_tree().create_timer(speech_len), "timeout")
	clear_dialog()
	top1()
	top2()
	move_squad()
	yield(get_tree().create_timer(4.0), "timeout")
	get_tree().change_scene("res://Ending.tscn")
	
func clear_dialog():
	$Polygon2D.hide()
	$Polygon2D2.hide()
	$Portrait.hide()
	$Portrait2.hide()
	$Polygon2D3.hide()
	$Polygon2D4.hide()
	$Label1.hide()
	$Label2.hide()
	
func set_dialogue_left(text):
	clear_dialog()
	$Polygon2D.show()
	$Portrait.show()
	$Polygon2D3.show()
	$Label1.show()
	$Label1.text = text

func set_dialogue_right(text):
	clear_dialog()
	$Polygon2D2.show()
	$Portrait2.show()
	$Polygon2D4.show()
	$Label2.show()
	$Label2.text = text

func portrait1():
	$Portrait/Viewport/Ship/Camera6.current = true
	$Portrait/Viewport/Ship/fightership.hide()
	$Portrait/Viewport/Ship/cockpit/Typing.show()
	
func move_squad():
	$TextureRect.rect_position = Vector2(0,300)
	$SecondaryContainer/TextureRect2.rect_position = Vector2(0,300)
	var tween = create_tween()
	tween.set_parallel()
	tween.tween_property($TextureRect/Viewport/Ship/fightership, "rotation_degrees", Vector3(0,0,45), 1.0).set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_CUBIC)
	tween.tween_property($TextureRect, "rect_position", Vector2(512,-450), 3.0).set_ease(Tween.EASE_OUT).set_delay(0.5)
	var num_sides = 4
	for i in num_sides:
		var secondary = $SecondaryContainer/TextureRect2.duplicate()
		$SecondaryContainer.add_child(secondary)
		if i >= 2:
			i += 1
		secondary.rect_position += Vector2(i*1024/num_sides-512, 0)
		tween.tween_property(secondary, "rect_position", secondary.rect_position+ Vector2(0, randf()*-150), 3.0*+randf())
	tween.tween_property($SecondShip/Ship/fightership, "rotation_degrees", Vector3(0,0,45), 1.0).set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_CUBIC).set_delay(3.0)
	tween.tween_property($SecondaryContainer, "position", Vector2(0,-450), 4.0).set_ease(Tween.EASE_OUT)
	tween.chain()
	tween.tween_property($SecondaryContainer, "position", Vector2(768,-900), 4.0).set_ease(Tween.EASE_OUT)

		
