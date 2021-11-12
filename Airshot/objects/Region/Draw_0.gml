var _ia = 60*(effect_amount/effect_amount_max);

var _color = c_white;
if(effect_type = 0)
{
	_color = c_lime;
}
if(effect_type = 1)
{
	_color = c_orange;
}

draw_set_alpha(0.15);
draw_circle_color(x,y,range_draw-range_draw/16,c_white,c_white,false);

draw_fan(x,y,range_draw-range_draw/16,range_draw,60,90,4,c_white,alpha,true);
draw_fan(x,y,range_draw-range_draw/16,range_draw,60,210,4,c_white,alpha,true);
draw_fan(x,y,range_draw-range_draw/16,range_draw,60,330,4,c_white,alpha,true);
	
draw_fan(x,y,range_draw-range_draw/16,range_draw,_ia,90,1,_color,alpha,false);
draw_fan(x,y,range_draw-range_draw/16,range_draw,_ia,210,1,_color,alpha,false);
draw_fan(x,y,range_draw-range_draw/16,range_draw,_ia,330,1,_color,alpha,false);