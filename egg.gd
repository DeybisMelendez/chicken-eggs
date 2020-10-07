extends Sprite

var can_walk = false
const SPEED = 100

func _ready():
	$AnimationPlayer.connect("animation_finished", self, "walk")
	$VisibilityNotifier2D.connect("screen_exited", self, "exit")

func _physics_process(delta):
	if can_walk:
		global_position.x -= SPEED * delta

func exit():
	queue_free()

func walk(_anim):
	can_walk = true
	get_tree().current_scene.set_score(-1)
	$sound.play()
	$AnimationPlayer.play("walk")
