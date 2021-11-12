phy_active = true;

var _stat = global.airframe_information[unit_airframe_index];
unit_player_init(_stat[0],[_stat[1],0.5],[_stat[2],_stat[3]],[_stat[4]*0.0005,_stat[5],_stat[6],_stat[7],_stat[9],_stat[10]],1000*_stat[8]);

switch(passive_skill_index)
{
	case 3:
		unit_player_effect_add(id,EFFECT.PASSIVE_reload,-0.8,0,id);
		break;
	case 4:
		unit_player_effect_add(id,EFFECT.PASSIVE_revive,0,room_speed*16,id);
		break;
	case 7:
		unit_player_effect_add(id,EFFECT.PASSIVE_untouchable,room_speed*3,0,id);
		break;
	case 8:
		unit_player_effect_add(id,EFFECT.PASSIVE_speedmax,0.02,0,id);
		unit_player_effect_add(id,EFFECT.PASSIVE_speedmax_attack,0,0,id);
		unit_player_effect_add(id,EFFECT.PASSIVE_speedmax_damage,0,0,id);
		break;
	case 9:
		unit_player_effect_add(id,EFFECT.PASSIVE_skillcool,-0.4,0,id);
		break;
	case 10:
		unit_player_effect_add(id,EFFECT.PASSIVE_Shell_trace,0,0,id);
		break;
	case 11:
		unit_player_effect_add(id,EFFECT.PASSIVE_Missile_trace,0,0,id);
		break;
	case 14:
		unit_player_effect_add(id,EFFECT.PASSIVE_Attack_damage,0.5,0,id);
		unit_player_effect_add(id,EFFECT.PASSIVE_Health_max,-0.2,0,id);
		break;
	case 15:
		unit_player_effect_add(id,EFFECT.PASSIVE_hide,[0.05,0.45],room_speed*2.5,id);
		break;
	case 16:
		unit_player_effect_add(id,EFFECT.PASSIVE_heavyequip,[0.4,0.2,0.1,0.2],0,id);
		break;
	case 17:
		unit_player_effect_add(id,EFFECT.PASSIVE_weakness_give,0,room_speed*10,id);
		break;
}

unit_skill_stand = 0;
switch(active_skill_index)
{
	default:
		unit_skill_stand_cool = 0*room_speed;
		break;
	case 1:
		unit_skill_stand_cool = 21*room_speed;
		break;
	case 2:
		unit_skill_stand_cool = 16*room_speed;
		break;
	case 3:
		unit_skill_stand_cool = 20*room_speed;
		break;
	case 4:
		unit_skill_stand_cool = 26*room_speed;
		break;
	case 5:
		unit_skill_stand_cool = 18*room_speed;
		break;
	case 6:
		unit_skill_stand_cool = 22*room_speed;
		break;
	case 7:
		unit_skill_stand_cool = 20*room_speed;
		break;
	case 8:
		unit_skill_stand_cool = 16*room_speed;
		break;
	case 9:
		unit_skill_stand_cool = 18*room_speed;
		break;
	case 10:
		unit_skill_stand_cool = 26*room_speed;
		break;
	case 11:
		unit_skill_stand_cool = 24*room_speed;
		break;
	case 12:
		unit_skill_stand_cool = 14*room_speed;
		break;
	case 13:
		unit_skill_stand_cool = 4*room_speed;
		break;
	case 14:
		unit_skill_stand_cool = 30*room_speed;
		break;
	case 15:
		unit_skill_stand_cool = 26*room_speed;
		unit_skill_stand = 3*room_speed;
		
		unit_player_effect_add(id,EFFECT.ACTIVE_timerewind_record,0,0,id);
		break;
	case 16:
		unit_skill_stand_cool = 14*room_speed;
		break;
	case 17:
		unit_skill_stand_cool = 18*room_speed;
		break;
	case 18:
		//unit_skill_stand_cool = 10*room_speed;
		
		//unit_player_effect_add(id,EFFECT.ACTIVE_timerewind_record,0,0,id);
		break;
}

//unit_player_effect_add(id,EFFECT.PASSIVE_skillcool,-0.58,0,id);
/*
var _ins = instance_create_depth(0,0,-1,Player_Drawer);
_ins.player_id = id;
_ins.player_position = player_position;
*/