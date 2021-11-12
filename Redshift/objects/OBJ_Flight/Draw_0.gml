camera_set_view_pos(global.__camera, x, y);
camera_assign(0, undefined);

draw_sprite_ext(airframe.sprite, airframe.subimg, x, y, 1, 1, engine.angular_direction, c_white, 1);