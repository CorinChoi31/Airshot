/// @description unit_player_effect_add(object,id,amount,tick,sender);
/// @param object
/// @param id
/// @param amount
/// @param tick
/// @param sender
function unit_player_effect_add() {

	var arg0 = argument[0];
	var arg1 = argument[1];
	var arg2 = argument[2];
	var arg3 = argument[3];
	var arg4 = argument[4];

	with(arg0)
	{
		ds_list_add(unit_effect_id,arg1);
		ds_list_add(unit_effect_tick,arg3);
		ds_list_add(unit_effect_tick_origin,arg3);
		ds_list_add(unit_effect_amount,arg2);
		ds_list_add(unit_effect_amount_origin,arg2);
		ds_list_add(unit_effect_sender,arg4);
		ds_list_add(unit_effect_first,true);
	}



}
