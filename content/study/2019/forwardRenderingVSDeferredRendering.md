+++
title = "Forward Rendering VS Deferred Rendering"
date = 2019-01-25T15:30:24+09:00
tags = ["cg", "opengl"]
categories = "study"
+++

<div class="description">
## Preface
Understanding difference between forward rendering and deferred rendering.

## Source From
https://gamedevelopment.tutsplus.com/articles/forward-rendering-vs-deferred-rendering--gamedev-12342
https://www.youtube.com/watch?v=C8FK9Xn1gUM

## Summary
- Modern graphics pipe line
    - Vertex Shader: +position +normal +texCoord
    - Geometry Shader: Executes once for each **primitive**
    - Fragment Shader: pixel color
- Deferred lighting is a modification of deferred rendering that reduces the size of the G-buffer by using more passes on the scene.
- Lighting is the main reason for going one route versus the other.
- Deferred Rendering
    - Doesn't support alpha blending.
    - Require high bandwidth.
    - No anti-aliasing.
- In case using many dynamic light, deferred rending will be a better choice.

## Nomenclature
- G-buffer: The combination of 2D image buffers. Diffuse Specular, Normals, Depth.
- Vertex shader: A single vertex point
- Geometry shader: Takes each transformed primitive. Create mathematical meshes based on a point.
- Pixel shader(= Fragment Shader): Calculate the color of a pixel on the screen.