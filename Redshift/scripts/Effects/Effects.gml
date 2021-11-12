enum effect_id
{
	NONE,
	HEALTH_HEAL
}

function effect_add(_source, _target, _id, _duration, _amount)
{
	with(_target)
	{
		ds_list_add(unit_effect_source, _source);	
		ds_list_add(unit_effect_target, _target);
		ds_list_add(unit_effect_id, _id);
		ds_list_add(unit_effect_first, true);
		ds_list_add(unit_effect_duration, _duration);
		ds_list_add(unit_effect_duration_original, _duration);
		ds_list_add(unit_effect_amount, _amount);
		ds_list_add(unit_effect_amount_original, _amount);
	}
}

function effect_apply(_airframe, _engine, _shield, _weapon)
{
	var _i = 0; var _j = 0;
	
	for(_i = 0; _i < unit_effect_size; _i++)
	{
		switch(unit_effect_type[|_i])
		{
			default:
			case effect_id.NONE:
				ds_list_delete(unit_effect_source, _i);
				ds_list_delete(unit_effect_target, _i);
				ds_list_delete(unit_effect_id, _i);
				ds_list_delete(unit_effect_first, _i);
				ds_list_delete(unit_effect_duration, _i);
				ds_list_delete(unit_effect_duration_original, _i);
				ds_list_delete(unit_effect_amount, _i);
				ds_list_delete(unit_effect_amount_original, _i);
					
				unit_effect_size -= 1;
				_i -= 1;
				break;
			case effect_id.HEALTH_HEAL:
				break;
		}
	}
}