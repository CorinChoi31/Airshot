function GPane(_x, _y, _width, _height) constructor
{
	/// funct GPane(x, y, width, height)
	/// descr 
	/// param {real} x
	/// param {real} y
	/// param {real} width
	/// param {real} height
	
	parent = noone; parent_x = 0; parent_y = 0;
	parent_on_surface = false;
	
	x = _x; x_target = x; x_trace = 1;
	y = _y; y_target = y; y_trace = 1;
	width = _width; width_target = width; width_trace = 1;
	height = _height; height_target = height; height_trace = 1;
	
	contents = ds_list_create();
	
	option_tick = 1;
	
	static step = function()
	{
		var _frame = round(option_tick);
		
		if(x != x_target)
		{
			repeat(_frame)
				x = lerp(x, x_target, x_trace);
		}
		if(y != y_target)
		{
			repeat(_frame)
				y = lerp(y, y_target, y_trace);
		}
		
		if(width != width_target)
		{
			repeat(_frame)
				width = lerp(width, width_target, width_trace);
		}
		if(height != height_target)
		{
			repeat(_frame)
				height = lerp(height, height_target, height_trace);
		}
		
		parent_x = x;
		parent_y = y;
		
		var _x = x;
		var _y = y;
		
		if(parent != noone)
		{
			_x += parent.x;
			_y += parent.y;
			
			parent_x += parent.x;
			parent_y += parent.y;
		}
		
		var _i = 0;
		var _size = ds_list_size(contents);
		for(_i = 0; _i < _size; _i++)
		{
			contents[|_i].step();	
		}
	}
	
	static draw = function()
	{
		var _i = 0;
		var _size = ds_list_size(contents);
		for(_i = 0; _i < _size; _i++)
		{
			contents[|_i].draw();	
		}
	}
	
	static addContent = function(_content)
	{
		var _prev = _content.parent;
		
		_content.parent = self;
		_content.parent_on_surface = false;
		
		ds_list_add(contents, _content);
		
		return _prev;
	}
}