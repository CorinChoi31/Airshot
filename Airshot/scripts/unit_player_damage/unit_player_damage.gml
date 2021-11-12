function unit_player_damage() {
	var _damage = 0;
	var _buff = 0;
	var _sender = noone;

	for(var i = ds_list_size(unit_damage_id)-1; i >= 0; i--)
	{
		_damage = unit_damage_amount[|i];
		_buff = 0;
		_sender = unit_damage_sender[|i];
	
		if(unit_damage_id[|i] = 0)
		{
			if(unit_health > 0)
			{
				_damage = _damage*unit_cc_damage_recive_ratio;
			
				if(_damage > 0)
				{
					_buff = unit_player_effect_search(id,EFFECT.DEFAULT_untouchable,0,0,[BUFF.SEARCH_AMOUNT,BUFF.SEARCH_MOREorSAME]);
					if(is_array(_buff))
					{
						_damage = 0;
					}
				
					if(passive_skill_index = 7)
					{
						_buff = unit_player_effect_search(id,EFFECT.PASSIVE_untouchable,0,0,[BUFF.SEARCH_AMOUNT,BUFF.SEARCH_MOREorSAME]);
						if(is_array(_buff))
						{
							unit_effect_tick[|_buff[0]] = unit_effect_amount[|_buff[0]];
							if(unit_effect_first[|_buff[0]] = true)
							{
								_damage = 0;
							}
						}
					
					}
					if(passive_skill_index = 8)
					{
						_buff = unit_player_effect_search(id,EFFECT.PASSIVE_speedmax_damage,0,0,[BUFF.SEARCH_AMOUNT,BUFF.SEARCH_MOREorSAME]);
						if(is_array(_buff))
						{
							if(unit_effect_amount[|_buff[0]] < 0.10)
							{
								unit_effect_amount[|_buff[0]] += 0.02;
							}
						}
					}
			
					if(passive_skill_index = 4)
					{
						if(unit_health-_damage <= 0)
						{
							_buff = unit_player_effect_search(id,EFFECT.PASSIVE_revive,0,0,[BUFF.SEARCH_AMOUNT,BUFF.SEARCH_MOREorSAME]);
							if(is_array(_buff))
							{
								if(unit_effect_tick[|_buff[0]] <= 0)
								{
									repeat(128)
									{
										var _dist = 128;
										var _dire = random_range(0,360);
										var _pox = phy_position_x+lengthdir_x(_dist,_dire);
										var _poy = phy_position_y+lengthdir_y(_dist,_dire);
										var _dire = point_direction(_pox,_poy,phy_position_x,phy_position_y);
										if(player_position = 1)
										particle_burst(global.portSkill[m_First_Skill_Revive_On],
											[_pox,_pox,_poy,_poy,depth-1,1,PART.SQUARE,PART.INVERSE_GAUSSIAN,4],[room_speed/4,room_speed*2],bm_add,-0.15,[0,1,0.1],[_dire,_dire,0],[0,0,0,false],[0,0],[id,room_speed/2]);
										if(player_position = 2)
										particle_burst(global.portSkill[m_Second_Skill_Revive_On],
											[_pox,_pox,_poy,_poy,depth-1,1,PART.SQUARE,PART.INVERSE_GAUSSIAN,4],[room_speed/4,room_speed*2],bm_add,-0.15,[0,1,0.1],[_dire,_dire,0],[0,0,0,false],[0,0],[id,room_speed/2]);
									}
						
									_damage = 0;
							
									unit_effect_tick[|_buff[0]] = unit_effect_tick_origin[|_buff[0]];
							
									unit_player_effect_add(id,EFFECT.DEFAULT_untouchable,0,room_speed*1.5,id);
									unit_player_effect_add(id,EFFECT.ACTIVE_Heal_regeneration,unit_cc_health_max*0.25,room_speed*2,id);
								}
							}
						}
					}
				
					if(passive_skill_index = 15)
					{
						_buff = unit_player_effect_search(id,EFFECT.PASSIVE_hide,0,0,[BUFF.SEARCH_EXISTS]);
						if(is_array(_buff))
							id.unit_effect_tick[|_buff[0]] = id.unit_effect_tick_origin[|_buff[0]];
					}
				
					if(_sender != noone and instance_exists(_sender))
					{
						_buff = unit_player_effect_search(_sender,EFFECT.ACTIVE_fixbydamage,0,0,[BUFF.SEARCH_AMOUNT,BUFF.SEARCH_MOREorSAME]);
						if(is_array(_buff))
						{
							unit_player_effect_add(_sender,EFFECT.ACTIVE_Heal_instant,_damage*(_sender.unit_effect_amount[|_buff[0]]),0,_sender);
						}
					
						if(_sender.passive_skill_index = 15)
						{
							_buff = unit_player_effect_search(_sender,EFFECT.PASSIVE_hide,0,0,[BUFF.SEARCH_EXISTS]);
							if(is_array(_buff))
							{
								_sender.unit_effect_tick[|_buff[0]] = _sender.unit_effect_tick_origin[|_buff[0]];
							}
						}
					
						if(_sender.passive_skill_index = 17)
						{
							_buff = unit_player_effect_search(id,EFFECT.PASSIVE_weakness,0,0,[BUFF.SEARCH_EXISTS]);
							if(is_array(_buff))
							{
								unit_effect_id[|_buff[0]] = -1;
								_buff = unit_player_effect_search(_sender,EFFECT.PASSIVE_weakness_give,0,0,[BUFF.SEARCH_EXISTS]);
								if(is_array(_buff))
								{
									_sender.unit_effect_tick[|_buff[0]] -= _sender.unit_effect_tick_origin[|_buff[0]]/2;
									
									unit_player_effect_add(id,EFFECT.DAMAGE_Recive_ratio,0.25,5 *room_speed,_sender);
								}
							}
						
						}
					}
				
					unit_health = unit_health-_damage;
					if(_damage > 0)
					{
						draw_text_rectangle(x+random_range(-64,64),y+random_range(-64,64),round(_damage),depth-1,4,4,WalkwayObliqueBold_Regular_48,c_ltgray,c_dkgray,room_speed/2,room_speed/4,id,1);
					}
				}
			}
		
			if(unit_health <= 0)
			{
				unit_dead = true;
			
				unit_damage_amount[|i] = 0;
				unit_health = 0;
			}
		
			ds_list_delete(unit_damage_id,i);
			ds_list_delete(unit_damage_amount,i);
			ds_list_delete(unit_damage_sender,i);
		}
		else
		{
			ds_list_delete(unit_damage_id,i);
			ds_list_delete(unit_damage_amount,i);
			ds_list_delete(unit_damage_sender,i);
		}
	}


}
