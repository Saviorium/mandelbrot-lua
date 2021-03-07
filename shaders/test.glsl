vec4 effect(vec4 color, Image tex, vec2 texture_coords, vec2 screen_coords)
{
    return color * vec4(screen_coords.x/500, screen_coords.y/500, 1-(screen_coords.x+screen_coords.y)/500, 1);
}
