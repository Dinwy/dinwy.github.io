+++
title = "NodesInUE4"
date = 2019-02-05T14:40:34+09:00
tags = []
categories = "study"
thumbnail = "/img/ue4/pannerNode.jpg"
+++

<div class="description">
# Preface

It is a good time to learn about shader nodes.

## Source From
- http://wiki.amplify.pt/index.php?title=Unity_Products:Amplify_Shader_Editor/Panner
- https://docs.unrealengine.com/en-US/Engine/Rendering/Materials/ExpressionReference/Math
- https://www.youtube.com/watch?v=_thf1Z3j73s

## Summary

## Nomenclature

### Nodes
- Panner: The Panner node moves a UV coordinate or other Vector 2 position by speed according to a Time value.
- OneMinus: The OneMinus expression takes an input value "X" and outputs "One Minus X". This operation is performed per channel.
    - Examples: OneMinus of 0.4 is 0.6; OneMinus of (0.2,0.5,1.0) is (0.8,0.5,0.0); OneMinus of (0.0,-0.4,1.6) is (1.0,1.4,-0.6). 
- TextCoord: Base UV texture coordinates. R color represent X axis, G color represent Y axis.