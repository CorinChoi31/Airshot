var _scale = _w/1080;

if(global.player_first != noone and global.player_second != noone)
{
	draw_set_font(WalkwayObliqueBold_Regular_24);
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_bottom);
	
	draw_set_color(c_white);
	
	var _dis = point_distance(global.player_first.x,global.player_first.y,global.player_second.x,global.player_second.y)*1.25;
	
	draw_set_alpha((_dis-1080)/(1080));
	draw_set_color(c_red);
	draw_circle(global.player_first.x,global.player_first.y,24*_scale,true);
	draw_set_color(c_aqua);
	draw_circle(global.player_second.x,global.player_second.y,24*_scale,true);
	
	draw_set_alpha(max((_dis-1080*2)/(1080*2),0.5));
	draw_set_color(c_red);
	draw_circle(global.player_first.x,global.player_first.y,global.player_first.unit_cc_attack_auto_target,true);
	draw_set_color(c_aqua);
	draw_circle(global.player_second.x,global.player_second.y,global.player_second.unit_cc_attack_auto_target,true);
	
	draw_set_alpha(0.75);
	
	draw_set_color(c_red);
	var _rot_angle = global.player_first.unit_cc_attack_bullet_speed*100;
	
	var _dir = point_direction(global.player_first.x,global.player_first.y,global.player_second.x,global.player_second.y);
	var _dir_auto = point_direction(global.player_first.x,global.player_first.y,global.player_second.x+global.player_second.phy_speed_x*(_dis/(25*_rot_angle)),global.player_second.y+global.player_second.phy_speed_y*(_dis/(25*_rot_angle)))
	
	draw_circle(global.player_first.x+lengthdir_x(64,-global.player_first.phy_rotation+90),global.player_first.y+lengthdir_y(64,-global.player_first.phy_rotation+90),4*_scale,false);
	draw_circle(global.player_first.x+lengthdir_x(48,_dir),global.player_first.y+lengthdir_y(48,_dir),3*_scale,true);
	draw_set_color(c_white);
	draw_circle(global.player_first.x+lengthdir_x(48,_dir_auto),global.player_first.y+lengthdir_y(48,_dir_auto),2*_scale,false);
	
	//draw_line_width(global.player_first.x,global.player_first.y,global.player_first.x+lengthdir_x(128,_dir_auto),global.player_first.y+lengthdir_y(128,_dir_auto),2);
	
	draw_set_color(c_aqua);
	var _rot_angle = global.player_second.unit_cc_attack_bullet_speed*100;
	
	var _dir = point_direction(global.player_second.x,global.player_second.y,global.player_first.x,global.player_first.y);
	var _dir_auto = point_direction(global.player_second.x,global.player_second.y,global.player_first.x+global.player_first.phy_speed_x*(_dis/(25*_rot_angle)),global.player_first.y+global.player_first.phy_speed_y*(_dis/(25*_rot_angle)));
	
	draw_circle(global.player_second.x+lengthdir_x(64,-global.player_second.phy_rotation+90),global.player_second.y+lengthdir_y(64,-global.player_second.phy_rotation+90),4*_scale,false);
	draw_circle(global.player_second.x+lengthdir_x(48,_dir),global.player_second.y+lengthdir_y(48,_dir),3*_scale,true);
	draw_set_color(c_white);
	draw_circle(global.player_second.x+lengthdir_x(48,_dir_auto),global.player_second.y+lengthdir_y(48,_dir_auto),2*_scale,false);
	
	//draw_line_width(global.player_second.x,global.player_second.y,global.player_second.x+lengthdir_x(128,_dir_auto),global.player_second.y+lengthdir_y(128,_dir_auto),2);
}