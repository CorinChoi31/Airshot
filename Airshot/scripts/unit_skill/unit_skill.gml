function unit_skill(argument0, argument1) {
	if(unit_attack_bullet_amount >= unit_skill_stand_consumption)
	{
		var _arg0 = argument0;
		if(_arg0 = 0)
		{
		
		}
		else
		{
		
		}
	
		unit_skill_stand = unit_cc_skill_stand_cool;
	
		var _random = false;
		if(_arg0 = 18)
		{
			var _search_lazer = unit_player_effect_search(id,EFFECT.ACTIVE_lazer,0,0,[BUFF.SEARCH_AMOUNT,BUFF.SEARCH_MOREorSAME]);
			if(!is_array(_search_lazer))
			{
				_random = true;
				_arg0 = irandom_range(0,15);
			}
			else
			{
				unit_effect_id[|_search_lazer[0]] = -1;
				unit_skill_stand = 0;
			}
		}
	
		if(_arg0 = 1)
		{
			unit_player_effect_add(id,EFFECT.ACTIVE_countdown,0,room_speed*1.5,id);
		
			draw_text_rectangle_progress(x,y-16,"초읽기",
				depth-1,16,16,NanumSquare_Regular_16,argument1,c_dkgray,room_speed*1.5,room_speed/2,id,1);
		}
		else if(_arg0 = 2)
		{
			unit_player_effect_add(id,EFFECT.ATTACK_Bullet_reload,-unit_attack_bullet_reload_cool*0.75,8*room_speed,id);
			unit_player_effect_add(id,EFFECT.ATTACK_speed,-unit_attack_speed_cool*0.25,8*room_speed,id);
		
			draw_text_rectangle_progress(x,y-16,"탄약확충",
				depth-1,16,16,NanumSquare_Regular_16,argument1,c_dkgray,room_speed*8,room_speed/2,id,1);
		}
		else if(_arg0 = 3)
		{
			unit_player_effect_add(id,EFFECT.ACTIVE_bombard,16,room_speed*1.5,id);
		
			draw_text_rectangle_progress(x,y-16,"미사일 폭격",
				depth-1,16,16,NanumSquare_Regular_16,argument1,c_dkgray,room_speed*2,room_speed/2,id,1);
		}
		else if(_arg0 = 4)
		{
			unit_player_effect_add(id,EFFECT.ACTIVE_reset,0,room_speed,id);
		
			draw_text_rectangle_progress(x,y-16,"재설정",
				depth-1,16,16,NanumSquare_Regular_16,argument1,c_dkgray,room_speed*1,room_speed/2,id,1);
		}
		else if(_arg0 = 5)
		{
			unit_player_effect_add(id,EFFECT.DAMAGE_Recive_ratio,-0.25,room_speed*1,id);
			unit_player_effect_add(id,EFFECT.DAMAGE_Recive_ratio,-0.75,room_speed*4,id);
		
			draw_text_rectangle_progress(x,y-16,"방어 강화",
				depth-1,16,16,NanumSquare_Regular_16,argument1,c_dkgray,room_speed*4,room_speed/2,id,1);
		}
		else if(_arg0 = 6)
		{
			unit_player_effect_add(id,EFFECT.ACTIVE_Shell_curtaincall,4,room_speed*12,id);
		
			draw_text_rectangle_progress(x,y-16,"대장갑 탄환",
				depth-1,16,16,NanumSquare_Regular_16,argument1,c_dkgray,room_speed*12,room_speed/2,id,1);
		}
		else if(_arg0 = 7)
		{
			unit_player_effect_add(id,EFFECT.ACTIVE_Shell_piercing,12,room_speed,id);
		
			draw_text_rectangle_progress(x,y-16,"철갑유탄",
				depth-1,16,16,NanumSquare_Regular_16,argument1,c_dkgray,room_speed*1,room_speed/2,id,1);
		}
		else if(_arg0 = 8)
		{
			unit_player_effect_add(id,EFFECT.ATTACK_range,0.5,room_speed*4,id);
			unit_player_effect_add(id,EFFECT.ATTACK_Bullet_speed,unit_attack_bullet_speed*0.5,room_speed*4,id);
			unit_player_effect_add(id,EFFECT.SPEED_max_constant,0.25,room_speed*4,id);
		
			draw_text_rectangle_progress(x,y-16,"가속",
				depth-1,16,16,NanumSquare_Regular_16,argument1,c_dkgray,room_speed*4,room_speed/2,id,1);
		}
		else if(_arg0 = 9)
		{
			unit_player_effect_add(id,EFFECT.SPEED_max_constant,0.1,room_speed*6,id);
			unit_player_effect_add(id,EFFECT.ATTACK_damage,unit_attack_damage*0.25,room_speed*6,id);
			unit_player_effect_add(id,EFFECT.ATTACK_speed,-unit_attack_speed_cool*0.5,room_speed*6,id);
		
			draw_text_rectangle_progress(x,y-16,"최적화",
				depth-1,16,16,NanumSquare_Regular_16,argument1,c_dkgray,room_speed*6,room_speed/2,id,1);
		}
		else if(_arg0 = 10)
		{
			unit_player_effect_add(id,EFFECT.ACTIVE_rage,60,room_speed*0.5,id);
		
			draw_text_rectangle_progress(x,y-16,"난사",
				depth-1,16,16,NanumSquare_Regular_16,argument1,c_dkgray,room_speed*1,room_speed/2,id,1);
		}
		else if(_arg0 = 11)
		{
			unit_player_effect_add(id,EFFECT.ACTIVE_impulse,0,room_speed*1,id);
		
			draw_text_rectangle_progress(x,y-16,"충격파",
				depth-1,16,16,NanumSquare_Regular_16,argument1,c_dkgray,room_speed*1,room_speed/2,id,1);
		}
		else if(_arg0 = 12)
		{
			unit_player_effect_add(id,EFFECT.ACTIVE_Missile_freeze,0,room_speed*0.5,id);
		
			draw_text_rectangle_progress(x,y-16,"빙결 미사일",
				depth-1,16,16,NanumSquare_Regular_16,argument1,c_dkgray,room_speed*0.5,room_speed/2,id,1);
		}
		else if(_arg0 = 13)
		{
			unit_player_effect_add(id,EFFECT.ACTIVE_dimensionjump,0,room_speed*0.1,id);
		
			draw_text_rectangle_progress(x,y-16,"차원 도약",
				depth-1,16,16,NanumSquare_Regular_16,argument1,c_dkgray,room_speed*0.1,room_speed/2,id,1);
		}
		else if(_arg0 = 14)
		{
			unit_player_effect_add(id,EFFECT.ACTIVE_fixbydamage,0.5,room_speed*10,id);
		
			draw_text_rectangle_progress(x,y-16,"재생",
				depth-1,16,16,NanumSquare_Regular_16,argument1,c_dkgray,room_speed*10,room_speed/2,id,1);
		}
		else if(_arg0 = 15)
		{
			unit_player_effect_add(id,EFFECT.ACTIVE_timerewind,0,room_speed*0.8,id);
		
			draw_text_rectangle_progress(x,y-16,"시간 역행",
				depth-1,16,16,NanumSquare_Regular_16,argument1,c_dkgray,room_speed*0.8,room_speed/2,id,1);
		}
		else if(_arg0 = 16)
		{
			unit_attack_speed = unit_cc_attack_speed_cool*5;
		
			unit_player_effect_add(id,EFFECT.ACTIVE_lazer_shot,unit_cc_attack_damage*0.25*unit_cc_damage_send_ratio,unit_cc_attack_speed_cool,room_speed,id);
		
			unit_player_effect_add(id,EFFECT.ACTIVE_lazer_shot,unit_cc_attack_damage*0.5*unit_cc_damage_send_ratio,unit_cc_attack_speed_cool*2,room_speed,id);
		
			unit_player_effect_add(id,EFFECT.ACTIVE_lazer_shot,unit_cc_attack_damage*1*unit_cc_damage_send_ratio,unit_cc_attack_speed_cool*4,room_speed,id);
		
			draw_text_rectangle_progress(x,y-16,"위상 분열포",
				depth-1,16,16,NanumSquare_Regular_16,argument1,c_dkgray,unit_cc_attack_speed_cool*4,room_speed/2,id,1);
		}
		else if(_arg0 = 17)
		{
			unit_player_effect_add(id,EFFECT.ACTIVE_energy_fire,0,room_speed*1,id);
		
			draw_text_rectangle_progress(x,y-16,"역장 발생기",
				depth-1,16,16,NanumSquare_Regular_16,argument1,c_dkgray,room_speed*1,room_speed/2,id,1);
		}
	
		if(unit_skill_stand > 0)
		{
			if(passive_skill_index = 9)
			{
				unit_player_effect_add(id,EFFECT.DEFAULT_untouchable,0,room_speed*1,id);
			}
			if(passive_skill_index = 14)
			{
				unit_player_effect_add(id,EFFECT.DAMAGE_Recive_ratio,0.3,room_speed*3,id);
			}
		}
		//unit_attack_bullet_amount -= unit_cc_skill_stand_consumption;
	}


}
