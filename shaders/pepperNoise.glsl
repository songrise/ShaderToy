
//glitch shader
vec3 discretize(vec3 x) {
    return floor(x+0.5);
}


//note: [0;1]
float rand( vec2 n ) {
  return fract(sin(dot(n.xy, vec2(12.9898, 78.233)))* 43758.5453);
}

float randVarying(vec2 n) {
    //temporally varying noise
  return fract(sin(dot(n.xy, vec2(12.9898-iTime, 78.233+iTime)))* 43758.5453);
}



void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
	vec2 uv = fragCoord.xy / iResolution.xy;
	vec3 tex = texture(iChannel0, uv).xyz;
    
    float intensity = 0.1;

    vec3 noise = vec3(randVarying(uv));
    // salt-and-pepper noise
    noise = discretize(noise)*2.0-1.0;
    vec3 final = mix(tex, noise, intensity);
    fragColor = vec4(final,1.0);
    
}