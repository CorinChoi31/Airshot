if(passive_id = 1)
{
	if(passive_trig = 0)
	{
		phy_speed_x = 0; phy_speed_y = 0;
		if(player_position = 1)
		{
			if(global.player_second != noone)
			{
				phy_rotation = 90-point_direction(x,y,global.player_second.phy_position_x,global.player_second.phy_position_y);
			}
		}
		if(player_position = 2)
		{
			if(global.player_first != noone)
			{
				phy_rotation = 90-point_direction(x,y,global.player_first.phy_position_x,global.player_first.phy_position_y);
			}
		}
		physics_apply_local_impulse(0,0,0,-speed_origin);
		
		passive_trig = 1;
		
		width += width_origin*3
	}
	else
	{
		width = min(width+width/10,width_origin*8);
	}
}