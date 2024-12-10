extends Spatial


# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func _ready():
	set_off()

func set_off():
	$WorldEnvironment.environment.background_color = Color.black
	$OmniLight.light_energy = 0.0
	
func set_on():
	$Walking.hide()
	var tween = create_tween()
	tween.set_parallel(true)
	var time = 1.0
	tween.tween_property($WorldEnvironment.environment, "background_color", Color.white, time)
	tween.tween_property($OmniLight, "light_energy", 10.0, time)
	tween.tween_property($door/door1, "translation", Vector3(5,1,34), time).set_delay(time)
	tween.tween_property($door/door2, "translation", Vector3(-5,0,34), time).set_delay(time)

	#$WorldEnvironment.environment.background_color = Color.white
	#$OmniLight.light_energy = 10.0

func liftoff():
	$Walking.hide()
	var tween = create_tween()
	tween.set_parallel(true)
	var time = 2.0
	$fightership/fire/Particles1.amount = 32
	$fightership/fire/Particles2.amount = 16
	$fightership/fire/Particles3.amount = 16
	#tween.tween_property($fightership/fire/Particles1, "amount", 32, time)
	#tween.tween_property($fightership/fire/Particles2, "amount", 8, time)
	#tween.tween_property($fightership/fire/Particles3, "amount", 8, time)
	tween.tween_property($fightership/fire/Particles1, "lifetime", 0.5, time)
	tween.tween_property($fightership/fire/Particles2, "lifetime", 0.1, time)
	tween.tween_property($fightership/fire/Particles3, "lifetime", 0.1, time)
	tween.tween_property($fightership, "translation", Vector3(0,0,1), time).set_ease(Tween.EASE_IN).set_trans(Tween.TRANS_CUBIC)
	tween.tween_callback(self, "liftoff2").set_delay(time)

func liftoff2():
	var tween = create_tween()
	tween.set_parallel(true)
	var time = 2.0
	$fightership/fire/Particles1.amount = 64
	$fightership/fire/Particles2.amount = 32
	$fightership/fire/Particles3.amount = 32
	$fightership/fire/Particles1.process_material.initial_velocity = 15.0
	$fightership/fire/Particles2.process_material.initial_velocity = 15.0
	$fightership/fire/Particles2.process_material.initial_velocity = 15.0
	$fightership/fire/Particles1.lifetime = 1.0
	$fightership/fire/Particles2.lifetime = 0.5
	$fightership/fire/Particles3.lifetime = 0.5
	#tween.tween_property($fightership/fire/Particles1, "amount", 32, time)
	#tween.tween_property($fightership/fire/Particles2, "amount", 8, time)
	#tween.tween_property($fightership/fire/Particles3, "amount", 8, time)
	#tween.tween_property($fightership/fire/Particles1/process_material, "initial_velocity", 30.0, time)
	#tween.tween_property($fightership/fire/Particles2/process_material, "initial_velocity", 30.0, time)
	#tween.tween_property($fightership/fire/Particles3/process_material, "initial_velocity", 30.0, time)
	tween.tween_property($fightership, "translation", Vector3(0,0,40), time).set_ease(Tween.EASE_OUT).set_trans(Tween.TRANS_CUBIC)
	
var walk_tween: SceneTreeTween = null
func walk():
	if walk_tween:
		walk_tween.kill()
	walk_tween = create_tween()
	$Walking.show()
	$Walking.translation = Vector3(-2,0,3)
	walk_tween.tween_property($Walking, "translation", Vector3(-2,0,0), 5.0)

