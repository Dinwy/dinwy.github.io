+++
title = "LeetCode/20. Valid Parentheses"
date = 2020-03-12T00:15:11+09:00
tags = ["coding", "algorithm", "leetCode"]
categories = "algorithm"
+++

<div class="description">

## Preface

I think I've already solved this problem on CodeWars. But it is a good exercise solve this problem again.

## Link

https://leetcode.com/problems/valid-parentheses

## Summary

This is asking two things, can you use `Stack` and `Dictionary`. When I was solving this first time, I was more thinking about using three `HashSet`. However after thinking and checking the best solution, I only need a single `Dictionary` & temporary `Stack` to validate.

## Solution

### My First Solution

```cs
public bool IsValidFirstSolution(string s)
{
	var stack = new Stack<string>(s.Select(x => x.ToString()).ToArray());
	var tempStack = new Stack<string>();

	var correctSet = new HashSet<string>() { "{}", "[]", "()" };
	var leftBraces = new HashSet<string>() { "{", "[", "(" };
	var rightBraces = new HashSet<string>() { "}", "]", ")" };

	while (stack.Count > 0)
	{
		var current = stack.Pop();
		while (rightBraces.Contains(current))
		{
			tempStack.Push(current);

			if (stack.Count == 0) return false;
			current = stack.Pop();
		}

		if (tempStack.Count == 0) return false;

		var combination = current + tempStack.Pop();
		if (!correctSet.Contains(combination)) return false;
	}

	return tempStack.Count == 0;
}
```

### Best Solution

```cs
public bool IsValid(string s)
{
	var correctSet = new Dictionary<char, char>() {
		{'{', '}'},
		{'[', ']'},
		{'(', ')'}
	};
	var tempStack = new Stack<char>();

	for (int i = 0; i < s.Length; i++)
	{
		if (correctSet.ContainsKey(s[i]))
		{
			tempStack.Push(correctSet[s[i]]);
		}
		else
		{
			if (tempStack.Count == 0) return false;
			var pair = tempStack.Pop();
			if (s[i] != pair) return false;
		}
	}

	
```

