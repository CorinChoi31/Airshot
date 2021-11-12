gpu_set_blendmode(blend);
draw_sprite_ext(sprite,subimg,x,y,max(0,image_xscale),max(0,image_yscale),image_angle,dcolor,dalpha);
gpu_set_blendmode(bm_normal);