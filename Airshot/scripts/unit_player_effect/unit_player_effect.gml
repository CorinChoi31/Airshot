function unit_player_effect() {
	var view_x = camera_get_view_x(view_camera[0]);
	var view_y = camera_get_view_y(view_camera[0]);
	var view_w = camera_get_view_width(view_camera[0]);
	var view_h = camera_get_view_height(view_camera[0]);
	var view_dw = 1080;
	var view_dh = 1080;
	var _scale = view_w/view_dw;

	var _passive_description = "";
	var _passive_timer = 0;

	var _untouchable = false;
	var _draw_stat = 4;

	if(player_position = 1)
	{
		draw_set_halign(fa_left);
		draw_set_valign(fa_bottom);
	}
	if(player_position = 2)
	{
		draw_set_halign(fa_right);
		draw_set_valign(fa_bottom);
		view_x += view_w;	
	}

	unit_effect_health_max = 0;

	unit_effect_speed_max = 0;
	unit_effect_speed_accel = 0

	unit_effect_damage_send_ratio = 0;
	unit_effect_damage_recive_ratio = 0;

	unit_effect_attack_damage = 0;
	unit_effect_attack_speed_cool = 0;
	
	unit_effect_attack_bullet_damage = 0;
	unit_effect_attack_bullet_speed = 0;
	unit_effect_attack_bullet_duration = 0;
	unit_effect_attack_bullet_amount_max = 0;
	unit_effect_attack_bullet_reload_cool = 0;
	
	unit_effect_skill_stand_cool = 0;
	unit_effect_skill_stand_consumption = 0;

	unit_effect_attack_auto_target = 0;

	var _color = c_white;
	var _color_hos = c_white;
	if(player_position = 1)
	{
		_color = c_orange;
		_color_hos = c_aqua;
	}
	else if(player_position = 2)
	{
		_color = c_aqua;
		_color_hos = c_orange;
	}

	for(var _i = ds_list_size(unit_effect_id)-1; _i >= 0; _i--)
	{
	#region Default
		if(unit_effect_id[|_i] = EFFECT.DEFAULT_untouchable)
		{
			if(unit_effect_first[|_i] = true)
			{
				unit_effect_first[|_i] = false;
				draw_text_rectangle_progress(x,y-32,"피해 면역",
					depth-1,4,4,NanumSquare_Regular_12,_color,c_dkgray,unit_effect_tick_origin[|_i],room_speed/2,id,1);
			}
			else
			{
			
			}
		
			_untouchable = true;
		
			unit_effect_tick[|_i] -= 1;
			if(unit_effect_tick[|_i] = -1)
			{
				unit_effect_id[|_i] = -1;
			}
		}
		else if(unit_effect_id[|_i] = EFFECT.DEFAULT_unstoppable)
		{
			if(unit_effect_first[|_i] = true)
			{
				unit_effect_first[|_i] = false;
			
				draw_text_rectangle_progress(x,y-64,"방해효과 면역",
					depth-1,4,4,NanumSquare_Regular_12,_color,c_dkgray,unit_effect_tick_origin[|_i],room_speed/2,id,1);
			}
			else
			{
			
			}
		
			phy_active = true;
		
			unit_effect_tick[|_i] -= 1;
			if(unit_effect_tick[|_i] = -1)
			{
				unit_effect_id[|_i] = -1;
			}
		}
	#endregion
	#region Stat
		else if(unit_effect_id[|_i] = EFFECT.HEALTH_max)
		{
			if(unit_effect_first[|_i] = true)
			{
				unit_effect_first[|_i] = false;
			
				unit_health += unit_effect_amount[|_i];
			}
			else
			{
			
			}
		
			unit_effect_health_max += unit_effect_amount[|_i];
		
			unit_effect_tick[|_i] -= 1;
			if(unit_effect_tick[|_i] = -1)
			{
				unit_effect_id[|_i] = -1;
			}
		}
		else if(unit_effect_id[|_i] = EFFECT.SPEED_max)
		{		
			unit_effect_speed_max += unit_effect_amount[|_i];
			
			unit_effect_tick[|_i] -= 1;
			if(unit_effect_tick[|_i] = -1)
			{
				unit_effect_id[|_i] = -1;
			}
		}
		else if(unit_effect_id[|_i] = EFFECT.SPEED_accel)
		{		
			unit_effect_speed_accel += unit_effect_amount[|_i];
		
			unit_effect_tick[|_i] -= 1;
			if(unit_effect_tick[|_i] = -1)
			{
				unit_effect_id[|_i] = -1;
			}
		}
		else if(unit_effect_id[|_i] = EFFECT.SPEED_max_constant)
		{
			unit_effect_speed_max += unit_speed_max*unit_effect_amount[|_i];
		
			unit_effect_tick[|_i] -= 1;
			if(unit_effect_tick[|_i] = -1)
			{
				unit_effect_id[|_i] = -1;
			}
		}
		else if(unit_effect_id[|_i] = EFFECT.DAMAGE_Send_ratio)
		{		
			unit_effect_damage_send_ratio += unit_effect_amount[|_i];
		
			unit_effect_tick[|_i] -= 1;
			if(unit_effect_tick[|_i] = -1)
			{
				unit_effect_id[|_i] = -1;
			}
		}
		else if(unit_effect_id[|_i] = EFFECT.DAMAGE_Recive_ratio)
		{		
			unit_effect_damage_recive_ratio += unit_effect_amount[|_i];
		
			unit_effect_tick[|_i] -= 1;
			if(unit_effect_tick[|_i] = -1)
			{
				unit_effect_id[|_i] = -1;
			}
		}
		else if(unit_effect_id[|_i] = EFFECT.ATTACK_damage)
		{		
			unit_effect_attack_damage += unit_effect_amount[|_i];
		
			unit_effect_tick[|_i] -= 1;
			if(unit_effect_tick[|_i] = -1)
			{
				unit_effect_id[|_i] = -1;
			}
		}
		else if(unit_effect_id[|_i] = EFFECT.ATTACK_speed)
		{		
			unit_effect_attack_speed_cool += unit_effect_amount[|_i];
		
			unit_effect_tick[|_i] -= 1;
			if(unit_effect_tick[|_i] = -1)
			{
				unit_effect_id[|_i] = -1;
			}
		}
		else if(unit_effect_id[|_i] = EFFECT.ATTACK_Bullet_speed)
		{
			unit_effect_attack_bullet_speed += unit_effect_amount[|_i];
		
			unit_effect_tick[|_i] -= 1;
			if(unit_effect_tick[|_i] = -1)
			{
				unit_effect_id[|_i] = -1;
			}
		}
		else if(unit_effect_id[|_i] = EFFECT.ATTACK_Bullet_duration)
		{		
			unit_effect_attack_bullet_duration += unit_effect_amount[|_i];
		
			unit_effect_tick[|_i] -= 1;
			if(unit_effect_tick[|_i] = -1)
			{
				unit_effect_id[|_i] = -1;
			}
		}
		else if(unit_effect_id[|_i] = EFFECT.ATTACK_Bullet_amountmax)
		{
			if(unit_effect_first[|_i] = true)
			{
				unit_effect_first[|_i] = false;
			
				unit_attack_bullet_amount += unit_effect_amount[|_i];
			}
			else
			{
			
			}
		
			unit_effect_attack_bullet_amount_max += unit_effect_amount[|_i];
		
			unit_effect_tick[|_i] -= 1;
			if(unit_effect_tick[|_i] = -1)
			{
				unit_effect_id[|_i] = -1;
			}
		}
		else if(unit_effect_id[|_i] = EFFECT.ATTACK_Bullet_reload)
		{
			unit_effect_attack_bullet_reload_cool += unit_effect_amount[|_i];
		
			unit_effect_tick[|_i] -= 1;
			if(unit_effect_tick[|_i] = -1)
			{
				if(unit_attack_bullet_reload <= 1)
				{
					unit_effect_id[|_i] = -1;
				}
				else
				{
					unit_effect_tick[|_i] = 0;
				}
			}
		}
		else if(unit_effect_id[|_i] = EFFECT.ATTACK_range)
		{
			unit_effect_attack_auto_target += unit_effect_amount[|_i]*unit_attack_auto_target;
		
			unit_effect_tick[|_i] -= 1;
			if(unit_effect_tick[|_i] = -1)
			{
				unit_effect_id[|_i] = -1;
			}
		}
		else if(unit_effect_id[|_i] = EFFECT.SKILL_cool)
		{		
			unit_effect_skill_stand_cool += unit_skill_stand_cool*unit_effect_amount[|_i];
		
			unit_effect_tick[|_i] -= 1;
			if(unit_effect_tick[|_i] = -1)
			{
				unit_effect_id[|_i] = -1;
			}
		}
	#endregion
	#region Passive
		else if(unit_effect_id[|_i] = EFFECT.PASSIVE_reload)
		{
			unit_effect_attack_bullet_reload_cool += unit_attack_bullet_reload_cool*unit_effect_amount[|_i];
		
			if(unit_effect_tick[|_i] = -1)
			{
				unit_effect_id[|_i] = -1;
			}
		}
		else if(unit_effect_id[|_i] = EFFECT.PASSIVE_revive)
		{
			if(unit_effect_first[|_i] = true)
			{
				unit_effect_tick[|_i] = 1;
				unit_effect_first[|_i] = false;
			}
		
			if(unit_effect_tick[|_i] > 0)
			{
				_passive_description = string_format(unit_effect_tick[|_i]/room_speed,0,1)+"초";
			
				unit_effect_tick[|_i]--;
				if(unit_effect_tick[|_i] <= 0)
				{
					repeat(32)
					{
						var _dist = 64;
						var _dire = random_range(0,360);
						var _pox = phy_position_x+lengthdir_x(_dist,_dire);
						var _poy = phy_position_y+lengthdir_y(_dist,_dire);
						var _dire = point_direction(_pox,_poy,phy_position_x,phy_position_y);
						if(player_position = 1)
						particle_burst(global.portSkill[m_First_Skill_Revive_Ready],
							[_pox,_pox,_poy,_poy,depth-1,1,PART.SQUARE,PART.INVERSE_GAUSSIAN,4],[room_speed/4,room_speed*2],bm_add,-0.05,[1,5,0.1],[_dire,_dire,0],[0,0,0,true],[0,0],[id,0]);
						if(player_position = 2)
						particle_burst(global.portSkill[m_Second_Skill_Revive_Ready],
							[_pox,_pox,_poy,_poy,depth-1,1,PART.SQUARE,PART.INVERSE_GAUSSIAN,4],[room_speed/4,room_speed*2],bm_add,-0.05,[1,5,0.1],[_dire,_dire,0],[0,0,0,true],[0,0],[id,0]);
					}
				}
			}
			else
			{
				_passive_description = "사용 가능";	
			}
		
			if(unit_effect_tick[|_i] = -1)
			{
				unit_effect_id[|_i] = -1;
			}
		}
		else if(unit_effect_id[|_i] = EFFECT.PASSIVE_untouchable)
		{
			if(unit_effect_tick[|_i] = unit_effect_amount[|_i])
			{
				if(unit_effect_first[|_i] = true)
				{
					unit_effect_first[|_i] = false;
				
					unit_player_effect_add(id,EFFECT.DAMAGE_Recive_ratio,-0.25,room_speed*2,id);
					unit_player_effect_add(id,EFFECT.SPEED_max_constant,0.10,room_speed*2,id);
				}
			}
		
			if(unit_effect_tick[|_i] > 0)
			{
				_passive_description = string_format(unit_effect_tick[|_i]/room_speed,0,1)+"초";
			
				unit_effect_tick[|_i]--;
			}
		
			if(unit_effect_tick[|_i] = 0)
			{
				if(unit_effect_first[|_i] = false)
				{
					part_emitter_region(global.partSys,partEmit,phy_position_x-32,phy_position_x+32,phy_position_y-32,phy_position_y+32,ps_shape_ellipse,ps_distr_invgaussian);
					if(player_position = 1)
					{
						part_emitter_burst(global.partSys,partEmit,global.partEffect[m_First_Effect_Movement],16);
					}
					if(player_position = 2)
					{
						part_emitter_burst(global.partSys,partEmit,global.partEffect[m_Second_Effect_Movement],16);
					}
				
					unit_effect_first[|_i] = true;
				}
			}
		
			if(unit_effect_tick[|_i] = -1)
			{
				unit_effect_id[|_i] = -1;
			}
		}
		else if(unit_effect_id[|_i] = EFFECT.PASSIVE_speedmax)
		{
			_passive_description = "이동 속도 +"+string_format((unit_effect_amount[|_i]+unit_effect_amount[|_i+1]+unit_effect_amount[|_i+2])*100,0,0)+"%"
		
			unit_effect_speed_max += unit_speed_max*unit_effect_amount[|_i];
		
			if(unit_effect_tick[|_i] = -1)
			{
				unit_effect_id[|_i] = -1;
			}
		}
		else if(unit_effect_id[|_i] = EFFECT.PASSIVE_speedmax_attack)
		{
			unit_effect_speed_max += unit_speed_max*unit_effect_amount[|_i];
		
			if(unit_effect_tick[|_i] = -1)
			{
				unit_effect_id[|_i] = -1;
			}
		}
		else if(unit_effect_id[|_i] = EFFECT.PASSIVE_speedmax_damage)
		{
			unit_effect_speed_max += unit_speed_max*unit_effect_amount[|_i];
		
			if(unit_effect_tick[|_i] = -1)
			{
				unit_effect_id[|_i] = -1;
			}
		}
		else if(unit_effect_id[|_i] = EFFECT.PASSIVE_Health_max)
		{
			if(unit_effect_first[|_i] = true)
			{
				unit_effect_first[|_i] = false;
			
				unit_health += unit_health_max*unit_effect_amount[|_i];
			}
		
			unit_effect_health_max = unit_health_max*unit_effect_amount[|_i];
		
			if(unit_effect_tick[|_i] = -1)
			{
				unit_effect_id[|_i] = -1;
			}
		}
		else if(unit_effect_id[|_i] = EFFECT.PASSIVE_Attack_damage)
		{
			unit_effect_attack_damage += unit_attack_damage*unit_effect_amount[|_i];
		
			if(unit_effect_tick[|_i] = -1)
			{
				unit_effect_id[|_i] = -1;
			}
		}
		else if(unit_effect_id[|_i] = EFFECT.PASSIVE_skillcool)
		{
			unit_effect_skill_stand_cool += unit_skill_stand_cool*unit_effect_amount[|_i];
		
			if(unit_effect_tick[|_i] = -1)
			{
				unit_effect_id[|_i] = -1;
			}
		}
		else if(unit_effect_id[|_i] = EFFECT.PASSIVE_heavyequip)
		{
			var _value = unit_effect_amount[|_i];
		
			unit_effect_health_max += unit_health_max*_value[0];
			unit_effect_attack_damage += unit_attack_damage*_value[1];
			unit_effect_speed_max -= unit_speed_max*_value[2];
			unit_effect_attack_speed_cool += unit_attack_speed_cool*_value[3];
		
			if(unit_effect_first[|_i] = true)
			{
				unit_effect_first[|_i] = false;
			
				unit_health += unit_health_max*_value[0];
			}
		
			if(unit_effect_tick[|_i] = -1)
			{
				unit_effect_id[|_i] = -1;
			}
		}
		else if(unit_effect_id[|_i] = EFFECT.PASSIVE_Shell_trace)
		{
			if(unit_effect_amount[|_i] >= 4)
			{
				unit_effect_amount[|_i] -= 4;
				unit_effect_amount_origin[|_i] += 10;
				unit_effect_tick[|_i] = room_speed/15;
			}
			else
			{
				_passive_description = string(4-unit_effect_amount[|_i])+"회 남음";
			}
		
			if(unit_effect_tick[|_i] > 0)
			{
				unit_effect_tick[|_i]--;
				if(unit_effect_tick[|_i] <= 0)
				{
					if(unit_effect_amount_origin[|_i] > 0)
					{
						unit_effect_tick[|_i] = room_speed/15;
						unit_effect_amount_origin[|_i] -= 1;
				
						var _lnx = lengthdir_x(4,-phy_rotation+90);
						var _lny = lengthdir_y(4,-phy_rotation+90);
			
						var _rnx = lengthdir_x(random_range(8,24),random_range(0,360));
						var _rny = lengthdir_y(random_range(8,24),random_range(0,360));
			
						var _b = instance_create_depth(phy_position_x+_lnx+_rnx,phy_position_y+_lny+_rny,depth-1,Shell_Tracer);
						with(_b)
						{
							player = other.id;
							player_position = other.player_position;
								
							phy_rotation = other.phy_rotation;
							if(player_position = 1)
							{
								if(global.player_second != noone)
								{
									phy_rotation = 90-point_direction(other.id.phy_position_x+_lnx,other.id.phy_position_y+_lny,global.player_second.phy_position_x,global.player_second.phy_position_y);
								}
							}
							if(player_position = 2)
							{
								if(global.player_first != noone)
								{
									phy_rotation = 90-point_direction(other.id.phy_position_x+_lnx,other.id.phy_position_y+_lny,global.player_first.phy_position_x,global.player_first.phy_position_y);
								}
							}
							
							if(player_position = 1)
							{
								effect_id = [m_First_Shell_Tracer_Trail,m_First_Shell_Tracer_Hit];
							}
							if(player_position = 2)
							{
								effect_id = [m_Second_Shell_Tracer_Trail,m_Second_Shell_Tracer_Hit];
							}
							
							physics_apply_local_impulse(0,0,0,-other.unit_cc_attack_bullet_speed*random_range(16,24));
								
							damage = other.unit_cc_attack_damage*0.10*other.unit_cc_damage_send_ratio;
							duration = room_speed*1;
						}
					}
				}
			}
		
			if(unit_effect_tick[|_i] = -1)
			{
				unit_effect_id[|_i] = -1;
			}
		}
		else if(unit_effect_id[|_i] = EFFECT.PASSIVE_Missile_trace)
		{
			if(unit_effect_amount[|_i] >= 3)
			{
				unit_effect_amount[|_i] -= 3;
				unit_effect_amount_origin[|_i] += 2;
				unit_effect_tick[|_i] = room_speed/5;
			}
			else
			{
				_passive_description = string(3-unit_effect_amount[|_i])+"회 남음";
			}
		
			if(unit_effect_tick[|_i] > 0)
			{
				unit_effect_tick[|_i]--;
				if(unit_effect_tick[|_i] <= 0)
				{
					if(unit_effect_amount_origin[|_i] > 0)
					{
						unit_effect_tick[|_i] = room_speed/5;
						unit_effect_amount_origin[|_i] -= 1;
				
						var _lnx = lengthdir_x(4,-phy_rotation+90);
						var _lny = lengthdir_y(4,-phy_rotation+90);
			
						var _rnx = lengthdir_x(random_range(8,32),random_range(0,360));
						var _rny = lengthdir_y(random_range(8,32),random_range(0,360));
					
						var _b = instance_create_depth(phy_position_x+_lnx+_rnx,phy_position_y+_lny+_rny,depth-1,Missile_Tracer);
						with(_b)
						{
							player = other.id;
							player_position = other.player_position;
								
							phy_rotation = other.phy_rotation;
							
							if(player_position = 1)
							{
								effect_id = [m_First_Missile_Tracer_Trail,m_First_Missile_Tracer_Hit];
							
								target = global.player_second;
								targets = global.player_second;
							}
							if(player_position = 2)
							{
								effect_id = [m_Second_Missile_Tracer_Trail,m_Second_Missile_Tracer_Hit];
							
								target = global.player_first;
								targets = global.player_first;
							}
						
							targeting_random_direction = random_range(0,360);
							targeting_random_distance = random_range(0,32);
						
							speeds = other.unit_cc_attack_bullet_speed*500;
							speed_origin = other.unit_cc_attack_bullet_speed*1500;
						
							damage = other.unit_cc_attack_damage*0.55*other.unit_cc_damage_send_ratio;
							duration = room_speed*6;
						}
					}
				}
			}
		
			if(unit_effect_tick[|_i] = -1)
			{
				unit_effect_id[|_i] = -1;
			}
		}
		else if(unit_effect_id[|_i] = EFFECT.PASSIVE_ignite)
		{
			if(unit_effect_first[|_i] = true)
			{
				unit_effect_amount[|_i] = 0;
				unit_effect_first[|_i] = false;
			}
			else
			{
				draw_set_color(c_orange);
				if(player_position = 1)
				{
					draw_text_transformed(view_x+view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
						"발화제 - "+string_format(unit_effect_amount[|_i],0,1)+"/s ("+string_format(unit_effect_tick[|_i]/room_speed,0,1)+"초 남음)",_scale,_scale,0);
					_draw_stat += 1;
				}
				if(player_position = 2)
				{
					draw_text_transformed(view_x-view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
						"발화제 - "+string_format(unit_effect_amount[|_i],0,1)+"/s ("+string_format(unit_effect_tick[|_i]/room_speed,0,1)+"초 남음)",_scale,_scale,0);
					_draw_stat += 1;
				}
			}
		
			if(unit_effect_tick[|_i]%room_speed = 0)
			{
				unit_player_damage_add(id,0,unit_effect_amount[|_i],unit_effect_sender[|_i]);
				if(unit_effect_amount[|_i] < unit_effect_amount_origin[|_i])
				{
					unit_effect_amount[|_i] += unit_effect_amount_origin[|_i]/(unit_effect_tick_origin[|_i]/room_speed);
				}
			}
		
			unit_effect_tick[|_i] -= 1;
			if(unit_effect_tick[|_i] = -1)
			{
				unit_effect_id[|_i] = -1;
			}
		}
		else if(unit_effect_id[|_i] = EFFECT.PASSIVE_hide)
		{
			if(unit_effect_first[|_i] = true)
			{
				unit_effect_first[|_i] = false;
			
				unit_effect_amount_origin[|_i] = 0;
			}
		
			if(unit_effect_tick[|_i] <= 0)
			{
				var _value = unit_effect_amount[|_i];
			
				_passive_description = string_format(_value[0]*100+_value[1]*(1-unit_health/unit_cc_health_max)*100,0,1)+"% 상승";
			
				unit_effect_amount_origin[|_i] = min(unit_effect_amount_origin[|_i]+1,unit_effect_tick_origin[|_i]);
				unit_player_effect_add(id,EFFECT.SPEED_max_constant,(_value[0]+_value[1]*(1-unit_health/unit_cc_health_max))*(unit_effect_amount_origin[|_i]/(unit_effect_tick_origin[|_i])),0,id);
			}
			else
			{
				unit_effect_amount_origin[|_i] = 0;
			
				unit_effect_tick[|_i] -= 1;
			
				_passive_description = string_format(unit_effect_tick[|_i]/room_speed,0,1)+"초 대기";
			}
		
			/*
			var _in = noone;
			if(instance_exists(Solid))
			{
				_in = collision_circle(x,y,32+16*unit_effect_amount[|_i],Solid,true,false)
				if(_in != noone)
				{
					if(unit_effect_tick[|_i] < room_speed*1.5)
					{
						unit_effect_tick[|_i] += 1;
					}
					else
					{
						if(unit_effect_amount[|_i] < 4)
						{
							unit_effect_amount[|_i] += 1;
							unit_effect_tick[|_i] = 0;
						}
						
						unit_effect_first[|_i] = true;
					}
				}
			}
			*/
		
			//unit_player_effect_add(id,EFFECT.DAMAGE_Recive_ratio,-0.15*unit_effect_amount[|_i],0,id);
			//unit_player_effect_add(id,EFFECT.SPEED_max_constant,0.05*unit_effect_amount[|_i],0,id);
		
			/*
			if(unit_effect_amount[|_i] < 4)
			{
				_passive_description = string(unit_effect_amount[|_i])+">"+string(unit_effect_amount[|_i]+1)+" : "+string_format((room_speed*1.5-unit_effect_tick[|_i])/room_speed,0,1)+"초 남음";
			}
			else
			{
				_passive_description = string(unit_effect_amount[|_i])+"/4 : "+string_format(unit_effect_tick[|_i]/room_speed,0,1)+"초 남음";
			}
		
		
			if(_in = noone)
			{
				if(unit_effect_first[|_i] = true)
				{
					unit_effect_first[|_i] = false;
					unit_effect_tick[|_i] = room_speed*2;
				}
			
				_passive_description = string(unit_effect_amount[|_i])+"/4 : "+string_format(unit_effect_tick[|_i]/room_speed,0,1)+"초 남음";
			
				if(unit_effect_tick[|_i] > 0)
				{
					unit_effect_tick[|_i] -= 1;
					if(unit_effect_tick[|_i] <= 0)
					{
						unit_effect_amount[|_i] = 0;
					}
				}
			}
			*/
		
			if(unit_effect_tick[|_i] = -1)
			{
				unit_effect_id[|_i] = -1;
			}
		
		}
		else if(unit_effect_id[|_i] = EFFECT.PASSIVE_weakness_give)
		{
			_passive_description = string_format(unit_effect_tick[|_i]/room_speed,0,1)+"초";
			
			unit_effect_tick[|_i] -= 1;
			if(unit_effect_tick[|_i] <= 0)
			{
				if(player_position = 1)
				{
					if(global.player_second != noone)
					{
						draw_text_rectangle_progress(x,y,"약점",
							depth-1,8,8,NanumSquare_Regular_12,c_yellow,c_dkgray,room_speed*2.5,room_speed/2,global.player_second,1);
						
						unit_player_effect_add(global.player_second,EFFECT.PASSIVE_weakness,16,room_speed*2.5,id);
					}
				}
				if(player_position = 2)
				{
					if(global.player_first != noone)
					{
						draw_text_rectangle_progress(x,y,"약점",
							depth-1,8,8,NanumSquare_Regular_12,c_yellow,c_dkgray,room_speed*2.5,room_speed/2,global.player_first,1);
					
						unit_player_effect_add(global.player_first,EFFECT.PASSIVE_weakness,16,room_speed*2.5,id);
					}
				}
				unit_effect_tick[|_i] = unit_effect_tick_origin[|_i];
			}
		}
		else if(unit_effect_id[|_i] = EFFECT.PASSIVE_weakness)
		{
			draw_set_color(c_orange);
			if(player_position = 1)
			{
				draw_text_transformed(view_x+view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"약점 - "+string_format(unit_effect_tick[|_i]/room_speed,0,1)+"초 남음",_scale,_scale,0);
				_draw_stat += 1;
			}
			if(player_position = 2)
			{
				draw_text_transformed(view_x-view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"약점 - "+string_format(unit_effect_tick[|_i]/room_speed,0,1)+"초 남음",_scale,_scale,0);
				_draw_stat += 1;
			}
			
			unit_effect_tick[|_i] -= 1;
			if(unit_effect_tick[|_i] = -1)
			{
				unit_effect_id[|_i] = -1;
			}
		}
	#endregion
	#region Active
		else if(unit_effect_id[|_i] = EFFECT.ACTIVE_Heal_instant)
		{
			if(unit_effect_first[|_i] = true)
			{
				unit_health += unit_effect_amount[|_i];
			
				unit_effect_first[|_i] = false;
			}
			else
			{
			
			}
		
			if(unit_effect_amount[|_i]*60 >= 0.1)
			{
				draw_set_color(c_lime);
				if(player_position = 1)
				{
					draw_text_transformed(view_x+view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
						"수리 - "+string_format(unit_effect_amount[|_i]*60,0,1)+"/s",_scale,_scale,0);
					_draw_stat += 1;
				}
				if(player_position = 2)
				{
					draw_text_transformed(view_x-view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
						"수리 - "+string_format(unit_effect_amount[|_i]*60,0,1)+"/s",_scale,_scale,0);
					_draw_stat += 1;
				}
			}
		
			unit_effect_tick[|_i] -= 1;
			if(unit_effect_tick[|_i] = -1)
			{
				unit_effect_id[|_i] = -1;
			}
		}
		else if(unit_effect_id[|_i] = EFFECT.ACTIVE_Heal_regeneration)
		{
			if(unit_effect_first[|_i] = true)
			{
				unit_effect_first[|_i] = false;
			}
			else
			{
				draw_set_color(c_lime);
				if(player_position = 1)
				{
					draw_text_transformed(view_x+view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
						"수리 - "+string_format(unit_effect_amount[|_i],0,1)+"/s ("+string_format(unit_effect_tick[|_i]/room_speed,0,1)+"초 남음)",_scale,_scale,0);
					_draw_stat += 1;
				}
				if(player_position = 2)
				{
					draw_text_transformed(view_x-view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
						"수리 - "+string_format(unit_effect_amount[|_i],0,1)+"/s ("+string_format(unit_effect_tick[|_i]/room_speed,0,1)+"초 남음)",_scale,_scale,0);
					_draw_stat += 1;
				}
			}
		
			unit_health += unit_effect_amount[|_i]/unit_effect_tick_origin[|_i];
		
			unit_effect_tick[|_i] -= 1;
			if(unit_effect_tick[|_i] = -1)
			{
				unit_effect_id[|_i] = -1;
			}
		}
		else if(unit_effect_id[|_i] = EFFECT.ACTIVE_countdown)
		{
			if(unit_effect_first[|_i] = true)
			{
				unit_effect_first[|_i] = false;
			}
			else
			{
			
			}
		
			with(Player)
			{
				if(player_position != other.player_position)
				{
					var _dis = point_distance(phy_position_x,phy_position_y,other.phy_position_x,other.phy_position_y);
					if(_dis < other.unit_cc_attack_auto_target)
					{
						phy_speed_x -= phy_speed_x/4; phy_speed_y -= phy_speed_y/4;
					}
				}
			}
		
			with(Bullet)
			{
				if(player_position != other.player_position)
				{
					var _dis = point_distance(phy_position_x,phy_position_y,other.phy_position_x,other.phy_position_y);
					if(_dis < other.unit_cc_attack_auto_target)
					{
						phy_speed_x -= phy_speed_x/5; phy_speed_y -= phy_speed_y/5;
					}
				}
			}
			with(Shell)
			{
				if(player_position != other.player_position)
				{
					var _dis = point_distance(phy_position_x,phy_position_y,other.phy_position_x,other.phy_position_y);
					if(_dis < other.unit_cc_attack_auto_target)
					{
						phy_speed_x -= phy_speed_x/5; phy_speed_y -= phy_speed_y/5;
					}
				}
			}
			with(Missile)
			{
				if(player_position != other.player_position)
				{
					var _dis = point_distance(phy_position_x,phy_position_y,other.phy_position_x,other.phy_position_y);
					if(_dis < other.unit_cc_attack_auto_target)
					{
						speeds -= speeds/4;
						speed_origin -= speed_origin/4;
					}
				}
			}
		
			draw_set_color(c_lime);
			if(player_position = 1)
			{
				draw_text_transformed(view_x+view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"초읽기 - "+string_format(unit_effect_tick[|_i]/room_speed,0,1)+"초",_scale,_scale,0);
				_draw_stat += 1;
			}
			if(player_position = 2)
			{
				draw_text_transformed(view_x-view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"초읽기 - "+string_format(unit_effect_tick[|_i]/room_speed,0,1)+"초",_scale,_scale,0);
				_draw_stat += 1;
			}
			unit_effect_tick[|_i] -= 1;
			if(unit_effect_tick[|_i] = -1)
			{
				unit_effect_id[|_i] = -1;
			}
		}
		else if(unit_effect_id[|_i] = EFFECT.ACTIVE_bombard)
		{
			if(unit_effect_first[|_i] = true)
			{
				unit_effect_first[|_i] = false;
			}
			else
			{
			
			}
		
			draw_set_color(c_lime);
			if(player_position = 1)
			{
				draw_text_transformed(view_x+view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"미사일 폭격 - "+string_format(unit_effect_amount[|_i],0,0)+"회 남음",_scale,_scale,0);
				_draw_stat += 1;
			}
			if(player_position = 2)
			{
				draw_text_transformed(view_x-view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"미사일 폭격 - "+string_format(unit_effect_amount[|_i],0,0)+"회 남음",_scale,_scale,0);
				_draw_stat += 1;
			}
		
			unit_effect_tick[|_i] -= 1;
			if(unit_effect_tick[|_i] = -1)
			{
				repeat(4)
				{
					var _lnx = lengthdir_x(4,-phy_rotation+90);
					var _lny = lengthdir_y(4,-phy_rotation+90);
			
					var _rnx = lengthdir_x(random_range(32,64),random_range(0,360));
					var _rny = lengthdir_y(random_range(32,64),random_range(0,360));
				
					var _b = instance_create_depth(phy_position_x+_lnx+_rnx,phy_position_y+_lny+_rny,depth-1,Missile_Tracer);
					with(_b)
					{
						player = other.id;
						player_position = other.player_position;
								
						phy_rotation = other.phy_rotation;
							
						if(player_position = 1)
						{
							effect_id = [m_First_Missile_Nano_Trail,m_First_Missile_Nano_Hit];
						
							target = global.player_second;
							targets = global.player_second;
						}
						if(player_position = 2)
						{
							effect_id = [m_Second_Missile_Nano_Trail,m_Second_Missile_Nano_Hit];
						
							target = global.player_first;
							targets = global.player_first;
						}
					
						targeting = room_speed*1+random_range(0,room_speed*0.5);
						targeting_dis = 32*2+random_range(0,32);
						targeting_spin = room_speed/10+random_range(0,room_speed/8);
						//targeting_accel = true;
					
						targeting_random_direction = random_range(0,360);
						targeting_random_distance = random_range(0,48);
						
						speeds = other.unit_cc_attack_bullet_speed*500;
						speed_origin = other.unit_cc_attack_bullet_speed*1000;
						speed_accel = room_speed/5;
						
						damage = other.unit_cc_attack_damage*0.1*other.unit_cc_damage_send_ratio;
						duration = room_speed*3+random_range(0,room_speed);
						range = 128;
					}
				}
			
				unit_effect_tick[|_i] = room_speed/6;
				unit_effect_amount[|_i]--;
				if(unit_effect_amount[|_i] = 0)
				{
					unit_effect_id[|_i] = -1;
				}
			}
		}
		else if(unit_effect_id[|_i] = EFFECT.ACTIVE_lazer)
		{
			if(unit_effect_first[|_i] = true)
			{
				unit_attack_bullet_amount = unit_attack_bullet_amount_max;
			
				unit_skill_stand = room_speed;
				unit_effect_first[|_i] = false;
			}
			else
			{
			
			}
			unit_effect_attack_speed_cool += max(unit_attack_speed_cool/2,room_speed/1.5-unit_attack_speed_cool);
		
			if(unit_effect_tick[|_i] > 0)
			{
				draw_set_color(c_lime);
				if(player_position = 1)
				{
					draw_text_transformed(view_x+view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
						"위상 분열포 준비 - "+string_format(unit_effect_tick[|_i]/room_speed,0,1)+"초",_scale,_scale,0);
					_draw_stat += 1;
				}
				if(player_position = 2)
				{
					draw_text_transformed(view_x-view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
						"위상 분열포 준비 - "+string_format(unit_effect_tick[|_i]/room_speed,0,1)+"초",_scale,_scale,0);
					_draw_stat += 1;
				}
				unit_effect_tick[|_i] -= 1;
			}
			else
			{
				draw_set_color(c_orange);
				if(player_position = 1)
				{
					draw_text_transformed(view_x+view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
						"위상 분열포 장착 중",_scale,_scale,0);
					_draw_stat += 1;
				}
				if(player_position = 2)
				{
					draw_text_transformed(view_x-view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
						"위상 분열포 장착 중",_scale,_scale,0);
					_draw_stat += 1;
				}
			}
		}
		else if(unit_effect_id[|_i] = EFFECT.ACTIVE_lazer_shot)
		{
			if(unit_effect_first[|_i] = true)
			{
				unit_effect_first[|_i] = false;
			}
			else
			{
			
			}
		
			var _r = sqr(unit_effect_amount[|_i]/unit_cc_attack_damage+1);
		
			if(unit_effect_tick[|_i] <= unit_cc_attack_speed_cool)
			{
				repeat(_r)
				{
					var _dist = 128*(unit_effect_tick[|_i]/unit_effect_tick_origin[|_i])*_r+1;
					var _pox = phy_position_x+lengthdir_x(random_range(64,64+_dist),random_range(0,360));
					var _poy = phy_position_y+lengthdir_y(random_range(64,64+_dist),random_range(0,360));
					var _dire = point_direction(_pox,_poy,phy_position_x,phy_position_y);
					if(player_position = 1)
						particle_burst(global.portSkill[m_First_Skill_Lazer_Trail],
							[_pox,_pox,_poy,_poy,depth-1,1,PART.SQUARE,PART.INVERSE_GAUSSIAN,4],[room_speed/4,room_speed/2],bm_add,-0.5,[0,10,-0.25],[_dire,_dire,0],[0,0,0,true],[0,0],[id,room_speed/4]);
					if(player_position = 2)
						particle_burst(global.portSkill[m_Second_Skill_Lazer_Trail],
							[_pox,_pox,_poy,_poy,depth-1,1,PART.SQUARE,PART.INVERSE_GAUSSIAN,4],[room_speed/4,room_speed/2],bm_add,-0.5,[0,10,-0.25],[_dire,_dire,0],[0,0,0,true],[0,0],[id,room_speed/4]);
				}
			}
		
			unit_effect_tick[|_i] -= 1;
			if(unit_effect_tick[|_i] <= -1)
			{
				var _dir = -phy_rotation+90;
				var _tdir = _dir;
				var _tdis = 0;
				var _mul = 1;
			
				if(global.player_first != noone and global.player_second != noone)
				{
					if(player_position = 1)
					{
						_tdir = point_direction(other.id.phy_position_x,other.id.phy_position_y,global.player_second.phy_position_x+global.player_second.phy_speed_x,global.player_second.phy_position_y+global.player_second.phy_speed_y);
						_tdis = point_distance(other.id.phy_position_x,other.id.phy_position_y,global.player_second.phy_position_x,global.player_second.phy_position_y);
					}
					if(player_position = 2)
					{
						_tdir = point_direction(other.id.phy_position_x,other.id.phy_position_y,global.player_first.phy_position_x+global.player_first.phy_speed_x,global.player_first.phy_position_y+global.player_first.phy_speed_y);
						_tdis = point_distance(other.id.phy_position_x,other.id.phy_position_y,global.player_first.phy_position_x,global.player_first.phy_position_y);
					}
				}
									
				if(abs(angle_difference(_tdir,_dir)) < 7.5)
				{
					_dir = _tdir;
				}
			
				var _ds = ds_list_create();
			
				var _lw = x+lengthdir_x(12,_dir+90);
				var _lh = y+lengthdir_y(12,_dir+90);
				var _rw = x+lengthdir_x(12,_dir-90);
				var _rh = y+lengthdir_y(12,_dir-90);
			
			
				var _range = 0;
			
				var _ds_x = _lw; var _ds_y = _lh;
				for(var i = 0; i < room_width; i += 8)
				{
					_ds_x += lengthdir_x(8,_dir);
					_ds_y += lengthdir_y(8,_dir);
				
					_range = random_range(0, _r);
				
					part_emitter_region(global.partSys,partEmit,_ds_x-_range,_ds_x+_range,_ds_y-_range,_ds_y+_range,ps_shape_rectangle,ps_distr_linear);
					if(player_position = 1)
						part_emitter_burst(global.partSys,partEmit,global.partSkill[m_First_Skill_Lazer_Trail],_r);
					if(player_position = 2)
						part_emitter_burst(global.partSys,partEmit,global.partSkill[m_Second_Skill_Lazer_Trail],_r);
				}
				with(Player)
				{
					if(player_position != other.player_position)
					{
						var _c = collision_line(_lw,_lh,_ds_x,_ds_y,id,false,false);
						if(_c != noone)
						{
							ds_list_add(_ds,_c);
						}
					}
				}
			
				var _ds_x = _rw; var _ds_y = _rh;
				for(var i = 0; i < room_width; i += 8)
				{
					_ds_x += lengthdir_x(8,_dir);
					_ds_y += lengthdir_y(8,_dir);
				
					_range = random_range(0, _r);
				
					part_emitter_region(global.partSys,partEmit,_ds_x-_range,_ds_x+_range,_ds_y-_range,_ds_y+_range,ps_shape_rectangle,ps_distr_linear);
					if(player_position = 1)
						part_emitter_burst(global.partSys,partEmit,global.partSkill[m_First_Skill_Lazer_Trail],_r);
					if(player_position = 2)
						part_emitter_burst(global.partSys,partEmit,global.partSkill[m_Second_Skill_Lazer_Trail],_r);
				}
			
				with(Player)
				{
					if(player_position != other.player_position)
					{
						var _c = collision_line(_rw,_rh,_ds_x,_ds_y,id,false,false);
						if(_c != noone)
						{
							ds_list_add(_ds,_c);
						}
					}
				}
			
				for(var i = 0; i < ds_list_size(_ds); i++)
				{
					with(_ds[|i])
					{
						unit_player_damage_add(id,0,other.unit_effect_amount[|_i],other.id);
					
						if(other.passive_skill_index = 2)
						{
							var _coll = ds_list_create();
							collision_circle_list(phy_position_x,phy_position_y,32,Player,true,false,_coll,true);
						
							for(var k = 0; k < ds_list_size(_coll); k++)
							{
								unit_player_damage_add(_coll[|k],0,other.unit_effect_amount[|_i],other.unit_effect_sender[|_i]);
							}
						
							ds_list_destroy(_coll);
						}
						if(other.passive_skill_index = 8)
						{
							var _search = unit_player_effect_search(other.id,EFFECT.PASSIVE_speedmax_attack,0,0,[BUFF.SEARCH_AMOUNT,BUFF.SEARCH_MOREorSAME]);
							if(is_array(_search))
							{
								if(other.id.unit_effect_amount[|_search[0]] < 0.20)
								{
									other.id.unit_effect_amount[|_search[0]] += 0.02;
								}
							}
						}
						if(other.passive_skill_index = 10)
						{
							var _search = unit_player_effect_search(other.id,EFFECT.PASSIVE_Shell_trace,0,0,[BUFF.SEARCH_AMOUNT,BUFF.SEARCH_MOREorSAME]);
							if(is_array(_search))
								other.id.unit_effect_amount[|_search[0]] += 1;
						}
						if(other.passive_skill_index = 11)
						{
							var _search = unit_player_effect_search(other.id,EFFECT.PASSIVE_Missile_trace,0,0,[BUFF.SEARCH_AMOUNT,BUFF.SEARCH_MOREorSAME]);
							if(is_array(_search))
								other.id.unit_effect_amount[|_search[0]] += 1;
						}
						if(other.passive_skill_index = 12)
						{
							var _search = unit_player_effect_search(id,EFFECT.PASSIVE_ignite,0,0,[BUFF.SEARCH_AMOUNT,BUFF.SEARCH_MOREorSAME]);
							if(is_array(_search))
							{
								id.unit_effect_tick[|_search[0]] = room_speed*4;
							}
							else
							{
								unit_player_effect_add(id,EFFECT.PASSIVE_ignite,other.unit_effect_amount[|_i]*0.40,room_speed*4,unit_effect_sender[|i]);
							}
						}
					
						part_emitter_region(global.partSys,partEmit,phy_position_x-16,phy_position_x+16,phy_position_y-16,phy_position_y+16,ps_shape_ellipse,ps_distr_linear);
						if(other.player_position = 1)
							part_emitter_burst(global.partSys,partEmit,global.partSkill[m_First_Skill_Lazer_Hit],32);
						if(other.player_position = 2)
							part_emitter_burst(global.partSys,partEmit,global.partSkill[m_Second_Skill_Lazer_Hit],32);
					}
				}
			
				ds_list_destroy(_ds);
			
				if(player_position = 1)
				particle_burst(global.portSkill[m_First_Skill_Lazer_Trail],
					[x-64*_r,x+64*_r,y-64*_r,y+64*_r,depth-1,25,PART.ECLIPSE,PART.GAUSSIAN,_r*2],[room_speed/2,room_speed],bm_add,-0.25,[0,100,-0.5],[_dir,_dir,0],[0,0,0,true],[0,0],[noone,0]);
				if(player_position = 2)
				particle_burst(global.portSkill[m_Second_Skill_Lazer_Trail],
					[x-64*_r,x+64*_r,y-64*_r,y+64*_r,depth-1,25,PART.ECLIPSE,PART.GAUSSIAN,_r*2],[room_speed/2,room_speed],bm_add,-0.25,[0,100,-0.5],[_dir,_dir,0],[0,0,0,true],[0,0],[noone,0]);
			
				repeat(_r*2)
				{
					var _rd = choose(_dir-90,_dir+90);
					var _pox = phy_position_x+lengthdir_x(random_range(16,48),_dir);
					var _poy = phy_position_y+lengthdir_y(random_range(16,48),_dir);
					if(player_position = 1)
						particle_burst(global.portSkill[m_First_Skill_Lazer_Trail],
							[_pox,_pox,_poy,_poy,depth-1,1,PART.SQUARE,PART.INVERSE_GAUSSIAN,4],[room_speed/4,room_speed],bm_add,-0.05,[0,10,-1],[_rd,_rd,0],[0,0,0,true],[0,0],[noone,1]);
					if(player_position = 2)
						particle_burst(global.portSkill[m_Second_Skill_Lazer_Trail],
							[_pox,_pox,_poy,_poy,depth-1,1,PART.SQUARE,PART.INVERSE_GAUSSIAN,4],[room_speed/4,room_speed],bm_add,-0.05,[0,10,-1],[_rd,_rd,0],[0,0,0,true],[0,0],[noone,1]);
				}
			
				unit_effect_id[|_i] = -1;
			}
		}
		else if(unit_effect_id[|_i] = EFFECT.ACTIVE_reset)
		{
			draw_set_color(c_lime);
			if(player_position = 1)
			{
				draw_text_transformed(view_x+view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"재설정 - "+string_format(unit_effect_tick[|_i]/room_speed,0,1)+"초",_scale,_scale,0);
				_draw_stat += 1;
			}
			if(player_position = 2)
			{
				draw_text_transformed(view_x-view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"재설정 - "+string_format(unit_effect_tick[|_i]/room_speed,0,1)+"초",_scale,_scale,0);
				_draw_stat += 1;
			}
			
			unit_effect_tick[|_i] -= 1;
			if(unit_effect_tick[|_i] = -1)
			{
				with(Bullet)
				{
					if(player_position != other.player_position)
					{
						player_position = other.player_position;
						damage += damage_origin*0.25;
					
						player = other.id;
					}
				}
				with(Bullet)
				{
					if(player_position = other.player_position)
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
						physics_apply_local_impulse(0,0,0,-speed_origin*1.5);
					}
				}
				unit_effect_id[|_i] = -1;
			}
		}
		else if(unit_effect_id[|_i] = EFFECT.ACTIVE_Shell_curtaincall)
		{
			if(unit_effect_first[|_i] = true)
			{
				unit_effect_first[|_i] = false;
			
				unit_attack_bullet_reload = 0;
				unit_attack_bullet_amount = 4;
			}
			else
			{
			
			}
		
			draw_set_color(c_lime);
			if(player_position = 1)
			{
				draw_text_transformed(view_x+view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"대장갑 탄환 - "+string_format(unit_effect_amount[|_i],0,0)+"회 / ("+string_format(unit_effect_tick[|_i]/room_speed,0,1)+"초 남음)",_scale,_scale,0);
				_draw_stat += 1;
			}
			if(player_position = 2)
			{
				draw_text_transformed(view_x-view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"대장갑 탄환 - "+string_format(unit_effect_amount[|_i],0,0)+"회 / ("+string_format(unit_effect_tick[|_i]/room_speed,0,1)+"초 남음)",_scale,_scale,0);
				_draw_stat += 1;
			}
			
			unit_effect_attack_bullet_amount_max += 4-unit_attack_bullet_amount_max;
			unit_effect_speed_max += -unit_speed_max*0.75;
		
			if(unit_effect_amount[|_i] = 0)
			{
				unit_effect_id[|_i] = -1;
			}
		
			unit_effect_tick[|_i] -= 1;
			if(unit_effect_tick[|_i] = -1)
			{
				unit_attack_bullet_amount = 0;
				unit_effect_id[|_i] = -1;
			}
		}
		else if(unit_effect_id[|_i] = EFFECT.ACTIVE_Shell_piercing)
		{
			if(unit_effect_first[|_i] = true)
			{
				unit_effect_first[|_i] = false;
			}
			else
			{
			
			}
		
			draw_set_color(c_lime);
			if(player_position = 1)
			{
				draw_text_transformed(view_x+view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"철갑유탄 - "+string_format(unit_effect_amount[|_i],0,0)+"회 남음",_scale,_scale,0);
				_draw_stat += 1;
			}
			if(player_position = 2)
			{
				draw_text_transformed(view_x-view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"철갑유탄 - "+string_format(unit_effect_amount[|_i],0,0)+"회 남음",_scale,_scale,0);
				_draw_stat += 1;
			}
			
			unit_effect_tick[|_i] -= 1;
			if(unit_effect_tick[|_i] = -1)
			{
				var _lnx = lengthdir_x(4,-phy_rotation+90);
				var _lny = lengthdir_y(4,-phy_rotation+90);
			
				var _rnx = lengthdir_x(random_range(16,64),random_range(0,360));
				var _rny = lengthdir_y(random_range(16,64),random_range(0,360));
			
				var _rot_angle = unit_cc_attack_bullet_speed*100;
			
				var _b = instance_create_depth(phy_position_x+_lnx+_rnx,phy_position_y+_lny+_rny,depth-1,Shell_Piercing);
				with(_b)
				{
					player = other.id;
					player_position = other.player_position;
								
					phy_rotation = other.phy_rotation;
					if(player_position = 1)
					{
						if(global.player_second != noone)
						{
							var _dis = point_distance(other.phy_position_x,other.phy_position_y,global.player_second.phy_position_x,global.player_second.phy_position_y);
							if(_dis > other.unit_cc_attack_auto_target)
							{
								_dis = 0;
							}
							phy_rotation = 90-point_direction(other.id.phy_position_x+_lnx,other.id.phy_position_y+_lny,global.player_second.phy_position_x+global.player_second.phy_speed_x*(_dis/(100*_rot_angle)),global.player_second.phy_position_y+global.player_second.phy_speed_y*(_dis/(100*_rot_angle)));
						}
					}
					if(player_position = 2)
					{
						if(global.player_first != noone)
						{
							var _dis = point_distance(other.phy_position_x,other.phy_position_y,global.player_first.phy_position_x,global.player_first.phy_position_y);
							if(_dis > other.unit_attack_auto_target)
							{
								_dis = 0;
							}
							phy_rotation = 90-point_direction(other.id.phy_position_x+_lnx,other.id.phy_position_y+_lny,global.player_first.phy_position_x+global.player_first.phy_speed_x*(_dis/(100*_rot_angle)),global.player_first.phy_position_y+global.player_first.phy_speed_y*(_dis/(100*_rot_angle)));
						}
					}
							
					if(player_position = 1)
					{
						effect_id = [m_First_Shell_Fire_Trail,m_First_Shell_Fire_Hit];
					}
					if(player_position = 2)
					{
						effect_id = [m_Second_Shell_Fire_Trail,m_Second_Shell_Fire_Hit];
					}
							
					physics_apply_local_impulse(0,0,0,-other.unit_cc_attack_bullet_speed*4);
								
					damage = other.unit_cc_attack_damage*1*other.unit_cc_damage_send_ratio;
					duration = room_speed*6;
				}
			
				unit_effect_tick[|_i] = room_speed/10;
				unit_effect_amount[|_i]--;
				if(unit_effect_amount[|_i] = 0)
				{
					unit_effect_id[|_i] = -1;
				}
			}
		}
		else if(unit_effect_id[|_i] = EFFECT.ACTIVE_rage)
		{
			if(unit_effect_first[|_i] = true)
			{
				unit_attack_bullet_amount = 0;
				unit_effect_first[|_i] = false;
			}
			else
			{
			
			}
		
			unit_effect_speed_max += -unit_speed_max*0.75;
			unit_attack_bullet_reload = unit_cc_attack_bullet_reload_cool;
		
			draw_set_color(c_orange);
			if(player_position = 1)
			{
				draw_text_transformed(view_x+view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"난사 - "+string_format(unit_effect_amount[|_i]/room_speed,0,1)+"초 남음",_scale,_scale,0);
				_draw_stat += 1;
			}
			if(player_position = 2)
			{
				draw_text_transformed(view_x-view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"난사 - "+string_format(unit_effect_amount[|_i]/room_speed,0,1)+"초 남음",_scale,_scale,0);
				_draw_stat += 1;
			}
		
			unit_effect_tick[|_i] -= 1;
			if(unit_effect_tick[|_i] <= -1)
			{
				var _lnx = lengthdir_x(4,-phy_rotation+90);
				var _lny = lengthdir_y(4,-phy_rotation+90);
			
				var _rnx = lengthdir_x(random_range(8,32),random_range(0,360));
				var _rny = lengthdir_y(random_range(8,32),random_range(0,360));
			
				var _dis = 0;
				if(global.player_first != noone and global.player_second != noone)
				{
					_dis = point_distance(global.player_first.phy_position_x,global.player_first.phy_position_y,global.player_second.phy_position_x,global.player_second.phy_position_y);
				}
				for(var i = 0; i < unit_attack_bullet_multiple_shot+unit_attack_bullet_multiple_shot*(passive_skill_index = 6); i++)
				{
					var _b = instance_create_depth(phy_position_x+_lnx+_rnx,phy_position_y+_lny+_rny,depth-1,Bullet);
					with(_b)
					{
						player = other.id;
						player_position = other.player_position;
					
						phy_rotation = other.phy_rotation+random_range(-7.5,7.5);
						phy_rotation += random_range(-other.unit_attack_bullet_multiple_shot_angle/2,other.unit_attack_bullet_multiple_shot_angle/2);
									
						speed_origin = other.unit_cc_attack_bullet_speed*1.5;
						damage_origin = other.unit_cc_attack_damage*other.unit_cc_damage_send_ratio*0.50;
									
						damage = damage_origin;
						duration = other.unit_cc_attack_bullet_duration;
									
						passive_id = other.passive_skill_index;
								
						if(passive_id = 5)
						{
							speed_origin = other.unit_cc_attack_bullet_speed*2;
						}
						if(passive_id = 6)
						{
							damage -= damage_origin*0.25;
							if(i%2 = 0)
							{
								speed_origin = speed_origin*(1-0.25);
							}
						}
									
						player = other.id;
									
						physics_apply_local_impulse(0,0,0,-speed_origin);
					}
				}
			
				unit_effect_tick[|_i] = 1;
				unit_effect_amount[|_i] -= unit_attack_bullet_multiple_shot;
				if(unit_effect_amount[|_i] <= 0)
				{
					unit_effect_id[|_i] = -1;
				}
			}
		}
		else if(unit_effect_id[|_i] = EFFECT.ACTIVE_impulse)
		{
			if(unit_effect_first[|_i] = true)
			{
				unit_effect_first[|_i] = false;
			}
			else
			{
			
			}
		
			repeat(3)
			{
				var _dist = unit_cc_attack_auto_target*2*(unit_effect_tick[|_i]/unit_effect_tick_origin[|_i]);
				var _pox = phy_position_x+lengthdir_x(random_range(64,64+_dist),random_range(0,360));
				var _poy = phy_position_y+lengthdir_y(random_range(64,64+_dist),random_range(0,360));
				var _dire = point_direction(_pox,_poy,phy_position_x,phy_position_y);
				if(player_position = 1)
				particle_burst(global.portSkill[m_First_Skill_Lazer_Trail],
					[_pox,_pox,_poy,_poy,depth-1,1,PART.SQUARE,PART.INVERSE_GAUSSIAN,4],[room_speed/4,room_speed/2],bm_add,-0.25,[0,10,-0.25],[_dire,_dire,0],[0,0,0,true],[0,0],[id,room_speed/4]);
				if(player_position = 2)
				particle_burst(global.portSkill[m_Second_Skill_Lazer_Trail],
					[_pox,_pox,_poy,_poy,depth-1,1,PART.SQUARE,PART.INVERSE_GAUSSIAN,4],[room_speed/4,room_speed/2],bm_add,-0.25,[0,10,-0.25],[_dire,_dire,0],[0,0,0,true],[0,0],[id,room_speed/4]);
			}
		
			with(Bullet)
			{
				if(point_distance(x,y,other.x,other.y) < other.unit_cc_attack_auto_target*1.5)
				{
					phy_speed_x -= phy_speed_x/50;
					phy_speed_y -= phy_speed_y/50;
				
					duration -= duration*0.002;
				}
			}
			with(Shell)
			{
				if(point_distance(x,y,other.x,other.y) < other.unit_cc_attack_auto_target*1.5)
				{
					phy_speed_x -= phy_speed_x/50;
					phy_speed_y -= phy_speed_y/50;
				
					duration -= duration*0.002;
				}
			}
			with(Missile)
			{
				if(point_distance(x,y,other.x,other.y) < other.unit_cc_attack_auto_target*1.5)
				{
					speeds -= speeds/50;
					speed_origin -= speed_origin/50;
				
					duration -= duration*0.002;
				}
			}
		
			with(Player)
			{
				if(point_distance(x,y,other.x,other.y) < other.unit_cc_attack_auto_target)
				{
					if(player_position != other.player_position)
					{
						phy_speed_x -= phy_speed_x/2;
						phy_speed_y -= phy_speed_y/2;
					}
				}
			}
		
			draw_set_color(c_lime);
			if(player_position = 1)
			{
				draw_text_transformed(view_x+view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"충격파 - "+string_format(unit_effect_tick[|_i]/room_speed,0,1)+"초 남음",_scale,_scale,0);
				_draw_stat += 1;
			}
			if(player_position = 2)
			{
				draw_text_transformed(view_x-view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"충격파 - "+string_format(unit_effect_tick[|_i]/room_speed,0,1)+"초 남음",_scale,_scale,0);
				_draw_stat += 1;
			}
		
			unit_effect_tick[|_i] -= 1;
			if(unit_effect_tick[|_i] <= -1)
			{
				/*
				repeat(64)
				{
					var _dist = random_range(unit_cc_attack_auto_target*0.5,unit_cc_attack_auto_target*1.25);
					var _dire = random_range(0,360);
					var _pox = phy_position_x+lengthdir_x(_dist,_dire);
					var _poy = phy_position_y+lengthdir_y(_dist,_dire);
					var _dire = point_direction(_pox,_poy,phy_position_x,phy_position_y);
					if(player_position = 1)
					particle_burst(global.partSkill[m_First_Skill_Lazer_Hit],
						[_pox,_pox,_poy,_poy,depth-1,1,PART.SQUARE,PART.INVERSE_GAUSSIAN,4],[room_speed,room_speed*2],bm_add,-0.05,[1,5,0.1],[_dire,_dire,0],[0,0,0,true],[0,0],[id,room_speed/4]);
					if(player_position = 2)
					particle_burst(global.partSkill[m_Second_Skill_Lazer_Hit],
						[_pox,_pox,_poy,_poy,depth-1,1,PART.SQUARE,PART.INVERSE_GAUSSIAN,4],[room_speed,room_speed*2],bm_add,-0.05,[1,5,0.1],[_dire,_dire,0],[0,0,0,true],[0,0],[id,room_speed/4]);
				}
				*/
			
				with(Bullet)
				{
					if(point_distance(x,y,other.x,other.y) < other.unit_cc_attack_auto_target*1.5)
					{
						duration -= duration*0.75;
					}
						//instance_destroy();
				}
				with(Shell)
				{
					if(point_distance(x,y,other.x,other.y) < other.unit_cc_attack_auto_target*1.5)
					{
						duration -= duration*0.75;
					}
						//instance_destroy();
				}
				with(Missile)
				{
					if(point_distance(x,y,other.x,other.y) < other.unit_cc_attack_auto_target*1.5)
					{
						duration -= duration*0.75;
					}
						//instance_destroy();
				}
		
				with(Player)
				{
					if(point_distance(x,y,other.x,other.y) < other.unit_cc_attack_auto_target)
					{
						if(player_position != other.player_position)
						{
					
							unit_attack_bullet_amount = 0;
							unit_attack_bullet_reload = unit_cc_attack_bullet_reload_cool;
						
							var _eff = unit_player_effect_search(id,EFFECT.ACTIVE_countdown,-4,-4,[BUFF.SEARCH_EXISTS]);
							if(is_array(_eff))
							{
								for(var k = 0; k < array_length_1d(_eff); k++)
								{
									unit_effect_amount[|_eff[k]] = 0;
									unit_effect_id[|_eff[k]] = -1;
								}
							}
							var _eff = unit_player_effect_search(id,EFFECT.ACTIVE_reset,-4,-4,[BUFF.SEARCH_EXISTS]);
							if(is_array(_eff))
							{
								for(var k = 0; k < array_length_1d(_eff); k++)
								{
									unit_effect_amount[|_eff[k]] = 0;
									unit_effect_id[|_eff[k]] = -1;
								}
							}
							var _eff = unit_player_effect_search(id,EFFECT.ACTIVE_bombard,-4,-4,[BUFF.SEARCH_EXISTS]);
							if(is_array(_eff))
							{
								for(var k = 0; k < array_length_1d(_eff); k++)
								{
									unit_effect_amount[|_eff[k]] = 0;
									unit_effect_id[|_eff[k]] = -1;
								}
							}
							var _eff = unit_player_effect_search(id,EFFECT.ACTIVE_lazer_shot,-4,-4,[BUFF.SEARCH_EXISTS]);
							if(is_array(_eff))
							{
								for(var k = 0; k < array_length_1d(_eff); k++)
								{
									unit_effect_amount[|_eff[k]] = 0;
									unit_effect_id[|_eff[k]] = -1;
								
									unit_skill_stand = unit_cc_skill_stand_cool;
								}
							}
							var _eff = unit_player_effect_search(id,EFFECT.ACTIVE_Shell_curtaincall,-4,-4,[BUFF.SEARCH_EXISTS]);
							if(is_array(_eff))
							{
								for(var k = 0; k < array_length_1d(_eff); k++)
								{
									unit_effect_amount[|_eff[k]] = 0;
									unit_effect_id[|_eff[k]] = -1;
								}
							}
							var _eff = unit_player_effect_search(id,EFFECT.ACTIVE_Shell_fire,-4,-4,[BUFF.SEARCH_EXISTS]);
							if(is_array(_eff))
							{
								for(var k = 0; k < array_length_1d(_eff); k++)
								{
									unit_effect_amount[|_eff[k]] = 0;
									unit_effect_id[|_eff[k]] = -1;
								}
							}
							var _eff = unit_player_effect_search(id,EFFECT.ACTIVE_Shell_piercing,-4,-4,[BUFF.SEARCH_EXISTS]);
							if(is_array(_eff))
							{
								for(var k = 0; k < array_length_1d(_eff); k++)
								{
									unit_effect_amount[|_eff[k]] = 0;
									unit_effect_id[|_eff[k]] = -1;
								}
							}
							var _eff = unit_player_effect_search(id,EFFECT.ACTIVE_rage,-4,-4,[BUFF.SEARCH_EXISTS]);
							if(is_array(_eff))
							{
								for(var k = 0; k < array_length_1d(_eff); k++)
								{
									unit_effect_amount[|_eff[k]] = 0;
									unit_effect_id[|_eff[k]] = -1;
								}
							}
							var _eff = unit_player_effect_search(id,EFFECT.ACTIVE_Missile_freeze,-4,-4,[BUFF.SEARCH_EXISTS]);
							if(is_array(_eff))
							{
								for(var k = 0; k < array_length_1d(_eff); k++)
								{
									unit_effect_amount[|_eff[k]] = 0;
									unit_effect_id[|_eff[k]] = -1;
								}
							}
							var _eff = unit_player_effect_search(id,EFFECT.ACTIVE_energy_fire,-4,-4,[BUFF.SEARCH_EXISTS]);
							if(is_array(_eff))
							{
								for(var k = 0; k < array_length_1d(_eff); k++)
								{
									unit_effect_amount[|_eff[k]] = 0;
									unit_effect_id[|_eff[k]] = -1;
								}
							}
						
							unit_player_effect_add(id,EFFECT.SPEED_max_constant,-0.5,room_speed*3,id);
						
							unit_skill_stand = max(unit_skill_stand, room_speed*3);
						
							repeat(16)
							{
								var _dist = random_range(0,unit_cc_attack_auto_target*0.1);
								var _dire = random_range(0,360);
								var _pox = other.phy_position_x+lengthdir_x(_dist,_dire);
								var _poy = other.phy_position_y+lengthdir_y(_dist,_dire);
								var _dire = point_direction(_pox,_poy,other.phy_position_x,other.phy_position_y);
								if(player_position = 2)
								particle_burst(global.portSkill[m_First_Skill_Revive_On],
									[_pox,_pox,_poy,_poy,depth-1,1,PART.SQUARE,PART.INVERSE_GAUSSIAN,4],[room_speed,room_speed*2],bm_add,-0.05,[1,5,0.1],[_dire,_dire,0],[0,0,0,true],[0,0],[id,room_speed/2]);
								if(player_position = 1)
								particle_burst(global.portSkill[m_Second_Skill_Revive_On],
									[_pox,_pox,_poy,_poy,depth-1,1,PART.SQUARE,PART.INVERSE_GAUSSIAN,4],[room_speed,room_speed*2],bm_add,-0.05,[1,5,0.1],[_dire,_dire,0],[0,0,0,true],[0,0],[id,room_speed/2]);
							}
						}
					}
				}
				unit_effect_id[|_i] = -1;
			}
		}
		else if(unit_effect_id[|_i] = EFFECT.ACTIVE_Missile_freeze)
		{
			if(unit_effect_first[|_i] = true)
			{
				unit_effect_first[|_i] = false;
			}
			else
			{
			
			}
		
			unit_effect_tick[|_i] -= 1;
			if(unit_effect_tick[|_i] = -1)
			{
				var _dir = -90;
				repeat(3)
				{		
					var _b = instance_create_depth(phy_position_x,phy_position_y,depth-1,Missile_Freezing_Tracer);
					with(_b)
					{
						player = other.id;
						player_position = other.player_position;
								
						phy_rotation = other.phy_rotation-180+_dir;
							
						if(player_position = 1)
						{
							effect_id = [m_First_Missile_Tracer_Trail,m_First_Missile_Tracer_Hit];
						
							target = global.player_second;
							targets = global.player_second;
						}
						if(player_position = 2)
						{
							effect_id = [m_Second_Missile_Tracer_Trail,m_Second_Missile_Tracer_Hit];
						
							target = global.player_first;
							targets = global.player_first;
						}
					
						targeting_random_direction = random_range(0,360);
						targeting_random_distance = random_range(0,32);
					
						speeds = other.unit_cc_attack_bullet_speed*750;
						speed_origin = other.unit_cc_attack_bullet_speed*1500;
						speed_accel = room_speed/2;
						
						damage = other.unit_cc_attack_damage*0.75*other.unit_cc_damage_send_ratio;
						duration = room_speed*5;
					}
					_dir += 90;
				}
				unit_effect_id[|_i] = -1;
			}
		}
		else if(unit_effect_id[|_i] = EFFECT.ACTIVE_dimensionjump)
		{
			/*
			if(unit_effect_first[|_i] = true)
			{
				unit_effect_first[|_i] = false;
			}
			else
			{
			
			}
			*/
		
			phy_speed_x += -phy_speed_x/2;
			phy_speed_y += -phy_speed_y/2;
		
			unit_skill_stand = max(unit_effect_tick[|_i], unit_cc_skill_stand_cool);
		
			unit_effect_tick[|_i] -= 1;
			if(unit_effect_tick[|_i] = -1)
			{
				if(unit_effect_first[|_i])
				{
					var _move = true;
			
					var _dis = 0;
			
					var prevX = phy_position_x;
					var prevY = phy_position_y;
			
					var _x = 0;
					var _y = 0;
					while(_move)
					{
						var _ins = collision_circle(phy_position_x+_x+lengthdir_x(96,-phy_rotation+90),phy_position_y+_y+lengthdir_y(96,-phy_rotation+90),32,Solid,false,false);
						if(_ins = noone)
						{
							_x = lengthdir_x(_dis,-phy_rotation+90);
							_y = lengthdir_y(_dis,-phy_rotation+90);
					
							_dis += 1;
						}
						else
						{
							_move = false;
					
							phy_position_x = phy_position_x+_x;
							phy_position_y = phy_position_y+_y;
					
							phy_speed_x = 0;
							phy_speed_y = 0;
						}
				
						if(_dis >= 400)
						{
							phy_position_x = phy_position_x+_x;
							phy_position_y = phy_position_y+_y;
					
							break;
						}
					}
				
					var _pdis = point_distance(prevX,prevY,phy_position_x,phy_position_y);
					var _pdir = point_direction(prevX,prevY,phy_position_x,phy_position_y);
			
					if(_pdis <= 64)
					{
						unit_skill_stand = unit_cc_skill_stand_cool*0.8-unit_effect_tick_origin[|_i];
					
						unit_effect_amount[|_i] = [phy_position_x,phy_position_y];
						unit_effect_id[|_i] = -1;
					}
					else
					{
						unit_skill_stand = unit_cc_skill_stand_cool-unit_effect_tick_origin[|_i];
					
						_x = 0;
						_y = 0;
				
						for(var i = 0; i <= round(_pdis/4)*4; i += 4)
						{
							_x = prevX+lengthdir_x(i,_pdir);
							_y = prevY+lengthdir_y(i,_pdir);
							part_emitter_region(global.partSys,partEmit,_x-8,_x+8,_y-8,_y+8,ps_shape_ellipse,ps_distr_linear);
							if(player_position = 1)
								part_emitter_burst(global.partSys,partEmit,global.partPlayer[m_First_Player_Movement],4);
							if(player_position = 2)
								part_emitter_burst(global.partSys,partEmit,global.partPlayer[m_Second_Player_Movement],4);
						}
					
						unit_effect_amount[|_i] = [prevX,prevY];
					
						/*
						var _search_dj = unit_player_effect_search(id,EFFECT.ACTIVE_dimensionjump_debuff,0,0,[BUFF.SEARCH_AMOUNT,BUFF.SEARCH_MOREorSAME]);
						if(is_array(_search_dj))
						{
							unit_player_effect_add(id,EFFECT.DAMAGE_Recive_ratio,0.3,room_speed*8,id);
							unit_player_effect_add(id,EFFECT.DAMAGE_Send_ratio,0.4,room_speed*8,id);
					
							unit_effect_tick[|_search_dj[0]] = unit_effect_tick_origin[|_search_dj[0]];
							unit_skill_stand = max(unit_skill_stand-room_speed*2,room_speed*2);
						}
						else
						{
							unit_player_effect_add(id,EFFECT.ACTIVE_dimensionjump_debuff,0,room_speed*12,id);
						}
						*/
					}
				
					unit_effect_first[|_i] = false;
					unit_effect_tick[|_i] = 0;
				}
				else
				{
					unit_effect_id[|_i] = -1;
				}
			}
		}
		else if(unit_effect_id[|_i] = EFFECT.ACTIVE_dimensionjump_debuff)
		{
			/*
			draw_set_color(c_orange);
			if(player_position = 1)
			{
				draw_text_transformed(view_x+view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"차원 도약 - "+string_format(unit_effect_tick[|_i]/room_speed,0,1)+"초 남음",_scale,_scale,0);
				_draw_stat += 1;
			}
			if(player_position = 2)
			{
				draw_text_transformed(view_x-view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"차원 도약 - "+string_format(unit_effect_tick[|_i]/room_speed,0,1)+"초 남음",_scale,_scale,0);
				_draw_stat += 1;
			}
		
			unit_effect_tick[|_i] -= 1;
			if(unit_effect_tick[|_i] = -1)
			{
				unit_effect_id[|_i] = -1;
			}
			*/
		}
		else if(unit_effect_id[|_i] = EFFECT.ACTIVE_fixbydamage)
		{
			draw_set_color(c_lime);
			if(player_position = 1)
			{
				draw_text_transformed(view_x+view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"재생 - "+string_format(unit_effect_tick[|_i]/room_speed,0,1)+"초 남음",_scale,_scale,0);
				_draw_stat += 1;
			}
			if(player_position = 2)
			{
				draw_text_transformed(view_x-view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"재생 - "+string_format(unit_effect_tick[|_i]/room_speed,0,1)+"초 남음",_scale,_scale,0);
				_draw_stat += 1;
			}
		
			unit_effect_tick[|_i] -= 1;
			if(unit_effect_tick[|_i] = -1)
			{
				unit_effect_id[|_i] = -1;
			}
		}
		else if(unit_effect_id[|_i] = EFFECT.ACTIVE_timerewind)
		{
			if(unit_effect_first[|_i] = true)
			{
				unit_attack_bullet_amount = 0;
			
				phy_speed_x = 0;
				phy_speed_y = 0;
			
				unit_effect_speed_max = -unit_speed_max;
				unit_effect_speed_accel = -unit_speed_accel;
			
				unit_effect_first[|_i] = false;
				unit_player_effect_add(id,EFFECT.DEFAULT_untouchable,0,room_speed*0.8,id);
			}
			else
			{
				if(ds_list_size(unit_skill_record) > 1)
				{
					phy_speed_x = 0;
					phy_speed_y = 0;
			
					unit_effect_speed_max = -unit_speed_max;
					unit_effect_speed_accel = -unit_speed_accel;
			
					var _index = ds_list_size(unit_skill_record)-1;
					var _list = unit_skill_record[|_index];
			
					phy_position_x += (_list[0]-phy_position_x)/(room_speed/6);
					phy_position_y += (_list[1]-phy_position_y)/(room_speed/6);
					phy_speed_x += (_list[2]-phy_speed_x)/(room_speed/6);
					phy_speed_y += (_list[3]-phy_speed_y)/(room_speed/6);
					phy_rotation += angle_difference(_list[4],phy_rotation)/(room_speed/6);
					unit_health += (_list[5]-unit_health)/(room_speed/6);
			
					repeat(4)
					{
						var _dist = 145;
						var _dire = random_range(0,360);
						var _pox = phy_position_x+lengthdir_x(_dist,_dire);
						var _poy = phy_position_y+lengthdir_y(_dist,_dire);
						var _dire = point_direction(_pox,_poy,phy_position_x,phy_position_y);
						if(player_position = 1)
						particle_burst(global.portSkill[m_First_Skill_Revive_On],
							[_pox,_pox,_poy,_poy,depth-1,1,PART.SQUARE,PART.INVERSE_GAUSSIAN,4],[room_speed/4,room_speed*2],bm_add,-0.15,[0,2,0.1],[_dire,_dire,0],[0,0,0,false],[0,0],[id,room_speed*0.8]);
						if(player_position = 2)
						particle_burst(global.portSkill[m_Second_Skill_Revive_On],
							[_pox,_pox,_poy,_poy,depth-1,1,PART.SQUARE,PART.INVERSE_GAUSSIAN,4],[room_speed/4,room_speed*2],bm_add,-0.15,[0,2,0.1],[_dire,_dire,0],[0,0,0,false],[0,0],[id,room_speed*0.8]);
					}
				}
			}
		
		
			unit_effect_tick[|_i] -= 1;
			if(unit_effect_tick[|_i] = -1)
			{
				if(ds_list_size(unit_skill_record) > 1)
				{
					var _list = unit_skill_record[|ds_list_size(unit_skill_record)-1];
			
					phy_position_x = _list[0];
					phy_position_y = _list[1];
					phy_speed_x = _list[2];
					phy_speed_y = _list[3];
					phy_rotation = _list[4];
					unit_health = _list[5];
					unit_attack_bullet_amount = _list[6];
					unit_attack_bullet_reload = _list[7];
			
					if(unit_health_prev < unit_health)
					{
						unit_health_prev = _list[5];
					}
				}
			
				ds_list_clear(unit_skill_record);
			
				unit_effect_id[|_i] = -1;
			}
		}
		else if(unit_effect_id[|_i] = EFFECT.ACTIVE_timerewind_record)
		{
			var _search_tr = unit_player_effect_search(id,EFFECT.ACTIVE_timerewind,0,0,[BUFF.SEARCH_AMOUNT,BUFF.SEARCH_MOREorSAME]);
			if(!is_array(_search_tr))
			{
				ds_list_insert(unit_skill_record,0,
					[phy_position_x,phy_position_y,phy_speed_x,phy_speed_y,phy_rotation,unit_health,unit_attack_bullet_amount,unit_attack_bullet_reload]);
		
				if(ds_list_size(unit_skill_record) >= room_speed*3)
				{
					ds_list_delete(unit_skill_record,room_speed*3);
				}
			}
		}
		else if(unit_effect_id[|_i] = EFFECT.ACTIVE_energy_fire)
		{
			if(unit_effect_first[|_i] = true)
			{
				unit_effect_first[|_i] = false;
			}
			else
			{
			
			}
		
			draw_set_color(c_lime);
			if(player_position = 1)
			{
				draw_text_transformed(view_x+view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"역장 발생기 - "+string_format(unit_effect_tick[|_i]/room_speed,0,1)+"초 남음",_scale,_scale,0);
				_draw_stat += 1;
			}
			if(player_position = 2)
			{
				draw_text_transformed(view_x-view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"역장 발생기 - "+string_format(unit_effect_tick[|_i]/room_speed,0,1)+"초 남음",_scale,_scale,0);
				_draw_stat += 1;
			}
			
			unit_effect_tick[|_i] -= 1;
			if(unit_effect_tick[|_i] = -1)
			{
				var _lnx = lengthdir_x(4,-phy_rotation+90);
				var _lny = lengthdir_y(4,-phy_rotation+90);
			
				var _rot_angle = unit_cc_attack_bullet_speed*100;
			
				var _b = instance_create_depth(phy_position_x+_lnx,phy_position_y+_lny,depth-1,Shell_Energy);
				with(_b)
				{
					player = other.id;
					player_position = other.player_position;
								
					phy_rotation = other.phy_rotation;
					/*
					if(player_position = 1)
					{
						if(global.player_second != noone)
						{
							var _dis = point_distance(other.phy_position_x,other.phy_position_y,global.player_second.phy_position_x,global.player_second.phy_position_y);
							if(_dis > other.unit_cc_attack_auto_target)
							{
								_dis = 0;
							}
							phy_rotation = 90-point_direction(other.id.phy_position_x+_lnx,other.id.phy_position_y+_lny,global.player_second.phy_position_x+global.player_second.phy_speed_x*(_dis/(100*_rot_angle)),global.player_second.phy_position_y+global.player_second.phy_speed_y*(_dis/(100*_rot_angle)));
						}
					}
					if(player_position = 2)
					{
						if(global.player_first != noone)
						{
							var _dis = point_distance(other.phy_position_x,other.phy_position_y,global.player_first.phy_position_x,global.player_first.phy_position_y);
							if(_dis > other.unit_attack_auto_target)
							{
								_dis = 0;
							}
							phy_rotation = 90-point_direction(other.id.phy_position_x+_lnx,other.id.phy_position_y+_lny,global.player_first.phy_position_x+global.player_first.phy_speed_x*(_dis/(100*_rot_angle)),global.player_first.phy_position_y+global.player_first.phy_speed_y*(_dis/(100*_rot_angle)));
						}
					}
					*/
				
					if(player_position = 1)
					{
						effect_id = [m_First_Shell_Energy_Trail,m_First_Shell_Energy_Hit];
					}
					if(player_position = 2)
					{
						effect_id = [m_Second_Shell_Energy_Trail,m_Second_Shell_Energy_Hit];
					}
				
					var _enemy = noone;
					if(player_position = 1)
					{
						if(global.player_second != noone)
						{
							_enemy = global.player_second;
						}
					}
					if(player_position = 2)
					{
						if(global.player_first != noone)
						{
							_enemy = global.player_first;	
						}
					}
				
					speed_origin = other.unit_cc_attack_bullet_speed*8;
				
					physics_apply_local_impulse(0,0,0,-other.unit_cc_attack_bullet_speed*8);
								
					damage = other.unit_cc_attack_damage*1*other.unit_cc_damage_send_ratio;
					duration = room_speed*6;
				
					width = 64;
				}
				unit_effect_id[|_i] = -1;
			}
		}
	#endregion
		else if(unit_effect_id[|_i] = EFFECT.HIDDEN_Heartstone)
		{
			if(unit_effect_first[|_i] = true)
			{
				unit_effect_first[|_i] = false;
			
				var _dir = -180;
				repeat(8)
				{		
					var _b = instance_create_depth(phy_position_x,phy_position_y,depth-1,Missile_Freezing_Tracer);
					with(_b)
					{
						player = other.id;
						player_position = other.player_position;
								
						phy_rotation = other.phy_rotation-180+_dir;
							
						if(player_position = 1)
						{
							effect_id = [m_First_Missile_Tracer_Trail,m_First_Missile_Tracer_Hit];
						
							target = global.player_second;
							targets = global.player_second;
						}
						if(player_position = 2)
						{
							effect_id = [m_Second_Missile_Tracer_Trail,m_Second_Missile_Tracer_Hit];
						
							target = global.player_first;
							targets = global.player_first;
						}
						
						speeds = other.unit_cc_attack_bullet_speed*750;
						speed_origin = other.unit_cc_attack_bullet_speed*1500;
						speed_accel = room_speed/2;
						
						damage = other.unit_cc_attack_damage*0.1*other.unit_cc_damage_send_ratio;
						duration = room_speed*1.5;
					}
					_dir += 45;
				}
			}
			else
			{
			
			}
		
			unit_effect_tick[|_i] -= 1;
			if(unit_effect_tick[|_i] = -1)
			{
				unit_effect_id[|_i] = -1;
			
				if(player_position = 1)
				{
					sprite_index = S_Player_First;	
				}
				if(player_position = 2)
				{
					sprite_index = S_Player_Second;	
				}
				image_index = unit_airframe_index+1;
				image_speed = 0;
			}
		}
		else
		{
			unit_player_effect_delete(_i);
		}
	}

