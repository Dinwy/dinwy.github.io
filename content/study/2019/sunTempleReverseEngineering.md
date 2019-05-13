+++
title = "SunTempleReverseEngineering"
date = 2019-05-13T15:31:58+09:00
tags = ["ue4","shader","tutorial"]
categories = "study"
+++

<div class="description">
## Preface

I have seen a good article about reverse engineering UE4 tutorial assets. So I got inspired by that and try to do the same thing.

## Source From

[Unreal 언리얼]태양의 사원 리버스 엔지니어링: http://blog.naver.com/PostView.nhn?blogId=cccani&logNo=221315412825&from=search&redirect=Log&widgetTypeCall=true&directAccess=false


## Summary

So I download the SunTemple example project and opened in Unreal. Then I opened SM_Pillar model.

<img src="/img/ue4/study/sunTempleReverseEngineering/pillarModel.jpg"  style="max-width: 600px;">

About modeling the top part of pillar, the leaf decoration seems like used same brush. And AO & Normal has been added to low poly model.

Let's move to M_pillar material.

<img src="/img/ue4/study/sunTempleReverseEngineering/M_pillar_node.jpg"  style="max-width: 600px;">

First thing I have noticed is that they are using customizedUV, and I don't know how that works. So I went to UE4 documentation.

The document says that customized UV is only manipulating Vertex shader, which has benefit when tiling textures.

> While a UV Coordinate node can be either part of the vertex or pixel shader, the CustomizedUVs feature is only run in the vertex shader, and offers a performance increase over running the same calculations in the pixel shader. This offers an excellent way to speed up even just tiling a texture. 
https://docs.unrealengine.com/en-US/Engine/Rendering/Materials/CustomizedUVs

Mobile specifically, using customized UV has full-precision benefit.

> Additionally, everything in the pixel shader on mobile is evaluated with half precision floats. This causes blocky looking textures and some other artifacts, when pixel shader math is done on texture coordinates. The Customized UV inputs however are done with full precision so they get around this problem.
https://docs.unrealengine.com/en-US/Engine/Rendering/Materials/CustomizedUVs

<img src="/img/ue4/study/sunTempleReverseEngineering/customizedUV.jpg"  style="max-width: 600px;"><br/>
`CustomizedUV example`

And about normals, two normals has been mixed. However `M_Pillar` and `M_Arch` has different way to mix normals.

<img src="/img/ue4/study/sunTempleReverseEngineering/mixingNormalsInMat.jpg"  style="max-width: 1080px;">

Someone wrote a article about how to blend normal maps properly in UE4.

http://www.jackcaron.com/techart/2014/11/14/ue4-normal-blending

Based on this article, it seems like normal blending in M_Pillar seems a bit wrong. Also as far as I know, you should not add two normals.

## Nomenclature

## References
