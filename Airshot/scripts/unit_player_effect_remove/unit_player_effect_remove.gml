/// @description unit_player_effect_remove(object,id);
/// @param object
/// @param id
function unit_player_effect_remove() {

	var arg0 = argument[0];
	var arg1 = argument[1];

	with(arg0)
	{
		for(var i = ds_list_size(unit_effect_id)-1; i >= 0; i--)
		{
			if(ds_list_find_value(unit_effect_id,i) == arg1)
		    {
				ds_list_delete(unit_effect_id,i);
				ds_list_delete(unit_effect_tick,i);
				ds_list_delete(unit_effect_tick_origin,i);
				ds_list_delete(unit_effect_amount,i);
				ds_list_delete(unit_effect_amount_origin,i);
				ds_list_delete(unit_effect_first,i);
				ds_list_delete(unit_effect_sender,i);
			}
		}
	}



}
