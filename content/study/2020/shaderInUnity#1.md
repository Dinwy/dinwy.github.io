+++
title = "HLSL Shader in Unity #1"
date = 2020-03-05T17:53:02+09:00
tags = ["unity", "shader"]

categories = "study"
+++

<div class="description">

## Preface

## Source From

- Shaders: What is clip space?: https://answers.unity.com/questions/1443941/shaders-what-is-clip-space.html
- Compute eye space from window space: https://www.khronos.org/opengl/wiki/Compute_eye_space_from_window_space
- Coordinate Systems: https://learnopengl.com/Getting-started/Coordinate-Systems
- NDC Space: Normalized device coordinate or NDC space is a screen independent display coordinate system; it encompasses a cube where the x, y, and z components range from −1 to 1. Although clipping to the view volume is specified to happen in clip space, NDC space can be thought of as the space that defines the view volume. The view volume is effectively the result of reversing the divide by wclip operation on the corners of the NDC cube.

## Summary

Coordinates:

>  first start in local space as local coordinates and are then further processed to world coordinates, view coordinates, clip coordinates and eventually end up as screen coordinates. 

> Clip coordinates are processed to the -1.0 and 1.0 range and determine which vertices will end up on the screen.

1. Local Space
2. Word Space
3. View Space
4. Clip Scape
5. Screen Space

### What is NDC Space?

Normalized device coordinate or NDC space is a screen independent display coordinate system; it encompasses a cube where the x, y, and z components range from −1 to 1. Although clipping to the view volume is specified to happen in clip space, NDC space can be thought of as the space that defines the view volume. The view volume is effectively the result of reversing the divide by wclip operation on the corners of the NDC cube.

## Nomenclature

- SV_POSITION: Clip Pos
- _ScreenParams == iResolution

- https://github.com/johnsietsma/ExtendingLWRP/wiki/LWRPShaders
  - TransformWorldToHClip == UnityObjectToClipPos
  - GetVertexPositionInputs()