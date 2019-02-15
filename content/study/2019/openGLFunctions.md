+++
title = "OpenGL Functions"
date = 2019-02-15T19:42:18+09:00
tags = []
categories = "study"
+++

<div class="description">

## Preface
Learning about OpenGL shaders.

## Source From
- Shadertoy for absolute beginners: https://youtu.be/u5HAYVHsasc

## Summary
```opengl

vec3 invert(vec3 inp)
{
    return vec3(inp.x * -1., inp.y * -1., inp.z * -1.);
}


float oneMinus(float inpt)
{
    return 1. - inpt;
}

float circle(vec2 uv, vec2 p, float r, float blur) {
    float d = length(uv - p);
    float c = smoothstep(r, r-blur, d);
    
    return c;
}

void mainImage( out vec4 fragColor, in vec2 fragCoord )
{
    // Normalized pixel coordinates (from 0 to 1)
    vec2 uv = fragCoord.xy / iResolution.xy;
	uv -= .5;
    uv.x *= iResolution.x / iResolution.y;

    vec3 col = vec3(0, 1, 0);
    float mask = circle(uv, vec2(0.), .4, .05);
    
    mask -= circle(uv, vec2(-0.13, 0.2), .07, .01);
    mask -= circle(uv, vec2(0.13, 0.2), .07, .01);
    
    float mouth = circle(uv, vec2(0. ), .3, 0.02);
    mouth -= circle(uv, vec2(0., 0.1), .3, .02);
    
    mask -= mouth;
    col = vec3(1., 1., 0.) * mask;
    
    fragColor = vec4(col, 1);
}
```

## Nomenclature
### OpenGL functions
- length: Calculate length of a vector
	- √x[0]2+x[1]2+…
- smoothstep: perform Hermite interpolation between two values