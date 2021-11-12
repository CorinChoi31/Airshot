///@description
///@param sprite[name/subimg],scale[x/y/min/max],color[col1/col2/...],alpha[alp1/alp2/...]
function particle_create() {

	var arg0 = argument[0];
	var arg1 = argument[1];
	var arg2 = argument[2];
	var arg3 = argument[3];

	if(!variable_global_exists("particle_sprite"))
	{
		global.particle_sprite = ds_list_create();
		global.particle_scale = ds_list_create();
		global.particle_color = ds_list_create();
		global.particle_alpha = ds_list_create();
	}

	ds_list_add(global.particle_sprite,arg0);
	ds_list_add(global.particle_scale,arg1);
	ds_list_add(global.particle_color,arg2);
	ds_list_add(global.particle_alpha,arg3);

	return ds_list_size(global.particle_sprite)-1;


}
