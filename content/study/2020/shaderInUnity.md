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

### Example

Using HLSL code gives some structural benefits. However it is a bit complicated to set it up. Unity code are conflicting itself still. You need to directly reference the github page. (https://github.com/Unity-Technologies/ScriptableRenderPipeline)

1. The packages were conflicting by themselves in 2019.3 URP 7.40. You have to manually reference or adjust it by writing `#include Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl`
2. Remember that Y coordinates of GLSL & HLSL is different. You need to write this down using hlsl in Unity.
```glsl
	#if UNITY_UV_STARTS_AT_TOP
		o.texcoord = o.texcoord * float2(1.0, -1.0) + float2(0.0, 1.0);
	#endif
```
3. General functions which used in previous Unity versions, now they named in differently. Can't find a proper document for that and the easiest way to do is go to the github page.


- CustomOutline.shader
```glsl
Shader "Hidden/Custom/Outline"
{
        SubShader
        {
            Cull Off ZWrite Off ZTest Always

            Pass
            {
                HLSLPROGRAM
                #pragma vertex VertDefault
                #pragma fragment Frag

                #include "CustomOutline.hlsl"

                ENDHLSL
            }
        }
}
```

-CustomOutline.hlsl
```glsl
#include "Packages/com.unity.render-pipelines.universal/ShaderLibrary/Core.hlsl"
#include "Packages/com.unity.render-pipelines.core/ShaderLibrary/Common.hlsl"
#include "AttributeDefaults.hlsl"
#include "Utils.hlsl"

Texture2D _MainTex;
Texture2D _CameraDepthTexture;
SamplerState sampler_MainTex;

float _Blend;

VaryingsDefault VertDefault(AttributesDefault v)
{
	VaryingsDefault o;
	o.posCS = float4(v.vertex.xy, 0.0, 1.0);
	o.texcoord = TransformTriangleVertexToUV(v.vertex.xy);

	#if UNITY_UV_STARTS_AT_TOP
		o.texcoord = o.texcoord * float2(1.0, -1.0) + float2(0.0, 1.0);
	#endif

	return o;
}

float4 Frag(VaryingsDefault i) : SV_Target
{
	float4 col = SAMPLE_TEXTURE2D(_MainTex, sampler_MainTex, i.texcoord);
	float4 offsetCol = SAMPLE_TEXTURE2D(_MainTex, sampler_MainTex, i.texcoord - 0.002);
	if (length(col - offsetCol) > 0.1) col = 0;

	return col;
}
```

## Nomenclature

- SV_POSITION: Clip Pos
- _ScreenParams == iResolution

- https://github.com/johnsietsma/ExtendingLWRP/wiki/LWRPShaders
  - TransformWorldToHClip == UnityObjectToClipPos
  - GetVertexPositionInputs()