engine.refresh();
if(keyboard_check(key_player_acceleration))
{
	engine.linear_acceleration();
}
if(keyboard_check(key_player_deceleration))
{
	engine.linear_deceleration();
}

if(keyboard_check(key_player_turn_left))
{
	engine.angular_left();
}
if(keyboard_check(key_player_turn_right))
{
	engine.angular_right();
}
engine.angular_direction += engine.angular_speed;

phy_speed_x = lengthdir_x(engine.linear_speed, engine.angular_direction);
phy_speed_y = lengthdir_y(engine.linear_speed, engine.angular_direction);
phy_rotation = engine.angular_direction

engine.linear_speed = sign(engine.linear_speed) * (abs(engine.linear_speed)-engine.total_linear_speed_damping);
engine.angular_speed = sign(engine.angular_speed) * (abs(engine.angular_speed)-engine.total_angular_speed_damping);