if(range > 0)
{
	range_draw += (range-range_draw)/(room_speed/4);
	alpha += (1-alpha)/(room_speed/4);
}
else
{
	range_draw += (0-range_draw)/(room_speed/10);
	alpha += (-0.1-alpha)/(room_speed/10);
}

if(alpha < 0)
{
	instance_destroy();
}

if(effect_on = true)
{
	var _dis = 0;
	if(effect_id = 0)
	{
		with(Bullet)
		{
			_dis = point_distance(x,y,other.x,other.y);
			if(_dis < other.range_draw)
			{
				if(other.effect_type = 0)
				{
					phy_speed_x += phy_speed_x/25;
					phy_speed_y += phy_speed_y/25;
				}
				else
				{
					phy_speed_x -= phy_speed_x/25;
					phy_speed_y -= phy_speed_y/25;
				}
			}
		}
		with(Shell)
		{
			_dis = point_distance(x,y,other.x,other.y);
			if(_dis < other.range_draw)
			{
				if(other.effect_type = 0)
				{
					phy_speed_x += phy_speed_x/25;
					phy_speed_y += phy_speed_y/25;
				}
				else
				{
					phy_speed_x -= phy_speed_x/25;
					phy_speed_y -= phy_speed_y/25;
				}
			}
		}
		with(Missile)
		{
			_dis = point_distance(x,y,other.x,other.y);
			if(_dis < other.range_draw)
			{
				if(other.effect_type = 0)
				{
					speeds -= speeds/25;
					speed_origin += speed_origin/25;
				}
				else
				{
					speeds -= speeds/25;
					speed_origin -= speed_origin/25;
				}
			}
		}
		other.effect_amount--;
	}
	else
	{
		with(global.player_first)
		{
			_dis = point_distance(x,y,other.x,other.y);
			if(_dis < other.range_draw)
			{
				if(other.effect_affect_first = 0)
				{
					other.effect_affect_first = room_speed;
			
					if(other.effect_type = 0)
					{
						switch(other.effect_id)
						{
							case 1:
								unit_player_effect_add(id,EFFECT.SPEED_max_constant,0.25,room_speed*2,noone);
								draw_text_rectangle_progress(other.x,other.y,"+이동속도 25%",
									depth-1,24,24,NanumSquare_Regular_16,c_lime,c_dkgray,room_speed*2,room_speed/4,id,1);
								other.effect_amount -= 25/2*2;
								break;
							case 2:
								unit_player_effect_add(id,EFFECT.DAMAGE_Send_ratio,0.15,room_speed*3,noone);
								draw_text_rectangle_progress(other.x,other.y,"+주는 피해량 15%",
									depth-1,24,24,NanumSquare_Regular_16,c_lime,c_dkgray,room_speed*3,room_speed/4,id,1);
								other.effect_amount -= 15/2*3;
								break;
							case 3:
								unit_player_effect_add(id,EFFECT.DAMAGE_Recive_ratio,-0.125,room_speed*4,noone);
								draw_text_rectangle_progress(other.x,other.y,"-받는 피해량 12.5%",
									depth-1,24,24,NanumSquare_Regular_16,c_lime,c_dkgray,room_speed*4,room_speed/4,id,1);
								other.effect_amount -= 12.5/2*4;
								break;
							case 4:
								unit_player_effect_add(id,EFFECT.ATTACK_damage,unit_attack_damage*0.25,room_speed*2,noone);
								draw_text_rectangle_progress(other.x,other.y,"+공격력 25%",
									depth-1,24,24,NanumSquare_Regular_16,c_lime,c_dkgray,room_speed*2,room_speed/4,id,1);
								other.effect_amount -= 25/2*2;
								break;
							case 5:
								unit_player_effect_add(id,EFFECT.ATTACK_speed,-unit_attack_speed_cool*0.25,room_speed*2,noone);
								draw_text_rectangle_progress(other.x,other.y,"+공격속도 25%",
									depth-1,24,24,NanumSquare_Regular_16,c_lime,c_dkgray,room_speed*2,room_speed/4,id,1);
								other.effect_amount -= 25/2*2;
								break;
							case 6:
								unit_player_effect_add(id,EFFECT.ATTACK_Bullet_speed,unit_attack_bullet_speed*0.50,room_speed*2,noone);
								draw_text_rectangle_progress(other.x,other.y,"+탄알속력 50%",
									depth-1,24,24,NanumSquare_Regular_16,c_lime,c_dkgray,room_speed*2,room_speed/4,id,1);
								other.effect_amount -= 50/2*2;
								break;
							case 7:
								unit_player_effect_add(id,EFFECT.ATTACK_Bullet_reload,-unit_attack_bullet_reload_cool*0.3,room_speed*2,noone);
								draw_text_rectangle_progress(other.x,other.y,"-재장전 30%",
									depth-1,24,24,NanumSquare_Regular_16,c_lime,c_dkgray,room_speed*2,room_speed/4,id,1);
								other.effect_amount -=30/2*2;
								break;
							case 8:
								if(unit_skill_stand > room_speed*2)
								{
									unit_skill_stand -= room_speed*2;
								}
								draw_text_rectangle_progress(other.x,other.y,"주 기술 재사용 대기시간 감소",
									depth-1,24,24,NanumSquare_Regular_16,c_lime,c_dkgray,room_speed*0.5,room_speed/4,id,1);
								other.effect_amount -= 120;
								break;
							case 9:
								unit_player_effect_add(id,EFFECT.ACTIVE_Heal_regeneration,10,room_speed*1,noone);
								draw_text_rectangle_progress(other.x,other.y,"+수리 10",
									depth-1,24,24,NanumSquare_Regular_16,c_lime,c_dkgray,room_speed*1,room_speed/4,id,1);
								other.effect_amount -= 10;
								break;
						}
					}
					else
					{
						switch(other.effect_id)
						{
							case 1:
								unit_player_effect_add(id,EFFECT.SPEED_max_constant,-0.25,room_speed*2,noone);
								draw_text_rectangle_progress(other.x,other.y,"-이동속도 25%",
									depth-1,24,24,NanumSquare_Regular_16,c_orange,c_dkgray,room_speed*2,room_speed/4,id,1);
								other.effect_amount -= 25*2;
								break;
							case 2:
								unit_player_effect_add(id,EFFECT.DAMAGE_Send_ratio,-0.1,room_speed*3,noone);
								draw_text_rectangle_progress(other.x,other.y,"-주는 피해량 10%",
									depth-1,24,24,NanumSquare_Regular_16,c_orange,c_dkgray,room_speed*3,room_speed/4,id,1);
								other.effect_amount -= 10*3;
								break;
							case 3:
								unit_player_effect_add(id,EFFECT.DAMAGE_Recive_ratio,+0.10,room_speed*4,noone);
								draw_text_rectangle_progress(other.x,other.y,"+받는 피해량 10%",
									depth-1,24,24,NanumSquare_Regular_16,c_orange,c_dkgray,room_speed*4,room_speed/4,id,1);
								other.effect_amount -= 10*4;
								break;
							case 4:
								unit_player_effect_add(id,EFFECT.ATTACK_damage,-unit_attack_damage*0.1,room_speed*2,noone);
								draw_text_rectangle_progress(other.x,other.y,"-공격력 10%",
									depth-1,24,24,NanumSquare_Regular_16,c_orange,c_dkgray,room_speed*2,room_speed/4,id,1);
								other.effect_amount -= 10*2;
								break;
							case 5:
								unit_player_effect_add(id,EFFECT.ATTACK_speed,+unit_attack_speed_cool*0.25,room_speed*2,noone);
								draw_text_rectangle_progress(other.x,other.y,"-공격속도 25%",
									depth-1,24,24,NanumSquare_Regular_16,c_orange,c_dkgray,room_speed*2,room_speed/4,id,1);
								other.effect_amount -= 25*2;
								break;
							case 6:
								unit_player_effect_add(id,EFFECT.ATTACK_Bullet_speed,-unit_attack_bullet_speed*0.25,room_speed*2,noone);
								draw_text_rectangle_progress(other.x,other.y,"-탄알속력 25%",
									depth-1,24,24,NanumSquare_Regular_16,c_orange,c_dkgray,room_speed*2,room_speed/4,id,1);
								other.effect_amount -= 25*2;
								break;
							case 7:
								unit_player_effect_add(id,EFFECT.ATTACK_Bullet_reload,+unit_attack_bullet_reload_cool*0.25,room_speed*2,noone);
								draw_text_rectangle_progress(other.x,other.y,"+재장전 25%",
									depth-1,24,24,NanumSquare_Regular_16,c_orange,c_dkgray,room_speed*2,room_speed/4,id,1);
								other.effect_amount -= 25*2;
								break;
							case 8:
								if(unit_skill_stand > 0)
								{
									unit_skill_stand += room_speed*1;
								}
								draw_text_rectangle_progress(other.x,other.y,"주 기술 재사용 대기시간 증가",
									depth-1,24,24,NanumSquare_Regular_16,c_orange,c_dkgray,room_speed*1,room_speed/4,id,1);
								other.effect_amount -= 120;
								break;
							case 9:
								if(unit_health > 10)
								{
									unit_player_damage_add(id,0,10,noone);
								}
								draw_text_rectangle_progress(other.x,other.y,"-손상 10",
									depth-1,24,24,NanumSquare_Regular_16,c_orange,c_dkgray,room_speed*1,room_speed/4,id,1);
								other.effect_amount -= 20;
								break;
						}
					}
				}
			}
		}

		with(global.player_second)
		{
			_dis = point_distance(x,y,other.x,other.y);
			if(_dis < other.range)
			{
				if(other.effect_affect_second = 0)
				{
					other.effect_affect_second = room_speed;
			
					if(other.effect_type = 0)
					{
						switch(other.effect_id)
						{
							case 1:
								unit_player_effect_add(id,EFFECT.SPEED_max_constant,0.25,room_speed*2,noone);
								draw_text_rectangle_progress(other.x,other.y,"+이동속도 25%",
									depth-1,24,24,NanumSquare_Regular_16,c_lime,c_dkgray,room_speed*2,room_speed/4,id,1);
								other.effect_amount -= 25/2*2;
								break;
							case 2:
								unit_player_effect_add(id,EFFECT.DAMAGE_Send_ratio,0.15,room_speed*3,noone);
								draw_text_rectangle_progress(other.x,other.y,"+주는 피해량 15%",
									depth-1,24,24,NanumSquare_Regular_16,c_lime,c_dkgray,room_speed*3,room_speed/4,id,1);
								other.effect_amount -= 15/2*3;
								break;
							case 3:
								unit_player_effect_add(id,EFFECT.DAMAGE_Recive_ratio,-0.125,room_speed*4,noone);
								draw_text_rectangle_progress(other.x,other.y,"-받는 피해량 12.5%",
									depth-1,24,24,NanumSquare_Regular_16,c_lime,c_dkgray,room_speed*4,room_speed/4,id,1);
								other.effect_amount -= 12.5/2*4;
								break;
							case 4:
								unit_player_effect_add(id,EFFECT.ATTACK_damage,unit_attack_damage*0.25,room_speed*2,noone);
								draw_text_rectangle_progress(other.x,other.y,"+공격력 25%",
									depth-1,24,24,NanumSquare_Regular_16,c_lime,c_dkgray,room_speed*2,room_speed/4,id,1);
								other.effect_amount -= 25/2*2;
								break;
							case 5:
								unit_player_effect_add(id,EFFECT.ATTACK_speed,-unit_attack_speed_cool*0.25,room_speed*2,noone);
								draw_text_rectangle_progress(other.x,other.y,"+공격속도 25%",
									depth-1,24,24,NanumSquare_Regular_16,c_lime,c_dkgray,room_speed*2,room_speed/4,id,1);
								other.effect_amount -= 25/2*2;
								break;
							case 6:
								unit_player_effect_add(id,EFFECT.ATTACK_Bullet_speed,unit_attack_bullet_speed*0.50,room_speed*2,noone);
								draw_text_rectangle_progress(other.x,other.y,"+탄알속력 50%",
									depth-1,24,24,NanumSquare_Regular_16,c_lime,c_dkgray,room_speed*2,room_speed/4,id,1);
								other.effect_amount -= 50/2*2;
								break;
							case 7:
								unit_player_effect_add(id,EFFECT.ATTACK_Bullet_reload,-unit_attack_bullet_reload_cool*0.30,room_speed*2,noone);
								draw_text_rectangle_progress(other.x,other.y,"-재장전 30%",
									depth-1,24,24,NanumSquare_Regular_16,c_lime,c_dkgray,room_speed*2,room_speed/4,id,1);
								other.effect_amount -=30/2*2;
								break;
							case 8:
								if(unit_skill_stand > room_speed*2)
								{
									unit_skill_stand -= room_speed*2;
								}
								draw_text_rectangle_progress(other.x,other.y,"주 기술 재사용 대기시간 감소",
									depth-1,24,24,NanumSquare_Regular_16,c_lime,c_dkgray,room_speed*1,room_speed/4,id,1);
								other.effect_amount -= 120;
								break;
							case 9:
								unit_player_effect_add(id,EFFECT.ACTIVE_Heal_regeneration,20,room_speed*1,noone);
								draw_text_rectangle_progress(other.x,other.y,"+수리 10",
									depth-1,24,24,NanumSquare_Regular_16,c_lime,c_dkgray,room_speed*1,room_speed/4,id,1);
								other.effect_amount -= 10;
								break;
						}
					}
					else
					{
						switch(other.effect_id)
						{
							case 1:
								unit_player_effect_add(id,EFFECT.SPEED_max_constant,-0.25,room_speed*2,noone);
								draw_text_rectangle_progress(other.x,other.y,"-이동속도 25%",
									depth-1,24,24,NanumSquare_Regular_16,c_orange,c_dkgray,room_speed*2,room_speed/4,id,1);
								other.effect_amount -= 25*2;
								break;
							case 2:
								unit_player_effect_add(id,EFFECT.DAMAGE_Send_ratio,-0.10,room_speed*3,noone);
								draw_text_rectangle_progress(other.x,other.y,"-주는 피해량 10%",
									depth-1,24,24,NanumSquare_Regular_16,c_orange,c_dkgray,room_speed*3,room_speed/4,id,1);
								other.effect_amount -= 10*3;
								break;
							case 3:
								unit_player_effect_add(id,EFFECT.DAMAGE_Recive_ratio,+0.10,room_speed*4,noone);
								draw_text_rectangle_progress(other.x,other.y,"+받는 피해량 10%",
									depth-1,24,24,NanumSquare_Regular_16,c_orange,c_dkgray,room_speed*4,room_speed/4,id,1);
								other.effect_amount -= 10*4;
								break;
							case 4:
								unit_player_effect_add(id,EFFECT.ATTACK_damage,-unit_attack_damage*0.10,room_speed*2,noone);
								draw_text_rectangle_progress(other.x,other.y,"-공격력 10%",
									depth-1,24,24,NanumSquare_Regular_16,c_orange,c_dkgray,room_speed*2,room_speed/4,id,1);
								other.effect_amount -= 10*2;
								break;
							case 5:
								unit_player_effect_add(id,EFFECT.ATTACK_speed,+unit_attack_speed_cool*0.25,room_speed*2,noone);
								draw_text_rectangle_progress(other.x,other.y,"-공격속도 25%",
									depth-1,24,24,NanumSquare_Regular_16,c_orange,c_dkgray,room_speed*2,room_speed/4,id,1);
								other.effect_amount -= 25*2;
								break;
							case 6:
								unit_player_effect_add(id,EFFECT.ATTACK_Bullet_speed,-unit_attack_bullet_speed*0.25,room_speed*2,noone);
								draw_text_rectangle_progress(other.x,other.y,"-탄알속력 25%",
									depth-1,24,24,NanumSquare_Regular_16,c_orange,c_dkgray,room_speed*2,room_speed/4,id,1);
								other.effect_amount -= 25*2;
								break;
							case 7:
								unit_player_effect_add(id,EFFECT.ATTACK_Bullet_reload,+unit_attack_bullet_reload_cool*0.25,room_speed*2,noone);
								draw_text_rectangle_progress(other.x,other.y,"+재장전 25%",
									depth-1,24,24,NanumSquare_Regular_16,c_orange,c_dkgray,room_speed*2,room_speed/4,id,1);
								other.effect_amount -= 25*2;
								break;
							case 8:
								if(unit_skill_stand > 0 and unit_skill_stand <= unit_cc_skill_stand_cool)
								{
									unit_skill_stand = min(unit_skill_stand+room_speed*1,unit_cc_skill_stand_cool);
								}
								draw_text_rectangle_progress(other.x,other.y,"주 기술 재사용 대기시간 증가",
									depth-1,24,24,NanumSquare_Regular_16,c_orange,c_dkgray,room_speed*1,room_speed/4,id,1);
								other.effect_amount -= 120;
								break;
							case 9:
								if(unit_health > 10)
								{
									unit_player_damage_add(id,0,10,noone);
								}
								draw_text_rectangle_progress(other.x,other.y,"-손상 10",
									depth-1,24,24,NanumSquare_Regular_16,c_orange,c_dkgray,room_speed*1,room_speed/4,id,1);
								other.effect_amount -= 20;
								break;
						}
					}
				}
			}
		}
	}
}
else
{
	effect_amount += effect_amount_max/room_speed;
	if(effect_amount = effect_amount_max)
	{
		effect_on = true;
	}
}

if(effect_affect_first > 0)
{
	effect_affect_first--;	
}
if(effect_affect_second > 0)
{
	effect_affect_second--;	
}

if(effect_on = true)
{
	effect_amount--;
	if(effect_amount <= 0)
	{
		range = 0;	
	}
}