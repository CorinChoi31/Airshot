var _scale = 1//view_w/1080;

if(player_position = 1)
{
	var _hw = view_w/6;
	player_health += ((player_id.unit_health/player_id.unit_cc_health_max)-player_health)/(room_speed/10);
	player_health_prev = player_id.unit_health_prev/player_id.unit_cc_health_max;
	
	var _sw = view_w/6;
	if(player_id.active_skill_index != 0)
	{
		var _v = 1-player_id.unit_skill_stand/player_id.unit_cc_skill_stand_cool;
		if(_v <= 1)
			player_skill += (_v-player_skill)/(room_speed/10);
	}
	else
	{
		player_skill = 0;
	}
	
	draw_set_color(c_red);
	draw_set_alpha((player_id.unit_health_prev_draw/room_speed)*0.5-alpha);
	draw_rectangle(view_w/16,view_h/32*25,view_w/16+player_health_prev*_hw,view_h/32*27,false);
	draw_set_color(c_white);
	draw_set_alpha(1-alpha);
	draw_rectangle(view_w/16,view_h/32*25,view_w/16+player_health*_hw,view_h/32*27,false);
	draw_rectangle(view_w/16,view_h/32*25,view_w/16+_hw,view_h/32*27,true);
	
	draw_rectangle(view_w/16,view_h/32*23,view_w/16+player_skill*_sw,view_h/32*24,false);
	draw_rectangle(view_w/16,view_h/32*23,view_w/16+_sw,view_h/32*24,true);
	
	var _x = 0; _w = view_w/128; var _max = player_id.unit_cc_attack_bullet_amount_max;
	for(var i = 0; i < _max; i++)
	{
		draw_rectangle(view_w/16+(_w*i)+_x,view_h/32*28,view_w/16+(_w*(i+1))+_x,view_h/32*29,true);
		if(i < player_id.unit_attack_bullet_amount)
		{
			draw_rectangle(view_w/16+(_w*i)+_x,view_h/32*28,view_w/16+(_w*(i+1))+_x,view_h/32*29,false);
			if(i+1 = player_id.unit_attack_bullet_amount)
			{
				
			}
		}
		else if(player_id.unit_attack_bullet_amount = 0)
		{
			if(i < round(player_id.unit_cc_attack_bullet_amount_max*((player_id.unit_cc_attack_bullet_reload_cool-player_id.unit_attack_bullet_reload)/player_id.unit_cc_attack_bullet_reload_cool)))
			{
				draw_rectangle(view_w/16+(_w*i)+_x,view_h/32*28,view_w/16+(_w*(i+1))+_x,view_h/32*29,false);
			}
		}
		_x += _w/3;
	}
	
	draw_set_halign(fa_right);
	draw_set_valign(fa_bottom);
	
	draw_set_color(c_red);
	draw_set_alpha(1-alpha);
	
	if(player_id.active_skill_index != 0)
	{
		draw_set_font(WalkwayObliqueBold_Regular_16);
		if(player_id.unit_skill_stand > 0)
		{
			if(player_id.unit_skill_stand > room_speed)
			{
				draw_text_transformed(view_w/16+player_skill*_sw-view_w/128,view_h/32*24,string(floor(player_id.unit_skill_stand/room_speed)),_scale,_scale,0);
			}
			else
			{
				draw_text_transformed(view_w/16+player_skill*_sw-view_w/128,view_h/32*24,string_format(player_id.unit_skill_stand/room_speed,0,1),_scale,_scale,0);
			}
		}
		else
		{
			draw_text_transformed(view_w/16+player_skill*_sw-view_w/128,view_h/32*24,"Ready",_scale,_scale,0);
			
			if(player_id.unit_skill_stand_consumption > 0)
			{
				draw_set_halign(fa_left);
				draw_text_transformed(view_w/16+player_skill*_sw+view_w/128,view_h/32*24,"COST: "+string(player_id.unit_skill_stand_consumption),_scale,_scale,0);
			}
		}
	}
	
	draw_set_halign(fa_right);
	draw_set_font(WalkwayObliqueBold_Regular_16);
	draw_text_transformed(view_w/16+_hw-view_w/128,view_h/32*27,string(ceil(player_id.unit_health))+"/"+string(player_id.unit_cc_health_max),_scale,_scale,0);
	
	draw_set_halign(fa_left);
	draw_set_font(WalkwayObliqueBold_Regular_16);
	if(player_id.unit_attack_bullet_amount > 0)
	{
		draw_text_transformed(view_w/16+(_w*(_max+1))+_x,view_h/32*29,string(player_id.unit_attack_bullet_amount)+"/"+string(_max),_scale,_scale,0);
	}
	else
	{
		draw_text_transformed(view_w/16+(_w*(_max+1))+_x,view_h/32*29,string(round(player_id.unit_cc_attack_bullet_amount_max*((player_id.unit_cc_attack_bullet_reload_cool-player_id.unit_attack_bullet_reload)/player_id.unit_cc_attack_bullet_reload_cool)))+"/"+string(_max),_scale,_scale,0);
	}
}
if(player_position = 2)
{
	var _hw = view_w/6;
	player_health += ((player_id.unit_health/player_id.unit_cc_health_max)-player_health)/(room_speed/10);
	player_health_prev = player_id.unit_health_prev/player_id.unit_cc_health_max;
	
	var _sw = view_w/6;
	if(player_id.active_skill_index != 0)
	{
		var _v = 1-player_id.unit_skill_stand/player_id.unit_cc_skill_stand_cool;
		if(_v <= 1)
			player_skill += (_v-player_skill)/(room_speed/10);
	}
	else
	{
		player_skill = 0;
	}
	
	draw_set_color(c_blue);
	draw_set_alpha((player_id.unit_health_prev_draw/room_speed)*0.5-alpha);
	draw_rectangle(view_w/16*15,view_h/32*25,view_w/16*15-player_health_prev*_hw,view_h/32*27,false);
	draw_set_color(c_white);
	draw_set_alpha(1-alpha);
	draw_rectangle(view_w/16*15,view_h/32*25,view_w/16*15-player_health*_hw,view_h/32*27,false);
	draw_rectangle(view_w/16*15,view_h/32*25,view_w/16*15-_hw,view_h/32*27,true);
	
	draw_rectangle(view_w/16*15,view_h/32*23,view_w/16*15-player_skill*_sw,view_h/32*24,false);
	draw_rectangle(view_w/16*15,view_h/32*23,view_w/16*15-_sw,view_h/32*24,true);
	
	var _x = 0; var _w = view_w/128; var _max = player_id.unit_cc_attack_bullet_amount_max;
	for(var i = 0; i < _max; i++)
	{
		draw_rectangle(view_w/16*15-(_w*i)-_x,view_h/32*28,view_w/16*15-(_w*(i+1))-_x,view_h/32*29,true);
		if(i < player_id.unit_attack_bullet_amount)
		{
			draw_rectangle(view_w/16*15-(_w*i)-_x,view_h/32*28,view_w/16*15-(_w*(i+1))-_x,view_h/32*29,false);
		}
		else if(player_id.unit_attack_bullet_amount = 0)
		{
			if(i < round(player_id.unit_cc_attack_bullet_amount_max*((player_id.unit_cc_attack_bullet_reload_cool-player_id.unit_attack_bullet_reload)/player_id.unit_cc_attack_bullet_reload_cool)))
			{
				draw_rectangle(view_w/16*15-(_w*i)-_x,view_h/32*28,view_w/16*15-(_w*(i+1))-_x,view_h/32*29,false);
			}
		}
		_x += _w/3;
	}
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_bottom);
	
	draw_set_color(c_blue);
	draw_set_alpha(1-alpha);
	
	if(player_id.active_skill_index != 0)
	{
		draw_set_font(WalkwayObliqueBold_Regular_16);
		if(player_id.unit_skill_stand > 0)
		{
			if(player_id.unit_skill_stand > room_speed)
			{
				draw_text_transformed(view_w/16*15-player_skill*_sw+view_w/128,view_h/32*24,string(floor(player_id.unit_skill_stand/room_speed)),_scale,_scale,0);
			}
			else
			{
				draw_text_transformed(view_w/16*15-player_skill*_sw+view_w/128,view_h/32*24,string_format(player_id.unit_skill_stand/room_speed,0,1),_scale,_scale,0);
			}
		}
		else
		{
			draw_text_transformed(view_w/16*15-player_skill*_sw+view_w/128,view_h/32*24,"Ready",_scale,_scale,0);
			
			if(player_id.unit_skill_stand_consumption > 0)
			{
				draw_set_halign(fa_right);
				draw_text_transformed(view_w/16*15-player_skill*_sw-view_w/128,view_h/32*24,string(player_id.unit_skill_stand_consumption)+" :COST",_scale,_scale,0);
			}
		}
	}
	
	draw_set_halign(fa_left);
	draw_set_font(WalkwayObliqueBold_Regular_16);
	draw_text_transformed(view_w/16*15-_hw+view_w/128,view_h/32*27,string(ceil(player_id.unit_health))+"/"+string(player_id.unit_cc_health_max),_scale,_scale,0);
	
	draw_set_halign(fa_right);
	draw_set_font(WalkwayObliqueBold_Regular_16);
	if(player_id.unit_attack_bullet_amount > 0)
	{
		draw_text_transformed(view_w/16*15-(_w*(_max+1))-_x,view_h/32*29,string(player_id.unit_attack_bullet_amount)+"/"+string(_max),_scale,_scale,0);
	}
	else
	{
		draw_text_transformed(view_w/16*15-(_w*(_max+1))-_x,view_h/32*29,string(round(player_id.unit_cc_attack_bullet_amount_max*((player_id.unit_cc_attack_bullet_reload_cool-player_id.unit_attack_bullet_reload)/player_id.unit_cc_attack_bullet_reload_cool)))+"/"+string(_max),_scale,_scale,0);
	}
}

draw_set_color(c_white);
draw_set_alpha(1);