extends Node2D

export (PackedScene) var egg
var score = 0
var record = 0

func _physics_process(delta):
	if Input.is_action_just_pressed("clic"):
		var new_egg = egg.instance()
		new_egg.position = get_global_mouse_position()
		$eggs.add_child(new_egg)
		$Tween.stop_all()
		$Chicken.global_position = get_global_mouse_position()
		var target = $Chicken.global_position + Vector2.UP * 50
		$Tween.interpolate_property($Chicken,"global_position", $Chicken.global_position, target, 1,Tween.TRANS_LINEAR,Tween.EASE_IN_OUT,0)
		$Tween.start()
		$Chicken/sound.play()
		set_score(1)

func set_score(point):
	score += point
	$score.set_text("Score: " + str(score))
	if score > record:
		record = score
		$record.set_text("Record: " + str(record))