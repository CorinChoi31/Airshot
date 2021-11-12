enum types
{
	TRUE = 0,
	BULLET,
	BURST,
}

function Airframe(_sprite, _subimg, _healths, _healths_max, _healths_regeneration, _healths_regeneration_delay, _defense) constructor
{
	sprite = is_undefined(_sprite) ? noone : _sprite;
	subimg = is_undefined(_subimg) ? -1 : _subimg;
	
	
	healths = is_undefined(_healths) ? 0 : _healths;
	
	healths_max = is_undefined(_healths_max) ? 0 : _healths_max;
	healths_regeneration = is_undefined(_healths_regeneration) ? 0 : _healths_regeneration;
	healths_regeneration_delay = is_undefined(_healths_regeneration_delay) ? 0 : _healths_regeneration_delay;
	
	effect_healths_max = 0;
	effect_healths_regeneration = 0;
	effect_healths_regeneration_delay = 0;
	
	total_healths_max = healths_max + effect_healths_max;
	total_healths_regeneration = healths_regeneration + effect_healths_regeneration;
	total_healths_regeneration_delay = healths_regeneration_delay + effect_healths_regeneration_delay;
	
	
	defense = is_undefined(_defense) ? 0 : _defense;
	
	effect_defense = 0;
	
	total_defense = defense + effect_defense;
	
	
	static step = function()
	{
		
	}
	
	static refresh = function()
	{
		total_healths_max = healths_max + effect_healths_max;
		total_healths_regeneration = healths_regeneration + effect_healths_regeneration;
		total_healths_regeneration_delay = healths_regeneration_delay + effect_healths_regeneration_delay;
		
		total_defense = defense + effect_defense;
	}
}
function Engine(_linear_speed, _linear_speed_max, _linear_speed_acceleration, _linear_speed_damping, _angular_speed, _angular_speed_max, _angular_speed_acceleration, _angular_speed_damping) constructor
{
	status = false;
	
	powers = 1;
	
	linear_speed = is_undefined(_linear_speed) ? 0 : _linear_speed;
	linear_speed_max = is_undefined(_linear_speed_max) ? 2 : _linear_speed_max;
	linear_speed_acceleration = is_undefined(_linear_speed_acceleration) ? 1/room_speed : _linear_speed_acceleration;
	linear_speed_damping = is_undefined(_linear_speed_damping) ? 0 : _linear_speed_damping;
	
	angular_direction = 0;
	angular_rotate = false;
	
	angular_speed = is_undefined(_angular_speed) ? 0 : _angular_speed;
	angular_speed_max = is_undefined(_angular_speed_max) ? 90 : _angular_speed_max;
	angular_speed_acceleration = is_undefined(_angular_speed_acceleration) ? 0.1/room_speed : _angular_speed_acceleration;
	angular_speed_damping = is_undefined(_angular_speed_damping) ? 0 : _angular_speed_damping;
	
	effect_linear_speed_max = 0;
	effect_linear_speed_acceleration = 0;
	effect_linear_speed_damping = 0;
	
	effect_angular_speed_max = 0;
	effect_angular_speed_acceleration = 0;
	effect_angular_speed_damping = 0;
	
	total_linear_speed_max = linear_speed_max + effect_linear_speed_max;
	total_linear_speed_acceleration = linear_speed_acceleration + effect_linear_speed_acceleration;
	total_linear_speed_damping = linear_speed_damping + effect_linear_speed_damping;
	
	total_angular_speed_max = angular_speed_max + effect_angular_speed_max;
	total_angular_speed_acceleration = angular_speed_acceleration + effect_angular_speed_acceleration;
	total_angular_speed_damping = angular_speed_damping + effect_angular_speed_damping;
	
	static refresh = function()
	{
		total_linear_speed_max = linear_speed_max + effect_linear_speed_max;
		total_linear_speed_acceleration = linear_speed_acceleration + effect_linear_speed_acceleration;
		total_linear_speed_damping = linear_speed_damping + effect_linear_speed_damping;
	
		total_angular_speed_max = angular_speed_max + effect_angular_speed_max;
		total_angular_speed_acceleration = angular_speed_acceleration + effect_angular_speed_acceleration;
		total_angular_speed_damping = angular_speed_damping + effect_angular_speed_damping;
	}
	
	static linear_acceleration = function()
	{
		linear_speed = min(linear_speed+total_linear_speed_acceleration, total_linear_speed_max);
	}
	static linear_deceleration = function()
	{
		linear_speed = max(linear_speed-total_linear_speed_acceleration, 0);
	}
	
	static angular_left = function()
	{
		angular_speed = min(angular_speed+total_angular_speed_acceleration, total_angular_speed_max);
	}
	static angular_right = function()
	{
		angular_speed = max(angular_speed-total_angular_speed_acceleration, -total_angular_speed_max);
	}
}
function Shield(_shields, _shields_max, _shields_regeneration, _shields_regeneration_delay) constructor
{
	status = true;
	
	shields = is_undefined(_shields) ? 0 : _shields;
	
	shields_max = is_undefined(_shields_max) ? 0 : _shields_max;
	shields_regeneration = is_undefined(_shields_regeneration) ? 0 : _shields_regeneration;
	shields_regeneration_delay = is_undefined(_shields_regeneration_delay) ? 0 : _shields_regeneration_delay;
	
	effect_shields_max = 0;
	effect_shields_regeneration = 0;
	effect_shields_regeneration_delay = 0;
	
	total_shields_max = shields_max + effect_shields_max;
	total_shields_regeneration = shields_regeneration + effect_shields_regeneration;
	total_shields_regeneration_delay = shields_regeneration_delay + effect_shields_regeneration_delay;
	
	static refresh = function()
	{
		total_shields_max = shields_max + effect_shields_max;
		total_shields_regeneration = shields_regeneration + effect_shields_regeneration;
		total_shields_regeneration_delay = shields_regeneration_delay + effect_shields_regeneration_delay;
	}
}
function Weapon(_type, _attack_damage, _attack_delay, _attack_times, _attack_critical_chance, _attack_critical_damage) constructor
{
	status = true;
	
	type = is_undefined(_type) ? types.BULLET : _type;
	
	attack_damage = is_undefined(_attack_damage) ? 0 : _attack_damage;
	attack_delay = is_undefined(_attack_damage) ? 0.5*room_speed : _attack_delay;
	attack_times = is_undefined(_attack_times) ? 2 : _attack_times;
	
	attack_critical_chance = is_undefined(_attack_critical_chance) ? 0 : _attack_critical_chance;
	attack_critical_damage = is_undefined(_attack_critical_damage) ? 1 : _attack_critical_damage;
	
	effect_attack_damage = 0;
	effect_attack_delay = 0;
	effect_attack_times = 0;
	
	effect_attack_critical_chance = 0;
	effect_attack_critical_damage = 0;
	
	total_attack_damage = attack_damage + effect_attack_damage;
	total_attack_delay = attack_delay + effect_attack_delay;
	total_attack_times = attack_times + effect_attack_times;
	
	total_attack_critical_chance = attack_critical_chance + effect_attack_critical_chance;
	total_attack_critical_damage = attack_critical_damage + effect_attack_critical_damage;
	
	static refresh = function()
	{
		total_attack_damage = attack_damage + effect_attack_damage;
		total_attack_delay = attack_delay + effect_attack_delay;
		total_attack_times = attack_times + effect_attack_times;
	
		total_attack_critical_chance = attack_critical_chance + effect_attack_critical_chance;
		total_attack_critical_damage = attack_critical_damage + effect_attack_critical_damage;
	}
	
	fire = function()
	{
		
	};
}