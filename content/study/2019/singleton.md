+++
title = "Singleton"
date = 2019-02-04T15:15:22+09:00
tags = ["c#", "programming"]
categories = "study"
+++

<div class="description">
## Preface

I think it is a good time to review and cleanup my C# knowledge.

## Source From
- http://csharpindepth.com/Articles/General/Singleton.aspx
- https://stackoverflow.com/questions/614818/in-c-what-is-the-difference-between-public-private-protected-and-having-no

## Summary
- Private constructor
- Static instance to achieve singleton class
- Nested class to initialized singleton class
- Using System.Lazy<T> is also possible way to create singleton class

```cs
public sealed class SingletonNested
{
    private SingletonNested() { }

    class SingletonCreator
    {
        static SingletonCreator() { }

        internal static readonly SingletonNested Instance = new SingletonNested();
    }

    public static SingletonNested Instance { get { return SingletonCreator.Instance; } }
}
```

## Nomenclature
- Assembly: An assembly is a "unit of deployment" for .NET, almost always a .exe or .dll.
- Access modifiers:

<img src="/img/accessModifiers.png" style="max-width: 480px;">


