menuAlpha_Draw += (menuAlpha-menuAlpha_Draw)/(menuAlpha_Speed);
menuSubAlpha_Draw += (menuSubAlpha-menuSubAlpha_Draw)/(menuSubAlpha_Speed);

#region 0
if(global.menu = 0)
{
	menuAlpha_Draw = 0;
	menuSubAlpha_Draw = 0;
	
	if(menuTick > room_speed*0.25)
	{
		menuNext = 1;
	}
		
	menuTick++;
	if(menuNext != -1)
	{
		if(menuChangeTick = 0)
		{
			menuChangeTick = menuChangeTick_Value;
				
			menuAlpha = 0;
			menuSubAlpha = 0;
		}
		else
		{
			menuChangeTick--;
			if(menuChangeTick = 0)
			{
				global.menu = menuNext;
					
				menuTick = 0;
					
				menuAlpha = 1;
				menuSubAlpha = 1;
				
				menuNext = -1;
			}
		}
	}
}
#endregion
#region 1
else if(global.menu = 1)
{
	draw_set_alpha(menuAlpha_Draw);
	draw_set_color(c_white);
		
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
		
	draw_set_font(WalkwayObliqueBold_Regular_48);
	draw_text(room_width/2,room_height/2,"Air-Shot");
	
	draw_set_font(WalkwayObliqueBold_Regular_16);
	draw_text(room_width/2,room_height/32*28,"Corin X BKD");
	draw_set_font(WalkwayObliqueBold_Regular_12);
	draw_text(room_width/2,room_height/32*29,"(c) 2018 Corin Choi, with B.K.D.");
	draw_set_font(WalkwayObliqueBold_Regular_16);
	draw_text(room_width/2,room_height/32*31,global.game_version);
	
	draw_set_alpha(menuSubAlpha_Draw);
		
	draw_set_font(WalkwayObliqueBold_Regular_24);
	draw_text(room_width/2,room_height/2+room_height/16,"Press <Space> to Start");
		
	if(keyboard_check_pressed(vk_space))
	{
		if(menuNext = -1)
		{
			menuNext = 2;
		}
	}
	if(menuNext = -1)
	{
		if(keyboard_check_pressed(vk_backspace))
		{
			game_end();
		}
		if(menuTick%(room_speed/1) = 0)
		{
			menuSubAlpha = !menuSubAlpha;
		}
	}
	
	if(keyboard_check_pressed(ord("P")))
	{
		if(menuNext = -1)
		{
			menuNext = 10;
			first_af_id = irandom_range(0,ds_list_size(airframes)-1);
			second_af_id = irandom_range(0,ds_list_size(airframes)-1);
			first_ps_id = irandom_range(1,ds_list_size(skill_passives)-1);
			second_ps_id = irandom_range(1,ds_list_size(skill_passives)-1);
			first_as_id = irandom_range(1,ds_list_size(skill_actives)-1);
			second_as_id = irandom_range(1,ds_list_size(skill_actives)-1);
			room_size_id = irandom_range(1,array_length_1d(room_size)-1);
			room_effect_id = choose(0,1);
			
			room_set_width(Room_GamePhysics,room_size[room_size_id]);
			room_set_height(Room_GamePhysics,room_size[room_size_id]);
		}
	}
		
	menuTick++;
	if(menuNext != -1)
	{
		if(menuChangeTick = 0)
		{
			menuChangeTick = menuChangeTick_Value;
				
			menuAlpha = 0;
			menuSubAlpha = 0;
		}
		else
		{
			menuChangeTick--;
			if(menuChangeTick = 0)
			{
				global.menu = menuNext;
					
				menuTick = 0;
					
				menuAlpha = 1;
				menuSubAlpha = 1;
				
				menuNext = -1;
			}
		}
	}
}
#endregion
#region 2
else if(global.menu = 2)
{
	draw_set_alpha(menuAlpha_Draw);
	draw_set_color(c_white);
		
	draw_set_halign(fa_left);
	draw_set_valign(fa_center);
	
	draw_set_font(NanumSquare_Regular_32);
	draw_text(room_width/8,room_height/8,global.patch_title);
	
	draw_set_valign(fa_top);
	
	draw_set_font(NanumSquare_Regular_16);
	draw_text(room_width/6,room_height/8*2,global.patch_context);
	
	draw_set_alpha(menuSubAlpha_Draw);
	
	draw_set_font(NanumSquare_Regular_12);
	
	draw_set_halign(fa_center);
	draw_set_valign(fa_center);
	
	draw_set_color(c_white);
	draw_text(room_width/8,room_height/4*3+64,"선택[이동]");
	draw_text(room_width/8+64*2.5,room_height/4*3+32,"확인[일반공격]");
	draw_text(room_width/8+64*4,room_height/4*3+32,"[기술]");
	//draw_text(room_width/8+64*4.5,room_height/4*3-32*6,"[재장전]");
	
	draw_text(room_width/8*7,room_height/4*3+64,"선택[이동]");
	draw_text(room_width/8*7-64*2.5,room_height/4*3+32,"확인[일반공격]");
	draw_text(room_width/8*7-64*4,room_height/4*3+32,"[기술]");
	//draw_text(room_width/8*7-64*4.5,room_height/4*3-32*6,"[재장전]");
	
	draw_set_font(NanumSquare_Regular_20);
	
	draw_rectangle_key(global.keyboard_assgin_first[0],"D",room_width/8+64,room_height/4*3,32,c_black,c_white,draw_get_alpha(),1,noone);
	draw_rectangle_key(global.keyboard_assgin_first[1],"W",room_width/8,room_height/4*3-64,32,c_black,c_white,draw_get_alpha(),1,noone);
	draw_rectangle_key(global.keyboard_assgin_first[2],"A",room_width/8-64,room_height/4*3,32,c_black,c_white,draw_get_alpha(),1,noone);
	draw_rectangle_key(global.keyboard_assgin_first[3],"S",room_width/8,room_height/4*3,32,c_black,c_white,draw_get_alpha(),1,noone);
	
	draw_rectangle_key(global.keyboard_assgin_first[4],"G",room_width/8+64*2.5,room_height/4*3-32,32,c_black,c_white,draw_get_alpha(),1,noone);
	draw_rectangle_key(global.keyboard_assgin_first[5],"H",room_width/8+64*4,room_height/4*3-32,32,c_black,c_white,draw_get_alpha(),1,noone);
	//draw_rectangle_key(global.keyboard_assgin_first[6],"J",room_width/8+64*4.5,room_height/4*3-32*4,32,c_black,c_white,draw_get_alpha(),1,noone);
	
	draw_rectangle_key(global.keyboard_assgin_second[0],"▶",room_width/8*7+64,room_height/4*3,32,c_black,c_white,draw_get_alpha(),1,noone);
	draw_rectangle_key(global.keyboard_assgin_second[1],"▲",room_width/8*7,room_height/4*3-64,32,c_black,c_white,draw_get_alpha(),1,noone);
	draw_rectangle_key(global.keyboard_assgin_second[2],"◀",room_width/8*7-64,room_height/4*3,32,c_black,c_white,draw_get_alpha(),1,noone);
	draw_rectangle_key(global.keyboard_assgin_second[3],"▼",room_width/8*7,room_height/4*3,32,c_black,c_white,draw_get_alpha(),1,noone);
	
	draw_rectangle_key(global.keyboard_assgin_second[4],"5",room_width/8*7-64*2.5,room_height/4*3-32,32,c_black,c_white,draw_get_alpha(),1,noone);
	draw_rectangle_key(global.keyboard_assgin_second[5],"6",room_width/8*7-64*4,room_height/4*3-32,32,c_black,c_white,draw_get_alpha(),1,noone);
	//draw_rectangle_key(global.keyboard_assgin_second[6],"9",room_width/8*7-64*4.5,room_height/4*3-32*4,32,c_black,c_white,draw_get_alpha(),1,noone);
	
	if(menuTick = room_speed*3)
	{
		if(menuNext = -1)
		{
			menuNext = 3;
		}
	}
		
	menuTick++;
	if(menuNext != -1)
	{
		if(menuChangeTick = 0)
		{
			menuChangeTick = menuChangeTick_Value;
				
			menuAlpha = 0;
			menuSubAlpha = 0;
		}
		else
		{
			menuChangeTick--;
			if(menuChangeTick = 0)
			{
				global.menu = menuNext;
					
				menuTick = 0;
					
				menuAlpha = 1;
				menuSubAlpha = 1;
				
				menuNext = -1;
			}
		}
	}
}
#endregion
#region 3
else if(global.menu = 3)
{
	if(menuTick = 0)
	{
		cursor_first = first_af_id;
		cursor_second = second_af_id;
	}
	
	draw_set_alpha(menuAlpha_Draw);
	draw_set_color(c_white);
		
	draw_set_halign(fa_left);
	draw_set_valign(fa_center);
		
	draw_set_font(NanumSquare_Regular_48);
	draw_text(room_width/8,room_height/8,"기체 선택");
		
	draw_set_alpha(menuSubAlpha_Draw);
	
	draw_set_font(NanumSquare_Regular_16);
	draw_rectangle_key(global.keyboard_assgin_first[1],"W",room_width/8*1-48,room_height/16*15,16,c_black,c_white,draw_get_alpha(),1,noone);
	draw_rectangle_key(global.keyboard_assgin_first[3],"S",room_width/8*1,room_height/16*15,16,c_black,c_white,draw_get_alpha(),1,noone);
	draw_rectangle_key(global.keyboard_assgin_first[4],"G",room_width/8*1+48,room_height/16*15,16,c_black,c_white,draw_get_alpha(),1,noone);
	
	draw_rectangle_key(global.keyboard_assgin_second[1],"▲",room_width/8*7+48,room_height/16*15,16,c_black,c_white,draw_get_alpha(),1,noone);
	draw_rectangle_key(global.keyboard_assgin_second[3],"▼",room_width/8*7,room_height/16*15,16,c_black,c_white,draw_get_alpha(),1,noone);
	draw_rectangle_key(global.keyboard_assgin_second[4],"5",room_width/8*7-48,room_height/16*15,16,c_black,c_white,draw_get_alpha(),1,noone);
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_center);
	
	var _y = 0; var _k = 0;
	for(var i = 0; i < min(ds_list_size(airframes)-menu_page_first*4,4); i++)
	{
		_k = i+menu_page_first*4;
		
		if(cursor_first = _k)
		{
			if(cursor_accept_first = false)
			{
				draw_set_color(c_dkgray);
			}
			else
			{
				draw_set_color(c_red);
			}
			draw_rectangle(room_width/8-room_width/256,room_height/4+room_height/16*i-room_width/256+_y,room_width/8+room_width/16+room_width/4,room_height/4+room_height/16+room_height/16*i+room_width/256+_y,false);
			draw_set_color(c_black);
			draw_rectangle(room_width/8+room_width/256,room_height/4+room_height/16*i+room_width/256+_y,room_width/8+room_width/16-room_width/256,room_height/4+room_height/16+room_height/16*i-room_width/256+_y,false);
			draw_set_color(c_white);
			draw_set_font(NanumSquare_Regular_20);
			draw_text(room_width/8+room_width/16+room_width/64,room_height/4+room_height/32+room_height/16*i+_y,airframes[|_k]);
		}
		draw_set_color(c_white);
		draw_rectangle(room_width/8,room_height/4+room_height/16*i+_y,room_width/8+room_width/16,room_height/4+room_height/16+room_height/16*i+_y,true);
		draw_sprite_ext(S_Player_First,_k+1,room_width/8+room_width/32,room_height/4+room_height/32+room_height/16*i+_y,1,1,menuTick,c_white,draw_get_alpha());
			
		_y += room_height/128;
	}
		
	draw_set_halign(fa_right);
		
	var _y = 0; var _k = 0;
	for(var i = 0; i < min(ds_list_size(airframes)-menu_page_second*4,4); i++)
	{
		_k = i+menu_page_second*4;
		
		if(cursor_second = _k)
		{
			if(cursor_accept_second = false)
			{
				draw_set_color(c_dkgray);
			}
			else
			{
				draw_set_color(c_blue);
			}
			draw_rectangle(room_width/8*7+room_width/256,room_height/4+room_height/16*i-room_width/256+_y,room_width/8*7-room_width/16-room_width/4,room_height/4+room_height/16+room_height/16*i+room_width/256+_y,false);
			draw_set_color(c_black);
			draw_rectangle(room_width/8*7-room_width/256,room_height/4+room_height/16*i+room_width/256+_y,room_width/8*7-room_width/16+room_width/256,room_height/4+room_height/16+room_height/16*i-room_width/256+_y,false);
			draw_set_color(c_white);
			draw_set_font(NanumSquare_Regular_20);
			draw_text(room_width/8*7-room_width/16-room_width/64,room_height/4+room_height/32+room_height/16*i+_y,airframes[|_k]);
		}
		draw_set_color(c_white);
		draw_rectangle(room_width/8*7,room_height/4+room_height/16*i+_y,room_width/8*7-room_width/16,room_height/4+room_height/16+room_height/16*i+_y,true);
		draw_sprite_ext(S_Player_Second,_k+1,room_width/8*7-room_width/32,room_height/4+room_height/32+room_height/16*i+_y,1,1,-menuTick,c_white,draw_get_alpha());
			
		_y += room_height/128;
	}
	
	menu_page_first = floor(cursor_first/4);
	menu_page_second = floor(cursor_second/4);
	
	if(menuNext = -1)
	{
		if(cursor_accept_first = false)
		{
			if(keyboard_check_pressed(global.keyboard_assgin_first[3]))
			{
				cursor_first += 1;
				if(cursor_first > ds_list_size(airframes)-1)
				{
					cursor_first = 0;
				}
			}
			if(keyboard_check_pressed(global.keyboard_assgin_first[1]))
			{
				cursor_first -= 1;
				if(cursor_first < 0)
				{
					cursor_first = ds_list_size(airframes)-1;
				}
			}
			if(keyboard_check_pressed(global.keyboard_assgin_first[4]))
			{
				cursor_accept_first = true;
			}
		}
		else
		{
			if(keyboard_check_pressed(global.keyboard_assgin_first[4]))
			{
				cursor_accept_first = false;
			}
		}
		
		if(cursor_accept_second = false)
		{
			if(keyboard_check_pressed(global.keyboard_assgin_second[3]))
			{
				cursor_second += 1;
				if(cursor_second > ds_list_size(airframes)-1)
				{
					cursor_second = 0;
				}
			}
			if(keyboard_check_pressed(global.keyboard_assgin_second[1]))
			{
				cursor_second -= 1;
				if(cursor_second < 0)
				{
					cursor_second = ds_list_size(airframes)-1;
				}
			}
			if(keyboard_check_pressed(global.keyboard_assgin_second[4]))
			{
				cursor_accept_second = true;
			}
		}
		else
		{
			if(keyboard_check_pressed(global.keyboard_assgin_second[4]))
			{
				cursor_accept_second = false;
			}
		}
	}
	
	if(keyboard_check_pressed(ord("P")))
	{
		if(menuNext = -1)
		{
			menuNext = 10;
			first_af_id = irandom_range(0,ds_list_size(airframes)-1);
			second_af_id = irandom_range(0,ds_list_size(airframes)-1);
			first_ps_id = irandom_range(1,ds_list_size(skill_passives)-1);
			second_ps_id = irandom_range(1,ds_list_size(skill_passives)-1);
			first_as_id = irandom_range(1,ds_list_size(skill_actives)-1);
			second_as_id = irandom_range(1,ds_list_size(skill_actives)-1);
			room_size_id = irandom_range(1,array_length_1d(room_size)-1);
			room_effect_id = choose(0,1);
			
			room_set_width(Room_GamePhysics,room_size[room_size_id]);
			room_set_height(Room_GamePhysics,room_size[room_size_id]);
		}
	}
	
	draw_set_color(c_white);
	var _angle = 0;
	var _value_first = 0; var _value_second = 0;
	
	_value_first = global.airframe_information[cursor_first];
	_value_second = global.airframe_information[cursor_second];
	
	var _y = 0; var _text = "";
	
	draw_set_font(NanumSquare_Regular_12);
	draw_set_halign(fa_center);
	draw_set_valign(fa_middle);
	
	for(var i = 0; i < array_length_1d(graph_list)-2; i++)
	{
		 _text = "";
		 
		graph_first[i] += (_value_first[i]-graph_first[i])/(room_speed/8);
		graph_second[i] += (_value_second[i]-graph_second[i])/(room_speed/8);
		
		if(i != array_length_1d(graph_list)-4)
		{
			draw_set_alpha(menuSubAlpha_Draw*1);
			draw_set_halign(fa_center);
			draw_text(room_width/2,room_height/32*20+room_height/32*i+_y,graph_list[i]);
			draw_set_halign(fa_left);
			if(i = 2)
			{
				_text = " x"+string(round(_value_first[9]));
			}
			draw_text(room_width/16*5+room_width/128,room_height/32*20+room_height/32*i+_y,string(graph_first[i])+_text);
			draw_set_halign(fa_right);
			if(i = 2)
			{
				_text = string(round(_value_second[9]))+"x ";
			}
			draw_text(room_width/16*11-room_width/128,room_height/32*20+room_height/32*i+_y,_text+string(graph_second[i]));
		
			draw_rectangle_color(room_width/16*5-room_width/6*(graph_first[i]/graph_max[i]),room_height/32*20+room_height/32*i+_y-room_height/128,room_width/16*5,room_height/32*20+room_height/32*i+_y+room_height/128,
				c_red,c_red,c_red,c_red,false);
			draw_rectangle_color(room_width/16*11,room_height/32*20+room_height/32*i+_y-room_height/128,room_width/16*11+room_width/6*(graph_second[i]/graph_max[i]),room_height/32*20+room_height/32*i+_y+room_height/128,
				c_blue,c_blue,c_blue,c_blue,false);
		
			draw_set_alpha(menuSubAlpha_Draw*0.25);
			draw_rectangle_color(room_width/16*11,room_height/32*20+room_height/32*i+_y-room_height/128,room_width/16*11+room_width/6,room_height/32*20+room_height/32*i+_y+room_height/128,
			c_white,c_white,c_white,c_white,true);
			draw_rectangle_color(room_width/16*5-room_width/6,room_height/32*20+room_height/32*i+_y-room_height/128,room_width/16*5,room_height/32*20+room_height/32*i+_y+room_height/128,
			c_white,c_white,c_white,c_white,true);
		
			_y += room_height/256;
		}
	}
	#region
	/*
	draw_set_halign(fa_center);
		
	draw_primitive_begin(pr_linestrip);
		for(_angle = 0; _angle <= 360; _angle += 360/9)
		{
			draw_vertex(room_width/4+lengthdir_x(room_width/8,_angle),room_height/4*3+lengthdir_y(room_width/8,_angle));
		}
	draw_primitive_end();
		
	draw_primitive_begin(pr_linestrip);
		for(_angle = 0; _angle <= 360; _angle += 360/9)
		{
			draw_vertex(room_width/4*3+lengthdir_x(room_width/8,_angle+180),room_height/4*3+lengthdir_y(room_width/8,_angle+180));
		}
	draw_primitive_end();
		
	_angle = 0;
	for(var i = 0; i < array_length_1d(graph_first); i++)
	{
		graph_first[i] += (_value_first[i]-graph_first[i])/(room_speed/5);
		draw_set_font(NanumSquare_Regular_16);
		draw_text(room_width/4+lengthdir_x((room_width/8+room_width/32)*(graph_first[i]/graph_max[i]),_angle),room_height/4*3+lengthdir_y((room_width/8+room_width/32)*(graph_first[i]/graph_max[i]),_angle),string_format(graph_first[i],0,1));
		draw_set_font(NanumSquare_Regular_12);
		draw_text(room_width/4+lengthdir_x((room_width/8+room_width/16),_angle),room_height/4*3+lengthdir_y((room_width/8+room_width/16),_angle),graph_list[i]);
		_angle += 360/9;
	}
	_angle = 180;
	for(var i = 0; i < array_length_1d(graph_second); i++)
	{
		graph_second[i] += (_value_second[i]-graph_second[i])/(room_speed/5);
		draw_set_font(NanumSquare_Regular_16);
		draw_text(room_width/4*3+lengthdir_x((room_width/8+room_width/32)*(graph_second[i]/graph_max[i]),_angle),room_height/4*3+lengthdir_y((room_width/8+room_width/32)*(graph_second[i]/graph_max[i]),_angle),string_format(graph_second[i],0,1));
		draw_set_font(NanumSquare_Regular_12);
		draw_text(room_width/4*3+lengthdir_x((room_width/8+room_width/16),_angle),room_height/4*3+lengthdir_y((room_width/8+room_width/16),_angle),graph_list[i]);
		_angle += 360/9;
	}
		
	draw_set_alpha(menuSubAlpha_Draw*0.75);
	
	/*
	_angle = 0;
	for(var i = 0; i < array_length_1d(graph_first); i++)
	{
		if(i < array_length_1d(graph_first)-1)
		{
			draw_primitive_begin(pr_trianglelist);
				draw_vertex(room_width/4,room_height/4*3);
				draw_vertex(room_width/4+lengthdir_x(room_width/8*(graph_first[i]/graph_max[i]),_angle),room_height/4*3+lengthdir_y(room_width/8*(graph_first[i]/graph_max[i]),_angle));
				_angle += 360/9;
				draw_vertex(room_width/4+lengthdir_x(room_width/8*(graph_first[i+1]/graph_max[i+1]),_angle),room_height/4*3+lengthdir_y(room_width/8*(graph_first[i+1]/graph_max[i+1]),_angle));
			draw_primitive_end();
			_angle -= 360/9;
			draw_primitive_begin(pr_linestrip);
				draw_vertex(room_width/4,room_height/4*3);
				draw_vertex(room_width/4+lengthdir_x(room_width/8*(graph_first[i]/graph_max[i]),_angle),room_height/4*3+lengthdir_y(room_width/8*(graph_first[i]/graph_max[i]),_angle));
				_angle += 360/9;
				draw_vertex(room_width/4+lengthdir_x(room_width/8*(graph_first[i+1]/graph_max[i+1]),_angle),room_height/4*3+lengthdir_y(room_width/8*(graph_first[i+1]/graph_max[i+1]),_angle));
			draw_primitive_end();
		}
		else
		{
			draw_primitive_begin(pr_trianglelist);
				draw_vertex(room_width/4,room_height/4*3);
				draw_vertex(room_width/4+lengthdir_x(room_width/8*(graph_first[i]/graph_max[i]),_angle),room_height/4*3+lengthdir_y(room_width/8*(graph_first[i]/graph_max[i]),_angle));
				_angle += 360/9;
				draw_vertex(room_width/4+lengthdir_x(room_width/8*(graph_first[0]/graph_max[0]),_angle),room_height/4*3+lengthdir_y(room_width/8*(graph_first[0]/graph_max[0]),_angle));
			draw_primitive_end();
			_angle -= 360/9;
			draw_primitive_begin(pr_linestrip);
				draw_vertex(room_width/4,room_height/4*3);
				draw_vertex(room_width/4+lengthdir_x(room_width/8*(graph_first[i]/graph_max[i]),_angle),room_height/4*3+lengthdir_y(room_width/8*(graph_first[i]/graph_max[i]),_angle));
				_angle += 360/9;
				draw_vertex(room_width/4+lengthdir_x(room_width/8*(graph_first[0]/graph_max[0]),_angle),room_height/4*3+lengthdir_y(room_width/8*(graph_first[0]/graph_max[0]),_angle));
			draw_primitive_end();
		}
	}
	
	_angle = 180;
	for(var i = 0; i < array_length_1d(graph_second); i++)
	{
		if(i < array_length_1d(graph_second)-1)
		{
			draw_primitive_begin(pr_trianglelist);
				draw_vertex(room_width/4*3,room_height/4*3);
				draw_vertex(room_width/4*3+lengthdir_x(room_width/8*(graph_second[i]/graph_max[i]),_angle),room_height/4*3+lengthdir_y(room_width/8*(graph_second[i]/graph_max[i]),_angle));
				_angle += 360/9;
				draw_vertex(room_width/4*3+lengthdir_x(room_width/8*(graph_second[i+1]/graph_max[i+1]),_angle),room_height/4*3+lengthdir_y(room_width/8*(graph_second[i+1]/graph_max[i+1]),_angle));
			draw_primitive_end();
			_angle -= 360/9;
			draw_primitive_begin(pr_linelist);
				draw_vertex(room_width/4*3,room_height/4*3);
				draw_vertex(room_width/4*3+lengthdir_x(room_width/8*(graph_second[i]/graph_max[i]),_angle),room_height/4*3+lengthdir_y(room_width/8*(graph_second[i]/graph_max[i]),_angle));
				_angle += 360/9;
				draw_vertex(room_width/4*3+lengthdir_x(room_width/8*(graph_second[i+1]/graph_max[i+1]),_angle),room_height/4*3+lengthdir_y(room_width/8*(graph_second[i+1]/graph_max[i+1]),_angle));
			draw_primitive_end();
		}
		else
		{
			draw_primitive_begin(pr_trianglelist);
				draw_vertex(room_width/4*3,room_height/4*3);
				draw_vertex(room_width/4*3+lengthdir_x(room_width/8*(graph_second[i]/graph_max[i]),_angle),room_height/4*3+lengthdir_y(room_width/8*(graph_second[i]/graph_max[i]),_angle));
				_angle += 360/9;
				draw_vertex(room_width/4*3+lengthdir_x(room_width/8*(graph_second[0]/graph_max[0]),_angle),room_height/4*3+lengthdir_y(room_width/8*(graph_second[0]/graph_max[0]),_angle));
			draw_primitive_end();
			_angle -= 360/9;
			draw_primitive_begin(pr_linelist);
				draw_vertex(room_width/4*3,room_height/4*3);
				draw_vertex(room_width/4*3+lengthdir_x(room_width/8*(graph_second[i]/graph_max[i]),_angle),room_height/4*3+lengthdir_y(room_width/8*(graph_second[i]/graph_max[i]),_angle));
				_angle += 360/9;
				draw_vertex(room_width/4*3+lengthdir_x(room_width/8*(graph_second[0]/graph_max[0]),_angle),room_height/4*3+lengthdir_y(room_width/8*(graph_second[0]/graph_max[0]),_angle));
			draw_primitive_end();
		}
	}
	*/
	
	#endregion
		
	if(menuNext = -1)
	{
		if(keyboard_check_pressed(vk_backspace))
		{
			global.game_score = 0;
			global.game_first_score = 0;
			global.game_second_score = 0;
			
			room_size_id = 0;
			room_effect_id = 0;
			
			first_af_id = 0;
			first_ps_id = 0;
			first_as_id = 0;

			second_af_id = 0;
			second_ps_id = 0;
			second_as_id = 0;
			
			menuNext = 1;
		}
			
		if(cursor_accept_first = true and cursor_accept_second = true)
		{
			first_af_id = cursor_first;
			second_af_id = cursor_second;
			menuNext = 4;
		}
	}
		
	menuTick++;
	if(menuNext != -1)
	{
		if(menuChangeTick = 0)
		{
			menuChangeTick = menuChangeTick_Value;
				
			menuAlpha = 0;
			menuSubAlpha = 0;
		}
		else
		{
			menuChangeTick--;
			if(menuChangeTick = 0)
			{
				global.menu = menuNext;

				cursor_first = 0;
				cursor_accept_first = false;
				cursor_second = 0;
				cursor_accept_second = false;
					
				menuTick = 0;
					
				menuAlpha = 1;
				menuSubAlpha = 1;
				
				menuNext = -1;
			}
		}
	}
}
#endregion
#region 4
else if(global.menu = 4)
{
	if(menuTick = 0)
	{
		cursor_first = first_ps_id;
		cursor_second = second_ps_id;
	}
	
	draw_set_alpha(menuAlpha_Draw);
	draw_set_color(c_white);
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_center);
		
	draw_set_font(NanumSquare_Regular_32);
	draw_text(room_width/8,room_height/8,"보조 기술 선택");
		
	draw_set_alpha(menuSubAlpha_Draw);
	
	draw_set_font(NanumSquare_Regular_16);
	draw_rectangle_key(global.keyboard_assgin_first[1],"W",room_width/8*1-48,room_height/16*15,16,c_black,c_white,draw_get_alpha(),1,noone);
	draw_rectangle_key(global.keyboard_assgin_first[3],"S",room_width/8*1,room_height/16*15,16,c_black,c_white,draw_get_alpha(),1,noone);
	draw_rectangle_key(global.keyboard_assgin_first[4],"G",room_width/8*1+48,room_height/16*15,16,c_black,c_white,draw_get_alpha(),1,noone);
	
	draw_rectangle_key(global.keyboard_assgin_second[1],"▲",room_width/8*7+48,room_height/16*15,16,c_black,c_white,draw_get_alpha(),1,noone);
	draw_rectangle_key(global.keyboard_assgin_second[3],"▼",room_width/8*7,room_height/16*15,16,c_black,c_white,draw_get_alpha(),1,noone);
	draw_rectangle_key(global.keyboard_assgin_second[4],"5",room_width/8*7-48,room_height/16*15,16,c_black,c_white,draw_get_alpha(),1,noone);
	
	draw_set_halign(fa_left);
	draw_set_valign(fa_center);
	
	draw_sprite_ext(S_Player_First,first_af_id+1,room_width/8+room_width/32,room_height/4+room_height/32,1,1,menuTick,c_white,draw_get_alpha());
	draw_sprite_ext(S_Player_Second,second_af_id+1,room_width-(room_width/8+room_width/32),room_height/4+room_height/32,1,1,-menuTick,c_white,draw_get_alpha());
		
	if(cursor_accept_first = false)
	{
		draw_set_color(c_dkgray);
	}
	else
	{
		draw_set_color(c_red);
	}
	draw_rectangle(room_width/8,room_height/4+room_height/8-room_height/32,room_width/8+room_width/16+room_width/4,room_height/4+room_height/8+room_height/32,false);
	draw_set_color(c_white);
	draw_set_font(NanumSquare_Regular_20);
	if(cursor_first = 0)
	{
		skill_description_draw_first = "";
		draw_text(room_width/8+room_width/64,room_height/4+room_height/8,skill_passives[|cursor_first]);
	}
	else
	{
		draw_rectangle(room_width/8+room_width/256,room_height/4+room_height/8-room_height/32+room_height/256,room_width/8+room_width/256+room_width/16,room_height/4+room_height/8-room_height/32+room_height/16-room_height/256,true);
		draw_text(room_width/8+room_width/16+room_width/64,room_height/4+room_height/8,skill_passives[|cursor_first]);
			
		if(skill_description_draw_first = "")
		{
			var _value = 0;
			_value = global.airframe_information[first_af_id];
			
			var _str = "";
			var _command = ""; var _command_enable = false; var _command_argument = ""; var _command_argument_enable = false;
			var _command_prev = ""; var _command_true = true; var _command_start = true; var _command_c = 0;
			for(var i = 1; i <= string_length(skill_passives_description[|cursor_first]); i++)
			{
				_str = string_char_at(skill_passives_description[|cursor_first],i);
				if(_str = "[")
				{
					_command = "";
					_command_prev = "";
					_command_enable = true;
					_command_true = true;
					_command_start = true;
					_command_argument = "";
				}
		
				if(_command_enable = false)
				{
					if(string_width(skill_description_draw_first+_str) > room_width/2.125)
					{
						skill_description_draw_first += "\n";
					}
					skill_description_draw_first += _str;
				}
				else
				{
					if(_str = "|")
					{
						_command_prev += _str;
						_command_argument_enable = true;
					}
					else if(_str = "]")
					{
						_command_prev += _str;
							
						if(_command = "HP")
						{
							_command_c = string_format(_value[0]*real(_command_argument),0,1);
							if(string_width(skill_description_draw_first+_command_c) > room_width/2.125)
							{
								skill_description_draw_first += "\n";
							}
							skill_description_draw_first += _command_c;
						}
						else if(_command = "SPEED")
						{
							_command_c = string_format(_value[1]*real(_command_argument),0,1);
							if(string_width(skill_description_draw_first+_command_c) > room_width/2.125)
							{
								skill_description_draw_first += "\n";
							}
							skill_description_draw_first += _command_c;
						}
						else if(_command = "ATK")
						{
							_command_c = string_format(_value[2]*real(_command_argument),0,1);
							if(string_width(skill_description_draw_first+_command_c) > room_width/2.125)
							{
								skill_description_draw_first += "\n";
							}
							skill_description_draw_first += _command_c;
						}
						else if(_command = "ATK_SPEED")
						{
							_command_c = string_format(_value[3]*real(_command_argument),0,1);
							if(string_width(skill_description_draw_first+_command_c) > room_width/2.125)
							{
								skill_description_draw_first += "\n";
							}
							skill_description_draw_first += _command_c;
						}
						else if(_command = "BULLET_SPEED")
						{
							_command_c = string_format(_value[4]*real(_command_argument),0,1);
							if(string_width(skill_description_draw_first+_command_c) > room_width/2.125)
							{
								skill_description_draw_first += "\n";
							}
							skill_description_draw_first += _command_c;
						}
						else if(_command = "RELOAD")
						{
							_command_c = string_format(_value[7]*real(_command_argument),0,1);
							if(string_width(skill_description_draw_first+_command_c) > room_width/2.125)
							{
								skill_description_draw_first += "\n";
							}
							skill_description_draw_first += _command_c;
						}
						else
						{
							_command_true = false;
						}
				
						if(_command_true = false)
						{
								
						}
				
						_command = "";
						_command_prev = "";
						_command_enable = false;
						_command_argument_enable = false;
						_command_argument = "";
					}
					else
					{
						if(_command_argument_enable = false)
						{
							_command_prev += _str;
							if(_command_start = true)
							{
								_command_start = false;	
							}
							else
							{
								_command += string_upper(_str);
							}
						}
						else
						{
							_command_argument += _str;
						}
					}
				}
			}

		}
		draw_set_valign(fa_top);
		draw_set_font(NanumSquare_Regular_24);
		draw_text(room_width/16,room_height/16*10,skill_passives[|cursor_first]);
		draw_set_font(NanumSquare_Regular_16);
		draw_text(room_width/16,room_height/16*11,skill_description_draw_first);
	}
		
	draw_set_valign(fa_middle);
	draw_set_halign(fa_right);
		
	if(cursor_accept_second = false)
	{
		draw_set_color(c_dkgray);
	}
	else
	{
		draw_set_color(c_blue);
	}
	draw_rectangle(room_width/8*7,room_height/4+room_height/8-room_height/32,room_width/8*7-room_width/16-room_width/4,room_height/4+room_height/8+room_height/32,false);
	draw_set_color(c_white);
	draw_set_font(NanumSquare_Regular_20);
	if(cursor_second = 0)
	{
		skill_description_draw_second = "";
		draw_text(room_width/8*7-room_width/64,room_height/4+room_height/8,skill_passives[|cursor_second]);
	}
	else
	{
		draw_rectangle(room_width/8*7-room_width/256,room_height/4+room_height/8-room_height/32+room_height/256,room_width/8*7-room_width/256-room_width/16,room_height/4+room_height/8-room_height/32+room_height/16-room_height/256,true);
		draw_text(room_width/8*7-room_width/16-room_width/64,room_height/4+room_height/8,skill_passives[|cursor_second]);
			
		if(skill_description_draw_second = "")
		{
			var _value = 0;
			_value = global.airframe_information[second_af_id];
			
			var _str = "";
			var _command = ""; var _command_enable = false; var _command_argument = ""; var _command_argument_enable = false;
			var _command_prev = ""; var _command_true = true; var _command_start = true; var _command_c = 0;
			for(var i = 1; i <= string_length(skill_passives_description[|cursor_second]); i++)
			{
				_str = string_char_at(skill_passives_description[|cursor_second],i);
				if(_str = "[")
				{
					_command = "";
					_command_prev = "";
					_command_enable = true;
					_command_true = true;
					_command_start = true;
					_command_argument = "";
				}
		
				if(_command_enable = false)
				{
					if(string_width(skill_description_draw_second+_str) > room_width/2.125)
					{
						skill_description_draw_second += "\n";
					}
					skill_description_draw_second += _str;
				}
				else
				{
					if(_str = "|")
					{
						_command_prev += _str;
						_command_argument_enable = true;
					}
					else if(_str = "]")
					{
						_command_prev += _str;
							
						if(_command = "HP")
						{
							_command_c = string_format(_value[0]*real(_command_argument),0,1);
							if(string_width(skill_description_draw_second+_command_c) > room_width/2.125)
							{
								skill_description_draw_second += "\n";
							}
							skill_description_draw_second += _command_c;
						}
						else if(_command = "SPEED")
						{
							_command_c = string_format(_value[1]*real(_command_argument),0,1);
							if(string_width(skill_description_draw_second+_command_c) > room_width/2.125)
							{
								skill_description_draw_second += "\n";
							}
							skill_description_draw_second += _command_c;
						}
						else if(_command = "ATK")
						{
							_command_c = string_format(_value[2]*real(_command_argument),0,1);
							if(string_width(skill_description_draw_second+_command_c) > room_width/2.125)
							{
								skill_description_draw_second += "\n";
							}
							skill_description_draw_second += _command_c;
						}
						else if(_command = "ATK_SPEED")
						{
							_command_c = string_format(_value[3]*real(_command_argument),0,1);
							if(string_width(skill_description_draw_second+_command_c) > room_width/2.125)
							{
								skill_description_draw_second += "\n";
							}
							skill_description_draw_second += _command_c;
						}
						else if(_command = "BULLET_SPEED")
						{
							_command_c = string_format(_value[4]*real(_command_argument),0,1);
							if(string_width(skill_description_draw_second+_command_c) > room_width/2.125)
							{
								skill_description_draw_second += "\n";
							}
							skill_description_draw_second += _command_c;
						}
						else if(_command = "RELOAD")
						{
							_command_c = string_format(_value[7]*real(_command_argument),0,1);
							if(string_width(skill_description_draw_second+_command_c) > room_width/2.125)
							{
								skill_description_draw_second += "\n";
							}
							skill_description_draw_second += _command_c;
						}
						else
						{
							_command_true = false;
						}
				
						if(_command_true = false)
						{
								
						}
				
						_command = "";
						_command_prev = "";
						_command_enable = false;
						_command_argument_enable = false;
						_command_argument = "";
					}
					else
					{
						if(_command_argument_enable = false)
						{
							_command_prev += _str;
							if(_command_start = true)
							{
								_command_start = false;	
							}
							else
							{
								_command += string_upper(_str);
							}
						}
						else
						{
							_command_argument += _str;
						}
					}
				}
			}

		}
		draw_set_valign(fa_top);
		draw_set_font(NanumSquare_Regular_24);
		draw_text(room_width/16*15,room_height/16*10,skill_passives[|cursor_second]);
		draw_set_font(NanumSquare_Regular_16);
		draw_text(room_width/16*15,room_height/16*11,skill_description_draw_second);
	}
		
	if(menuNext = -1)
	{
		if(cursor_accept_first = false)
		{
			if(keyboard_check_pressed(global.keyboard_assgin_first[3]))
			{
				cursor_first += 1;
				if(cursor_first > ds_list_size(skill_passives)-1)
				{
					cursor_first = 0;
				}
				skill_description_draw_first = "";
			}
			if(keyboard_check_pressed(global.keyboard_assgin_first[1]))
			{
				cursor_first -= 1;
				if(cursor_first < 0)
				{
					cursor_first = ds_list_size(skill_passives)-1;
				}
				skill_description_draw_first = "";
			}
			if(keyboard_check_pressed(global.keyboard_assgin_first[4]))
			{
				cursor_accept_first = true;
				first_ps_id = cursor_first;
					
			}
		}
		else
		{
			if(keyboard_check_pressed(global.keyboard_assgin_first[4]))
			{
				cursor_accept_first = false;
			}	
		}
		
		if(cursor_accept_second = false)
		{
			if(keyboard_check_pressed(global.keyboard_assgin_second[3]))
			{
				cursor_second += 1;
				if(cursor_second > ds_list_size(skill_passives)-1)
				{
					cursor_second = 0;
				}
				skill_description_draw_second = "";
			}
			if(keyboard_check_pressed(global.keyboard_assgin_second[1]))
			{
				cursor_second -= 1;
				if(cursor_second < 0)
				{
					cursor_second = ds_list_size(skill_passives)-1;
				}
				skill_description_draw_second = "";
			}
			if(keyboard_check_pressed(global.keyboard_assgin_second[4]))
			{
				cursor_accept_second = true;
				second_ps_id = cursor_second;
			}
		}
		else
		{
			if(keyboard_check_pressed(global.keyboard_assgin_second[4]))
			{
				cursor_accept_second = false;
			}
		}
	}
		
	if(menuNext = -1)
	{
		if(keyboard_check_pressed(vk_backspace))
		{
			menuNext = 3;
		}
			
		if(cursor_accept_first = true and cursor_accept_second = true)
		{
			menuNext = 5;
		}
	}
		
	menuTick++;
	if(menuNext != -1)
	{
		if(menuChangeTick = 0)
		{
			menuChangeTick = menuChangeTick_Value;
				
			menuAlpha = 0;
			menuSubAlpha = 0;
		}
		else
		{
			menuChangeTick--;
			if(menuChangeTick = 0)
			{
				global.menu = menuNext;
					
				cursor_first = 0;
				cursor_accept_first = false;
				cursor_second = 0;
				cursor_accept_second = false;
					
				skill_description_draw_first = "";
				skill_description_draw_second = "";
					
				menuTick = 0;
					
				menuAlpha = 1;
				menuSubAlpha = 1;
				
				menuNext = -1;
			}
		}
	}
}
#endregion
#region 5
else if(global.menu = 5)
{
	if(menuTick = 0)
	{
		cursor_first = first_as_id;
		cursor_second = second_as_id;
	}
	
	draw_set_alpha(menuAlpha_Draw);
	draw_set_color(c_white);
		
	draw_set_halign(fa_left);
	draw_set_valign(fa_center);
		
	draw_set_font(NanumSquare_Regular_32);
	draw_text(room_width/8,room_height/8,"주 기술 선택");
		
	draw_set_alpha(menuSubAlpha_Draw);
	
	draw_set_font(NanumSquare_Regular_16);
	draw_rectangle_key(global.keyboard_assgin_first[1],"W",room_width/8*1-48,room_height/16*15,16,c_black,c_white,draw_get_alpha(),1,noone);
	draw_rectangle_key(global.keyboard_assgin_first[3],"S",room_width/8*1,room_height/16*15,16,c_black,c_white,draw_get_alpha(),1,noone);
	draw_rectangle_key(global.keyboard_assgin_first[4],"G",room_width/8*1+48,room_height/16*15,16,c_black,c_white,draw_get_alpha(),1,noone);
	
	draw_rectangle_key(global.keyboard_assgin_second[1],"▲",room_width/8*7+48,room_height/16*15,16,c_black,c_white,draw_get_alpha(),1,noone);
	draw_rectangle_key(global.keyboard_assgin_second[3],"▼",room_width/8*7,room_height/16*15,16,c_black,c_white,draw_get_alpha(),1,noone);
	draw_rectangle_key(global.keyboard_assgin_second[4],"5",room_width/8*7-48,room_height/16*15,16,c_black,c_white,draw_get_alpha(),1,noone);
	
	draw_set_halign(fa_left);
	
	draw_set_color(c_white);
	draw_set_font(NanumSquare_Regular_16);
	draw_sprite_ext(S_Player_First,first_af_id+1,room_width/8+room_width/32,room_height/4+room_height/32,1,1,menuTick,c_white,draw_get_alpha());
	draw_text(room_width/8+room_width/64+room_width/16,room_height/4+room_height/64,"보조 기술 : "+skill_passives[|first_ps_id]);
	draw_set_halign(fa_right);
	draw_sprite_ext(S_Player_Second,second_af_id+1,room_width-(room_width/8+room_width/32),room_height/4+room_height/32,1,1,-menuTick,c_white,draw_get_alpha());
	draw_text(room_width/8*7-room_width/64-room_width/16,room_height/4+room_height/64,"보조 기술 : "+skill_passives[|second_ps_id]);
	
	draw_set_halign(fa_left);
		
	if(cursor_accept_first = false)
	{
		draw_set_color(c_dkgray);
	}
	else
	{
		draw_set_color(c_red);
	}
	draw_rectangle(room_width/8,room_height/4+room_height/8-room_height/32,room_width/8+room_width/16+room_width/4,room_height/4+room_height/8+room_height/32,false);
	draw_set_color(c_white);
	draw_set_font(NanumSquare_Regular_20);
	if(cursor_first = 0)
	{
		skill_description_draw_first = "";
		draw_text(room_width/8+room_width/64,room_height/4+room_height/8,skill_actives[|cursor_first]);
	}
	else
	{
		//draw_rectangle(room_width/8+room_width/256,room_height/4+room_height/8-room_height/32+room_height/256,room_width/8+room_width/256+room_width/16,room_height/4+room_height/8-room_height/32+room_height/16-room_height/256,true);
		draw_text(room_width/8+room_width/16+room_width/64,room_height/4+room_height/8,skill_actives[|cursor_first]);
		draw_sprite(S_Skill_Active_First,cursor_first,room_width/8+room_width/256+room_width/32,room_height/4+room_height/8);
			
		if(skill_description_draw_first = "")
		{
			var _value = 0;
			_value = global.airframe_information[first_af_id];
			
			var _str = "";
			var _command = ""; var _command_enable = false; var _command_argument = ""; var _command_argument_enable = false;
			var _command_prev = ""; var _command_true = true; var _command_start = true; var _command_c = 0;
			for(var i = 1; i <= string_length(skill_actives_description[|cursor_first]); i++)
			{
				_str = string_char_at(skill_actives_description[|cursor_first],i);
				if(_str = "[")
				{
					_command = "";
					_command_prev = "";
					_command_enable = true;
					_command_true = true;
					_command_start = true;
					_command_argument = "";
				}
		
				if(_command_enable = false)
				{
					if(string_width(skill_description_draw_first+_str) > room_width/2.125)
					{
						skill_description_draw_first += "\n";
					}
					skill_description_draw_first += _str;
				}
				else
				{
					if(_str = "|")
					{
						_command_prev += _str;
						_command_argument_enable = true;
					}
					else if(_str = "]")
					{
						_command_prev += _str;
							
						if(_command = "HP")
						{
							_command_c = string_format(_value[0]*real(_command_argument),0,1);
							if(string_width(skill_description_draw_first+_command_c) > room_width/2.125)
							{
								skill_description_draw_first += "\n";
							}
							skill_description_draw_first += _command_c;
						}
						else if(_command = "SPEED")
						{
							_command_c = string_format(_value[1]*real(_command_argument),0,1);
							if(string_width(skill_description_draw_first+_command_c) > room_width/2.125)
							{
								skill_description_draw_first += "\n";
							}
							skill_description_draw_first += _command_c;
						}
						else if(_command = "ATK")
						{
							_command_c = string_format(_value[2]*real(_command_argument),0,1);
							if(string_width(skill_description_draw_first+_command_c) > room_width/2.125)
							{
								skill_description_draw_first += "\n";
							}
							skill_description_draw_first += _command_c;
						}
						else if(_command = "ATK_SPEED")
						{
							_command_c = string_format(_value[3]*real(_command_argument),0,1);
							if(string_width(skill_description_draw_first+_command_c) > room_width/2.125)
							{
								skill_description_draw_first += "\n";
							}
							skill_description_draw_first += _command_c;
						}
						else if(_command = "BULLET_SPEED")
						{
							_command_c = string_format(_value[4]*real(_command_argument),0,1);
							if(string_width(skill_description_draw_first+_command_c) > room_width/2.125)
							{
								skill_description_draw_first += "\n";
							}
							skill_description_draw_first += _command_c;
						}
						else if(_command = "RELOAD")
						{
							_command_c = string_format(_value[7]*real(_command_argument),0,1);
							if(string_width(skill_description_draw_first+_command_c) > room_width/2.125)
							{
								skill_description_draw_first += "\n";
							}
							skill_description_draw_first += _command_c;
						}
						else if(_command = "COOLDOWN")
						{
							_command_c = real(_command_argument)-(real(_command_argument)*0.4)*(first_ps_id = 9);
							if(_command_c != 0)
							{
								skill_description_draw_first_cool = string(_command_c)+"초";
							}
							else
							{
								skill_description_draw_first_cool = "";
							}
						}
						else
						{
							_command_true = false;
						}
				
						if(_command_true = false)
						{
								
						}
				
						_command = "";
						_command_prev = "";
						_command_enable = false;
						_command_argument_enable = false;
						_command_argument = "";
					}
					else
					{
						if(_command_argument_enable = false)
						{
							_command_prev += _str;
							if(_command_start = true)
							{
								_command_start = false;	
							}
							else
							{
								_command += string_upper(_str);
							}
						}
						else
						{
							_command_argument += _str;
						}
					}
				}
			}

		}
		draw_set_valign(fa_top);
		draw_set_font(NanumSquare_Regular_24);
		draw_text(room_width/16,room_height/16*10,skill_actives[|cursor_first]);
		draw_set_font(NanumSquare_Regular_16);
		draw_text(room_width/16,room_height/16*11,skill_description_draw_first);
		draw_set_font(NanumSquare_Regular_12);
		draw_set_halign(fa_right);
		draw_text(room_width/16+room_width/2.75,room_height/16*10,skill_description_draw_first_cool);
	}
		
	draw_set_valign(fa_middle);
	draw_set_halign(fa_right);
		
	if(cursor_accept_second = false)
	{
		draw_set_color(c_dkgray);
	}
	else
	{
		draw_set_color(c_blue);
	}
	draw_rectangle(room_width/8*7,room_height/4+room_height/8-room_height/32,room_width/8*7-room_width/16-room_width/4,room_height/4+room_height/8+room_height/32,false);
	draw_set_color(c_white);
	draw_set_font(NanumSquare_Regular_20);
	if(cursor_second = 0)
	{
		skill_description_draw_second = "";
		draw_text(room_width/8*7-room_width/64,room_height/4+room_height/8,skill_actives[|cursor_second]);
	}
	else
	{
		//draw_rectangle(room_width/8*7-room_width/256,room_height/4+room_height/8-room_height/32+room_height/256,room_width/8*7-room_width/256-room_width/16,room_height/4+room_height/8-room_height/32+room_height/16-room_height/256,true);
		draw_text(room_width/8*7-room_width/16-room_width/64,room_height/4+room_height/8,skill_actives[|cursor_second]);
		draw_sprite(S_Skill_Active_Second,cursor_second,room_width/8*7-room_width/256-room_width/32,room_height/4+room_height/8);
			
		if(skill_description_draw_second = "")
		{
			var _value = 0;
			_value = global.airframe_information[second_af_id];
			
			var _str = "";
			var _command = ""; var _command_enable = false; var _command_argument = ""; var _command_argument_enable = false;
			var _command_prev = ""; var _command_true = true; var _command_start = true; var _command_c = 0;
			for(var i = 1; i <= string_length(skill_actives_description[|cursor_second]); i++)
			{
				_str = string_char_at(skill_actives_description[|cursor_second],i);
				if(_str = "[")
				{
					_command = "";
					_command_prev = "";
					_command_enable = true;
					_command_true = true;
					_command_start = true;
					_command_argument = "";
				}
		
				if(_command_enable = false)
				{
					if(string_width(skill_description_draw_second+_str) > room_width/2.125)
					{
						skill_description_draw_second += "\n";
					}
					skill_description_draw_second += _str;
				}
				else
				{
					if(_str = "|")
					{
						_command_prev += _str;
						_command_argument_enable = true;
					}
					else if(_str = "]")
					{
						_command_prev += _str;
							
						if(_command = "HP")
						{
							_command_c = string_format(_value[0]*real(_command_argument),0,1);
							if(string_width(skill_description_draw_second+_command_c) > room_width/2.125)
							{
								skill_description_draw_second += "\n";
							}
							skill_description_draw_second += _command_c;
						}
						else if(_command = "SPEED")
						{
							_command_c = string_format(_value[1]*real(_command_argument),0,1);
							if(string_width(skill_description_draw_second+_command_c) > room_width/2.125)
							{
								skill_description_draw_second += "\n";
							}
							skill_description_draw_second += _command_c;
						}
						else if(_command = "ATK")
						{
							_command_c = string_format(_value[2]*real(_command_argument),0,1);
							if(string_width(skill_description_draw_second+_command_c) > room_width/2.125)
							{
								skill_description_draw_second += "\n";
							}
							skill_description_draw_second += _command_c;
						}
						else if(_command = "ATK_SPEED")
						{
							_command_c = string_format(_value[3]*real(_command_argument),0,1);
							if(string_width(skill_description_draw_second+_command_c) > room_width/2.125)
							{
								skill_description_draw_second += "\n";
							}
							skill_description_draw_second += _command_c;
						}
						else if(_command = "BULLET_SPEED")
						{
							_command_c = string_format(_value[4]*real(_command_argument),0,1);
							if(string_width(skill_description_draw_second+_command_c) > room_width/2.125)
							{
								skill_description_draw_second += "\n";
							}
							skill_description_draw_second += _command_c;
						}
						else if(_command = "RELOAD")
						{
							_command_c = string_format(_value[7]*real(_command_argument),0,1);
							if(string_width(skill_description_draw_second+_command_c) > room_width/2.125)
							{
								skill_description_draw_second += "\n";
							}
							skill_description_draw_second += _command_c;
						}
						else if(_command = "COOLDOWN")
						{
							_command_c = real(_command_argument)-(real(_command_argument)*0.4)*(second_ps_id = 9);
							if(_command_c != 0)
							{
								skill_description_draw_second_cool = string(_command_c)+"초";
							}
							else
							{
								skill_description_draw_second_cool = "";
							}
						}
						else
						{
							_command_true = false;
						}
				
						if(_command_true = false)
						{
								
						}
				
						_command = "";
						_command_prev = "";
						_command_enable = false;
						_command_argument_enable = false;
						_command_argument = "";
					}
					else
					{
						if(_command_argument_enable = false)
						{
							_command_prev += _str;
							if(_command_start = true)
							{
								_command_start = false;	
							}
							else
							{
								_command += string_upper(_str);
							}
						}
						else
						{
							_command_argument += _str;
						}
					}
				}
			}

		}
		draw_set_valign(fa_top);
		draw_set_font(NanumSquare_Regular_24);
		draw_text(room_width/16*15,room_height/16*10,skill_actives[|cursor_second]);
		draw_set_font(NanumSquare_Regular_16);
		draw_text(room_width/16*15,room_height/16*11,skill_description_draw_second);
		draw_set_font(NanumSquare_Regular_12);
		draw_set_halign(fa_left);
		draw_text(room_width/16*15-room_width/2.75,room_height/16*10,skill_description_draw_second_cool);
	}
		
	if(menuNext = -1)
	{
		if(cursor_accept_first = false)
		{
			if(keyboard_check_pressed(global.keyboard_assgin_first[3]))
			{
				cursor_first += 1;
				if(cursor_first > ds_list_size(skill_actives)-1)
				{
					cursor_first = 0;
				}
				skill_description_draw_first = "";
			}
			if(keyboard_check_pressed(global.keyboard_assgin_first[1]))
			{
				cursor_first -= 1;
				if(cursor_first < 0)
				{
					cursor_first = ds_list_size(skill_actives)-1;
				}
				skill_description_draw_first = "";
			}
			if(keyboard_check_pressed(global.keyboard_assgin_first[4]))
			{
				cursor_accept_first = true;
				first_as_id = cursor_first;
					
			}
		}
		else
		{
			if(keyboard_check_pressed(global.keyboard_assgin_first[4]))
			{
				cursor_accept_first = false;
			}	
		}
		
		if(cursor_accept_second = false)
		{
			if(keyboard_check_pressed(global.keyboard_assgin_second[3]))
			{
				cursor_second += 1;
				if(cursor_second > ds_list_size(skill_actives)-1)
				{
					cursor_second = 0;
				}
				skill_description_draw_second = "";
			}
			if(keyboard_check_pressed(global.keyboard_assgin_second[1]))
			{
				cursor_second -= 1;
				if(cursor_second < 0)
				{
					cursor_second = ds_list_size(skill_actives)-1;
				}
				skill_description_draw_second = "";
			}
			if(keyboard_check_pressed(global.keyboard_assgin_second[4]))
			{
				cursor_accept_second = true;
				second_as_id = cursor_second;
			}
		}
		else
		{
			if(keyboard_check_pressed(global.keyboard_assgin_second[4]))
			{
				cursor_accept_second = false;
			}
		}
	}
		
	if(menuNext = -1)
	{
		if(keyboard_check_pressed(vk_backspace))
		{
			menuNext = 4;
		}
			
		if(cursor_accept_first = true and cursor_accept_second = true)
		{
			menuNext = 6;
		}
	}
		
	menuTick++;
	if(menuNext != -1)
	{
		if(menuChangeTick = 0)
		{
			menuChangeTick = menuChangeTick_Value;
				
			menuAlpha = 0;
			menuSubAlpha = 0;
		}
		else
		{
			menuChangeTick--;
			if(menuChangeTick = 0)
			{
				global.menu = menuNext;
					
				cursor_first = 0;
				cursor_accept_first = false;
				cursor_second = 0;
				cursor_accept_second = false;
					
				skill_description_draw_first = "";
				skill_description_draw_second = "";
					
				menuTick = 0;
					
				menuAlpha = 1;
				menuSubAlpha = 1;
				
				menuNext = -1;
			}
		}
	}
}
#endregion
#region 6
else if(global.menu = 6)
{
	if(menuTick = 0)
	{
		cursor_first = room_size_id;
		cursor_second = room_effect_id;
	}
	
	draw_set_alpha(menuAlpha_Draw);
	draw_set_color(c_white);
		
	draw_set_halign(fa_left);
	draw_set_valign(fa_center);
		
	draw_set_font(NanumSquare_Regular_48);
	draw_text(room_width/8,room_height/8,"월드 특성 선택");
		
	draw_set_alpha(menuSubAlpha_Draw);
	
	draw_set_font(NanumSquare_Regular_16);
	
	draw_rectangle_key(global.keyboard_assgin_first[1],"W",room_width/8*1-48,room_height/16*15,16,c_black,c_white,draw_get_alpha(),1,noone);
	draw_rectangle_key(global.keyboard_assgin_first[3],"S",room_width/8*1,room_height/16*15,16,c_black,c_white,draw_get_alpha(),1,noone);
	draw_rectangle_key(global.keyboard_assgin_first[4],"G",room_width/8*1+48,room_height/16*15,16,c_black,c_white,draw_get_alpha(),1,noone);
	
	draw_rectangle_key(global.keyboard_assgin_second[1],"▲",room_width/8*7+48,room_height/16*15,16,c_black,c_white,draw_get_alpha(),1,noone);
	draw_rectangle_key(global.keyboard_assgin_second[3],"▼",room_width/8*7,room_height/16*15,16,c_black,c_white,draw_get_alpha(),1,noone);
	draw_rectangle_key(global.keyboard_assgin_second[4],"5",room_width/8*7-48,room_height/16*15,16,c_black,c_white,draw_get_alpha(),1,noone);
	
	draw_set_color(c_white);
	
	draw_set_font(NanumSquare_Regular_24);
	
	draw_set_color(c_dkgray);
	if(cursor_accept_first = true)
	{
		draw_set_color(c_red);
	}
	draw_rectangle(room_width/8,room_height/2-room_height/32,room_width/8+room_width/16+room_width/4,room_height/2+room_height/32,false);
	draw_set_color(c_dkgray);
	if(cursor_accept_second = true)
	{
		draw_set_color(c_blue);
	}
	draw_rectangle(room_width/8*7,room_height/2-room_height/32,room_width/8*7-room_width/16-room_width/4,room_height/2+room_height/32,false);
	
	draw_set_color(c_white);
	draw_set_halign(fa_left);
	draw_text(room_width/8+room_width/32,room_height/2,string(room_size[cursor_first])+"x"+string(room_size[cursor_first]));
	draw_set_halign(fa_center);

	draw_set_halign(fa_right);
	draw_text(room_width/8*7-room_width/32,room_height/2,room_type[cursor_second]);
	
	if(menuNext = -1)
	{
		if(cursor_accept_first = false)
		{
			if(keyboard_check_pressed(global.keyboard_assgin_first[3]))
			{
				cursor_first += 1;
				if(cursor_first > array_length_1d(room_size)-1)
				{
					cursor_first = 0;
				}
			}
			if(keyboard_check_pressed(global.keyboard_assgin_first[1]))
			{
				cursor_first -= 1;
				if(cursor_first < 0)
				{
					cursor_first = array_length_1d(room_size)-1;
				}
			}
			if(keyboard_check_pressed(global.keyboard_assgin_first[4]))
			{
				cursor_accept_first = true;
			}
		}
		else
		{
			if(keyboard_check_pressed(global.keyboard_assgin_first[4]))
			{
				cursor_accept_first = false;
			}
		}
		
		if(cursor_accept_second = false)
		{
			if(keyboard_check_pressed(global.keyboard_assgin_second[3]))
			{
				cursor_second += 1;
				if(cursor_second > array_length_1d(room_type)-1)
				{
					cursor_second = 0;
				}
			}
			if(keyboard_check_pressed(global.keyboard_assgin_second[1]))
			{
				cursor_second -= 1;
				if(cursor_second < 0)
				{
					cursor_second = array_length_1d(room_type)-1;
				}
			}
			if(keyboard_check_pressed(global.keyboard_assgin_second[4]))
			{
				cursor_accept_second = true;
			}
		}
		else
		{
			if(keyboard_check_pressed(global.keyboard_assgin_second[4]))
			{
				cursor_accept_second = false;
			}
		}
	}
	
	if(menuNext = -1)
	{
		if(cursor_accept_first = true and cursor_accept_second = true)
		{
			room_size_id = cursor_first;
			room_effect_id = cursor_second;
			
			room_set_width(Room_GamePhysics,room_size[room_size_id]);
			room_set_height(Room_GamePhysics,room_size[room_size_id]);
			
			menuNext = 10;
		}
	}
	
	if(keyboard_check_pressed(vk_backspace))
	{
		if(menuNext = -1)
		{
			menuNext = 5;
		}
	}
		
	menuTick++;
	if(menuNext != -1)
	{
		if(menuChangeTick = 0)
		{
			menuChangeTick = menuChangeTick_Value;
				
			menuAlpha = 0;
			menuSubAlpha = 0;
		}
		else
		{
			menuChangeTick--;
			if(menuChangeTick = 0)
			{
				global.menu = menuNext;
				
				cursor_first = 0;
					
				menuTick = 0;
					
				menuAlpha = 1;
				menuSubAlpha = 1;
				
				menuNext = -1;
			}
		}
	}
}
#endregion
#region 10
else if(global.menu = 10)
{
	if(menuTick = 0)
	{
		room = Room_GamePhysics;
		global.game_running = true;
		
		global.game_score += 1;
	}
	
	if(menuTick < room_speed*3)
	{
		global.camera.x = room_width/2;
		global.camera.y = room_height/2;
		global.camera._w = room_width;
		
		var _scale = room_width/1080;
		
		draw_set_alpha(1);
		
		draw_set_color(c_black);
		draw_rectangle(0,0,room_width,room_height,false);
		
		draw_set_alpha(menuTick/room_speed);
		
		draw_set_color(c_white);
		draw_set_valign(fa_center);
		draw_set_halign(fa_center);
		draw_set_font(NanumSquare_Regular_48);
		draw_text_transformed(room_width/2,room_height/2,"VS",_scale,_scale,0);
		draw_set_valign(fa_top);
		draw_set_halign(fa_left);
		draw_set_font(NanumSquare_Regular_16);
		draw_sprite_ext(S_Player_First,first_af_id+1,room_width/8+room_width/32,room_height/4+room_height/32,_scale,_scale,menuTick,c_white,draw_get_alpha());
		draw_text_transformed(room_width/8+room_width/64+room_width/16,room_height/4+room_height/64,"보조 기술 : "+skill_passives[|first_ps_id],_scale,_scale,0);
		draw_text_transformed(room_width/8+room_width/64+room_width/16,room_height/4+room_height/16,"주 기술 : "+skill_actives[|first_as_id],_scale,_scale,0);
		draw_set_valign(fa_bottom);
		draw_set_halign(fa_right);
		draw_sprite_ext(S_Player_Second,second_af_id+1,room_width-(room_width/8+room_width/32),room_height-(room_height/4+room_height/32),_scale,_scale,-menuTick,c_white,draw_get_alpha());
		draw_text_transformed(room_width/8*7-room_width/64-room_width/16,room_height-(room_height/4+room_height/16),"보조 기술 : "+skill_passives[|second_ps_id],_scale,_scale,0);
		draw_text_transformed(room_width/8*7-room_width/64-room_width/16,room_height-(room_height/4+room_height/64),"주 기술 : "+skill_actives[|second_as_id],_scale,_scale,0);
	}
	else if(menuTick < room_speed*5)
	{
		if(menuTick = room_speed*3)
		{
			global.player_first = instance_create_depth(room_width/16*5,room_height/16*5,1,Player);
			with(global.player_first)
			{
				player_position = 1;
			
				phy_rotation = 90;
				phy_fixed_rotation = true;
			
				unit_airframe_index = other.first_af_id;
				passive_skill_index = other.first_ps_id;
				active_skill_index = other.first_as_id;
			
				keyboard_assgin = global.keyboard_assgin_first;
			
				sprite_index = S_Player_First;
			
				image_index = unit_airframe_index+1;
				image_speed = 0;
			}
		
			global.player_second = instance_create_depth(room_width/16*11,room_height/16*11,1,Player);
			with(global.player_second)
			{
				player_position = 2;
			
				phy_rotation = 270;
				phy_fixed_rotation = true;
			
				unit_airframe_index = other.second_af_id;
				passive_skill_index = other.second_ps_id;
				active_skill_index = other.second_as_id;
			
				keyboard_assgin = global.keyboard_assgin_second;
			
				sprite_index = S_Player_Second;
			
				image_index = unit_airframe_index+1;
				image_speed = 0;
			}
		}
		
		var _scale = room_width/1080;
			
		draw_set_alpha((room_speed*4-menuTick)/room_speed);
			
		draw_set_color(c_black);
		draw_rectangle(0,0,room_width,room_height,false);
			
		draw_set_color(c_white);
		draw_set_valign(fa_center);
		draw_set_halign(fa_center);
		draw_set_font(NanumSquare_Regular_48);
		draw_text_transformed(room_width/2,room_height/2,"VS",_scale,_scale,0);
		draw_set_valign(fa_top);
		draw_set_halign(fa_left);
		draw_set_font(NanumSquare_Regular_16);
		draw_sprite_ext(S_Player_First,first_af_id+1,room_width/8+room_width/32,room_height/4+room_height/32,_scale,_scale,menuTick,c_white,draw_get_alpha());
		draw_text_transformed(room_width/8+room_width/64+room_width/16,room_height/4+room_height/64,"보조 기술 : "+skill_passives[|first_ps_id],_scale,_scale,0);
		draw_text_transformed(room_width/8+room_width/64+room_width/16,room_height/4+room_height/16,"주 기술 : "+skill_actives[|first_as_id],_scale,_scale,0);
		draw_set_valign(fa_bottom);
		draw_set_halign(fa_right);
		draw_sprite_ext(S_Player_Second,second_af_id+1,room_width-(room_width/8+room_width/32),room_height-(room_height/4+room_height/32),_scale,_scale,-menuTick,c_white,draw_get_alpha());
		draw_text_transformed(room_width/8*7-room_width/64-room_width/16,room_height-(room_height/4+room_height/16),"보조 기술 : "+skill_passives[|second_ps_id],_scale,_scale,0);
		draw_text_transformed(room_width/8*7-room_width/64-room_width/16,room_height-(room_height/4+room_height/64),"주 기술 : "+skill_actives[|second_as_id],_scale,_scale,0);
		
		room_effect_tick = 0;
		room_effect = noone;
	}
	else
	{
		if(room_effect_tick = 0)
		{
			if(room_effect_id = 1 or room_effect_id = 3)
			{
				if(room_effect = noone)
				{
					room_effect = instance_create_depth(random_range(room_width/4,room_width-room_width/4),random_range(room_height/4,room_height-room_height/4),1,Region)
					//room_effect_tick = room_effect_tick_cool;
					
					room_effect.effect_type = irandom_range(0,1);
					room_effect.effect_id = irandom_range(0,9);
					
					room_effect.effect_amount_max = irandom_range(room_speed*10,room_speed*20);
					
					room_effect.range = random_range(room_width/32,room_width/6);
				}
				else
				{
					if(!instance_exists(room_effect))
					{
						room_effect = noone;
					}
				}
			}
			if(room_effect_id = 2 or room_effect_id = 3)
			{
				
			}
		}
		else
		{
			room_effect_tick--;
		}
	}
	
	if(global.game_running = false)
	{
		menuChangeTick_Value = room_speed*2;
		
		menuAlpha_Speed = room_speed/2;
		menuSubAlpha_Speed = room_speed/1.75;
		
		draw_set_alpha(1-menuAlpha_Draw);
		draw_set_color(c_black);
		draw_rectangle(0,0,room_width,room_height,false);
		
		if(menuNext = -1)
		{
			menuNext = 100;
		}
	}
		
	menuTick++;
	if(menuNext != -1)
	{
		if(menuChangeTick = 0)
		{
			menuChangeTick = menuChangeTick_Value;
				
			menuAlpha = 0;
			menuSubAlpha = 0;
		}
		else
		{
			menuChangeTick--;
			if(menuChangeTick = 0)
			{
				global.menu = menuNext;
				room = Room_Main;
				
				global.player_first = noone;
				global.player_second = noone;
				
				menuChangeTick_Value = room_speed/2;
				menuAlpha_Speed = room_speed/10;
				menuSubAlpha_Speed = room_speed/5;
					
				menuTick = 0;
					
				menuAlpha = 1;
				menuSubAlpha = 1;
				
				menuNext = -1;
			}
		}
	}
}
#endregion
#region 100
else if(global.menu = 100)
{
	if(menuTick = room_speed*0.85)
	{
		if(global.game_result = 0)
		{
			
		}
		else if(global.game_result = -1)
		{
			part_emitter_region(global.partSys,partEmit,room_width/4-room_height/128,room_width/4+room_height/128,room_height/2-room_height/128,room_height/2+room_height/128,ps_shape_ellipse,ps_distr_invgaussian);
			part_emitter_burst(global.partSys,partEmit,global.partMenu[m_First_Winner_Burst],128);
		}
		else if(global.game_result = 1)
		{
			part_emitter_region(global.partSys,partEmit,room_width/4*3-room_height/128,room_width/4*3+room_height/128,room_height/2-room_height/128,room_height/2+room_height/128,ps_shape_ellipse,ps_distr_invgaussian);
			part_emitter_burst(global.partSys,partEmit,global.partMenu[m_Second_Winner_Burst],128);
		}
	}
	if(menuTick = room_speed*1)
	{
		if(global.game_result = 0)
		{
			
		}
		else if(global.game_result = -1)
		{
			global.game_first_score += 1;
		}
		else if(global.game_result = 1)
		{
			global.game_second_score += 1;
		}
	}
	
	draw_set_alpha(menuAlpha_Draw);
	
	var _scale = room_width/1080;
	
	draw_set_color(c_white);
	draw_set_valign(fa_center);
	draw_set_halign(fa_center);
	
	draw_set_alpha(menuSubAlpha_Draw);
	
	draw_set_font(NanumSquare_Regular_20);
	
	if(global.game_result = 0)
	{
		draw_text_transformed(room_width/2,room_height/2,"= ! 이번 전투 결과 ! =",_scale,_scale,0);
		
		draw_set_font(NanumSquare_Regular_12);
		draw_text_transformed(room_width/2,room_height/16*9,"["+string(global.game_score)+"번째 전투]",_scale,_scale,0);
	}
	else if(global.game_result = -1)
	{
		draw_text_transformed(room_width/2,room_height/2,"< ! 이번 전투 결과 ! =",_scale,_scale,0);
		
		draw_set_font(NanumSquare_Regular_12);
		draw_text_transformed(room_width/2,room_height/16*9,"["+string(global.game_score)+"번째 전투]",_scale,_scale,0);
		
		if(menuTick > room_speed*0.75 and menuTick < room_speed*5.25)
		{
			part_emitter_region(global.partSys,partEmit,0,0,room_height/8*3,room_height/8*5,ps_shape_rectangle,ps_distr_invgaussian);
			part_emitter_burst(global.partSys,partEmit,global.partMenu[m_First_Winner_Steam],4+floor(global.game_first_score/4));
		}
		
		gpu_set_blendmode(bm_add);
		draw_rectangle_color(0,0,room_width,room_height,make_color_rgb(64,0,0),make_color_rgb(64,0,0),c_black,make_color_rgb(64,0,0),false);
	}
	else if(global.game_result = 1)
	{
		draw_text_transformed(room_width/2,room_height/2,"= ! 이번 전투 결과 ! >",_scale,_scale,0);
		
		draw_set_font(NanumSquare_Regular_12);
		draw_text_transformed(room_width/2,room_height/16*9,"["+string(global.game_score)+"번째 전투]",_scale,_scale,0);
		
		if(menuTick > room_speed*0.75 and menuTick < room_speed*5.25)
		{
			part_emitter_region(global.partSys,partEmit,room_width,room_width,room_height/8*3,room_height/8*5,ps_shape_rectangle,ps_distr_invgaussian);
			part_emitter_burst(global.partSys,partEmit,global.partMenu[m_Second_Winner_Steam],4+floor(global.game_second_score/4));
		}
		
		gpu_set_blendmode(bm_add);
		draw_rectangle_color(0,0,room_width,room_height,c_black,make_color_rgb(0,0,64),make_color_rgb(0,0,64),make_color_rgb(0,0,64),false);
	}
	
	gpu_set_blendmode(bm_normal);
	
	draw_set_font(WalkwayObliqueBold_Regular_48);
	
	draw_set_color(c_orange);
	draw_text_transformed(room_width/4,room_height/2,global.game_first_score,_scale+floor(global.game_first_score/4)/10,_scale+floor(global.game_first_score/4)/10,0);
	draw_set_color(c_aqua);
	draw_text_transformed(room_width/4*3,room_height/2,global.game_second_score,_scale+floor(global.game_second_score/4)/10,_scale+floor(global.game_second_score/4)/10,0);
	
	if(menuTick > room_speed*3)
	{
		if(menuNext = -1)
		{
			menuNext = 3;
		}
	}
	
	menuTick++;
	if(menuNext != -1)
	{
		if(menuChangeTick = 0)
		{
			menuChangeTick = menuChangeTick_Value;
				
			menuAlpha = 0;
			menuSubAlpha = 0;
		}
		else
		{
			menuChangeTick--;
			if(menuChangeTick = 0)
			{
				global.menu = menuNext;
				
				global.game_result = 0;
				
				cursor_first = 0;
				cursor_accept_first = 0;
				graph_first = [0,0,0,0,0,0,0,0,0];
				cursor_second = 0;
				cursor_accept_second = 0;
				graph_second = [0,0,0,0,0,0,0,0,0];
				
				menuTick = 0;
					
				menuAlpha = 1;
				menuSubAlpha = 1;
				
				menuNext = -1;
			}
		}
	}
}
#endregion
