#region Part

	global.partSys = part_system_create();
	part_system_depth(global.partSys,1);

	#region UI
		#macro m_First_Winner_Burst 0
		#macro m_First_Winner_Steam 1
	
		global.partMenu[m_First_Winner_Burst] = part_type_create();
		var _ind = global.partMenu[m_First_Winner_Burst];
			part_type_shape(_ind,pt_shape_sphere);
			part_type_size(_ind,0.05,0.35,-0.0025,0);
			part_type_scale(_ind,1,1);
			part_type_color3(_ind,c_red,c_orange,c_blue);
			part_type_alpha3(_ind,0,1,0);
			part_type_blend(_ind,true);
			part_type_speed(_ind,0,7.5,-0.0375,0);
			part_type_direction(_ind,0,360,0,0);
			part_type_orientation(_ind,0,360,0,0,true);
			part_type_life(_ind,room_speed/5,room_speed*2);
	
		global.partMenu[m_First_Winner_Steam] = part_type_create();
		var _ind = global.partMenu[m_First_Winner_Steam];
			part_type_shape(_ind,pt_shape_square);
			part_type_size(_ind,0.05,0.25,-0.001,0);
			part_type_scale(_ind,1,1);
			part_type_color3(_ind,c_white,c_orange,c_blue);
			part_type_alpha3(_ind,0,1,0);
			part_type_blend(_ind,true);
			part_type_speed(_ind,0,10,-0.05,0);
			part_type_direction(_ind,0,0,0,0);
			part_type_orientation(_ind,0,360,0,0,true);
			part_type_life(_ind,room_speed/10,room_speed);

		#macro m_Second_Winner_Burst 2
		#macro m_Second_Winner_Steam 3

		global.partMenu[m_Second_Winner_Burst] = part_type_create();
		var _ind = global.partMenu[m_Second_Winner_Burst];
			part_type_shape(_ind,pt_shape_sphere);
			part_type_size(_ind,0.05,0.35,-0.0025,0);
			part_type_scale(_ind,1,1);
			part_type_color3(_ind,c_blue,c_aqua,c_red);
			part_type_alpha3(_ind,1,1,0);
			part_type_blend(_ind,true);
			part_type_speed(_ind,0,10,-0.0375,0);
			part_type_direction(_ind,0,360,0,0);
			part_type_orientation(_ind,0,360,0,0,true);
			part_type_life(_ind,room_speed/5,room_speed*2);

		global.partMenu[m_Second_Winner_Steam] = part_type_create();
		var _ind = global.partMenu[m_Second_Winner_Steam];
			part_type_shape(_ind,pt_shape_square);
			part_type_size(_ind,0.05,0.25,-0.001,0);
			part_type_scale(_ind,1,1);
			part_type_color3(_ind,c_white,c_aqua,c_red);
			part_type_alpha3(_ind,1,1,0);
			part_type_blend(_ind,true);
			part_type_speed(_ind,0,7.5,-0.05,0);
			part_type_direction(_ind,180,180,0,0);
			part_type_orientation(_ind,0,360,0,0,true);
			part_type_life(_ind,room_speed/10,room_speed);
	#endregion

	#region Default Stat
		#macro m_First_Player_Movement 0
		#macro m_Second_Player_Movement 1

		global.partPlayer[m_First_Player_Movement] = part_type_create();
		var _ind = global.partPlayer[m_First_Player_Movement];
			part_type_shape(_ind,pt_shape_sphere);
			part_type_size(_ind,0.025,0.1,0,0);
			part_type_scale(_ind,1,1);
			part_type_color3(_ind,c_white,c_orange,c_blue);
			part_type_alpha3(_ind,1,1,0);
			part_type_blend(_ind,true);
			part_type_speed(_ind,0,0,0,0);
			part_type_direction(_ind,0,360,0,0);
			part_type_orientation(_ind,0,360,0,0,true);
			part_type_life(_ind,room_speed/4,room_speed);

		global.partPlayer[m_Second_Player_Movement] = part_type_create();
		var _ind = global.partPlayer[m_Second_Player_Movement];
			part_type_shape(_ind,pt_shape_sphere);
			part_type_size(_ind,0.025,0.1,0,0);
			part_type_scale(_ind,1,1);
			part_type_color3(_ind,c_white,c_aqua,c_red);
			part_type_alpha3(_ind,1,1,0);
			part_type_blend(_ind,true);
			part_type_speed(_ind,0,0,0,0);
			part_type_direction(_ind,0,360,0,0);
			part_type_orientation(_ind,0,360,0,0,true);
			part_type_life(_ind,room_speed/4,room_speed);
	#endregion

	#region Effect
		#macro m_First_Effect_Movement 0
		#macro m_Second_Effect_Movement 1

		global.partEffect[m_First_Effect_Movement] = part_type_create();
		var _ind = global.partEffect[m_First_Effect_Movement];
			part_type_shape(_ind,pt_shape_square);
			part_type_size(_ind,0.025,0.1,-0.0005,0);
			part_type_scale(_ind,1,1);
			part_type_color3(_ind,c_yellow,c_orange,c_red);
			part_type_alpha3(_ind,1,0.25,0);
			part_type_blend(_ind,true);
			part_type_speed(_ind,0,0,0,0);
			part_type_direction(_ind,0,360,0,0);
			part_type_orientation(_ind,0,360,0,0,true);
			part_type_life(_ind,room_speed/4,room_speed);

		global.partEffect[m_Second_Effect_Movement] = part_type_create();
		var _ind = global.partEffect[m_Second_Effect_Movement];
			part_type_shape(_ind,pt_shape_square);
			part_type_size(_ind,0.025,0.1,-0.0005,0);
			part_type_scale(_ind,1,1);
			part_type_color3(_ind,c_aqua,c_blue,c_teal);
			part_type_alpha3(_ind,1,0.25,0);
			part_type_blend(_ind,true);
			part_type_speed(_ind,0,0,0,0);
			part_type_direction(_ind,0,360,0,0);
			part_type_orientation(_ind,0,360,0,0,true);
			part_type_life(_ind,room_speed/4,room_speed);
	#endregion

	#region Skill
		#macro m_First_Skill_Revive_Ready 0
		#macro m_First_Skill_Revive_On 1
	
		#macro m_First_Skill_Lazer_Trail 2
		#macro m_First_Skill_Lazer_Hit 3

		global.partSkill[m_First_Skill_Revive_Ready] = part_type_create();
		var _ind = global.partSkill[m_First_Skill_Revive_Ready];
			part_type_shape(_ind,pt_shape_square);
			part_type_size(_ind,0.05,0.1,-0.00025,0);
			part_type_scale(_ind,1,1);
			part_type_color3(_ind,c_orange,c_white,c_white);
			part_type_alpha3(_ind,1,0.25,0);
			part_type_blend(_ind,true);
			part_type_speed(_ind,0,3,-0.0125,0);
			part_type_direction(_ind,0,360,0,0);
			part_type_orientation(_ind,0,360,0,0,true);
			part_type_life(_ind,room_speed/4,room_speed*2);

		global.partSkill[m_First_Skill_Revive_On] = part_type_create();
		var _ind = global.partSkill[m_First_Skill_Revive_On];
			part_type_shape(_ind,pt_shape_square);
			part_type_size(_ind,0.05,0.1,-0.0001,0);
			part_type_scale(_ind,1,1);
			part_type_color3(_ind,c_red,c_orange,c_maroon);
			part_type_alpha3(_ind,0.25,1,0);
			part_type_blend(_ind,true);
			part_type_speed(_ind,0,3,-0.0125,0);
			part_type_direction(_ind,0,360,0,0);
			part_type_orientation(_ind,0,360,0,0,true);
			part_type_life(_ind,room_speed,room_speed*2);
		
		global.partSkill[m_First_Skill_Lazer_Trail] = part_type_create();
		var _ind = global.partSkill[m_First_Skill_Lazer_Trail];
			part_type_shape(_ind,pt_shape_square);
			part_type_size(_ind,0.05,0.15,0,0);
			part_type_scale(_ind,1,1);
			part_type_color3(_ind,c_orange,c_red,c_blue);
			part_type_alpha3(_ind,1,1,0);
			part_type_blend(_ind,true);
			part_type_speed(_ind,0,0,0,0);
			part_type_direction(_ind,0,360,0,0);
			part_type_orientation(_ind,0,360,0,0,true);
			part_type_life(_ind,room_speed/4,room_speed*1);

		global.partSkill[m_First_Skill_Lazer_Hit] = part_type_create();
		var _ind = global.partSkill[m_First_Skill_Lazer_Hit];
			part_type_shape(_ind,pt_shape_square);
			part_type_size(_ind,0.05,0.15,-0.001,0);
			part_type_scale(_ind,1,1);
			part_type_color3(_ind,c_orange,c_red,c_blue);
			part_type_alpha3(_ind,1,0.25,0);
			part_type_blend(_ind,true);
			part_type_speed(_ind,0,2,0,0);
			part_type_direction(_ind,0,360,0,0);
			part_type_orientation(_ind,0,360,0,0,true);
			part_type_life(_ind,room_speed/4,room_speed*1);

		#macro m_Second_Skill_Revive_Ready 4
		#macro m_Second_Skill_Revive_On 5
	
		#macro m_Second_Skill_Lazer_Trail 6
		#macro m_Second_Skill_Lazer_Hit 7

		global.partSkill[m_Second_Skill_Revive_Ready] = part_type_create();
		var _ind = global.partSkill[m_Second_Skill_Revive_Ready];
			part_type_shape(_ind,pt_shape_square);
			part_type_size(_ind,0.05,0.1,-0.00025,0);
			part_type_scale(_ind,1,1);
			part_type_color3(_ind,c_aqua,c_white,c_white);
			part_type_alpha3(_ind,1,0.25,0);
			part_type_blend(_ind,true);
			part_type_speed(_ind,0,3,-0.0125,0);
			part_type_direction(_ind,0,360,0,0);
			part_type_orientation(_ind,0,360,0,0,true);
			part_type_life(_ind,room_speed/4,room_speed*2);

		global.partSkill[m_Second_Skill_Revive_On] = part_type_create();
		var _ind = global.partSkill[m_Second_Skill_Revive_On];
			part_type_shape(_ind,pt_shape_square);
			part_type_size(_ind,0.05,0.1,-0.0001,0);
			part_type_scale(_ind,1,1);
			part_type_color3(_ind,c_blue,c_aqua,c_teal);
			part_type_alpha3(_ind,0.25,1,0);
			part_type_blend(_ind,true);
			part_type_speed(_ind,0,3,-0.0125,0);
			part_type_direction(_ind,0,360,0,0);
			part_type_orientation(_ind,0,360,0,0,true);
			part_type_life(_ind,room_speed,room_speed*2);
	
		global.partSkill[m_Second_Skill_Lazer_Trail] = part_type_create();
		var _ind = global.partSkill[m_Second_Skill_Lazer_Trail];
			part_type_shape(_ind,pt_shape_square);
			part_type_size(_ind,0.05,0.15,0,0);
			part_type_scale(_ind,1,1);
			part_type_color3(_ind,c_blue,c_aqua,c_red);
			part_type_alpha3(_ind,1,1,0);
			part_type_blend(_ind,true);
			part_type_speed(_ind,0,0,0,0);
			part_type_direction(_ind,0,360,0,0);
			part_type_orientation(_ind,0,360,0,0,true);
			part_type_life(_ind,room_speed/4,room_speed*1);

		global.partSkill[m_Second_Skill_Lazer_Hit] = part_type_create();
		var _ind = global.partSkill[m_Second_Skill_Lazer_Hit];
			part_type_shape(_ind,pt_shape_square);
			part_type_size(_ind,0.05,0.15,-0.001,0);
			part_type_scale(_ind,1,1);
			part_type_color3(_ind,c_blue,c_aqua,c_red);
			part_type_alpha3(_ind,1,0.25,0);
			part_type_blend(_ind,true);
			part_type_speed(_ind,0,2,0,0);
			part_type_direction(_ind,0,360,0,0);
			part_type_orientation(_ind,0,360,0,0,true);
			part_type_life(_ind,room_speed/4,room_speed*1);
	#endregion

	#region Bullet
		#macro m_First_Bullet_Trail 0
		#macro m_First_Bullet_Hit 1

		global.partBullet[m_First_Bullet_Trail] = part_type_create();
		var _ind = global.partBullet[m_First_Bullet_Trail];
			part_type_shape(_ind,pt_shape_square);
			part_type_size(_ind,0.05,0.05,0,0);
			part_type_scale(_ind,1,1);
			part_type_color3(_ind,c_red,c_orange,c_blue);
			part_type_alpha3(_ind,1,1,0);
			part_type_blend(_ind,true);
			part_type_speed(_ind,0,0,0,0);
			part_type_direction(_ind,0,360,0,0);
			part_type_orientation(_ind,0,360,0,0,true);
			part_type_life(_ind,room_speed/10,room_speed/10);

		global.partBullet[m_First_Bullet_Hit] = part_type_create();
		var _ind = global.partBullet[m_First_Bullet_Hit];
			part_type_shape(_ind,pt_shape_square);
			part_type_size(_ind,0.05,0.15,-0.001,0);
			part_type_scale(_ind,1,1);
			part_type_color3(_ind,c_red,c_orange,c_blue);
			part_type_alpha3(_ind,1,0.25,0);
			part_type_blend(_ind,true);
			part_type_speed(_ind,0,1,0,0);
			part_type_direction(_ind,0,360,0,0);
			part_type_orientation(_ind,0,360,0,0,true);
			part_type_life(_ind,room_speed/2,room_speed*4);
	
		#macro m_Second_Bullet_Trail 2
		#macro m_Second_Bullet_Hit 3

		global.partBullet[m_Second_Bullet_Trail] = part_type_create();
		var _ind = global.partBullet[m_Second_Bullet_Trail];
			part_type_shape(_ind,pt_shape_square);
			part_type_size(_ind,0.05,0.05,0,0);
			part_type_scale(_ind,1,1);
			part_type_color3(_ind,c_blue,c_aqua,c_red);
			part_type_alpha3(_ind,1,1,0);
			part_type_blend(_ind,true);
			part_type_speed(_ind,0,0,0,0);
			part_type_direction(_ind,0,360,0,0);
			part_type_orientation(_ind,0,360,0,0,true);
			part_type_life(_ind,room_speed/10,room_speed/10);

		global.partBullet[m_Second_Bullet_Hit] = part_type_create();
		var _ind = global.partBullet[m_Second_Bullet_Hit];
			part_type_shape(_ind,pt_shape_square);
			part_type_size(_ind,0.05,0.15,-0.001,0);
			part_type_scale(_ind,1,1);
			part_type_color3(_ind,c_blue,c_aqua,c_red);
			part_type_alpha3(_ind,1,0.25,0);
			part_type_blend(_ind,true);
			part_type_speed(_ind,0,1,0,0);
			part_type_direction(_ind,0,360,0,0);
			part_type_orientation(_ind,0,360,0,0,true);
			part_type_life(_ind,room_speed/2,room_speed*4);
	#endregion

	#region Shell
		#macro m_First_Shell_Curtain_Trail 0
		#macro m_First_Shell_Curtain_Trail_Last 1
		#macro m_First_Shell_Curtain_Hit 2

		#macro m_First_Shell_Fire_Trail 3
		#macro m_First_Shell_Fire_Hit 4

		#macro m_First_Shell_Piercing_Trail 5
		#macro m_First_Shell_Piercing_Hit 6

		#macro m_First_Shell_Tracer_Trail 7
		#macro m_First_Shell_Tracer_Hit 8
		
		#macro m_First_Shell_Energy_Trail 9
		#macro m_First_Shell_Energy_Hit 10

		global.partShell[m_First_Shell_Curtain_Trail] = part_type_create();
		var _ind = global.partShell[m_First_Shell_Curtain_Trail];
			part_type_shape(_ind,pt_shape_square);
			part_type_size(_ind,0.05,0.25,0,0);
			part_type_scale(_ind,1,1);
			part_type_color3(_ind,c_maroon,c_red,c_blue);
			part_type_alpha3(_ind,1,1,0);
			part_type_blend(_ind,true);
			part_type_speed(_ind,0,0,0,0);
			part_type_direction(_ind,0,360,0,0);
			part_type_orientation(_ind,0,360,0,0,true);
			part_type_life(_ind,room_speed/10,room_speed/4);

		global.partShell[m_First_Shell_Curtain_Trail_Last] = part_type_create();
		var _ind = global.partShell[m_First_Shell_Curtain_Trail_Last];
			part_type_shape(_ind,pt_shape_square);
			part_type_size(_ind,0.05,0.35,0,0);
			part_type_scale(_ind,1,1);
			part_type_color3(_ind,c_orange,c_red,c_blue);
			part_type_alpha3(_ind,1,1,0);
			part_type_blend(_ind,true);
			part_type_speed(_ind,0,0,0,0);
			part_type_direction(_ind,0,360,0,0);
			part_type_orientation(_ind,0,360,0,0,true);
			part_type_life(_ind,room_speed/10,room_speed*2);

		global.partShell[m_First_Shell_Curtain_Hit] = part_type_create();
		var _ind = global.partShell[m_First_Shell_Curtain_Hit];
			part_type_shape(_ind,pt_shape_square);
			part_type_size(_ind,0.05,0.5,-0.001,0);
			part_type_scale(_ind,1,1);
			part_type_color3(_ind,c_maroon,c_red,c_blue);
			part_type_alpha3(_ind,1,0.25,0);
			part_type_blend(_ind,true);
			part_type_speed(_ind,0,1.5,0,0);
			part_type_direction(_ind,0,360,0,0);
			part_type_orientation(_ind,0,360,0,0,true);
			part_type_life(_ind,room_speed/4,room_speed*5);

		global.partShell[m_First_Shell_Fire_Trail] = part_type_create();
		var _ind = global.partShell[m_First_Shell_Fire_Trail];
			part_type_shape(_ind,pt_shape_square);
			part_type_size(_ind,0.05,0.35,0,0);
			part_type_scale(_ind,1,1);
			part_type_color3(_ind,c_red,c_yellow,c_blue);
			part_type_alpha3(_ind,1,1,0);
			part_type_blend(_ind,true);
			part_type_speed(_ind,0,0,0,0);
			part_type_direction(_ind,0,360,0,0);
			part_type_orientation(_ind,0,360,0,0,true);
			part_type_life(_ind,room_speed/10,room_speed/2);

		global.partShell[m_First_Shell_Fire_Hit] = part_type_create();
		var _ind = global.partShell[m_First_Shell_Fire_Hit];
			part_type_shape(_ind,pt_shape_square);
			part_type_size(_ind,0.05,0.5,-0.001,0);
			part_type_scale(_ind,1,1);
			part_type_color3(_ind,c_red,c_yellow,c_blue);
			part_type_alpha3(_ind,1,0.25,0);
			part_type_blend(_ind,true);
			part_type_speed(_ind,0,2,0,0);
			part_type_direction(_ind,0,360,0,0);
			part_type_orientation(_ind,0,360,0,0,true);
			part_type_life(_ind,room_speed/4,room_speed*5);

		global.partShell[m_First_Shell_Piercing_Trail] = part_type_create();
		var _ind = global.partShell[m_First_Shell_Piercing_Trail];
			part_type_shape(_ind,pt_shape_square);
			part_type_size(_ind,0.05,0.35,0,0);
			part_type_scale(_ind,1,1);
			part_type_color3(_ind,c_red,c_yellow,c_dkgray);
			part_type_alpha3(_ind,1,1,0);
			part_type_blend(_ind,true);
			part_type_speed(_ind,0,0,0,0);
			part_type_direction(_ind,0,360,0,0);
			part_type_orientation(_ind,0,360,0,0,true);
			part_type_life(_ind,room_speed/10,room_speed/2);

		global.partShell[m_First_Shell_Piercing_Hit] = part_type_create();
		var _ind = global.partShell[m_First_Shell_Piercing_Hit];
			part_type_shape(_ind,pt_shape_square);
			part_type_size(_ind,0.05,0.5,-0.001,0);
			part_type_scale(_ind,1,1);
			part_type_color3(_ind,c_red,c_yellow,c_dkgray);
			part_type_alpha3(_ind,1,0.25,0);
			part_type_blend(_ind,true);
			part_type_speed(_ind,0,2,0,0);
			part_type_direction(_ind,0,360,0,0);
			part_type_orientation(_ind,0,360,0,0,true);
			part_type_life(_ind,room_speed/4,room_speed*5);

		global.partShell[m_First_Shell_Tracer_Trail] = part_type_create();
		var _ind = global.partShell[m_First_Shell_Tracer_Trail];
			part_type_shape(_ind,pt_shape_square);
			part_type_size(_ind,0.05,0.15,0,0);
			part_type_scale(_ind,1,1);
			part_type_color3(_ind,c_maroon,c_red,c_white);
			part_type_alpha3(_ind,1,1,0);
			part_type_blend(_ind,true);
			part_type_speed(_ind,0,0,0,0);
			part_type_direction(_ind,0,360,0,0);
			part_type_orientation(_ind,0,360,0,0,true);
			part_type_life(_ind,room_speed/10,room_speed);

		global.partShell[m_First_Shell_Tracer_Hit] = part_type_create();
		var _ind = global.partShell[m_First_Shell_Tracer_Hit];
			part_type_shape(_ind,pt_shape_square);
			part_type_size(_ind,0.05,0.35,-0.001,0);
			part_type_scale(_ind,1,1);
			part_type_color3(_ind,c_maroon,c_red,c_white);
			part_type_alpha3(_ind,1,0.25,0);
			part_type_blend(_ind,true);
			part_type_speed(_ind,0,2,0,0);
			part_type_direction(_ind,0,360,0,0);
			part_type_orientation(_ind,0,360,0,0,true);
			part_type_life(_ind,room_speed/4,room_speed/2);
		
		global.partShell[m_First_Shell_Energy_Trail] = part_type_create();
		var _ind = global.partShell[m_First_Shell_Energy_Trail];
			part_type_shape(_ind,pt_shape_square);
			part_type_size(_ind,0.05,0.15,0,0);
			part_type_scale(_ind,1,1);
			part_type_color3(_ind,c_maroon,c_orange,c_white);
			part_type_alpha3(_ind,1,1,0);
			part_type_blend(_ind,true);
			part_type_speed(_ind,0,0,0,0);
			part_type_direction(_ind,0,360,0,0);
			part_type_orientation(_ind,0,360,0,0,true);
			part_type_life(_ind,room_speed/4,room_speed/2);

		global.partShell[m_First_Shell_Energy_Hit] = part_type_create();
		var _ind = global.partShell[m_First_Shell_Energy_Hit];
			part_type_shape(_ind,pt_shape_square);
			part_type_size(_ind,0.05,0.35,-0.001,0);
			part_type_scale(_ind,1,1);
			part_type_color3(_ind,c_maroon,c_orange,c_white);
			part_type_alpha3(_ind,1,0.25,0);
			part_type_blend(_ind,true);
			part_type_speed(_ind,0,2,0,0);
			part_type_direction(_ind,0,360,0,0);
			part_type_orientation(_ind,0,360,0,0,true);
			part_type_life(_ind,room_speed/2,room_speed);
	
		#macro m_Second_Shell_Curtain_Trail 11
		#macro m_Second_Shell_Curtain_Trail_Last 12
		#macro m_Second_Shell_Curtain_Hit 13

		#macro m_Second_Shell_Fire_Trail 14
		#macro m_Second_Shell_Fire_Hit 15

		#macro m_Second_Shell_Piercing_Trail 16
		#macro m_Second_Shell_Piercing_Hit 17

		#macro m_Second_Shell_Tracer_Trail 18
		#macro m_Second_Shell_Tracer_Hit 19
		
		#macro m_Second_Shell_Energy_Trail 20
		#macro m_Second_Shell_Energy_Hit 21

		global.partShell[m_Second_Shell_Curtain_Trail] = part_type_create();
		var _ind = global.partShell[m_Second_Shell_Curtain_Trail];
			part_type_shape(_ind,pt_shape_square);
			part_type_size(_ind,0.05,0.25,0,0);
			part_type_scale(_ind,1,1);
			part_type_color3(_ind,c_navy,c_blue,c_red);
			part_type_alpha3(_ind,1,1,0);
			part_type_blend(_ind,true);
			part_type_speed(_ind,0,0,0,0);
			part_type_direction(_ind,0,360,0,0);
			part_type_orientation(_ind,0,360,0,0,true);
			part_type_life(_ind,room_speed/10,room_speed/4);

		global.partShell[m_Second_Shell_Curtain_Trail_Last] = part_type_create();
		var _ind = global.partShell[m_Second_Shell_Curtain_Trail_Last];
			part_type_shape(_ind,pt_shape_square);
			part_type_size(_ind,0.05,0.35,0,0);
			part_type_scale(_ind,1,1);
			part_type_color3(_ind,c_aqua,c_blue,c_red);
			part_type_alpha3(_ind,1,1,0);
			part_type_blend(_ind,true);
			part_type_speed(_ind,0,0,0,0);
			part_type_direction(_ind,0,360,0,0);
			part_type_orientation(_ind,0,360,0,0,true);
			part_type_life(_ind,room_speed/10,room_speed*2);

		global.partShell[m_Second_Shell_Curtain_Hit] = part_type_create();
		var _ind = global.partShell[m_Second_Shell_Curtain_Hit];
			part_type_shape(_ind,pt_shape_square);
			part_type_size(_ind,0.05,0.5,-0.001,0);
			part_type_scale(_ind,1,1);
			part_type_color3(_ind,c_navy,c_blue,c_red);
			part_type_alpha3(_ind,1,0.25,0);
			part_type_blend(_ind,true);
			part_type_speed(_ind,0,1.5,0,0);
			part_type_direction(_ind,0,360,0,0);
			part_type_orientation(_ind,0,360,0,0,true);
			part_type_life(_ind,room_speed/4,room_speed*5);

		global.partShell[m_Second_Shell_Fire_Trail] = part_type_create();
		var _ind = global.partShell[m_Second_Shell_Fire_Trail];
			part_type_shape(_ind,pt_shape_square);
			part_type_size(_ind,0.05,0.35,0,0);
			part_type_scale(_ind,1,1);
			part_type_color3(_ind,c_blue,c_aqua,c_red);
			part_type_alpha3(_ind,1,1,0);
			part_type_blend(_ind,true);
			part_type_speed(_ind,0,0,0,0);
			part_type_direction(_ind,0,360,0,0);
			part_type_orientation(_ind,0,360,0,0,true);
			part_type_life(_ind,room_speed/10,room_speed/2);

		global.partShell[m_Second_Shell_Fire_Hit] = part_type_create();
		var _ind = global.partShell[m_Second_Shell_Fire_Hit];
			part_type_shape(_ind,pt_shape_square);
			part_type_size(_ind,0.05,0.5,-0.001,0);
			part_type_scale(_ind,1,1);
			part_type_color3(_ind,c_blue,c_aqua,c_red);
			part_type_alpha3(_ind,1,0.25,0);
			part_type_blend(_ind,true);
			part_type_speed(_ind,0,2,0,0);
			part_type_direction(_ind,0,360,0,0);
			part_type_orientation(_ind,0,360,0,0,true);
			part_type_life(_ind,room_speed/4,room_speed*5);

		global.partShell[m_Second_Shell_Piercing_Trail] = part_type_create();
		var _ind = global.partShell[m_Second_Shell_Piercing_Trail];
			part_type_shape(_ind,pt_shape_square);
			part_type_size(_ind,0.05,0.35,0,0);
			part_type_scale(_ind,1,1);
			part_type_color3(_ind,c_blue,c_aqua,c_dkgray);
			part_type_alpha3(_ind,1,1,0);
			part_type_blend(_ind,true);
			part_type_speed(_ind,0,0,0,0);
			part_type_direction(_ind,0,360,0,0);
			part_type_orientation(_ind,0,360,0,0,true);
			part_type_life(_ind,room_speed/10,room_speed/2);

		global.partShell[m_Second_Shell_Piercing_Hit] = part_type_create();
		var _ind = global.partShell[m_Second_Shell_Piercing_Hit];
			part_type_shape(_ind,pt_shape_square);
			part_type_size(_ind,0.05,0.5,-0.001,0);
			part_type_scale(_ind,1,1);
			part_type_color3(_ind,c_blue,c_aqua,c_dkgray);
			part_type_alpha3(_ind,1,0.25,0);
			part_type_blend(_ind,true);
			part_type_speed(_ind,0,2,0,0);
			part_type_direction(_ind,0,360,0,0);
			part_type_orientation(_ind,0,360,0,0,true);
			part_type_life(_ind,room_speed/4,room_speed*5);

		global.partShell[m_Second_Shell_Tracer_Trail] = part_type_create();
		var _ind = global.partShell[m_Second_Shell_Tracer_Trail];
			part_type_shape(_ind,pt_shape_square);
			part_type_size(_ind,0.05,0.15,0,0);
			part_type_scale(_ind,1,1);
			part_type_color3(_ind,c_blue,c_aqua,c_white);
			part_type_alpha3(_ind,1,1,0);
			part_type_blend(_ind,true);
			part_type_speed(_ind,0,0,0,0);
			part_type_direction(_ind,0,360,0,0);
			part_type_orientation(_ind,0,360,0,0,true);
			part_type_life(_ind,room_speed/10,room_speed);

		global.partShell[m_Second_Shell_Tracer_Hit] = part_type_create();
		var _ind = global.partShell[m_Second_Shell_Tracer_Hit];
			part_type_shape(_ind,pt_shape_square);
			part_type_size(_ind,0.05,0.35,-0.001,0);
			part_type_scale(_ind,1,1);
			part_type_color3(_ind,c_blue,c_aqua,c_white);
			part_type_alpha3(_ind,1,0.25,0);
			part_type_blend(_ind,true);
			part_type_speed(_ind,0,2,0,0);
			part_type_direction(_ind,0,360,0,0);
			part_type_orientation(_ind,0,360,0,0,true);
			part_type_life(_ind,room_speed/4,room_speed/2);
			
		global.partShell[m_Second_Shell_Energy_Trail] = part_type_create();
		var _ind = global.partShell[m_Second_Shell_Energy_Trail];
			part_type_shape(_ind,pt_shape_square);
			part_type_size(_ind,0.05,0.15,0,0);
			part_type_scale(_ind,1,1);
			part_type_color3(_ind,c_blue,c_aqua,c_white);
			part_type_alpha3(_ind,1,1,0);
			part_type_blend(_ind,true);
			part_type_speed(_ind,0,0,0,0);
			part_type_direction(_ind,0,360,0,0);
			part_type_orientation(_ind,0,360,0,0,true);
			part_type_life(_ind,room_speed/4,room_speed/2);

		global.partShell[m_Second_Shell_Energy_Hit] = part_type_create();
		var _ind = global.partShell[m_Second_Shell_Energy_Hit];
			part_type_shape(_ind,pt_shape_square);
			part_type_size(_ind,0.05,0.35,-0.001,0);
			part_type_scale(_ind,1,1);
			part_type_color3(_ind,c_aqua,c_aqua,c_white);
			part_type_alpha3(_ind,1,0.25,0);
			part_type_blend(_ind,true);
			part_type_speed(_ind,0,2,0,0);
			part_type_direction(_ind,0,360,0,0);
			part_type_orientation(_ind,0,360,0,0,true);
			part_type_life(_ind,room_speed/2,room_speed);
	#endregion

	#region Missle
		#macro m_First_Missile_Tracer_Trail 0
		#macro m_First_Missile_Tracer_Hit 1
		#macro m_First_Missile_Nano_Trail 2
		#macro m_First_Missile_Nano_Hit 3

		global.partMissile[m_First_Missile_Tracer_Trail] = part_type_create();
		var _ind = global.partMissile[m_First_Missile_Tracer_Trail];
			part_type_shape(_ind,pt_shape_square);
			part_type_size(_ind,0.05,0.125,0,0);
			part_type_scale(_ind,1,1);
			part_type_color3(_ind,c_maroon,c_red,c_orange);
			part_type_alpha3(_ind,1,1,0);
			part_type_blend(_ind,true);
			part_type_speed(_ind,0,0,0,0);
			part_type_direction(_ind,0,360,0,0);
			part_type_orientation(_ind,0,360,0,0,true);
			part_type_life(_ind,room_speed/10,room_speed/2);

		global.partMissile[m_First_Missile_Tracer_Hit] = part_type_create();
		var _ind = global.partMissile[m_First_Missile_Tracer_Hit];
			part_type_shape(_ind,pt_shape_square);
			part_type_size(_ind,0.05,0.25,-0.001,0);
			part_type_scale(_ind,1,1);
			part_type_color3(_ind,c_maroon,c_red,c_orange);
			part_type_alpha3(_ind,1,0.25,0);
			part_type_blend(_ind,true);
			part_type_speed(_ind,0,3,-0.005,0);
			part_type_direction(_ind,0,360,0,0);
			part_type_orientation(_ind,0,360,0,0,true);
			part_type_life(_ind,room_speed/4,room_speed);

		global.partMissile[m_First_Missile_Nano_Trail] = part_type_create();
		var _ind = global.partMissile[m_First_Missile_Nano_Trail];
			part_type_shape(_ind,pt_shape_square);
			part_type_size(_ind,0.05,0.125,0,0);
			part_type_scale(_ind,1,1);
			part_type_color3(_ind,c_maroon,c_blue,c_orange);
			part_type_alpha3(_ind,1,1,0);
			part_type_blend(_ind,true);
			part_type_speed(_ind,0,0,0,0);
			part_type_direction(_ind,0,360,0,0);
			part_type_orientation(_ind,0,360,0,0,true);
			part_type_life(_ind,room_speed/10,room_speed/4);

		global.partMissile[m_First_Missile_Nano_Hit] = part_type_create();
		var _ind = global.partMissile[m_First_Missile_Nano_Hit];
			part_type_shape(_ind,pt_shape_square);
			part_type_size(_ind,0.05,0.25,-0.001,0);
			part_type_scale(_ind,1,1);
			part_type_color3(_ind,c_maroon,c_blue,c_orange);
			part_type_alpha3(_ind,1,0.25,0);
			part_type_blend(_ind,true);
			part_type_speed(_ind,0,3,-0.005,0);
			part_type_direction(_ind,0,360,0,0);
			part_type_orientation(_ind,0,360,0,0,true);
			part_type_life(_ind,room_speed/4,room_speed/2);


		#macro m_Second_Missile_Tracer_Trail 4
		#macro m_Second_Missile_Tracer_Hit 5
		#macro m_Second_Missile_Nano_Trail 6
		#macro m_Second_Missile_Nano_Hit 7

		global.partMissile[m_Second_Missile_Tracer_Trail] = part_type_create();
		var _ind = global.partMissile[m_Second_Missile_Tracer_Trail];
			part_type_shape(_ind,pt_shape_square);
			part_type_size(_ind,0.05,0.125,0,0);
			part_type_scale(_ind,1,1);
			part_type_color3(_ind,c_navy,c_blue,c_aqua);
			part_type_alpha3(_ind,1,1,0);
			part_type_blend(_ind,true);
			part_type_speed(_ind,0,0,0,0);
			part_type_direction(_ind,0,360,0,0);
			part_type_orientation(_ind,0,360,0,0,true);
			part_type_life(_ind,room_speed/10,room_speed/2);

		global.partMissile[m_Second_Missile_Tracer_Hit] = part_type_create();
		var _ind = global.partMissile[m_Second_Missile_Tracer_Hit];
			part_type_shape(_ind,pt_shape_square);
			part_type_size(_ind,0.05,0.25,-0.001,0);
			part_type_scale(_ind,1,1);
			part_type_color3(_ind,c_navy,c_blue,c_aqua);
			part_type_alpha3(_ind,1,0.25,0);
			part_type_blend(_ind,true);
			part_type_speed(_ind,0,3,-0.005,0);
			part_type_direction(_ind,0,360,0,0);
			part_type_orientation(_ind,0,360,0,0,true);
			part_type_life(_ind,room_speed/4,room_speed);

		global.partMissile[m_Second_Missile_Nano_Trail] = part_type_create();
		var _ind = global.partMissile[m_Second_Missile_Nano_Trail];
			part_type_shape(_ind,pt_shape_square);
			part_type_size(_ind,0.05,0.125,0,0);
			part_type_scale(_ind,1,1);
			part_type_color3(_ind,c_navy,c_red,c_aqua);
			part_type_alpha3(_ind,1,1,0);
			part_type_blend(_ind,true);
			part_type_speed(_ind,0,0,0,0);
			part_type_direction(_ind,0,360,0,0);
			part_type_orientation(_ind,0,360,0,0,true);
			part_type_life(_ind,room_speed/10,room_speed/4);

		global.partMissile[m_Second_Missile_Nano_Hit] = part_type_create();
		var _ind = global.partMissile[m_Second_Missile_Nano_Hit];
			part_type_shape(_ind,pt_shape_square);
			part_type_size(_ind,0.05,0.25,-0.001,0);
			part_type_scale(_ind,1,1);
			part_type_color3(_ind,c_navy,c_red,c_aqua);
			part_type_alpha3(_ind,1,0.25,0);
			part_type_blend(_ind,true);
			part_type_speed(_ind,0,3,-0.005,0);
			part_type_direction(_ind,0,360,0,0);
			part_type_orientation(_ind,0,360,0,0,true);
			part_type_life(_ind,room_speed/4,room_speed/2);
		#endregion

