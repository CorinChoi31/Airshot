if(passive_id = 2)
{
	var _coll = ds_list_create();
	collision_circle_list(phy_position_x,phy_position_y,64,Player,true,false,_coll,true);
			
	part_emitter_region(global.partSys,partEmit,phy_position_x-16,phy_position_x+16,phy_position_y-16,phy_position_y+16,ps_shape_ellipse,ps_distr_gaussian);
			
	for(var i = 0; i < ds_list_size(_coll); i++)
	{
		unit_player_damage_add(_coll[|i],0,damage*0.50,player);
	}
			
	if(player_position = 1)
		part_emitter_burst(global.partSys,partEmit,global.partBullet[m_First_Bullet_Hit],24);
	if(player_position = 2)
		part_emitter_burst(global.partSys,partEmit,global.partBullet[m_Second_Bullet_Hit],24);
			
	ds_list_destroy(_coll);
}

part_emitter_destroy(global.partSys,partEmit);