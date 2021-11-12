physics_world_update_speed(room_speed);
instance_create_depth(room_width/2,room_height/2,10,Block);

/*
if(_t = 0)
{
	var _f = 960;
	for(var i = _f; i <= room_width-_f; i += 64)
	{
		instance_create_depth(i,_f,10,Block);
		instance_create_depth(i,room_height-_f,10,Block);
	}
	for(var i = _f; i <= room_height-_f; i += 64)
	{
		instance_create_depth(_f,i,10,Block);
		instance_create_depth(room_width-_f,i,10,Block);
	}
	
	repeat(irandom_range(room_width/480,room_width/120))
	{
		with(instance_create_depth(random_range(_f+128,room_width-_f-128),random_range(_f+128,room_width-_f-128),10,choose(Wall_01)))
		{
			phy_rotation = random(360);
			phy_fixed_rotation = false;	
		}
	}
	
}
else if(_t = 1)
{
	for(var i = 0; i < 360; i += 0.1)
	{
		var _c = collision_circle(room_width/2+lengthdir_x(room_width/16*7,i),room_height/2+lengthdir_y(room_height/16*7,i),32,Block,true,false)
		if(_c = noone)
		{
			var _ins = instance_create_depth(room_width/2+lengthdir_x(room_width/16*7,i),room_height/2+lengthdir_y(room_height/16*7,i),10,Block);
			_ins.phy_rotation = -point_direction(_ins.x,_ins.y,room_width/2,room_height/2);
		}
	}
	
	repeat(irandom_range(room_width/480,room_width/120))
	{
		var i = random(360);
		var _dis = random(room_width/16*7-128);
		var _x = room_width/2+lengthdir_x(_dis,i);
		var _y = room_height/2+lengthdir_y(_dis,i);
		
		with(instance_create_depth(_x,_y,10,choose(Wall_01)))
		{
			phy_rotation = random(360);
			phy_fixed_rotation = false;	
		}
	}
}
*/