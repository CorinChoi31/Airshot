function draw_rectangle_key(argument0, argument1, argument2, argument3, argument4, argument5, argument6, argument7, argument8, argument9) {
	var _key = keyboard_check(argument0);

	if(argument9 != noone)
	{
		draw_set_font(argument9);
	}
	draw_set_valign(fa_middle);
	draw_set_halign(fa_center);

	draw_set_alpha(argument7);
	draw_set_color(argument5);
	if(_key)
	{
		draw_set_color(argument6);
		draw_rectangle(argument2-argument4*argument8,argument3-argument4*argument8,argument2+argument4*argument8,argument3+argument4*argument8,false);
	}
	draw_set_color(argument6);
	draw_rectangle(argument2-argument4*argument8,argument3-argument4*argument8,argument2+argument4*argument8,argument3+argument4*argument8,true);
	if(_key)
	{
		draw_set_color(argument5);
	}
	draw_text_transformed(argument2,argument3,argument1,argument8,argument8,0);


}
