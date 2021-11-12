/// @description unit_player_effect_delete(index);
/// @param index
function unit_player_effect_delete() {

	var arg0 = argument[0];

	ds_list_delete(unit_effect_id,arg0);
	ds_list_delete(unit_effect_tick,arg0);
	ds_list_delete(unit_effect_tick_origin,arg0);
	ds_list_delete(unit_effect_amount,arg0);
	ds_list_delete(unit_effect_amount_origin,arg0);
	ds_list_delete(unit_effect_first,arg0);
	ds_list_delete(unit_effect_sender,arg0);


}
