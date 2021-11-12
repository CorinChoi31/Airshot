var _player = collision_line(prevX,prevY,phy_position_x,phy_position_y,Player,true,false);
if(_player = noone)
{
	var _dir = point_direction(prevX,prevY,phy_position_x,phy_position_y);
	var _lx = lengthdir_x(width,_dir+90);
	var _ly = lengthdir_y(width,_dir+90);
	
	_player = collision_line(prevX+_lx,prevY+_ly,phy_position_x+_lx,phy_position_y+_ly,Player,true,false);
}
if(_player = noone)
{
	var _dir = point_direction(prevX,prevY,phy_position_x,phy_position_y);
	var _lx = lengthdir_x(width,_dir-90);
	var _ly = lengthdir_y(width,_dir-90);
	
	_player = collision_line(prevX+_lx,prevY+_ly,phy_position_x+_lx,phy_position_y+_ly,Player,true,false);
}

if(_player != noone)
{
	if(_player.player_position != player_position)
	{
		part_emitter_region(global.partSys,partEmit,phy_position_x-64,phy_position_x+64,phy_position_y-64,phy_position_y+64,ps_shape_ellipse,ps_distr_invgaussian);
		if(player_position = 1)
			part_emitter_burst(global.partSys,partEmit,global.partShell[effect_id[1]],8);
		if(player_position = 2)
			part_emitter_burst(global.partSys,partEmit,global.partShell[effect_id[1]],8);
			
		instance_destroy();
		
		unit_player_effect_add(_player, EFFECT.SPEED_max_constant, -1, 2*room_speed, player);
		unit_player_damage_add(_player,0,damage,player);
	}
}

var _pdis = point_distance(prevX,prevY,phy_position_x,phy_position_y);
var _pdir = point_direction(prevX,prevY,phy_position_x,phy_position_y);
var _x = 0;
var _y = 0;
for(var i = 0; i <= round(_pdis/5)*5; i += 5)
{
	_x = prevX+lengthdir_x(i,_pdir);
	_y = prevY+lengthdir_y(i,_pdir);
	part_emitter_region(global.partSys,partEmit,_x,_x,_y,_y,ps_shape_rectangle,ps_distr_linear);
	if(player_position = 1)
		part_emitter_burst(global.partSys,partEmit,global.partShell[effect_id[0]],1);
	if(player_position = 2)
		part_emitter_burst(global.partSys,partEmit,global.partShell[effect_id[0]],1);
}

prevX = phy_position_x;
prevY = phy_position_y;

with(Player)
{
	if(player_position != other.player_position)
	{
		var _dis = point_distance(phy_position_x,phy_position_y,other.phy_position_x,other.phy_position_y);
		if(_dis < other.width *8)
		{
			unit_player_effect_add(id, EFFECT.SPEED_max_constant, -0.6, 0, other.player);
			
			/*
			if(other.player.passive_skill_index = 10)
			{
				var _search = unit_player_effect_search(other.player,EFFECT.PASSIVE_Shell_trace,0,0,[BUFF.SEARCH_AMOUNT,BUFF.SEARCH_MOREorSAME]);
				if(is_array(_search))
					//if(other.player.unit_effect_tick[|_search[0]] <= 0)
						other.player.unit_effect_amount[|_search[0]] += 1;
			}
			if(other.player.passive_skill_index = 11)
			{
				var _search = unit_player_effect_search(other.player,EFFECT.PASSIVE_Missile_trace,0,0,[BUFF.SEARCH_AMOUNT,BUFF.SEARCH_MOREorSAME]);
				if(is_array(_search))
					//if(other.player.unit_effect_tick[|_search[0]] <= 0)
						other.player.unit_effect_amount[|_search[0]] += 1;
			}
			*/
		}
	}
}	
with(Bullet)
{
	var _dis = point_distance(phy_position_x,phy_position_y,other.phy_position_x,other.phy_position_y);
	if(_dis < other.width *8)
	{
		phy_speed_x -= phy_speed_x/20; phy_speed_y -= phy_speed_y/20;
	}
}
with(Shell)
{
	var _dis = point_distance(phy_position_x,phy_position_y,other.phy_position_x,other.phy_position_y);
	if(_dis < other.width *8)
	{
		phy_speed_x -= phy_speed_x/20; phy_speed_y -= phy_speed_y/20;
	}
}
with(Missile)
{
	var _dis = point_distance(phy_position_x,phy_position_y,other.phy_position_x,other.phy_position_y);
	if(_dis < other.width *8)
	{
		speeds -= speeds/25;
		speed_origin -= speed_origin/25;
	}
}

if(phy_active = true)
{
	if(duration > 0)
	{
		duration--;
		if(duration <= 0)
		{
			instance_destroy();
		}
	}
}