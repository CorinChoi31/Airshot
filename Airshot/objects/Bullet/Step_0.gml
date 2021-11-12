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
		part_emitter_region(global.partSys,partEmit,phy_position_x-32,phy_position_x+32,phy_position_y-32,phy_position_y+32,ps_shape_ellipse,ps_distr_linear);
		if(player_position = 1)
			part_emitter_burst(global.partSys,partEmit,global.partBullet[m_First_Bullet_Hit],16);
		if(player_position = 2)
			part_emitter_burst(global.partSys,partEmit,global.partBullet[m_Second_Bullet_Hit],16);
		
		if(passive_id = 8)
		{
			var _search = unit_player_effect_search(player,EFFECT.PASSIVE_speedmax_attack,0,0,[BUFF.SEARCH_AMOUNT,BUFF.SEARCH_MOREorSAME]);
			if(is_array(_search))
			{
				if(player.unit_effect_amount[|_search[0]] < 0.20)
				{
					player.unit_effect_amount[|_search[0]] += 0.02;
				}
			}
		}
		if(passive_id = 10)
		{
			var _search = unit_player_effect_search(player,EFFECT.PASSIVE_Shell_trace,0,0,[BUFF.SEARCH_AMOUNT,BUFF.SEARCH_MOREorSAME]);
			if(is_array(_search))
				player.unit_effect_amount[|_search[0]] += 1;
		}
		if(passive_id = 11)
		{
			var _search = unit_player_effect_search(player,EFFECT.PASSIVE_Missile_trace,0,0,[BUFF.SEARCH_AMOUNT,BUFF.SEARCH_MOREorSAME]);
			if(is_array(_search))
				player.unit_effect_amount[|_search[0]] += 1;
		}
		if(passive_id = 12)
		{
			var _search = unit_player_effect_search(_player,EFFECT.PASSIVE_ignite,0,0,[BUFF.SEARCH_AMOUNT,BUFF.SEARCH_MOREorSAME]);
			if(is_array(_search))
			{
				_player.unit_effect_tick[|_search[0]] = room_speed*4;
			}
			else
			{
				unit_player_effect_add(_player,EFFECT.PASSIVE_ignite,damage*0.40,room_speed*4,player);
			}
		}
		
		unit_player_damage_add(_player,0,damage,player);
		
		instance_destroy();
	}
}


var _pdis = point_distance(prevX,prevY,phy_position_x,phy_position_y);
var _pdir = point_direction(prevX,prevY,phy_position_x,phy_position_y);
var _x = 0;
var _y = 0;
for(var i = 0; i < max(round(_pdis/5)*5, 1); i += 5)
{
	for(var j = -width/2; j <= width/2; j += 4)
	{
		_x = prevX+lengthdir_x(j,_pdir+90)+lengthdir_x(i,_pdir);
		_y = prevY+lengthdir_y(j,_pdir+90)+lengthdir_y(i,_pdir);
		part_emitter_region(global.partSys,partEmit,_x,_x,_y,_y,ps_shape_rectangle,ps_distr_linear);
		if(player_position = 1)
			part_emitter_burst(global.partSys,partEmit,global.partBullet[m_First_Bullet_Trail],1);
		if(player_position = 2)
			part_emitter_burst(global.partSys,partEmit,global.partBullet[m_Second_Bullet_Trail],1);
	}
}

prevX = phy_position_x;
prevY = phy_position_y;

if(phy_active = true)
{
	if(duration > 0)
	{
		duration--;
		passive_keep++;
		
		if(duration <= 0)
		{
			instance_destroy();
		}
	}
	
	if(passive_id = 5)
	{
		if(passive_keep > room_speed and passive_keep <= room_speed*5)
		{
			damage -= (damage_origin*0.75/4)/room_speed;
		}
	}
}