#region Stat Effect
	if(unit_effect_speed_max > 0)
	{
		part_emitter_region(global.partSys,partEmit,phy_position_x-16,phy_position_x+16,phy_position_y-16,phy_position_y+16,ps_shape_ellipse,ps_distr_invgaussian);
		if(player_position = 1)
		{
			part_emitter_burst(global.partSys,partEmit,global.partEffect[m_First_Effect_Movement],4);
		}
		if(player_position = 2)
		{
			part_emitter_burst(global.partSys,partEmit,global.partEffect[m_Second_Effect_Movement],4);
		}
	}
#endregion

#region Text
	if(_untouchable = true)
	{
		ds_list_clear(unit_damage_id);
		ds_list_clear(unit_damage_amount);
	
		draw_set_color(c_lime);
		if(player_position = 1)
		{
			draw_text_transformed(view_x+view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
				"피해 면역",_scale,_scale,0);
			_draw_stat += 1;
		}
		if(player_position = 2)
		{
			draw_text_transformed(view_x-view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
				"피해 면역",_scale,_scale,0);
			_draw_stat += 1;
		}
	}

	var _ratio = 1; var _value = 0;
	if(unit_effect_health_max != 0)
	{
		_ratio = abs(unit_effect_health_max)/unit_health_max;
	
		if(unit_effect_health_max < 0)
		{
			draw_set_color(c_orange);
			if(player_position = 1)
			{
				draw_text_transformed(view_x+view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"내구도 -"+string(round(_ratio*100))+"%",_scale,_scale,0);
				_draw_stat += 1;
			}
			if(player_position = 2)
			{
				draw_text_transformed(view_x-view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"내구도 -"+string(round(_ratio*100))+"%",_scale,_scale,0);
				_draw_stat += 1;
			}
		}
		if(unit_effect_health_max > 0)
		{
			draw_set_color(c_lime);
			if(player_position = 1)
			{
				draw_text_transformed(view_x+view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"내구도 +"+string(round(_ratio*100))+"%",_scale,_scale,0);
				_draw_stat += 1;
			}
			if(player_position = 2)
			{
				draw_text_transformed(view_x-view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"내구도 +"+string(round(_ratio*100))+"%",_scale,_scale,0);
				_draw_stat += 1;
			}
		}
	
	}
	if(unit_effect_speed_max != 0)
	{
		_ratio = abs(unit_effect_speed_max)/unit_speed_max;
	
		if(unit_effect_speed_max < 0)
		{
			draw_set_color(c_orange);
			if(player_position = 1)
			{
				draw_text_transformed(view_x+view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"이동 속도 -"+string(round(_ratio*100))+"%",_scale,_scale,0);
				_draw_stat += 1;
			}
			if(player_position = 2)
			{
				draw_text_transformed(view_x-view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"이동 속도 -"+string(round(_ratio*100))+"%",_scale,_scale,0);
				_draw_stat += 1;
			}
		}
		if(unit_effect_speed_max > 0)
		{
			draw_set_color(c_lime);
			if(player_position = 1)
			{
				draw_text_transformed(view_x+view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"이동 속도 +"+string(round(_ratio*100))+"%",_scale,_scale,0);
				_draw_stat += 1;
			}
			if(player_position = 2)
			{
				draw_text_transformed(view_x-view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"이동 속도 +"+string(round(_ratio*100))+"%",_scale,_scale,0);
				_draw_stat += 1;
			}
		}
	}
	if(unit_effect_speed_accel != 0)
	{
		_ratio = abs(unit_effect_speed_accel)/unit_speed_accel;
	
		if(unit_effect_speed_accel < 0)
		{
			draw_set_color(c_orange);
			if(player_position = 1)
			{
				draw_text_transformed(view_x+view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"가속도 -"+string(round(_ratio*100))+"%",_scale,_scale,0);
				_draw_stat += 1;
			}
			if(player_position = 2)
			{
				draw_text_transformed(view_x-view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"가속도 -"+string(round(_ratio*100))+"%",_scale,_scale,0);
				_draw_stat += 1;
			}
		}
		if(unit_effect_speed_accel > 0)
		{
			draw_set_color(c_lime);
			if(player_position = 1)
			{
				draw_text_transformed(view_x+view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"가속도 +"+string(round(_ratio*100))+"%",_scale,_scale,0);
				_draw_stat += 1;
			}
			if(player_position = 2)
			{
				draw_text_transformed(view_x-view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"가속도 +"+string(round(_ratio*100))+"%",_scale,_scale,0);
				_draw_stat += 1;
			}
		}
	}
	if(unit_effect_damage_send_ratio != 0)
	{
		_ratio = abs(unit_effect_damage_send_ratio)/unit_damage_send_ratio;
	
		if(unit_effect_damage_send_ratio < 0)
		{
			draw_set_color(c_orange);
			if(player_position = 1)
			{
				draw_text_transformed(view_x+view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"주는 피해량 -"+string(round(_ratio*100))+"%",_scale,_scale,0);
				_draw_stat += 1;
			}
			if(player_position = 2)
			{
				draw_text_transformed(view_x-view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"주는 피해량 -"+string(round(_ratio*100))+"%",_scale,_scale,0);
				_draw_stat += 1;
			}
		}
		if(unit_effect_damage_send_ratio > 0)
		{
			draw_set_color(c_lime);
			if(player_position = 1)
			{
				draw_text_transformed(view_x+view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"주는 피해량 +"+string(round(_ratio*100))+"%",_scale,_scale,0);
				_draw_stat += 1;
			}
			if(player_position = 2)
			{
				draw_text_transformed(view_x-view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"주는 피해량 +"+string(round(_ratio*100))+"%",_scale,_scale,0);
				_draw_stat += 1;
			}
		}
	}
	if(unit_effect_damage_recive_ratio != 0)
	{
		_ratio = abs(unit_effect_damage_recive_ratio)/unit_damage_recive_ratio;
	
		if(unit_effect_damage_recive_ratio > 0)
		{
			draw_set_color(c_orange);
			if(player_position = 1)
			{
				draw_text_transformed(view_x+view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"받는 피해량 +"+string(round(_ratio*100))+"%",_scale,_scale,0);
				_draw_stat += 1;
			}
			if(player_position = 2)
			{
				draw_text_transformed(view_x-view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"받는 피해량 +"+string(round(_ratio*100))+"%",_scale,_scale,0);
				_draw_stat += 1;
			}
		}
		if(unit_effect_damage_recive_ratio < 0)
		{
			draw_set_color(c_lime);
			if(player_position = 1)
			{
				draw_text_transformed(view_x+view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"받는 피해량 -"+string(round(_ratio*100))+"%",_scale,_scale,0);
				_draw_stat += 1;
			}
			if(player_position = 2)
			{
				draw_text_transformed(view_x-view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"받는 피해량 -"+string(round(_ratio*100))+"%",_scale,_scale,0);
				_draw_stat += 1;
			}
		}
	}
	if(unit_effect_attack_damage != 0)
	{
		_ratio = abs(unit_effect_attack_damage)/unit_attack_damage;
	
		if(unit_effect_attack_damage < 0)
		{
			draw_set_color(c_orange);
			if(player_position = 1)
			{
				draw_text_transformed(view_x+view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"공격력 -"+string(round(_ratio*100))+"%",_scale,_scale,0);
				_draw_stat += 1;
			}
			if(player_position = 2)
			{
				draw_text_transformed(view_x-view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"공격력 -"+string(round(_ratio*100))+"%",_scale,_scale,0);
				_draw_stat += 1;
			}
		}
		if(unit_effect_attack_damage > 0)
		{
			draw_set_color(c_lime);
			if(player_position = 1)
			{
				draw_text_transformed(view_x+view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"공격력 +"+string(round(_ratio*100))+"%",_scale,_scale,0);
				_draw_stat += 1;
			}
			if(player_position = 2)
			{
				draw_text_transformed(view_x-view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"공격력 +"+string(round(_ratio*100))+"%",_scale,_scale,0);
				_draw_stat += 1;
			}
		}
	}
	if(unit_effect_attack_speed_cool != 0)
	{
		_ratio = abs(unit_effect_attack_speed_cool)/unit_attack_speed_cool;
	
		if(unit_effect_attack_speed_cool > 0)
		{
			draw_set_color(c_orange);
			if(player_position = 1)
			{
				draw_text_transformed(view_x+view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"공격 속도 -"+string(round(_ratio*100))+"%",_scale,_scale,0);
				_draw_stat += 1;
			}
			if(player_position = 2)
			{
				draw_text_transformed(view_x-view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"공격 속도 -"+string(round(_ratio*100))+"%",_scale,_scale,0);
				_draw_stat += 1;
			}
		}
		if(unit_effect_attack_speed_cool < 0)
		{
			draw_set_color(c_lime);
			if(player_position = 1)
			{
				draw_text_transformed(view_x+view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"공격 속도 +"+string(round(_ratio*100))+"%",_scale,_scale,0);
				_draw_stat += 1;
			}
			if(player_position = 2)
			{
				draw_text_transformed(view_x-view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"공격 속도 +"+string(round(_ratio*100))+"%",_scale,_scale,0);
				_draw_stat += 1;
			}
		}
	}
	if(unit_effect_attack_bullet_speed != 0)
	{
		_ratio = abs(unit_effect_attack_bullet_speed)/unit_attack_bullet_speed;
	
		if(unit_effect_attack_bullet_speed < 0)
		{
			draw_set_color(c_orange);
			if(player_position = 1)
			{
				draw_text_transformed(view_x+view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"탄알 속력 -"+string(round(_ratio*100))+"%",_scale,_scale,0);
				_draw_stat += 1;
			}
			if(player_position = 2)
			{
				draw_text_transformed(view_x-view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"탄알 속력 -"+string(round(_ratio*100))+"%",_scale,_scale,0);
				_draw_stat += 1;
			}
		}
		if(unit_effect_attack_bullet_speed > 0)
		{
			draw_set_color(c_lime);
			if(player_position = 1)
			{
				draw_text_transformed(view_x+view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"탄알 속력 +"+string(round(_ratio*100))+"%",_scale,_scale,0);
				_draw_stat += 1;
			}
			if(player_position = 2)
			{
				draw_text_transformed(view_x-view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"탄알 속력 +"+string(round(_ratio*100))+"%",_scale,_scale,0);
				_draw_stat += 1;
			}
		}
	}
	if(unit_effect_attack_bullet_duration != 0)
	{
		_ratio = abs(unit_effect_attack_bullet_speed)/unit_attack_bullet_speed;
	
		if(unit_effect_attack_bullet_speed < 0)
		{
			draw_set_color(c_orange);
			if(player_position = 1)
			{
				draw_text_transformed(view_x+view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"탄알 지속시간 -"+string(round(_ratio*100))+"%",_scale,_scale,0);
				_draw_stat += 1;
			}
			if(player_position = 2)
			{
				draw_text_transformed(view_x-view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"탄알 지속시간 -"+string(round(_ratio*100))+"%",_scale,_scale,0);
				_draw_stat += 1;
			}
		}
		if(unit_effect_attack_bullet_speed > 0)
		{
			draw_set_color(c_lime);
			if(player_position = 1)
			{
				draw_text_transformed(view_x+view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"탄알 지속시간 +"+string(round(_ratio*100))+"%",_scale,_scale,0);
				_draw_stat += 1;
			}
			if(player_position = 2)
			{
				draw_text_transformed(view_x-view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"탄알 지속시간 +"+string(round(_ratio*100))+"%",_scale,_scale,0);
				_draw_stat += 1;
			}
		}
	}
	if(unit_effect_attack_bullet_amount_max != 0)
	{
		_ratio = abs(unit_effect_attack_bullet_amount_max)/unit_attack_bullet_amount_max;
	
		if(unit_effect_attack_bullet_amount_max < 0)
		{
			draw_set_color(c_orange);
			if(player_position = 1)
			{
				draw_text_transformed(view_x+view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"탄창 -"+string(round(_ratio*100))+"%",_scale,_scale,0);
				_draw_stat += 1;
			}
			if(player_position = 2)
			{
				draw_text_transformed(view_x-view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"탄창 -"+string(round(_ratio*100))+"%",_scale,_scale,0);
				_draw_stat += 1;
			}
		}
		if(unit_effect_attack_bullet_amount_max > 0)
		{
			draw_set_color(c_lime);
			if(player_position = 1)
			{
				draw_text_transformed(view_x+view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"탄창 +"+string(round(_ratio*100))+"%",_scale,_scale,0);
				_draw_stat += 1;
			}
			if(player_position = 2)
			{
				draw_text_transformed(view_x-view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"탄창 +"+string(round(_ratio*100))+"%",_scale,_scale,0);
				_draw_stat += 1;
			}
		}
	}
	if(unit_effect_attack_bullet_reload_cool != 0)
	{
		_ratio = abs(unit_effect_attack_bullet_reload_cool)/unit_attack_bullet_reload_cool;
	
		if(unit_effect_attack_bullet_reload_cool > 0)
		{
			draw_set_color(c_orange);
			if(player_position = 1)
			{
				draw_text_transformed(view_x+view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"재장전 +"+string(round(_ratio*100))+"%",_scale,_scale,0);
				_draw_stat += 1;
			}
			if(player_position = 2)
			{
				draw_text_transformed(view_x-view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"재장전 +"+string(round(_ratio*100))+"%",_scale,_scale,0);
				_draw_stat += 1;
			}
		}
		if(unit_effect_attack_bullet_reload_cool < 0)
		{
			draw_set_color(c_lime);
			if(player_position = 1)
			{
				draw_text_transformed(view_x+view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"재장전 -"+string(round(_ratio*100))+"%",_scale,_scale,0);
				_draw_stat += 1;
			}
			if(player_position = 2)
			{
				draw_text_transformed(view_x-view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"재장전 -"+string(round(_ratio*100))+"%",_scale,_scale,0);
				_draw_stat += 1;
			}
		}
	}
	if(unit_effect_skill_stand_cool != 0)
	{
		_ratio = abs(unit_effect_skill_stand_cool)/unit_skill_stand_cool;
	
		if(unit_effect_skill_stand_cool > 0)
		{
			draw_set_color(c_orange);
			if(player_position = 1)
			{
				draw_text_transformed(view_x+view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"기술 재사용 대기시간 +"+string(round(_ratio*100))+"%",_scale,_scale,0);
				_draw_stat += 1;
			}
			if(player_position = 2)
			{
				draw_text_transformed(view_x-view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"기술 재사용 대기시간 +"+string(round(_ratio*100))+"%",_scale,_scale,0);
				_draw_stat += 1;
			}
		}
		if(unit_effect_skill_stand_cool < 0)
		{
			draw_set_color(c_lime);
			if(player_position = 1)
			{
				draw_text_transformed(view_x+view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"기술 재사용 대기시간 -"+string(round(_ratio*100))+"%",_scale,_scale,0);
				_draw_stat += 1;
			}
			if(player_position = 2)
			{
				draw_text_transformed(view_x-view_w/128*35,view_y+view_h-view_h/48*_draw_stat,
					"기술 재사용 대기시간 -"+string(round(_ratio*100))+"%",_scale,_scale,0);
				_draw_stat += 1;
			}
		}
	}
