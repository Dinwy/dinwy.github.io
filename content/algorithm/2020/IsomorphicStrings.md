+++
title = "LeetCode/205. IsomorphicStrings"
date = 2020-04-29T17:04:26+09:00
tags = ["coding", "algorithm", "leetCode"]
categories = "algorithm"
+++

<div class="description">

## Link

- https://leetcode.com/problems/isomorphic-strings/

## Summary

When I was solving this I was confused that I have to compare A -> B also B <- A. For example, when comparing `aa` and `ab`, when I make a dictionary like { a: a, b: a} then it should throw error. Which means that `Key` and `Value` both should be unique and have a same value.

## Solutions

### My Solution

Below is my first solution. Change the array value to the other one. And it already contains value then throw error.

```cs
// Not smart solution
public bool IsIsomorphic(string s, string t)
{
	if (s.Length != t.Length) return false;

	var pair = new Dictionary<char, char>();
	var arr = t.ToCharArray();
	for (int i = 0; i < arr.Length; i++)
	{
		if (pair.ContainsKey(t[i]))
		{
			arr[i] = pair[t[i]];
			continue;
		}

		if (pair.ContainsValue(s[i])) return false;
		pair.Add(t[i], s[i]);
		arr[i] = s[i];
	}

	return string.Equals(s, new string(arr));
}
```

The best solution is make two dictionaries and compare values. Also save not only `count` it adds `index` at the same time to avoid when `i == 0`.

```cs
public bool IsIsomorphic(string s, string t)
{
	var pairA = new Dictionary<char, int>();
	var pairB = new Dictionary<char, int>();

	for (int i = 0; i < s.Length; i++)
	{
		var a = 0;
		var b = 0;
		pairA.TryGetValue(s[i], out a);
		pairB.TryGetValue(t[i], out b);

		if (a != b) return false;
		pairA[s[i]] = i + 1;
		pairB[t[i]] = i + 1;
	}

	return true;
}
```

### Best Solution

