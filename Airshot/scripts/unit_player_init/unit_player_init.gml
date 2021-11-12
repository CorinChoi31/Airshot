///@description
///@function unit_player_init(health,speed[max/accel],attack[damage/speed],bullet[speed/duration/amount/reload/multi/multi_angle],auto_target_range)
function unit_player_init(argument0, argument1, argument2, argument3, argument4) {

	///@param health
	///@param speed[max/accel]
	///@param attack[damage/speed]
	///@param bullet[speed/duration/amount/reload/multi/multi_angle]
	///@param auto_target_range

#region Default
		unit_health = argument0;
		unit_health_max = argument0;
		unit_health_prev = argument0;
		unit_health_prev_draw = 0;
	
		unit_speed = 0;
		unit_speed_max = argument1[0];
		unit_speed_accel = argument1[1];

		unit_damage_send_ratio = 1;
		unit_damage_recive_ratio = 1;
	
		unit_attack_damage = argument2[0];
		unit_attack_speed = 0;
		unit_attack_speed_cool = room_speed/argument2[1];

		unit_attack_bullet_speed = argument3[0];
		unit_attack_bullet_duration = argument3[1]*room_speed;
		unit_attack_bullet_amount = 0;
		unit_attack_bullet_amount_max = argument3[2];
		unit_attack_bullet_reload = 0;
		unit_attack_bullet_reload_cool = argument3[3]*room_speed;
		unit_attack_bullet_multiple_shot = argument3[4];
		unit_attack_bullet_multiple_shot_angle = argument3[5];
	
		unit_skill_stand = 0;
		unit_skill_stand_cool = 0;
		unit_skill_stand_consumption = 0;
	
		unit_dead = false;
		unit_dead_trig = true;
	
		unit_attack_auto_target = argument4;
#endregion

#region Default
		unit_health_draw = unit_health;
		unit_health_max_draw = unit_health_max;
#endregion

#region List
		unit_effect_id = ds_list_create();
		unit_effect_tick = ds_list_create();
		unit_effect_tick_origin = ds_list_create();
		unit_effect_amount = ds_list_create();
		unit_effect_amount_origin = ds_list_create();
		unit_effect_first = ds_list_create();
		unit_effect_sender = ds_list_create();

		unit_damage_id = ds_list_create();
		unit_damage_amount = ds_list_create();
		unit_damage_sender = ds_list_create();
	
		unit_skill_record = ds_list_create();
#endregion

#region Effects
		unit_effect_health_max = 0;

		unit_effect_speed_max = 0;
		unit_effect_speed_accel = 0

		unit_effect_damage_send_ratio = 0;
		unit_effect_damage_recive_ratio = 0;
	
		unit_effect_attack_damage = 0;
		unit_effect_attack_speed_cool = 0;
	
		unit_effect_attack_bullet_speed = 0;
		unit_effect_attack_bullet_duration = 0;
		unit_effect_attack_bullet_amount_max = 0;
		unit_effect_attack_bullet_reload_cool = 0;
	
		unit_effect_skill_stand_cool = 0;
		unit_effect_skill_stand_consumption = 0;
	
		unit_effect_attack_auto_target = 0;
#endregion

#region Calcurate
		unit_cc_health_max = unit_health_max+unit_effect_health_max;

		unit_cc_speed_max = unit_speed_max+unit_effect_speed_max;
		unit_cc_speed_accel = unit_speed_accel+unit_effect_speed_accel;

		unit_cc_damage_send_ratio = unit_damage_send_ratio+unit_effect_damage_send_ratio;
		unit_cc_damage_recive_ratio = unit_damage_recive_ratio+unit_effect_damage_recive_ratio;
	
		unit_cc_attack_damage = unit_attack_damage+unit_effect_attack_damage;
		unit_cc_attack_speed_cool = unit_attack_speed_cool+unit_effect_attack_speed_cool;
	
		unit_cc_attack_bullet_speed = unit_attack_bullet_speed+unit_effect_attack_bullet_speed;
		unit_cc_attack_bullet_duration = unit_attack_bullet_duration+unit_effect_attack_bullet_duration;
		unit_cc_attack_bullet_amount_max = unit_attack_bullet_amount_max+unit_effect_attack_bullet_amount_max;
		unit_cc_attack_bullet_reload_cool = unit_attack_bullet_reload_cool+unit_effect_attack_bullet_reload_cool;
	
		unit_cc_skill_stand_cool = unit_skill_stand_cool+unit_effect_skill_stand_cool;
		unit_cc_skill_stand_consumption = unit_skill_stand_consumption+unit_effect_skill_stand_consumption;
	
		unit_cc_attack_auto_target = unit_attack_auto_target+unit_effect_attack_auto_target;
#endregion


}
