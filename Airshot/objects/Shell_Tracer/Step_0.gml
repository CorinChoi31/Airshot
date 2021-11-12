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
		part_emitter_region(global.partSys,partEmit,phy_position_x-16,phy_position_x+16,phy_position_y-16,phy_position_y+16,ps_shape_ellipse,ps_distr_invgaussian);
		if(player_position = 1)
			part_emitter_burst(global.partSys,partEmit,global.partShell[effect_id[1]],8);
		if(player_position = 2)
			part_emitter_burst(global.partSys,partEmit,global.partShell[effect_id[1]],8);
			
		instance_destroy();
		
		unit_player_effect_add(_player,EFFECT.SPEED_max_constant,-0.02,room_speed*2,player);
		
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