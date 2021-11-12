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

var _projectTile = collision_line(prevX,prevY,phy_position_x,phy_position_y,ProjectTile,true,false);
if(_projectTile = noone)
{
	var _dir = point_direction(prevX,prevY,phy_position_x,phy_position_y);
	var _lx = lengthdir_x(width,_dir+90);
	var _ly = lengthdir_y(width,_dir+90);
	
	_projectTile = collision_line(prevX+_lx,prevY+_ly,phy_position_x+_lx,phy_position_y+_ly,ProjectTile,true,false);
}
if(_projectTile = noone)
{
	var _dir = point_direction(prevX,prevY,phy_position_x,phy_position_y);
	var _lx = lengthdir_x(width,_dir-90);
	var _ly = lengthdir_y(width,_dir-90);
	
	_projectTile = collision_line(prevX+_lx,prevY+_ly,phy_position_x+_lx,phy_position_y+_ly,ProjectTile,true,false);
}

if(_player != noone)
{
	if(_player.player_position != player_position)
	{
		instance_destroy();
	}
}

if(_projectTile != noone)
{
	if(instance_exists(_projectTile) and _projectTile.player_position != player_position)
	{
		instance_destroy();
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
		part_emitter_burst(global.partSys,partEmit,global.partMissile[effect_id[0]],1);
	if(player_position = 2)
		part_emitter_burst(global.partSys,partEmit,global.partMissile[effect_id[0]],1);
}

speeds += (speed_origin-speeds)/(speed_accel);

phy_speed_x += (lengthdir_x(speeds,-phy_rotation+90)-phy_speed_x)/(room_speed/10);
phy_speed_y += (lengthdir_y(speeds,-phy_rotation+90)-phy_speed_y)/(room_speed/10);

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