extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var scenes = [
	preload("res://My2DHangar.tscn").instance(),
	preload("res://My2DShip.tscn").instance(),
	preload("res://Ending.tscn").instance()
	
]

var audio = [
	preload("res://sfx/606933__garuda1982__large-diesel-emergency-generator-is-running.wav"),
	preload("res://sfx/fx-loud-emergency-alarm-236420.wav"),
	preload("res://sfx/Lite Saturation - Fast Epic - 30 sec.mp3")
]

var current = 0
var current_instance = null

var current_audio = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	for i in scenes:
		i.connect("next", self, "play")
	scenes[0].connect("cue_music", self, "music")
	call_deferred("play")

func music():
	$AudioStreamPlayer2D.stream = audio[current_audio]
	$AudioStreamPlayer2D.play()
	current_audio += 1

func play():
	if current < len(scenes):
		if current_instance:
			remove_child(current_instance)
		current_instance = scenes[current]
		add_child(current_instance)
		current += 1

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
