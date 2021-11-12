///@description particle_burst(id,pos[x_min/x_max/y_min/y_max/depth/num/type],life[min/max],blend,scale_increase,speed[min/max/increase],direction[min/max/addtional_direction],rotation[min/max/additional_rotation/rotation_relative],gravity[speed/direction],target)
///@param id,pos[x_min/x_max/y_min/y_max/depth/num/type/gauss/gauss_strength],life[min/max],blend,scale_increase,speed[min/max/increase],direction[min/max/addtional_direction],rotation[min/max/additional_rotation/rotation_relative],gravity[speed/direction],target
function particle_burst() {

	var arg0 = argument[0]; //id
	var arg1 = argument[1]; //pos
	var arg2 = argument[2]; //life
	var arg3 = argument[3]; //blend
	var arg4 = argument[4]; //scale
	var arg5 = argument[5]; //speed
	var arg6 = argument[6]; //direction
	var arg7 = argument[7]; //rotation
	var arg8 = argument[8]; //gravity
	var arg9 = argument[9]; //target

	var ins = noone;

	for(var i = 0; i < arg1[5]; i++)
	{
		if(!is_string(arg1[4]))
		{
			if(arg1[6] = 0)
			{
				if(array_length_1d(arg1) = 9)
				{
					if(arg1[7] = 0)
					{
						ins = instance_create_depth(irandom_range(arg1[0],arg1[1]),irandom_range(arg1[2],arg1[3]),arg1[4],particle_object);
					}
					if(arg1[7] = 1)
					{
						ins = instance_create_depth(random_gauss_range(arg1[0],arg1[1],arg1[8]),random_gauss_range(arg1[2],arg1[3],arg1[8]),arg1[4],particle_object);
					}
					if(arg1[7] = 2)
					{
						ins = instance_create_depth(random_invgauss_range(arg1[0],arg1[1],arg1[8]),random_invgauss_range(arg1[2],arg1[3],arg1[8]),arg1[4],particle_object);
					}
				
				}
				else
				{
					ins = instance_create_depth(irandom_range(arg1[0],arg1[1]),irandom_range(arg1[2],arg1[3]),arg1[4],particle_object);
				}
			}
			if(arg1[6] = 1)
			{
				var _ran_dir = random_range(0,360)
				var _cX = (arg1[0]+arg1[1])/2;
				var _cY = (arg1[2]+arg1[3])/2;
			
				if(array_length_1d(arg1) = 9)
				{
					if(arg1[7] = 0)
					{
						var _x = _cX + lengthdir_x(irandom_range(_cX-arg1[0],_cX-arg1[1]),_ran_dir);
						var _y = _cY + lengthdir_y(irandom_range(_cY-arg1[2],_cY-arg1[3]),_ran_dir);
					}
					if(arg1[7] = 1)
					{
						var _x = _cX + lengthdir_x(random_gauss_range(_cX-arg1[0],_cX-arg1[1],arg1[8]),_ran_dir);
						var _y = _cY + lengthdir_y(random_gauss_range(_cY-arg1[2],_cY-arg1[3],arg1[8]),_ran_dir);
					}
					if(arg1[7] = 2)
					{
						var _x = _cX + lengthdir_x(random_invgauss_range(_cX-arg1[0],_cX-arg1[1],arg1[8]),_ran_dir);
						var _y = _cY + lengthdir_y(random_invgauss_range(_cY-arg1[2],_cY-arg1[3],arg1[8]),_ran_dir);
					}
				}
				else
				{
					var _x = _cX + lengthdir_x(irandom_range(_cX-arg1[0],_cX-arg1[1]),_ran_dir);
					var _y = _cY + lengthdir_y(irandom_range(_cY-arg1[2],_cY-arg1[3]),_ran_dir);
				}
				ins = instance_create_depth(_x,_y,arg1[4],particle_object);
			}
		}
		else
		{
			if(arg1[6] = 0)
				var ins = instance_create_layer(irandom_range(arg1[0],arg1[1]),irandom_range(arg1[2],arg1[3]),arg1[4],particle_object);
			if(arg1[6] = 1)
			{
				var _ran_dir = random_range(0,360)
				var _cX = (arg1[0]+arg1[1])/2;
				var _cY = (arg1[2]+arg1[3])/2;
				var _x = _cX + lengthdir_x(irandom_range(_cX-arg1[0],_cX-arg1[1]),_ran_dir);
				var _y = _cY + lengthdir_y(irandom_range(_cY-arg1[2],_cY-arg1[3]),_ran_dir);
				var ins = instance_create_layer(_x,_y,arg1[4],particle_object);
			}
		}
		with(ins)
		{
				life = irandom_range(arg2[0],arg2[1]);
				blend = arg3;
			var _sprite = ds_list_find_value(global.particle_sprite,arg0)
				sprite = _sprite[0];
				subimg = _sprite[1];
			var _scale = ds_list_find_value(global.particle_scale,arg0);
				scaleX = _scale[0];
				scaleY = _scale[1];
				scaleS = random_range(_scale[2],_scale[3]);
				scale_add = arg4/room_speed;
			for(var j = 0; j < array_length_1d(ds_list_find_value(global.particle_color,arg0)); j++)
			{
				var _color = ds_list_find_value(global.particle_color,arg0);
				color[j] = _color[j];
				dcolor = _color[0];
				_h = color_get_hue(_color[0]);
				_s = color_get_saturation(_color[0]);
				_v = color_get_value(_color[0]);
				_r = color_get_red(_color[0]);
				_g = color_get_green(_color[0]);
				_b = color_get_blue(_color[0]);
			}
			for(var j = 0; j < array_length_1d(ds_list_find_value(global.particle_alpha,arg0)); j++)
			{
				var _alpha = ds_list_find_value(global.particle_alpha,arg0);
				alpha[j] = _alpha[j];
				dalpha = _alpha[0];
			}
				speed = random_range(arg5[0],arg5[1]);
				speed_add = arg5[2];
				direction = random_range(arg6[0],arg6[1]);
				direction_add = arg6[2];
				image_angle = random_range(arg7[0],arg7[1]);
				image_angle_add = arg7[2];
				image_angle_relative = arg7[3];
				gravity = arg8[0]/room_speed;
				gravity_direction = arg8[1];
			
				target = arg9[0];
				if(arg9[0] != noone)
				{
					targeting = arg9[1];
					firstX = arg9[0].x;
					firstY = arg9[0].y;
				}
		
				image_xscale = scaleX*scaleS;
				image_yscale = scaleY*scaleS;
				if(image_angle_relative = true)
					image_angle += direction;
			
				alpha_change = 0;
				alpha_change_tick = life/(array_length_1d(alpha)-1);
				alpha_change_common_tick = life/(array_length_1d(alpha)-1);
				color_change = 0;
				color_change_tick = life/(array_length_1d(color)-1);
				color_change_common_tick = life/(array_length_1d(color)-1);
		}
	}


}
