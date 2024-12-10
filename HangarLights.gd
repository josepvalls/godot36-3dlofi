extends Spatial

func play_lights():
	var tween = create_tween()
	tween.set_parallel(true)
	for i in 16:
		for j in ["a", "b"]:
			var light = get_node("l"+str(i+1)+j)
			if not light:
				prints("missing", "l"+str(i+1)+j)
				continue
			tween.tween_callback(light.get_node("AnimationPlayer"), "play", ["flash"]).set_delay(i*0.2)
