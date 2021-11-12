if(alarm[0] = -1)
{
	var _move = false;
	var move_x = 0; var move_y = 0;

	if(phy_active = true)
	{
		unit_player_stat();
	
		if(keyboard_check(keyboard_assgin[4]))
		{
			if(unit_attack_bullet_amount > 0)
			{
				if(unit_attack_speed <= 0)
				{
					if(global.player_first != noone and global.player_second != noone)
					{
						var _dis = point_distance(global.player_first.phy_position_x,global.player_first.phy_position_y,global.player_second.phy_position_x,global.player_second.phy_position_y);
				
						var _lnx = lengthdir_x(4,-phy_rotation+90);
						var _lny = lengthdir_y(4,-phy_rotation+90);
						
						var _search_curtain = unit_player_effect_search(id,EFFECT.ACTIVE_Shell_curtaincall,0,0,[BUFF.SEARCH_AMOUNT,BUFF.SEARCH_MOREorSAME]);
						//var _search_lazer = unit_player_effect_search(id,EFFECT.ACTIVE_lazer,0,0,[BUFF.SEARCH_AMOUNT,BUFF.SEARCH_MOREorSAME]);
						
						var _rot_angle = unit_cc_attack_bullet_speed*100;
						
						if(!is_array(_search_curtain)) //and !is_array(_search_lazer))
						{
							unit_attack_speed = unit_cc_attack_speed_cool;
							unit_attack_bullet_amount -= unit_attack_bullet_multiple_shot;
							
							for(var i = 0; i < unit_attack_bullet_multiple_shot+unit_attack_bullet_multiple_shot*(passive_skill_index = 6); i++)
							{
								var _b = instance_create_depth(phy_position_x+_lnx,phy_position_y+_lny,depth-1,Bullet);
								with(_b)
								{
									player_id = other.id;
									player_position = other.player_position;
					
									phy_rotation = other.phy_rotation;
									if(_dis <= other.unit_cc_attack_auto_target)
									{
										if(player_position = 1)
										{
											phy_rotation = 90-point_direction(other.id.phy_position_x+_lnx,other.id.phy_position_y+_lny,global.player_second.phy_position_x+global.player_second.phy_speed_x*(_dis/(25*_rot_angle)),global.player_second.phy_position_y+global.player_second.phy_speed_y*(_dis/(25*_rot_angle)));
										}
										if(player_position = 2)
										{
											phy_rotation = 90-point_direction(other.id.phy_position_x+_lnx,other.id.phy_position_y+_lny,global.player_first.phy_position_x+global.player_first.phy_speed_x*(_dis/(25*_rot_angle)),global.player_first.phy_position_y+global.player_first.phy_speed_y*(_dis/(25*_rot_angle)));
										}
									}
									
									phy_rotation += random_range(-other.unit_attack_bullet_multiple_shot_angle/2,other.unit_attack_bullet_multiple_shot_angle/2);
									
									speed_origin = other.unit_cc_attack_bullet_speed;
									damage_origin = other.unit_cc_attack_damage*other.unit_cc_damage_send_ratio;
									
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
						}
						else
						{
							if(is_array(_search_curtain))
							{
								phy_speed_x = 0;
								phy_speed_y = 0;
								
								unit_attack_speed = 0.8*room_speed;
								unit_effect_amount[|_search_curtain[0]] -= 1;
								unit_attack_bullet_amount -= 1;
								
								_rot_angle = unit_cc_attack_bullet_speed*4*100;
						
								var _b = instance_create_depth(phy_position_x+_lnx,phy_position_y+_lny,depth-1,Shell_Curtain);
								with(_b)
								{
									player = other.id;
									player_position = other.player_position;
								
									phy_rotation = other.phy_rotation;
									var _dir = other.phy_rotation;
									if(player_position = 1)
									{
										_dir = 90-point_direction(other.id.phy_position_x+_lnx,other.id.phy_position_y+_lny,global.player_second.phy_position_x+global.player_second.phy_speed_x*(_dis/(200*_rot_angle)),global.player_second.phy_position_y+global.player_second.phy_speed_y*(_dis/(200*_rot_angle)));
									}
									if(player_position = 2)
									{
										_dir = 90-point_direction(other.id.phy_position_x+_lnx,other.id.phy_position_y+_lny,global.player_first.phy_position_x+global.player_first.phy_speed_x*(_dis/(200*_rot_angle)),global.player_first.phy_position_y+global.player_first.phy_speed_y*(_dis/(200*_rot_angle)));
									}
									
									if(abs(angle_difference(phy_rotation,_dir)) < 7.5)
									{
										phy_rotation = _dir;
									}
								
									if(player_position = 1)
									{
										effect_id = [m_First_Shell_Curtain_Trail,m_First_Shell_Curtain_Hit];
									}
									if(player_position = 2)
									{
										effect_id = [m_Second_Shell_Curtain_Trail,m_Second_Shell_Curtain_Hit];
									}
							
									physics_apply_local_impulse(0,0,0,-other.unit_cc_attack_bullet_speed*16);
								
									speed_origin = other.unit_cc_attack_bullet_speed*16;
									damage = other.unit_cc_attack_damage*1.5*other.unit_cc_damage_send_ratio;
								
									damage += (other.unit_cc_health_max-other.unit_health)*0.15*(3-other.unit_effect_amount[|_search_curtain[0]]);
									duration = room_speed*1;
									if(other.unit_effect_amount[|_search_curtain[0]] = 0)
									{
										if(player_position = 1)
										{
											effect_id = [m_First_Shell_Curtain_Trail_Last,m_First_Shell_Curtain_Hit];
										}
										if(player_position = 2)
										{
											effect_id = [m_Second_Shell_Curtain_Trail_Last,m_Second_Shell_Curtain_Hit];
										}
										damage *= 2;
										
										duration += room_speed*0.5;
									}
								}
							}
							/*
							if(is_array(_search_lazer))
							{
								if(unit_effect_tick[|_search_lazer[0]] = 0)
								{
									unit_attack_speed = unit_cc_attack_speed_cool;
									unit_skill_stand = unit_attack_speed*0.5;
								
									unit_player_effect_add(id,EFFECT.ACTIVE_lazer_shot,unit_cc_attack_damage*0.45*unit_cc_damage_send_ratio,unit_attack_speed*0.5,id);
								}
							}
							*/
						}
					}
				}
			}
		}
		
		if(keyboard_check_pressed(keyboard_assgin[5]))
		{
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
		
			if(unit_skill_stand <= 0)
			{
				unit_skill(active_skill_index,_color);
			}
		}
		
		/*
		if(keyboard_check_pressed(keyboard_assgin[7]))
		{
			if(sprite_index != HEARTSTONE)
			{
				sprite_index = HEARTSTONE;
				image_speed = -1;
				
				unit_player_effect_add(id,EFFECT.HIDDEN_Heartstone,0,room_speed*8,id);
			}
		}
		*/
	}

	if(phy_active = true)
	{
		if(unit_speed > 0)
		{
			unit_speed -= unit_cc_speed_max/(room_speed/2);
		}
		if(unit_speed < 0)
		{
			unit_speed = 0;
		}
		
		for(var i = 0; i < 4; i++)
		{
			if(keyboard_check(keyboard_assgin[i]))
			{
			    var this_angle = 90-i*90;
			    move_x += lengthdir_x(1, this_angle);
			    move_y += lengthdir_y(1, this_angle);
			}
		}
		
		//move_x = choose(1,0,-1);
		//move_y = choose(1,0,-1);
	}
	if(point_distance(0,0,move_x,move_y) > 0)
	{
		var _agd = angle_difference(point_direction(0,0,move_x,move_y),phy_rotation);
		var _eff_1 = is_array(unit_player_effect_search(id,EFFECT.ACTIVE_Shell_curtaincall,0,0,[BUFF.SEARCH_AMOUNT,BUFF.SEARCH_MOREorSAME]));
		var _eff_2 = is_array(unit_player_effect_search(id,EFFECT.ACTIVE_rage,0,0,[BUFF.SEARCH_AMOUNT,BUFF.SEARCH_MOREorSAME]));
		var _eff_3 = is_array(unit_player_effect_search(id,EFFECT.ACTIVE_lazer_shot,0,0,[BUFF.SEARCH_AMOUNT,BUFF.SEARCH_MOREorSAME]));
		
		if(!_eff_1 and !_eff_2 and !_eff_3)
		{
			phy_rotation += _agd/(room_speed/10);
		}
		else if(_eff_3)
		{
			if(is_array(unit_player_effect_search(id,EFFECT.ACTIVE_lazer_shot,0,0,[BUFF.SEARCH_AMOUNT,BUFF.SEARCH_MOREorSAME])))
			{
				phy_rotation += _agd/(room_speed);
			}
			else
			{
				phy_rotation += _agd/(room_speed/2);
			}
		}
		else if(_eff_2)
		{
			phy_rotation += _agd/(room_speed/2);
		}
		else if(_eff_1)
		{
			phy_rotation += _agd/(room_speed/2);
		}
		
		if(unit_speed < unit_cc_speed_max)
		{
			unit_speed += unit_cc_speed_max/(room_speed/8);
		}
		else
		{
			unit_speed += (unit_cc_speed_max-unit_speed)/(room_speed/4);
		}
		
		if(_eff_3)
		{
			unit_speed = 0;
			unit_cc_speed_max = 0;
		}///
	}
	
	phy_speed_x += (lengthdir_x(unit_speed,-phy_rotation+90)-phy_speed_x)/(room_speed/10);
	phy_speed_y += (lengthdir_y(unit_speed,-phy_rotation+90)-phy_speed_y)/(room_speed/10);

	if(unit_dead = true)
	{
		if(unit_dead_trig = true)
		{
			unit_dead_trig = false;
			
			part_emitter_region(global.partSys,partEmit,phy_position_x-128,phy_position_x+128,phy_position_y-128,phy_position_y+128,ps_shape_ellipse,ps_distr_linear);
			
			if(player_position = 1)
			{
				var _color = c_aqua;
				part_emitter_burst(global.partSys,partEmit,global.partBullet[m_First_Bullet_Hit],64);
				global.player_first = noone;
				
				/*
				if(global.player_second != noone)
				{
					global.player_first.phy_active = false;
				}
				*/
				phy_active = false;
				
				global.game_running = false;
				global.game_result += 1;
				
				/*
				ds_list_clear(unit_effect_id);
				ds_list_clear(unit_effect_tick);
				ds_list_clear(unit_effect_tick_origin);
				ds_list_clear(unit_effect_amount);
				ds_list_clear(unit_effect_amount_origin);
				ds_list_clear(unit_effect_first);
				ds_list_clear(unit_effect_sender);
				*/
			}
			if(player_position = 2)
			{
				var _color = c_orange;
				part_emitter_burst(global.partSys,partEmit,global.partBullet[m_Second_Bullet_Hit],64);
				global.player_second = noone;
				
				/*
				if(global.player_first != noone)
				{
					global.player_second.phy_active = false;
				}
				*/
				phy_active = false;
				
				global.game_running = false;
				global.game_result -= 1;
				
				/*
				ds_list_clear(unit_effect_id);
				ds_list_clear(unit_effect_tick);
				ds_list_clear(unit_effect_tick_origin);
				ds_list_clear(unit_effect_amount);
				ds_list_clear(unit_effect_amount_origin);
				ds_list_clear(unit_effect_first);
				ds_list_clear(unit_effect_sender);
				*/
			}
			
			with(Bullet)
			{
				if(player_position = other.player_position)
				{
					instance_destroy();
				}
			}
			with(Shell)
			{
				if(player_position = other.player_position)
				{
					instance_destroy();
				}
			}
			with(Missile)
			{
				if(player_position = other.player_position)
				{
					instance_destroy();
				}
			}
		}
	}

	if(phy_active = true)
	{
		if(phy_speed > 1)
		{
			part_emitter_region(global.partSys,partEmit,phy_position_x-8,phy_position_x+8,phy_position_y-8,phy_position_y+8,ps_shape_ellipse,ps_distr_invgaussian);
			if(player_position = 1)
			{
				part_emitter_burst(global.partSys,partEmit,global.partPlayer[m_First_Player_Movement],phy_speed);
			}
			if(player_position = 2)
			{
				part_emitter_burst(global.partSys,partEmit,global.partPlayer[m_Second_Player_Movement],phy_speed);
			}
		}
	}
	
	unit_health_draw += (unit_health-unit_health_draw)/(room_speed/10);
	unit_health_max_draw += (unit_cc_health_max-unit_health_max_draw)/(room_speed/10);
}