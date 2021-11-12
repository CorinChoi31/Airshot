view_x = camera_get_view_x(view_camera[0]);
view_y = camera_get_view_y(view_camera[0]);
view_w = display_get_gui_width()//camera_get_view_width(view_camera[0]); 
view_h = display_get_gui_height()//camera_get_view_height(view_camera[0]);
view_dw = 1080;
view_dh = 1080;

if(player_id.unit_dead = false)
{
	if(global.game_running = false)
	{
		alpha += (1-alpha)/(room_speed/4);
	}
	else
	{
		alpha += -alpha/(room_speed/4);
	}
}
else
{
	alpha += (1-alpha)/(room_speed/5);
}