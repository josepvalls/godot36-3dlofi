extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
signal next
signal cue_music


# Called when the node enters the scene tree for the first time.
func _ready():
	call_deferred("play_cutscene")
func play_cutscene():
	# show quikc views of the outside, empty
	$TextureRect2/Viewport/Hangar/cockpit/Typing.hide()
	$TextureRect/Viewport/Hangar/fightership/fire.hide()
	emit_signal("cue_music")
	show1()
	yield(get_tree().create_timer(2.0), "timeout")
	show2()
	yield(get_tree().create_timer(2.0), "timeout")
	show3()
	yield(get_tree().create_timer(2.0), "timeout")
	#show4()
	#yield(get_tree().create_timer(1.0), "timeout")
	show5()
	yield(get_tree().create_timer(1.0), "timeout")
	emit_signal("cue_music")
	$ViewportContainer2/Viewport/Hangar/Lights.play_lights()
	yield(get_tree().create_timer(3.0), "timeout")
	# start walk
	emit_signal("cue_music")
	show4()
	do_walk1()
	yield(get_tree().create_timer(3.0), "timeout")
	show3()
	do_walk2()
	yield(get_tree().create_timer(3.0), "timeout")
	# show full cockpit
	$TextureRect2/Viewport/Hangar/cockpit/Typing.show()
	show5()
	yield(get_tree().create_timer(3.0), "timeout")
	# show the outside with fire
	$TextureRect/Viewport/Hangar/fightership/fire.show()
	show2()
	yield(get_tree().create_timer(3.0), "timeout")
	# open the gate from behind
	$ViewportContainer2/Viewport/Hangar.set_on()
	yield(get_tree().create_timer(3.0), "timeout")
	show5()
	yield(get_tree().create_timer(2.0), "timeout")
	show2()
	yield(get_tree().create_timer(1.0), "timeout")
	$ViewportContainer2/Viewport/Hangar.liftoff()
	$TextureRect/Viewport/Hangar.liftoff()
	yield(get_tree().create_timer(2.5), "timeout")
	# show clear cockpit
	#$ViewportContainer2.hide()
	#yield(get_tree().create_timer(2.5), "timeout")
	#show5()
	#$TextureRect/Viewport/Hangar/Lights.hide()
	#$TextureRect/Viewport/Hangar/door.hide()
	#$TextureRect2/Viewport/Hangar/Lights.hide()
	#$TextureRect2/Viewport/Hangar/door.hide()
	#get_tree().change_scene("res://My2DShip.tscn")
	emit_signal("next")
	
	
	


func show1():
	$TextureRect/Viewport/Hangar/cockpit.hide()
	$TextureRect2/Viewport/Hangar/cockpit.hide()
	$ViewportContainer2/Viewport/Hangar/Camera1.current = true
	$TextureRect/Viewport/Hangar/Camera1.current = true
	$TextureRect2/Viewport/Hangar/Camera1.current = true
	
func show2():
	$TextureRect/Viewport/Hangar/cockpit.hide()
	$TextureRect2/Viewport/Hangar/cockpit.hide()
	$ViewportContainer2/Viewport/Hangar/Camera2.current = true
	$TextureRect/Viewport/Hangar/Camera2.current = true
	$TextureRect2/Viewport/Hangar/Camera2.current = true
	$TextureRect/Viewport/Hangar/OmniLight2.hide()
	$TextureRect2/Viewport/Hangar/OmniLight2.hide()
	$ViewportContainer2/Viewport/Hangar/OmniLight2.hide()
	$TextureRect/Viewport/Hangar/Walking.hide()
	$TextureRect2/Viewport/Hangar/Walking.hide()
	$ViewportContainer2/Viewport/Hangar/Walking.hide()
	#$TextureRect2/Viewport/Hangar/door/door1.translation = Vector3(2.5,1,34)
	#$TextureRect2/Viewport/Hangar/door/door2.translation = Vector3(-2.5,1,34)


func show3():
	$TextureRect/Viewport/Hangar/cockpit.hide()
	$TextureRect2/Viewport/Hangar/cockpit.hide()
	$TextureRect/Viewport/Hangar/OmniLight2.show()
	$TextureRect2/Viewport/Hangar/OmniLight2.show()
	$ViewportContainer2/Viewport/Hangar/OmniLight2.show()
	$ViewportContainer2/Viewport/Hangar/Camera3.current = true
	$TextureRect/Viewport/Hangar/Camera3.current = true
	$TextureRect2/Viewport/Hangar/Camera3.current = true

func show4():
	$TextureRect/Viewport/Hangar/cockpit.hide()
	$TextureRect2/Viewport/Hangar/cockpit.hide()
	$TextureRect/Viewport/Hangar/OmniLight2.show()
	$TextureRect2/Viewport/Hangar/OmniLight2.show()
	$ViewportContainer2/Viewport/Hangar/OmniLight2.show()
	$ViewportContainer2/Viewport/Hangar/Walking/Camera4.current = true
	$TextureRect/Viewport/Hangar/Walking/Camera4.current = true
	$TextureRect2/Viewport/Hangar/Walking/Camera4.current = true

func show5():
	$TextureRect/Viewport/Hangar/cockpit.show()
	$TextureRect/Viewport/Hangar/cockpit/OmniLight3.show()
	$TextureRect2/Viewport/Hangar/cockpit.show()
	$TextureRect2/Viewport/Hangar/cockpit/OmniLight3.show()
	$TextureRect/Viewport/Hangar/door/door1.translation = Vector3(5,1,34)
	$TextureRect/Viewport/Hangar/door/door2.translation = Vector3(-5,1,34)
	$TextureRect/Viewport/Hangar/cockpit/Camera5.current = true
	$TextureRect2/Viewport/Hangar/cockpit/Camera5.current = true




func do_walk1():
	$TextureRect2/Viewport/Hangar/Walking.show()
	$ViewportContainer2/Viewport/Hangar/fightership.hide()
	$TextureRect/Viewport/Hangar/fightership.hide()
	$TextureRect2/Viewport/Hangar/fightership.hide()
	$ViewportContainer2/Viewport/Hangar.walk()
	$TextureRect/Viewport/Hangar.walk()
	$TextureRect2/Viewport/Hangar.walk()

func do_walk2():
	$TextureRect2/Viewport/Hangar/Walking.show()
	$ViewportContainer2/Viewport/Hangar/fightership.show()
	$TextureRect/Viewport/Hangar/fightership.show()
	$TextureRect2/Viewport/Hangar/fightership.hide()
	$ViewportContainer2/Viewport/Hangar.walk()
	$TextureRect/Viewport/Hangar.walk()
	$TextureRect2/Viewport/Hangar.walk()


func _input(event):
	if event is InputEventKey and event.pressed:
		match event.scancode:
			KEY_E:
				$ViewportContainer2/Viewport/Hangar.set_on()
				yield(get_tree().create_timer(2.0), "timeout")
				$ViewportContainer2/Viewport/Hangar.liftoff()
				$TextureRect/Viewport/Hangar.liftoff()
				return
			KEY_R:
				do_walk1()
				return
			KEY_T:
				do_walk2()
				return

			KEY_1:
				show1()
			KEY_2:
				show2()
			KEY_3:
				show3()
			KEY_4:
				show4()
			KEY_5:
				show5()
