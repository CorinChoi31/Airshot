draw_set_font(font);
draw_set_halign(fa_center);
draw_set_valign(fa_middle);

var _w = string_width(text)*scale;
var _h = string_height(text)*scale;

var _a = min(time/time_alpha,1);

var _v = 1-(max(time-time_alpha,0)/time_origin);

draw_set_color(c_gray);
draw_set_alpha(_a*0.25);
if(follower != noone)
{
	x += (follower.x-x)/(room_speed/5);
	y += (follower.y-y)/(room_speed/5);
	
	if(!instance_exists(follower))
	{
		follower = noone;	
	}
}

gpu_set_blendmode(bm_max);
draw_set_color(text_bg_color);
draw_set_alpha(_a*0.5);
draw_rectangle(x-_w/2-space_w*scale,y-_h/2-space_h*scale,x+_w/2+space_w*scale,y+_h/2+space_h*scale,false);

if(mode = 1)
{
	if(_v > 0)
	{
		draw_set_color(text_color);
		draw_set_alpha(_a*0.75);
		draw_rectangle(x-_w/2-space_w*scale+_v*((_w/2)+space_w*scale),y+_h/2+space_h*scale,x+_w/2+space_w*scale-_v*((_w/2)+space_w*scale),y+_h/2+space_h*scale+space_h/2,false);
	}
}

gpu_set_blendmode(bm_add);
draw_set_color(text_color);
draw_set_alpha(_a);
draw_text_transformed(x,y,text,scale,scale,0);

gpu_set_blendmode(bm_normal);
draw_set_color(c_white);
draw_set_alpha(1);

if(time > 0)
{
	time--;
	if(time <= 0)
	{
		instance_destroy();	
	}
}

