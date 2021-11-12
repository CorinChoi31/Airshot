if(camera_enable)
{
	var _camera_velocity = 1;
	
	if(camera_fov != camera_fov_target
		or camera_aspect != camera_aspect_target
		or camera_znear != camera_znear_target
		or camera_zfar != camera_zfar_target
	)
	{
		repeat(_repeat)
		{
			camera_fov = lerp(camera_fov, camera_fov_target, _camera_velocity);
			camera_aspect = lerp(camera_aspect, camera_aspect_target, _camera_velocity);
			camera_znear = lerp(camera_znear, camera_znear_target, _camera_velocity);
			camera_zfar = lerp(camera_zfar, camera_zfar_target, _camera_velocity);
		}
	}
	
	if(camera_xfrom != camera_xfrom_target
		or camera_yfrom != camera_yfrom_target
		or camera_zfrom != camera_zfrom_target
	)
	{
		repeat(_repeat)
		{
			camera_xfrom = lerp(camera_xfrom, camera_xfrom_target, _camera_velocity);
			camera_yfrom = lerp(camera_yfrom, camera_yfrom_target, _camera_velocity);
			camera_zfrom = lerp(camera_zfrom, camera_zfrom_target, _camera_velocity);
		}
	}
	if(camera_xto != camera_xto_target
		or camera_yto != camera_yto_target
		or camera_zto != camera_zto_target
	)
	{
		repeat(_repeat)
		{
			camera_xto = lerp(camera_xto, camera_xto_target, _camera_velocity);
			camera_yto = lerp(camera_yto, camera_yto_target, _camera_velocity);
			camera_zto = lerp(camera_zto, camera_zto_target, _camera_velocity);
		}
	}
	if(camera_xvec != camera_xvec_target
		or camera_yvec != camera_yvec_target
		or camera_zvec != camera_zvec_target
	)
	{
		repeat(_repeat)
		{
			camera_xvec = lerp(camera_xvec, camera_xvec_target, _camera_velocity);
			camera_yvec = lerp(camera_yvec, camera_yvec_target, _camera_velocity);
			camera_zvec = lerp(camera_zvec, camera_zvec_target, _camera_velocity);
		}
	}
	
	if(camera_width != camera_width_target
		or camera_height != camera_height_target
	)
	{
		repeat(_repeat)
		{
			camera_width = lerp(camera_width, camera_width_target, _camera_velocity);
			camera_height = lerp(camera_height, camera_height_target, _camera_velocity);
		}
	}
	
	camera_set_view_size(camera, camera_width, camera_height);
	
	camera_matrix_projection = matrix_build_projection_perspective_fov(camera_fov, camera_aspect, camera_znear, camera_zfar);
	camera_set_proj_mat(camera, camera_matrix_projection);
	
	camera_matrix_lookat = matrix_build_lookat(camera_xfrom, camera_yfrom, camera_zfrom, camera_xto, camera_yto, camera_zto, camera_xvec, camera_yvec, camera_zvec);
	camera_set_view_mat(camera, camera_matrix_lookat);
}