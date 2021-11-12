var _coll = ds_list_create();
collision_circle_list(phy_position_x,phy_position_y,range,Player,true,false,_coll,true);
			
part_emitter_region(global.partSys,partEmit,phy_position_x-range/2,phy_position_x+range/2,phy_position_y-range/2,phy_position_y+range/2,ps_shape_ellipse,ps_distr_invgaussian);
			
for(var i = 0; i < ds_list_size(_coll); i++)
{
	if(_coll[|i].phy_active = true)
	{
		unit_player_damage_add(_coll[|i],0,damage,player);
	}
}

ds_list_clear(_coll)
collision_circle_list(phy_position_x,phy_position_y,range/10,ProjectTile,true,false,_coll,true);
for(var i = 0; i < ds_list_size(_coll); i++)
{
	if(instance_exists(_coll[|i]))
	{
		instance_destroy(_coll[|i]);
	}
}

if(player_position = 1)
	part_emitter_burst(global.partSys,partEmit,global.partMissile[effect_id[1]],range/2);
if(player_position = 2)
	part_emitter_burst(global.partSys,partEmit,global.partMissile[effect_id[1]],range/2);
			
ds_list_destroy(_coll);
	
part_emitter_destroy(global.partSys,partEmit);