#endregion

	var _draw_i = 0;

	unit_cc_health_max = unit_health_max+unit_effect_health_max;

	unit_cc_speed_max = max(unit_speed_max+unit_effect_speed_max,0);
	unit_cc_speed_accel = max(unit_speed_accel+unit_effect_speed_accel,0);

	unit_cc_damage_send_ratio = max(unit_damage_send_ratio+unit_effect_damage_send_ratio,0);
	unit_cc_damage_recive_ratio = max(unit_damage_recive_ratio+unit_effect_damage_recive_ratio,0);
	
	unit_cc_attack_damage = unit_attack_damage+unit_effect_attack_damage;
	unit_cc_attack_speed_cool = unit_attack_speed_cool+unit_effect_attack_speed_cool;

	unit_cc_attack_bullet_speed = unit_attack_bullet_speed+unit_effect_attack_bullet_speed;
	unit_cc_attack_bullet_duration = unit_attack_bullet_duration+unit_effect_attack_bullet_duration;
	unit_cc_attack_bullet_amount_max = unit_attack_bullet_amount_max+unit_effect_attack_bullet_amount_max;
	unit_cc_attack_bullet_reload_cool = unit_attack_bullet_reload_cool+unit_effect_attack_bullet_reload_cool;
	
	unit_cc_skill_stand_cool = unit_skill_stand_cool+unit_effect_skill_stand_cool;
	unit_cc_skill_stand_consumption = unit_skill_stand_consumption+unit_effect_skill_stand_consumption;

	unit_cc_attack_auto_target = unit_attack_auto_target+unit_effect_attack_auto_target;

