/// @description unit_player_damage_add(object,id,amount,sender);
/// @param object
/// @param id
/// @param amount
/// @param sender
function unit_player_damage_add() {

	var arg0 = argument[0];
	var arg1 = argument[1];
	var arg2 = argument[2];
	var arg3 = argument[3];

	with(arg0)
	{
		ds_list_add(unit_damage_id,arg1);
		ds_list_add(unit_damage_amount,arg2);
		ds_list_add(unit_damage_sender,arg3);
	}



}
