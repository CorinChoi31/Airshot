unit_effect_size = 0;
unit_effect_source = ds_list_create();
unit_effect_target = ds_list_create();
unit_effect_id = ds_list_create();
unit_effect_first = ds_list_create();
unit_effect_duration = ds_list_create();
unit_effect_duration_original = ds_list_create();
unit_effect_amount = ds_list_create();
unit_effect_amount_original = ds_list_create();

key_player_acceleration = ord("W");
key_player_deceleration = ord("S");
key_player_turn_left = ord("A");
key_player_turn_right = ord("D");

airframe = new Airframe(SPR_Airships, 2, 100, 100, 0, 0, 10);
engine = new Engine(0, 100/room_speed, 7.5/room_speed, 0.1/room_speed, 0, 90/room_speed, 15/room_speed, 5/room_speed);
shield = new Shield(100, 100, 10/room_speed, 3*room_speed);
weapon = new Weapon();