/// @description unit_player_effect_search(instance,id,amount,tick,search_type[SEARCH/SEARCH_TYPE]);
/// @param instance
/// @param id
/// @param amount
/// @param tick
/// @param search_type[SEARCH/SEARCH_TYPE]
function unit_player_effect_search() {

	var arg0 = argument[0];
	var arg1 = argument[1];
	var arg2 = argument[2];
	var arg3 = argument[3];
	var arg4 = argument[4];

	var _amount = -1;
	var _tick = -1;

	var search_location = 0;
	var search_num = 0;

	if(arg4[0] = BUFF.SEARCH_EXISTS)
	{
		with(arg0)
		{
			for(var rep = ds_list_size(unit_effect_id)-1; rep >= 0; rep--)
			{
				if(ds_list_find_value(unit_effect_id,rep) == arg1)
				{
					search_location[search_num] = rep;
					search_num += 1;
				}
			}
		}
	}

	if(arg4[0] = BUFF.SEARCH_LESS)
	{
		if(arg4[1] = BUFF.SEARCH_AMOUNT)
		{
			with(arg0)
			{
				for(var rep = ds_list_size(unit_effect_id)-1; rep >= 0; rep--)
				{
					if(ds_list_find_value(unit_effect_id,rep) == arg1)
					{
						_amount = unit_effect_amount[|rep];
						_tick = unit_effect_tick[|rep];
				
						if(_amount < arg2)
						{
							search_location[search_num] = rep;
							search_num += 1;
						}
					}
				}
			}
		}
		if(arg4[1] = BUFF.SEARCH_TICK)
		{
			with(arg0)
			{
				for(var rep = ds_list_size(unit_effect_id)-1; rep >= 0; rep--)
				{
					if(ds_list_find_value(unit_effect_id,rep) == arg1)
					{
						_amount = unit_effect_amount[|rep];
						_tick = unit_effect_tick[|rep];
				
						if(_tick < arg3)
						{
							search_location[search_num] = rep;
							search_num += 1;
						}
					}
				}
			}
		}
		if(arg4[1] = BUFF.SEARCH_BOTH)
		{
			with(arg0)
			{
				for(var rep = ds_list_size(unit_effect_id)-1; rep >= 0; rep--)
				{
					if(ds_list_find_value(unit_effect_id,rep) == arg1)
					{
						_amount = unit_effect_amount[|rep];
						_tick = unit_effect_tick[|rep];
				
						if(_amount < arg2 and _tick < arg3)
						{
							search_location[search_num] = rep;
							search_num += 1;
						}
					}
				}
			}
		}
	}

	if(arg4[0] = BUFF.SEARCH_LESSorSAME)
	{
		if(arg4[1] = BUFF.SEARCH_AMOUNT)
		{
			with(arg0)
			{
				for(var rep = ds_list_size(unit_effect_id)-1; rep >= 0; rep--)
				{
					if(ds_list_find_value(unit_effect_id,rep) == arg1)
					{
						_amount = unit_effect_amount[|rep];
						_tick = unit_effect_tick[|rep];
					
						if(_amount <= arg2)
						{
							search_location[search_num] = rep;
							search_num += 1;
						}
					}
				}
			}
		}
		if(arg4[1] = BUFF.SEARCH_TICK)
		{
			with(arg0)
			{
				for(var rep = ds_list_size(unit_effect_id)-1; rep >= 0; rep--)
				{
					if(ds_list_find_value(unit_effect_id,rep) == arg1)
					{
						_amount = unit_effect_amount[|rep];
						_tick = unit_effect_tick[|rep];
				
						if(_tick <= arg3)
						{
							search_location[search_num] = rep;
							search_num += 1;
						}
					}
				}
			}
		}
		if(arg4[1] = BUFF.SEARCH_BOTH)
		{
			with(arg0)
			{
				for(var rep = ds_list_size(unit_effect_id)-1; rep >= 0; rep--)
				{
					if(ds_list_find_value(unit_effect_id,rep) == arg1)
					{
						_amount = unit_effect_amount[|rep];
						_tick = unit_effect_tick[|rep];
				
						if(_amount <= arg2 and _tick <= arg3)
						{
							search_location[search_num] = rep;
							search_num += 1;
						}
					}
				}
			}
		}
	}

	if(arg4[0] = BUFF.SEARCH_SAME)
	{
		if(arg4[1] = BUFF.SEARCH_AMOUNT)
		{
			with(arg0)
			{
				for(var rep = ds_list_size(unit_effect_id)-1; rep >= 0; rep--)
				{
					if(ds_list_find_value(unit_effect_id,rep) == arg1)
					{
						_amount = unit_effect_amount[|rep];
						_tick = unit_effect_tick[|rep];
				
						if(_amount = arg2)
						{
							search_location[search_num] = rep;
							search_num += 1;
						}
					}
				}
			}
		}
		if(arg4[1] = BUFF.SEARCH_TICK)
		{
			with(arg0)
			{
				for(var rep = ds_list_size(unit_effect_id)-1; rep >= 0; rep--)
				{
					if(ds_list_find_value(unit_effect_id,rep) == arg1)
					{
						_amount = unit_effect_amount[|rep];
						_tick = unit_effect_tick[|rep];
				
						if(_tick = arg3)
						{
							search_location[search_num] = rep;
							search_num += 1;
						}
					}
				}
			}
		}
		if(arg4[1] = BUFF.SEARCH_BOTH)
		{
			with(arg0)
			{
				for(var rep = ds_list_size(unit_effect_id)-1; rep >= 0; rep--)
				{
					if(ds_list_find_value(unit_effect_id,rep) == arg1)
					{
						_amount = unit_effect_amount[|rep];
						_tick = unit_effect_tick[|rep];
				
						if(_amount = arg2 and _tick = arg3)
						{
							search_location[search_num] = rep;
							search_num += 1;
						}
					}
				}
			}
		}
	}

	if(arg4[0] = BUFF.SEARCH_MOREorSAME)
	{
		if(arg4[1] = BUFF.SEARCH_AMOUNT)
		{
			with(arg0)
			{
				for(var rep = ds_list_size(unit_effect_id)-1; rep >= 0; rep--)
				{
					if(ds_list_find_value(unit_effect_id,rep) == arg1)
					{
						_amount = unit_effect_amount[|rep];
						_tick = unit_effect_tick[|rep];
				
						if(_amount >= arg2)
						{
							search_location[search_num] = rep;
							search_num += 1;
						}
					}
				}
			}
		}
		if(arg4[1] = BUFF.SEARCH_TICK)
		{
			with(arg0)
			{
				for(var rep = ds_list_size(unit_effect_id)-1; rep >= 0; rep--)
				{
					if(ds_list_find_value(unit_effect_id,rep) == arg1)
					{
						_amount = unit_effect_amount[|rep];
						_tick = unit_effect_tick[|rep];
				
						if(_tick >= arg3)
						{
							search_location[search_num] = rep;
							search_num += 1;
						}
					}
				}
			}
		}
		if(arg4[1] = BUFF.SEARCH_BOTH)
		{
			with(arg0)
			{
				for(var rep = ds_list_size(unit_effect_id)-1; rep >= 0; rep--)
				{
					if(ds_list_find_value(unit_effect_id,rep) == arg1)
					{
						_amount = unit_effect_amount[|rep];
						_tick = unit_effect_tick[|rep];
				
						if(_amount >= arg2 and _tick >= arg3)
						{
							search_location[search_num] = rep;
							search_num += 1;
						}
					}
				}
			}
		}
	}

	if(arg4[0] = BUFF.SEARCH_MORE)
	{
		if(arg4[1] = BUFF.SEARCH_AMOUNT)
		{
			with(arg0)
			{
				for(var rep = ds_list_size(unit_effect_id)-1; rep >= 0; rep--)
				{
					if(ds_list_find_value(unit_effect_id,rep) == arg1)
					{
						_amount = unit_effect_amount[|rep];
						_tick = unit_effect_tick[|rep];
				
						if(_amount > arg2)
						{
							search_location[search_num] = rep;
							search_num += 1;
						}
					}
				}
			}
		}
		if(arg4[1] = BUFF.SEARCH_TICK)
		{
			with(arg0)
			{
				for(var rep = ds_list_size(unit_effect_id)-1; rep >= 0; rep--)
				{
					if(ds_list_find_value(unit_effect_id,rep) == arg1)
					{
						_amount = unit_effect_amount[|rep];
						_tick = unit_effect_tick[|rep];
				
						if(_tick > arg3)
						{
							search_location[search_num] = rep;
							search_num += 1;
						}
					}
				}
			}
		}
		if(arg4[1] = BUFF.SEARCH_BOTH)
		{
			with(arg0)
			{
				for(var rep = ds_list_size(unit_effect_id)-1; rep >= 0; rep--)
				{
					if(ds_list_find_value(unit_effect_id,rep) == arg1)
					{
						_amount = unit_effect_amount[|rep];
						_tick = unit_effect_tick[|rep];
				
						if(_amount > arg2 and _tick > arg3)
						{
							search_location[search_num] = rep;
							search_num += 1;
						}
					}
				}
			}
		}
	}

	return search_location;


}
