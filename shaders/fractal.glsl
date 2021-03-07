vec2 cx_sqr(vec2 a) {
  float x2 = a.x*a.x;
  float y2 = a.y*a.y;
  float xy = a.x*a.y;
  return vec2(x2 - y2, xy + xy);
}

vec4 effect(vec4 color, Image tex, vec2 texture_coords, vec2 screen_coords)
{
    vec2 z = screen_coords/200-vec2(2,2);
    vec2 c = z;
    vec2 pz = z;
    vec3 sumz = vec3(0.0, 0.0, 0.0);
    int i;
    for (i = 0; i < 1000; ++i) {
        vec2 ppz = pz;
        pz = z;
        z = cx_sqr(z) + c;
        if (dot(z, z) > 10) { break; }
        sumz.x += dot(z - pz, pz - ppz);
        sumz.y += dot(z - pz, z - pz);
        sumz.z += dot(z - ppz, z - ppz);
    }
    if (i == 1000) {
        return vec4(0, 0, 0, 1.0);
    }
    float n1 = sin(float(i) * 0.1) * 0.5 + 0.5;
    float n2 = cos(float(i) * 0.1) * 0.5 + 0.5;
    return vec4(n1, n2, 1.0, 1.0);
}
