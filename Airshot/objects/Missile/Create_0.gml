player = noone;

speeds = 0;
speed_origin = 0;
speed_accel = room_speed/3;

partEmit = part_emitter_create(global.partSys);

prevX = phy_position_x;
prevY = phy_position_y;

player_position = 0;

phy_bullet = true;
phy_fixed_rotation = true;

duration = 0;
damage = 0;

image_alpha = 0;

effect_id = [0,0];

range = 96;

width = 16;

target = noone;