player = instance_create_layer(256, 256, "Game", OBJ_Flight);

camera_assign(0, undefined);

//camera_set_view_target(global.__camera, player);
camera_set_view_pos(global.__camera, player.x, player.y);