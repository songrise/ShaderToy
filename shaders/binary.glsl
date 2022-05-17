
vec3 discretize(vec3 x) {
    return floor(x+0.5);
}

vec3 cvtGrey(vec3 color) {
    return vec3(0.299*color.r + 0.587*color.g + 0.114*color.b);
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
	vec2 uv = fragCoord.xy / iResolution.xy;
	vec3 tex = texture(iChannel0, uv).xyz;

    vec3 grey = cvtGrey(tex);
    float threshold = 0.3;
    vec3 bin = step(threshold, grey);
    fragColor = vec4(bin,1.0);
    // fragColor = vec4(grey,1.0);
}