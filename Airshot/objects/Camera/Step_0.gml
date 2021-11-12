camera_set_view_target(view_camera[0],id);

if(global.player_first != noone and global.player_second != noone)
{
	x += ((global.player_first.x+global.player_second.x)/2-x)/(room_speed/5);
	y += ((global.player_first.y+global.player_second.y)/2-y)/(room_speed/5);
	
	var _dis = point_distance(global.player_first.x,global.player_first.y,global.player_second.x,global.player_second.y)*1.25;
	
	_w += (max(960,_dis)-_w)/(room_speed/5);
	_h = (_w/ratio_w*ratio_h);
	
	camera_set_view_size(view_camera[0],_w,_h);
	camera_set_view_border(view_camera[0],_w,_h);
}
else if(global.player_first != noone)
{
	x += (global.player_first.x-x)/(room_speed/5);
	y += (global.player_first.y-y)/(room_speed/5);
	
	_w += (960/2-_w)/(room_speed/5);
	_h = (_w/ratio_w*ratio_h);
	
	camera_set_view_size(view_camera[0],_w,_h);
	camera_set_view_border(view_camera[0],_w,_h);
}
else if(global.player_second != noone)
{
	x += (global.player_second.x-x)/(room_speed/5);
	y += (global.player_second.y-y)/(room_speed/5);
	
	_w += (960/2-_w)/(room_speed/5);
	_h = (_w/ratio_w*ratio_h);
}
else
{
	x += (room_width/2-x)/(room_speed/4);
	y += (room_height/2-y)/(room_speed/4);
	_w += (room_width-_w)/(room_speed/4);
	_h = (_w/ratio_w*ratio_h);
}

//display_set_gui_size(_w,_h);

camera_set_view_size(view_camera[0],_w,_h);
camera_set_view_border(view_camera[0],_w,_h);