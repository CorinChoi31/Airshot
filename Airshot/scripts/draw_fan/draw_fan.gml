///@description draw_fan(x,y,radius_inside,radius_outside,incidence_angle,rotation,density,color,alpha,outline);
///@function draw_fan(x,y,radius_inside,radius_outside,incidence_angle,rotation,density,color,alpha,outline);
function draw_fan(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9) {

	///@param x
	///@param y
	///@param radius_inside
	///@param radius_outside
	///@param incidence_angle
	///@param rotation
	///@param density
	///@param color
	///@param alpha
	///@param outline

	var arg0 = argument0; //x
	var arg1 = argument1; //y
	var arg2 = argument2; //radius_inside
	var arg3 = argument3; //radius_outside
	var arg4 = argument4; //incidence_angle
	var arg5 = argument5; //rotation
	var arg6 = argument6; //density
	var arg7 = argument7; //color
	var arg8 = argument8; //alpha
	var arg9 = argument9; //outline

	draw_set_color(arg7);
	draw_set_alpha(arg8);

	if(arg9 = false)
	{
		draw_primitive_begin(pr_trianglelist);
		for(var _v = arg5-arg4; _v < arg5+arg4; _v += arg6)
		{
			draw_vertex(arg0+lengthdir_x(arg3,_v),arg1+lengthdir_y(arg3,_v));
			draw_vertex(arg0+lengthdir_x(arg2,_v),arg1+lengthdir_y(arg2,_v));
			draw_vertex(arg0+lengthdir_x(arg3,_v+arg6),arg1+lengthdir_y(arg3,_v+arg6));
		}
		for(var _v = arg5-arg4; _v < arg5+arg4; _v += arg6)
		{
			draw_vertex(arg0+lengthdir_x(arg2,_v),arg1+lengthdir_y(arg2,_v));
			draw_vertex(arg0+lengthdir_x(arg3,_v+arg6),arg1+lengthdir_y(arg3,_v+arg6));
			draw_vertex(arg0+lengthdir_x(arg2,_v+arg6),arg1+lengthdir_y(arg2,_v+arg6));
		}
		draw_primitive_end();
	}
	else
	{
		draw_primitive_begin(pr_linestrip);
		draw_vertex(arg0+lengthdir_x(arg2,arg5-arg4),arg1+lengthdir_y(arg2,arg5-arg4));
		for(var _v = arg5-arg4; _v <= arg5+arg4; _v += arg6)
		{
			draw_vertex(arg0+lengthdir_x(arg3,_v),arg1+lengthdir_y(arg3,_v));
		}
		draw_vertex(arg0+lengthdir_x(arg2,arg5+arg4),arg1+lengthdir_y(arg2,arg5+arg4));
		if(arg2 > 0)
		{
			for(var _v = arg5+arg4; _v >= arg5-arg4; _v -= arg6)
			{
				draw_vertex(arg0+lengthdir_x(arg2,_v),arg1+lengthdir_y(arg2,_v));
			}
		}
		draw_primitive_end();
	}


}
