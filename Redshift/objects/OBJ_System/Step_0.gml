if(keyboard_check_pressed(vk_f2))
{
	room_goto(ROM_PhysicsGame);
	room_set_camera(ROM_PhysicsGame, 0, global.__camera);
}

if(keyboard_check_pressed(vk_f3))
{
	instance_create_layer(0, 0, "UI", OBJ_Game);
}