#region
	if(player_position = 1)
	{
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
	
		draw_set_alpha(1);
		draw_set_halign(fa_left);
	
		draw_set_color(c_white);
	
		if(active_skill_index != 0)
		{
			var _cool = "사용 가능";
			if(unit_skill_stand > room_speed)
			{
				_cool = string(floor(unit_skill_stand/room_speed))+"초 남음";
			}
			else if(unit_skill_stand > 0)
			{
				_cool = string_format(unit_skill_stand/room_speed,0,1)+"초 남음";
			}
			draw_set_font(NanumSquare_Regular_12);
			draw_set_color(c_black);
			draw_set_alpha(0.25);
			draw_rectangle(view_x+view_w/64*4,view_y+view_h/64*56,view_x+view_w/64*16,view_y+view_h/64*59,false);
			_ratio = min(unit_skill_stand/unit_cc_skill_stand_cool,1);
			var _w = view_w/64*4+_ratio*(view_w/64*12);
			draw_set_alpha(0.75);
			draw_set_color(c_red);
			draw_rectangle(view_x+view_w/64*4+1,view_y+view_h/64*56,view_x+_w,view_y+view_h/64*59,false);
			draw_set_alpha(1);
			draw_set_color(c_white);
			draw_rectangle(view_x+view_w/64*4,view_y+view_h/64*56,view_x+view_w/64*16,view_y+view_h/64*59,true);
			draw_sprite_ext(S_Skill_Active_First,active_skill_index,view_x+view_w/64*6,view_y+view_h/64*57.5,_scale/2,_scale/2,0,c_white,1);
			draw_text_transformed(view_x+view_w/64*8,view_y+view_h/64*58,_cool,_scale,_scale,0);
			draw_text_transformed(view_x+view_w/64*8,view_y+view_h/64*57,global.system.skill_actives[|active_skill_index],_scale,_scale,0);
		
			_draw_i += 1;
		}
	
		var _draw_y = -_draw_i*view_h/16;
		if(passive_skill_index != 0)
		{
			draw_set_font(NanumSquare_Regular_12);
			draw_set_color(c_black);
			draw_set_alpha(0.25);
			draw_rectangle(view_x+view_w/64*4,view_y+view_h/64*56+_draw_y,view_x+view_w/64*16,view_y+view_h/64*59+_draw_y,false);
			draw_set_color(c_white);
			draw_set_alpha(1);
			draw_rectangle(view_x+view_w/64*4,view_y+view_h/64*56+_draw_y,view_x+view_w/64*16,view_y+view_h/64*59+_draw_y,true);
			//draw_sprite_ext(S_Skill_Passive_First,passive_skill_index,view_x+view_w/64*6,view_y+view_h/64*57.5+_draw_y,_scale/2,_scale/2,0,c_white,1);
			draw_text_transformed(view_x+view_w/64*8,view_y+view_h/64*58+_draw_y,_passive_description,_scale,_scale,0);
			draw_text_transformed(view_x+view_w/64*8,view_y+view_h/64*57+_draw_y,global.system.skill_passives[|passive_skill_index],_scale,_scale,0);
		
			_draw_i += 0.75;
		}
	
		_draw_y = -_draw_i*view_h/16;
	
		var _x = 0; _w = view_w/128; var _max = unit_cc_attack_bullet_amount_max;
		for(var i = 0; i < _max; i++)
		{
			draw_rectangle(view_x+view_w/16+(_w*i)+_x,view_y+view_h/64*56+_draw_y,view_x+view_w/16+(_w*(i+1))+_x,view_y+view_h/64*58+_draw_y,true);
			if(i < unit_attack_bullet_amount)
			{
				draw_rectangle(view_x+view_w/16+(_w*i)+_x,view_y+view_h/64*56+_draw_y,view_x+view_w/16+(_w*(i+1))+_x,view_y+view_h/64*58+_draw_y,false);
				if(i+1 = unit_attack_bullet_amount)
				{
				
				}
			}
			else if(unit_attack_bullet_amount = 0)
			{
				if(i < round(unit_cc_attack_bullet_amount_max*((unit_cc_attack_bullet_reload_cool-unit_attack_bullet_reload)/unit_cc_attack_bullet_reload_cool)))
				{
					draw_rectangle(view_x+view_w/16+(_w*i)+_x,view_y+view_h/64*56+_draw_y,view_x+view_w/16+(_w*(i+1))+_x,view_y+view_h/64*58+_draw_y,false);
				}
			}
			_x += _w/3;
		}
		draw_set_font(WalkwayObliqueBold_Regular_12);
		draw_set_halign(fa_right);
		draw_text_transformed(view_x+view_w/16-view_w/128,view_y+view_h/64*57+_draw_y,string(floor(unit_attack_bullet_amount))+"/"+string(floor(unit_cc_attack_bullet_amount_max)),_scale,_scale,0);
		_draw_i += 1;
	
		_draw_y = -_draw_i*view_h/16;
	
		draw_set_font(WalkwayObliqueBold_Regular_16);
		draw_set_color(c_red);
		draw_set_alpha(0.5);
		_ratio = (unit_health_prev/unit_health_max_draw);
		var _w = view_w/64*4+_ratio*(view_w/64*12);
		draw_rectangle(view_x+view_w/64*4,view_y+view_h/64*56+_draw_y,view_x+_w,view_y+view_h/64*59+_draw_y,false);
		draw_set_alpha(1);
		draw_set_color(c_white);
		_ratio = (unit_health_draw/unit_health_max_draw);
		_w = view_w/64*4+_ratio*(view_w/64*12);
		draw_rectangle(view_x+view_w/64*4,view_y+view_h/64*56+_draw_y,view_x+_w,view_y+view_h/64*59+_draw_y,false);
		draw_rectangle(view_x+view_w/64*4,view_y+view_h/64*56+_draw_y,view_x+view_w/64*16,view_y+view_h/64*59+_draw_y,true);
	
		draw_set_color(c_red);
		draw_set_halign(fa_right);
		draw_set_valign(fa_bottom);
		draw_text_transformed(view_x+_w-view_w/128,view_y+view_h/64*59+_draw_y,string(round(unit_health_draw)),_scale,_scale,0);
		draw_set_valign(fa_middle);
		draw_set_halign(fa_left);
		draw_set_color(c_white);
		draw_text_transformed(view_x+view_w/64*16+view_w/128,view_y+view_h/64*57.5+_draw_y,string(round(unit_health_max_draw)),_scale,_scale,0);
	}
