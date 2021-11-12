if(life <= 0)
	instance_destroy();
if(life > 0)
	life--;
if(image_index != -1)
	image_speed = 0;

speed = max(speed+speed_add/room_speed,0);
direction += direction_add/room_speed;
image_angle += image_angle_add/room_speed;

image_xscale += scale_add;
image_yscale += scale_add;

dalpha += (alpha[min(alpha_change+1,array_length_1d(alpha)-1)]-dalpha)/max(sqrt(alpha_change_common_tick*4),1);

//var _dr = degtorad(direction);
x += hspeed//*cos(_dr);
y += vspeed//*sin(_dr);

if(target != noone)
{
	if(instance_exists(target))
	{
		if(targeting <= 0)
		{
			x += target.x-firstX;
			y += target.y-firstY;
		
			firstX = target.x;
			firstY = target.y;
		}
		else
		{
			x += (target.x-x)/targeting;
			y += (target.y-y)/targeting;
			
			if(image_angle_relative = true)
			{
				image_angle = point_direction(x,y,target.x,target.y);
			}
		}
	}
	else
	{
		target = noone;
	}
}

if(targeting >= 1)
{
	targeting += -targeting/life;
}

#region HSV
	/*
	_h += (color_get_hue(color[min(color_change+1,array_length_1d(color)-1)])-_h)/max(sqrt(color_change_common_tick*4),1);
	_s += (color_get_saturation(color[min(color_change+1,array_length_1d(color)-1)])-_s)/max(sqrt(color_change_common_tick*4),1);
	_v += (color_get_value(color[min(color_change+1,array_length_1d(color)-1)])-_v)/max(sqrt(color_change_common_tick*4),1);

	dcolor = make_color_hsv(_h,_s,_v);
	*/
#endregion

#region RGB
	_r += (color_get_red(color[min(color_change+1,array_length_1d(color)-1)])-_r)/max(sqrt(color_change_common_tick*4),1);
	_g += (color_get_green(color[min(color_change+1,array_length_1d(color)-1)])-_g)/max(sqrt(color_change_common_tick*4),1);
	_b += (color_get_blue(color[min(color_change+1,array_length_1d(color)-1)])-_b)/max(sqrt(color_change_common_tick*4),1);

	dcolor = make_color_rgb(_r,_g,_b);
#endregion

#region TICKS
alpha_change_tick--;
if(alpha_change_tick <= 0)
{
	alpha_change = min(alpha_change+1,array_length_1d(alpha)-1);
	alpha_change_tick = alpha_change_common_tick;
}
color_change_tick--;
if(color_change_tick <= 0)
{
	color_change = min(color_change+1,array_length_1d(color)-1);
	color_change_tick = color_change_common_tick;
}
#endregion

if(y-sprite_height/2*scaleY > room_height or y+sprite_height/2*scaleY < 0 or x-sprite_width/2*scaleX > room_width or x+sprite_width/2*scaleX < 0)
{
	instance_destroy();
}