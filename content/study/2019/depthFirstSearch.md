+++
title = "DepthFirstSearch"
date = 2019-02-20T11:36:30+09:00
tags = ["c#", "algorithm", "graph"]
categories = "study"
+++

<div class="description">
## Preface

Yesterday, I have solved algorithm quiz on LeetCode: https://leetcode.com/problems/number-of-islands/
After solving the problem, I've realized that this quiz is related with DFS(depth-first-search).
So it is good to know what is DFS.

## Source From
- Depth-first search: https://en.wikipedia.org/wiki/Depth-first_search
- Recursion: https://www.dotnetperls.com/recursion

## Summary
- C# doesn't support tail-recursion-optimization
- > Yes, the CLR supports .tail. The Roslyn compiler currently has no facility for inserting .tail at all, regardless of what the CLR currently does, however. This is unlike, for example, F#, where tail recursion is leveraged. https://github.com/dotnet/roslyn/issues/1235
- Methods calls depth: Method calls can be nested but that impacts performance. The more nesting, the more depth the stack. https://www.dotnetperls.com/method-call-depth

## Nomenclature
- Depth-first search: Is an algorithm for traversing or searching tree or graph data structures.
- Call stack: In computer science, a call stack is a stack data structure that stores information about the active subroutines of a computer program.
- Class vs Struct:
	> Do not define a structure unless the type has all of the following characteristics:
	>   It logically represents a single value, similar to primitive types (integer, double, and so on).
    >	It has an instance size smaller than 16 bytes.
    >	It is immutable.
    >	It will not have to be boxed frequently.
	>  https://stackoverflow.com/questions/521298/when-to-use-struct
- Boxing : The process of converting a value type to the type object or to any interface type implemented by this value type. https://docs.microsoft.com/en-us/dotnet/csharp/programming-guide/types/boxing-and-unboxing
	```cs
	int i = 123;
	// The following line boxes i.
	object o = i;  
	```
- Unboxing: Extracts the value type from the object. 
	```cs
	int i = 123;      // a value type
	object o = i;     // boxing
	int j = (int)o;   // unboxing
	```