#endregion
#region
	if(player_position = 2)
	{
		draw_set_halign(fa_center);
		draw_set_valign(fa_middle);
	
		draw_set_alpha(1);
		draw_set_halign(fa_right);
	
		draw_set_color(c_white);
	
		if(active_skill_index != 0)
		{
			var _cool = "사용 가능";
			if(unit_skill_stand > room_speed)
			{
				_cool = string(floor(unit_skill_stand/room_speed))+"초 남음";
			}
			else if(unit_skill_stand > 0)
			{
				_cool = string_format(unit_skill_stand/room_speed,0,1)+"초 남음";
			}
			draw_set_font(NanumSquare_Regular_12);
			draw_set_color(c_black);
			draw_set_alpha(0.25);
			draw_rectangle(view_x-view_w/64*4,view_y+view_h/64*56,view_x-view_w/64*16,view_y+view_h/64*59,false);
			_ratio = min(unit_skill_stand/unit_cc_skill_stand_cool,1);
			var _w = view_w/64*4+_ratio*(view_w/64*12);
			draw_set_alpha(0.75);
			draw_set_color(c_blue);
			draw_rectangle(view_x-view_w/64*4,view_y+view_h/64*56,view_x-_w,view_y+view_h/64*59,false);
			draw_set_alpha(1);
			draw_set_color(c_white);
			draw_rectangle(view_x-view_w/64*4,view_y+view_h/64*56,view_x-view_w/64*16,view_y+view_h/64*59,true);
			draw_sprite_ext(S_Skill_Active_Second,active_skill_index,view_x-view_w/64*6,view_y+view_h/64*57.5,_scale/2,_scale/2,0,c_white,1);
			draw_text_transformed(view_x-view_w/64*8,view_y+view_h/64*58,_cool,_scale,_scale,0);
			draw_text_transformed(view_x-view_w/64*8,view_y+view_h/64*57,global.system.skill_actives[|active_skill_index],_scale,_scale,0);
			_draw_i += 1;
		}
	
		var _draw_y = -_draw_i*view_h/16;
		if(passive_skill_index != 0)
		{
			draw_set_font(NanumSquare_Regular_12);
			draw_set_color(c_black);
			draw_set_alpha(0.25);
			draw_rectangle(view_x-view_w/64*4,view_y+view_h/64*56+_draw_y,view_x-view_w/64*16,view_y+view_h/64*59+_draw_y,false);
			draw_set_color(c_white);
			draw_set_alpha(1);
			draw_rectangle(view_x-view_w/64*4,view_y+view_h/64*56+_draw_y,view_x-view_w/64*16,view_y+view_h/64*59+_draw_y,true);
			//draw_sprite_ext(S_Skill_Passive_Second,passive_skill_index,view_x-view_w/64*6,view_y+view_h/64*57.5+_draw_y,_scale/2,_scale/2,0,c_white,1);
			draw_text_transformed(view_x-view_w/64*8,view_y+view_h/64*58+_draw_y,_passive_description,_scale,_scale,0);
			draw_text_transformed(view_x-view_w/64*8,view_y+view_h/64*57+_draw_y,global.system.skill_passives[|passive_skill_index],_scale,_scale,0);
		
			_draw_i += 0.75;
		}
	
		_draw_y = -_draw_i*view_h/16;
	
		var _x = 0; _w = view_w/128; var _max = unit_cc_attack_bullet_amount_max;
		for(var i = 0; i < _max; i++)
		{
			draw_rectangle(view_x-view_w/16-(_w*i)-_x,view_y+view_h/64*56+_draw_y,view_x-view_w/16-(_w*(i+1))-_x,view_y+view_h/64*58+_draw_y,true);
			if(i < unit_attack_bullet_amount)
			{
				draw_rectangle(view_x-view_w/16-(_w*i)-_x,view_y+view_h/64*56+_draw_y,view_x-view_w/16-(_w*(i+1))-_x,view_y+view_h/64*58+_draw_y,false);
				if(i+1 = unit_attack_bullet_amount)
				{
				
				}
			}
			else if(unit_attack_bullet_amount = 0)
			{
				if(i < round(unit_cc_attack_bullet_amount_max*((unit_cc_attack_bullet_reload_cool-unit_attack_bullet_reload)/unit_cc_attack_bullet_reload_cool)))
				{
					draw_rectangle(view_x-view_w/16-(_w*i)-_x,view_y+view_h/64*56+_draw_y,view_x-view_w/16-(_w*(i+1))-_x,view_y+view_h/64*58+_draw_y,false);
				}
			}
			_x += _w/3;
		}
		draw_set_font(WalkwayObliqueBold_Regular_12);
		draw_set_halign(fa_left);
		draw_text_transformed(view_x-view_w/16+view_w/128,view_y+view_h/64*57+_draw_y,string(floor(unit_attack_bullet_amount))+"/"+string(floor(unit_cc_attack_bullet_amount_max)),_scale,_scale,0);
		_draw_i += 1;
	
		_draw_y = -_draw_i*view_h/16;
	
		draw_set_font(WalkwayObliqueBold_Regular_16);
		draw_set_color(c_blue);
		draw_set_alpha(0.5);
		_ratio = (unit_health_prev/unit_health_max_draw);
		var _w = view_w/64*4+_ratio*(view_w/64*12);
		draw_rectangle(view_x-view_w/64*4,view_y+view_h/64*56+_draw_y,view_x-_w,view_y+view_h/64*59+_draw_y,false);
		draw_set_alpha(1);
		draw_set_color(c_white);
		_ratio = (unit_health_draw/unit_health_max_draw);
		_w = view_w/64*4+_ratio*(view_w/64*12);
		draw_rectangle(view_x-view_w/64*4,view_y+view_h/64*56+_draw_y,view_x-_w,view_y+view_h/64*59+_draw_y,false);
		draw_rectangle(view_x-view_w/64*4,view_y+view_h/64*56+_draw_y,view_x-view_w/64*16,view_y+view_h/64*59+_draw_y,true);
	
		draw_set_color(c_blue);
		draw_set_halign(fa_left);
		draw_set_valign(fa_bottom);
		draw_text_transformed(view_x-_w+view_w/128,view_y+view_h/64*59+_draw_y,string(round(unit_health_draw)),_scale,_scale,0);
		draw_set_valign(fa_middle);
		draw_set_halign(fa_right);
		draw_set_color(c_white);
		draw_text_transformed(view_x-view_w/64*16-view_w/128,view_y+view_h/64*57.5+_draw_y,string(round(unit_health_max_draw)),_scale,_scale,0);
	}
#endregion


}
