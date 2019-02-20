+++
title = "RayMarching#1"
date = 2019-02-19T12:12:50+09:00
tags = ["shader","rayMarching"]
categories = "study"
+++

<div class="description">
## Preface

Using OpenGL, practicing ray marching.

## Source From
- http://iquilezles.org/www/articles/distfunctions/distfunctions.htm
- http://jamie-wong.com/2016/07/15/ray-marching-signed-distance-functions/
- How to Normalize a vector: https://www.youtube.com/watch?v=7fn03DIW3Ak

## Summary
- ShaderToy controls only a fragment shader

## Nomenclature
### ShaderToy
- fragCoord: Current fragment(pixel) position
- iResolution: The size of the frame. Equal to windows/viewport
- Signed Distance Functions(SDF): When passed the coordinates of a point in space, return the shortest distance between that point and some surface. 
- Radians: Convert a quantity in degrees to radians. 2π rad = 360∘  1rad ≒ 57.3∘
- Normalize: Calculates the unit vector in the same direction as the original vector. Divice vector by its maginitude. Therefore, new length will be 1.
