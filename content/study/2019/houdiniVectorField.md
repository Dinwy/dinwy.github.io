+++
title = "Houdini Vector Field"
date = 2019-01-23T16:48:43+09:00
tags = ["houdini", "cg"]
categories = "study"
+++

<div class="description">
# Preface
What I've learned while making vector field on Houdini. Which will be used in UE4.

## Source From
http://www.tokeru.com/cgwiki/index.php?title=HoudiniVolumes

## Summary
- SideFX provide "Game Development Toolset": https://www.sidefx.com/tutorials/game-development-toolset-overview/
- VolumeTrail node needs 2 things
    - Points to trail
    - Velocity Volumes
- Bounds and Scatter node will make scatter dots
- VDBFromPolygons node is useful.

## Nomenclature
- Houdini: VFX and 3D modeling software
- VDB: Volumetric Data Blocks (Not really. It is just a name)
- SDF: Signed Distance Field
- VOPs: Vector OPerators

## Common Attributes
- P | vector | Point position.
- N | vector | Normal direction.
- V | vector | velocity.
- force | vector | The force attribute on the current point.
