var _color = c_white;
var _color_hos = c_white;
if(player_position = 1)
{
	_color = c_orange;
	_color_hos = c_aqua;
}
if(player_position = 2)
{
	_color = c_aqua;
	_color_hos = c_orange;
}

var _isEffect = 0; var _drawAngle = 0; var _drawed = false; 

switch(active_skill_index)
{
	case 1:
		_isEffect = unit_player_effect_search(id,EFFECT.ACTIVE_countdown,0,0,[BUFF.SEARCH_TICK,BUFF.SEARCH_MOREorSAME]);
		if(is_array(_isEffect))
		{
			_drawAngle = 60*(unit_effect_tick[|_isEffect[0]]/unit_effect_tick_origin[|_isEffect[0]]);
			
			effect_range += (unit_cc_attack_auto_target-effect_range)/(room_speed/10);
			effect_alpha += (1-effect_alpha)/(room_speed/10);
	
			_drawed = true;
		}
		
		effect_angle += (_drawAngle-effect_angle)/(room_speed/15);
		draw_fan(x,y,effect_range-effect_range/32,effect_range,60,90,2,c_white,effect_alpha,true);
		draw_fan(x,y,effect_range-effect_range/32,effect_range,60,210,2,c_white,effect_alpha,true);
		draw_fan(x,y,effect_range-effect_range/32,effect_range,60,330,2,c_white,effect_alpha,true);
		
		draw_fan(x,y,effect_range-effect_range/32,effect_range,effect_angle,90,2,_color,effect_alpha,false);
		draw_fan(x,y,effect_range-effect_range/32,effect_range,effect_angle,210,2,_color,effect_alpha,false);
		draw_fan(x,y,effect_range-effect_range/32,effect_range,effect_angle,330,2,_color,effect_alpha,false);
		break;
	case 11:
		_isEffect = unit_player_effect_search(id,EFFECT.ACTIVE_impulse,0,0,[BUFF.SEARCH_TICK,BUFF.SEARCH_MOREorSAME]);
		if(is_array(_isEffect))
		{
			_drawAngle = 60*((unit_effect_tick_origin[|_isEffect[0]]-(unit_effect_tick[|_isEffect[0]]+1))/unit_effect_tick_origin[|_isEffect[0]]);
			
			effect_range += (unit_cc_attack_auto_target-effect_range)/(room_speed/10);
			effect_alpha += (1-effect_alpha)/(room_speed/10);
	
			_drawed = true;
		}
		
		effect_angle += (_drawAngle-effect_angle)/(room_speed/15);
		draw_fan(x,y,effect_range-effect_range/32,effect_range,60,90,2,c_white,effect_alpha,true);
		draw_fan(x,y,effect_range-effect_range/32,effect_range,60,210,2,c_white,effect_alpha,true);
		draw_fan(x,y,effect_range-effect_range/32,effect_range,60,330,2,c_white,effect_alpha,true);
		
		draw_fan(x,y,effect_range-effect_range/32,effect_range,effect_angle,90,2,_color,effect_alpha,false);
		draw_fan(x,y,effect_range-effect_range/32,effect_range,effect_angle,210,2,_color,effect_alpha,false);
		draw_fan(x,y,effect_range-effect_range/32,effect_range,effect_angle,330,2,_color,effect_alpha,false);
		break;
	case 15:
		if(ds_list_size(unit_skill_record) > 0)
		{
			var _list = unit_skill_record[|ds_list_size(unit_skill_record)-1];
			var _alpha = 0;
			if(unit_skill_stand <= room_speed*3)
			{
				_alpha = 0.85*((room_speed*3-unit_skill_stand)/(room_speed*3));
			}
			else
			{
				_isEffect = unit_player_effect_search(id,EFFECT.ACTIVE_timerewind,0,0,[BUFF.SEARCH_TICK,BUFF.SEARCH_MOREorSAME]);
				if(is_array(_isEffect))
				{
					_alpha = (unit_effect_tick[|_isEffect[0]]/unit_effect_tick_origin[|_isEffect[0]])*0.85;
				}
			}
			
			draw_set_font(WalkwayObliqueBold_Regular_16);
			draw_set_halign(fa_center);
			draw_set_valign(fa_top);
			if(player_position = 1)
			{
				draw_sprite_ext(S_Player_First,unit_airframe_index+1,_list[0],_list[1],0.75,0.75,-_list[4],c_white,_alpha);
			}
			if(player_position = 2)
			{
				draw_sprite_ext(S_Player_Second,unit_airframe_index+1,_list[0],_list[1],0.75,0.75,-_list[4],c_white,_alpha);
			}
			draw_set_alpha(_alpha);
			draw_set_color(_color);
			draw_text(_list[0],_list[1]+24,string(round(_list[5])));
			draw_set_font(WalkwayObliqueBold_Regular_12);
			draw_set_valign(fa_bottom);
			if(_list[6] > 0)
			{
				draw_text(_list[0],_list[1]-24,string(round(_list[6])));
			}
			else
			{
				draw_text(_list[0],_list[1]-24,string_format(_list[7]/room_speed,0,1)+" sec");
			}
		}
		break;
	case 16:
		_isEffect = unit_player_effect_search(id,EFFECT.ACTIVE_countdown,0,0,[BUFF.SEARCH_TICK,BUFF.SEARCH_MOREorSAME]);
		if(is_array(_isEffect))
		{
			_drawAngle = 60*(unit_effect_tick[|_isEffect[0]]/unit_effect_tick_origin[|_isEffect[0]]);
			
			effect_range += (unit_cc_attack_auto_target-effect_range)/(room_speed/10);
			effect_alpha += (1-effect_alpha)/(room_speed/10);
	
			_drawed = true;
		}
		_isEffect = unit_player_effect_search(id,EFFECT.ACTIVE_impulse,0,0,[BUFF.SEARCH_TICK,BUFF.SEARCH_MOREorSAME]);
		if(is_array(_isEffect))
		{
			_drawAngle = 60*((unit_effect_tick_origin[|_isEffect[0]]-(unit_effect_tick[|_isEffect[0]]+1))/unit_effect_tick_origin[|_isEffect[0]]);
			
			effect_range += (unit_cc_attack_auto_target-effect_range)/(room_speed/10);
			effect_alpha += (1-effect_alpha)/(room_speed/10);
	
			_drawed = true;
		}
		
		effect_angle += (_drawAngle-effect_angle)/(room_speed/15);
		draw_fan(x,y,effect_range-effect_range/32,effect_range,60,90,2,c_white,effect_alpha,true);
		draw_fan(x,y,effect_range-effect_range/32,effect_range,60,210,2,c_white,effect_alpha,true);
		draw_fan(x,y,effect_range-effect_range/32,effect_range,60,330,2,c_white,effect_alpha,true);
		
		draw_fan(x,y,effect_range-effect_range/32,effect_range,effect_angle,90,2,_color,effect_alpha,false);
		draw_fan(x,y,effect_range-effect_range/32,effect_range,effect_angle,210,2,_color,effect_alpha,false);
		draw_fan(x,y,effect_range-effect_range/32,effect_range,effect_angle,330,2,_color,effect_alpha,false);
		
		if(ds_list_size(unit_skill_record) > 0)
		{
			var _list = unit_skill_record[|ds_list_size(unit_skill_record)-1];
			var _alpha = 0;
			if(unit_skill_stand <= room_speed*3)
			{
				_alpha = 0.85*((room_speed*3-unit_skill_stand)/(room_speed*3));
			}
			else
			{
				_isEffect = unit_player_effect_search(id,EFFECT.ACTIVE_timerewind,0,0,[BUFF.SEARCH_TICK,BUFF.SEARCH_MOREorSAME]);
				if(is_array(_isEffect))
				{
					_alpha = (unit_effect_tick[|_isEffect[0]]/unit_effect_tick_origin[|_isEffect[0]])*0.85;
				}
			}
			
			draw_set_font(WalkwayObliqueBold_Regular_16);
			draw_set_halign(fa_center);
			draw_set_valign(fa_top);
			if(player_position = 1)
			{
				draw_sprite_ext(S_Player_First,unit_airframe_index+1,_list[0],_list[1],0.75,0.75,-_list[4],c_white,_alpha);
			}
			if(player_position = 2)
			{
				draw_sprite_ext(S_Player_Second,unit_airframe_index+1,_list[0],_list[1],0.75,0.75,-_list[4],c_white,_alpha);
			}
			draw_set_alpha(_alpha);
			draw_set_color(_color);
			draw_text(_list[0],_list[1]+24,string(round(_list[5])));
			draw_set_font(WalkwayObliqueBold_Regular_12);
			draw_set_valign(fa_bottom);
			if(_list[6] > 0)
			{
				draw_text(_list[0],_list[1]-24,string(round(_list[6])));
			}
			else
			{
				draw_text(_list[0],_list[1]-24,string_format(_list[7]/room_speed,0,1)+" sec");
			}
		}
		break;
}
	
if(_drawed = false)
{
	effect_range += (-effect_range)/(room_speed/10);
	effect_alpha += (-effect_alpha)/(room_speed/10);
	effect_angle += (-effect_angle)/(room_speed/10);
}

draw_set_alpha(1);
draw_set_color(c_white);
draw_self();

if(alarm[0] = -1)
{
	draw_set_color(c_white);
	draw_set_alpha(1);
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	draw_set_font(NanumSquare_Regular_16);
	unit_player_effect();
	unit_player_damage();
}