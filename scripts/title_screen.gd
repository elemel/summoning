extends Node2D

@export var game_screen_file = "res://scenes/screens/game.tscn"

func _unhandled_input(event: InputEvent) -> void:
    if event is InputEventMouseButton:
        if event.pressed and (event.button_index == MOUSE_BUTTON_LEFT):
            get_viewport().set_input_as_handled()
            start_game()

    if event is InputEventKey:
        if event.pressed and (event.keycode == KEY_SPACE or event.keycode == KEY_ENTER):
            get_viewport().set_input_as_handled()
            start_game()

        if event.pressed and (event.keycode == KEY_ESCAPE or event.keycode == KEY_BACKSPACE):
            get_viewport().set_input_as_handled()
            get_tree().quit()

func start_game() -> void:
    var game_screen_scene = load(game_screen_file)
    get_tree().root.add_child(game_screen_scene.instantiate())
    get_tree().root.remove_child(self)
