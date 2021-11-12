global.tick++;
if(global.tick >= room_speed*60)
{
	global.tick = 0;	
}

if(keyboard_check_released(vk_f5))
{
	game_restart();
}

if(room = Room_Main)
{
	
	if(keyboard_check_released(vk_space))
	{
		//room = Room_GamePhysics;
	}
	
}