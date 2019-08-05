+++
title = "Using CustomShader In UE4.22"
date = 2019-07-03T10:57:22+09:00
tags = ["ue4", "shader"]
categories = "study"
+++

# Preface

I've found a good article about how to write a custom shader in UE4 yesterday.

> Unreal Engine 4 Custom Shaders Tutorial: https://www.raywenderlich.com/57-unreal-engine-4-custom-shaders-tutorial

The article has been made based on UE4.19 and was not working on UE4.22. Because default shader folder has been changed. Therefore it is good to write it down how to do that on UE 4.22.

## Workflow

1. Follow tutorial from `Unreal Engine 4 Custom Shaders Tutorial`
2. You will fail when loading `.usf` file from the folder.
3. Now we need to create C++ GameMode. Right click on content view. `New C++ Class` -> `None` and create class.(We will delete later)

	<div class="image">
	<img src="/img/ue4/study/customShader/step1.jpg" style="max-width: 640px;">
	<img src="/img/ue4/study/customShader/step2.jpg" style="max-width: 640px;">
	</div>
	<div class="image">
	</div>

4. Open Visual Studio 2017.
5. Delete `MyClass.cpp` and `MyClass.h`
6. We will modify `${YourProjectName}.cpp` and `${YourProjectName}.h`. In this document, it is `TestGround.cpp` and `TestGround.h`
7. Change `TestGround.h`

	```cpp
	// Fill out your copyright notice in the Description page of Project Settings.

	#pragma once

	#include "CoreMinimal.h"
	#include "ModuleManager.h"

	class FTestGroundModule: public IModuleInterface
	{
	public:
		virtual void StartupModule() override;
		virtual void ShutdownModule() override;
	};
	```

8. Change `TestGround.cpp`

	```cpp
	// Fill out your copyright notice in the Description page of Project Settings.

	#include "TestGround.h"
	#include "Modules/ModuleManager.h"

	void FTestGroundModule::StartupModule()
	{
	#if (ENGINE_MINOR_VERSION >= 21)    
		FString ShaderDirectory = FPaths::Combine(FPaths::ProjectDir(), TEXT("Shaders"));
		AddShaderSourceDirectoryMapping("/Project", ShaderDirectory);
	#endif

	}

	void FTestGroundModule::ShutdownModule()
	{
	}

	IMPLEMENT_PRIMARY_GAME_MODULE( FTestGroundModule, TestGround, "TestGround" );
	```

9. Delete `MyClass`

	<div class="image">
	<img src="/img/ue4/study/customShader/step3.jpg" style="max-width: 640px;">
	</div>
	<div class="image">
	</div>

10. End. Now you are able to load your `.usf` file from `/YourProject/Shaders` folder.

## References

- Unreal Engine 4 Custom Shaders Tutorial: https://www.raywenderlich.com/57-unreal-engine-4-custom-shaders-tutorial
- https://forums.unrealengine.com/development-discussion/rendering/1562454-virtual-shader-source-path-link-custom-shaders-4-21-4-22
