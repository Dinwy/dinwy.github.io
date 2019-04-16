+++
title = "ProceduralHologram"
date = 2019-03-26T09:58:07+09:00
tags = ["ue4","shader"]
categories = "everyday"
thumbnail = "/video/ue4/proceduralHologram.webm"
+++

<div class="image">
<video playsinline autoplay muted loop id="vid" src="/video/ue4/proceduralHologram.webm" type="video/mp4" style="max-width: 640px;">
</div>

<div class="description">
# Description

Learning about vertex offset manipulation. Shader node from DeepSpaceBanana. <br/>
Since I create this for learning purpose, some parts are slightly different from the original.

  - Not using panning bar.
  - Using fully UV unwrapped for each quad rather than dividing XY by total amount of quads.
  - Not using sine wave to create burst impact.

## Blueprint
<img src="/img/ue4/BP_proceduralHologram.jpg">

# References
- Procedural Hologram Shader: https://deepspacebanana.github.io/deepspacebanana.github.io/blog/shader/art/unreal%20engine/Hologram-Shader-V1
