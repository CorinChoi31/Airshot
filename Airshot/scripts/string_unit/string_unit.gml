///string_unit(real,unit)
function string_unit(argument0, argument1) {

	var _text = string(argument0);

	var _arr = 0;
	var _str = "";

	var _max = string_length(_text);
	var _max_mod = _max-1;

	for(var i = 1; i <= _max; i += 1)
	{
		_str += string_char_at(_text,i);
		if(_max_mod%argument1 mod argument1 = 0)
		{
			if(i != _max)
			{
				_str += ",";
			}
		}
		_max_mod--;
	}

	return _str;


}
