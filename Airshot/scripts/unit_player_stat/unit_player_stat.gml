function unit_player_stat() {
	if(unit_health <= 0)
	{
		unit_dead = true;
	}
	if(unit_health > unit_cc_health_max)
	{
		unit_health = unit_cc_health_max;
	}

	unit_health = max(0,unit_health);

	if(unit_health_prev != unit_health)
	{
		unit_health_prev += min(1/(room_speed/4),abs((unit_health-unit_health_prev)/(room_speed/4)))*sign(unit_health-unit_health_prev);
		unit_health_prev_draw = room_speed;
	
		if(unit_health < unit_health_prev)
		{
			var _regeneration = min((unit_health_prev-unit_health)/(room_speed*10),2/room_speed);
			unit_player_effect_add(id,EFFECT.ACTIVE_Heal_instant,_regeneration+_regeneration*3*(passive_skill_index = 13),0,id);
		}
	
		if(unit_health_prev > unit_cc_health_max)
		{
			unit_health_prev = unit_cc_health_max;
		}
	}

	if(unit_attack_bullet_amount <= 0)
	{
		if(unit_attack_bullet_reload <= 0)
		{
			unit_attack_bullet_reload = max(unit_cc_attack_bullet_reload_cool,1);
		}
	}

	if(unit_health_prev_draw > 0)
	{
		unit_health_prev_draw--;
		if(unit_health_prev_draw = 0)
		{
			unit_health_prev = unit_health;
		}
	}
	if(unit_attack_speed > 0)
	{
		unit_attack_speed--;
	}
	if(unit_attack_bullet_amount <= 0)
	{
		if(unit_attack_bullet_reload > 0)
		{
			unit_attack_bullet_reload--;
			if(unit_attack_bullet_reload > unit_cc_attack_bullet_reload_cool)
			{
				unit_attack_bullet_reload += (unit_cc_attack_bullet_reload_cool-unit_attack_bullet_reload)
			}
		
			if(unit_attack_bullet_reload <= 0)
			{
				unit_attack_bullet_amount = max(unit_cc_attack_bullet_amount_max,0);
				//unit_attack_bullet_reload = max(unit_cc_attack_bullet_reload_cool,1);
			}
		}
	}
	if(unit_skill_stand > 0)
	{
		unit_skill_stand--;
		if(unit_skill_stand < 1)
		{
			unit_skill_stand = 0;
		}
	}


}