#endregion

#region Port
	#macro m_Player_Repair 0
	
	global.portPlayer[m_Player_Repair] = particle_create([particle_square,0],[1,1,0.01,0.05],[c_white,c_lime,c_green],[0,0,1,1,1,0.5,0]);
	
	global.portSkill[m_First_Skill_Revive_Ready] = particle_create([particle_square,0],[0.8,0.4,0.1,0.25],[c_white,c_orange,c_red,c_white],[0,0,1,1,1,0.5,0]);
	global.portSkill[m_First_Skill_Revive_On] = particle_create([particle_square,0],[1,1,0.1,0.25],[c_white,c_orange,c_red,c_white],[0,0,0,1,1,0.5,0]);
	global.portSkill[m_First_Skill_Lazer_Trail] = particle_create([particle_square,0],[1,0.5,0.075,0.25],[c_orange,c_orange,c_red,c_white],[0,1,1,0,0]);
	
	global.portSkill[m_Second_Skill_Revive_Ready] = particle_create([particle_square,0],[0.8,0.4,0.1,0.25],[c_white,c_aqua,c_blue,c_white],[0,0,1,1,1,0.5,0]);
	global.portSkill[m_Second_Skill_Revive_On] = particle_create([particle_square,0],[1,1,0.1,0.25],[c_white,c_aqua,c_blue,c_white],[0,0,0,1,1,0.5,0]);
	global.portSkill[m_Second_Skill_Lazer_Trail] = particle_create([particle_square,0],[1,0.5,0.075,0.25],[c_aqua,c_aqua,c_blue,c_white],[0,1,1,0,0]);
#endregion