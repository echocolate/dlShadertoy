void mainImage( out vec4 fragColor, in vec2 fragCoord)
{
    vec2 uv = fragCoord/iResolution.xy;
    
    
    vec3 bg_col = vec3(.3, .6, .7);
    
    vec3 col_col = vec3(0.8, .1, .91);
    
    int cols = 25;
    
    uv.x *= float(cols);
 
    float f = texelFetch(iChannel0, ivec2(int(uv.x)*512/cols,.0), 0).x;
    
    bool x_flag = (abs(fract(uv.x) - .5) < .3) ? true : false;
    bool y_flag = (uv.y < f) ? true : false; 

    fragColor = x_flag && y_flag ? vec4(col_col, 1.) : vec4(bg_col,1.);

}
