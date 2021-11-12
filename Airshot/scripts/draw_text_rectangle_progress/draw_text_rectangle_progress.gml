///@function draw_text_rectangle_progress(x,y,string,depth,w,h,font,text_color,text_bg_color,time,time_alpha,follower,scale)
function draw_text_rectangle_progress(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9, argument10, argument11, argument12) {

	///@param x
	///@param y
	///@param string
	///@param depth
	///@param w
	///@param h
	///@param font
	///@param text_color
	///@param text_bg_color
	///@param time
	///@param time_alpha
	///@param follower
	///@param scale

	var _ins = instance_create_depth(argument0,argument1,argument3,Notify);
	with(_ins)
	{
		mode = 1;
	
		text = argument2;
		space_w = argument4;
		space_h = argument5;
		font = argument6;
		text_color = argument7;
		text_bg_color = argument8;
		time = argument9+argument10;
		time_origin = argument9;
		time_alpha = argument10;
		follower = argument11;
		scale = argument12;
	}

	return _ins;


}
