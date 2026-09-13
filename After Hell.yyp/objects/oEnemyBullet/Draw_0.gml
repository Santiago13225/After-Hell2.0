draw_self();

gpu_set_blendenable(false);//Turn off alpha blending. Anything we draw with any transparency is going to be drawn at its natural opacity.
gpu_set_colorwriteenable(false, false, false, true);//Turn off 3 RGB channels, but leave alpha channel on.
draw_set_alpha(0);//Draw the rectangle over the sprite at an alpha of 0.
var x1 = x-sprite_xoffset;//X-coordinate of the top-left corner of the sprite. X-position minus the sprite x-offset. X-offset is equal to the x-position of the origin.
var y1 = y-sprite_yoffset;//Uses top-left corner as well.
draw_rectangle(x1, y1, x1 + sprite_width, y1 + sprite_height, false);//Use top-left corner and bottom-right corner to draw rectangle. We use false as we don't want an outline but a full rectangle.
//We draw the rectangle to the alpha channel. Because we have disabled alpha blending, the alpha of the area over the sprite is going to be 0.
//Because the rectangle area is 0, anything on top of the sprite with an alpha of 1 will give us an occlusion. We will draw the silhouette over the occlusion.
//Any area over the sprite that has an alpha of 0 leads to no occlusion, so we don't draw a silhouette there.
draw_set_alpha(1);//Reset the draw alpha to 1. 
gpu_set_colorwriteenable(true, true, true, true);//Turn all the channels back on, so that everything after the sprite can draw itself normally.
gpu_set_blendenable(true);//Allow transparency in our image.