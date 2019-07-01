+++
title = "Shader Practice TextureCoordinates Day1PracticeJuly2019"
date = 2019-07-01T15:28:20+09:00
tags = ["shader", "unity", "ue4"]
categories = "everyday"
thumbnail = "/video/ue4/battleTransitionEffect.webm"
+++

# Description

Glad I have some time to practice shader at work. Today I'll review very basic part of pixel shader and will create.

## TextureCoordinates basic

It is a good place to learn about pixel shader in Shadertoy(https://www.shadetoy.com). It simply displays mainImage on the screen.
The code below is simply how to draw circle.

```js
float sdCircle( vec2 p, float r )
{
  return length(p) - r;
}

void mainImage(out vec4 fragColor, in vec2 fragCoord )
{
    // Normalized pixel coordinates (from 0 to 1)
    // The order is important
    vec2 uv = fragCoord.xy/iResolution.xy;

    uv -= .5;
    uv.x *= iResolution.x/ iResolution.y;

    float c = sdCircle(uv, .5);
  
    if ( c < .0) c = 1.0; else c = 0.;

     // Output to screen
    fragColor = vec4(vec3(c), 1.0);
}
```

Let's break down this into the small pieces. This main image will run every pixels on the window it displays it. 

1. So `vec2 uv` means that normalized value between 0-1 on the screen.
2. UV value -.5 which now uv's range will be -0.5 to 0.5
3. UV.x will be multiply by ratio of `iResolution.x` and `iResolution.y`. For example, on 1080p screen, it will be 1920 / 1080 = 1.7778. Which will correct the UV.x stretching.
4. Calculate circle. This is **signed distance functions***(https://en.wikipedia.org/wiki/Signed_distance_function). Simply, on arbitrary position `p`, we can figure out we are inside of that circle or surface or outside. The data we need to calculate is **circle's center position** and **radius of circle** and **p**. In this function we put circle in the center `(0, 0, 0)` so we don't need to check the center of the circle however in 3D space we need to change this function like as this below.

```js
// params:
// p: arbitrary point in 3D space
// c: the center of our sphere
// r: the radius of our sphere
float distance_from_sphere(in vec3 p, in vec3 c, float r)
{
    return length(p - c) - r;
}
```

5. By processing 4, we will get blurry dark circle in the center which radius is `.5` 
6. We will make black and white rather than using blurry image. The point `p` Inside of the circle will be shown as white and outside will be shown as black.
7. Output to screen.

> Source from: http://www.michaelwalczyk.com/blog/2017/5/25/ray-marching

### Usage

This is a very basic of how fragment shader works and knowing this will give you to make a idea how UV works. We can use this like as **Keijiro/TV** effect. I've recreated that effect on UE4( https://dinwy.github.io/everyday/2019/tv/). On that link, see how `UV.x` is distorted. By adding some values to the `UV.x` the image looks like it is distorted. That is exactly done in this article like `uv.x *= iResolution.x/ iResolution.y;`

### nomenclature

- fragcoord: contains the window-relative coordinates of the current fragment. https://www.khronos.org/registry/OpenGL-Refpages/gl4/html/gl_FragCoord.xhtml

### Stats

- Time taken: 00:42:05

## Pokemon Battle Transition

Since today is the first day of doing **Practice July 2019**, it would be nice to recreate shader which I've created before. I have recreated this on Unity3D few months ago and will recreate this on UE4.

- On Unity with ASE

<div class="image">
<img src="/img/unity/battleTransitionEffect.jpg" style="max-width: 1024px;">
</div>

- On Unreal Engine 4

<div class="image">
<video playsinline autoplay muted loop id="vid" src="/video/ue4/battleTransitionEffect.webm" type="video/mp4">
</div>

<div class="image">
<img src="/img/ue4/BP_battleTransitionEffect.jpg" style="max-width: 1024px;">
</div>

### References

- Shaders Case Study - Pokemon Battle Transitions: https://youtu.be/LnAoD7hgDxw

### Stats

- TIme Taken: 1:55:00

## Thoughts

I was spending way more time than I've expected. Reasons were that I was tired this afternoon also tried to improve some parts in UE4 which was worth trying. However it took too much time. Need to be handled in a better way tomorrow and the next time.

