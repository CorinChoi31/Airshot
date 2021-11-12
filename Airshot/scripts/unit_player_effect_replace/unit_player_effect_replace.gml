/// @description unit_player_effect_replace(object,id,replace_amount,replace_tick,search_type[SEARCH/SEARCH_TYPE],replace_type[REPLACE/REPLACE_TYPE]);
/// @param object
/// @param id
/// @param replace_amount
/// @param replace_tick
/// @param search_type[SEARCH/SEARCH_TYPE]
/// @param replace_type[REPLACE/REPLACE_TYPE]
function unit_player_effect_replace() {

	var arg0 = argument[0];
	var arg1 = argument[1];
	var arg2 = argument[2];
	var arg3 = argument[3];
	var arg4 = argument[4];
	var arg5 = argument[5];

	var _amount = -1;
	var _tick = -1;

	var searched = 0;
	searched = unit_player_effect_search(arg0,arg1,arg2,arg3,arg4);

	with(arg0)
	{
		if(is_array(searched))
		{
			if(arg5[0] = BUFF.REPLACE_ALL)
			{
				if(arg5[1] = BUFF.REPLACE_AMOUNT)
				{
					for(var cha = 0; cha < array_length_1d(searched); cha++)
					{
						ds_list_replace(unit_effect_amount,searched[cha],arg2);
					}
				}
				else if(arg5[1] = BUFF.REPLACE_TICK)
				{
					for(var cha = 0; cha < array_length_1d(searched); cha++)
					{
						ds_list_replace(unit_effect_tick,searched[cha],arg3);
					}
				}
				else if(arg5[1] = BUFF.REPLACE_BOTH)
				{
					for(var cha = 0; cha < array_length_1d(searched); cha++)
					{
						ds_list_replace(unit_effect_amount,searched[cha],arg2);
						ds_list_replace(unit_effect_tick,searched[cha],arg3);
					}
				}
				return searched;
			}
			if(arg5[0] = BUFF.REPLACE_SINGLE)
			{
				if(arg5[1] = BUFF.REPLACE_AMOUNT)
				{
					ds_list_replace(unit_effect_amount,searched[0],arg2);
				}
				else if(arg5[1] = BUFF.REPLACE_TICK)
				{
					ds_list_replace(unit_effect_tick,searched[0],arg3);
				}
				else if(arg5[1] = BUFF.REPLACE_BOTH)
				{
					ds_list_replace(unit_effect_amount,searched[0],arg2);
					ds_list_replace(unit_effect_tick,searched[0],arg3);
				}
				return searched[0];
			}
		}
		else
		{
			return 0;
		}
	}


}
