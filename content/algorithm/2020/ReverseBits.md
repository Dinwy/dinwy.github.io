+++
title = "LeetCode/190. ReverseBits"
date = 2020-04-16T00:58:46+09:00
tags = ["coding", "algorithm", "leetCode"]
categories = "algorithm"
+++

<div class="description">

## Link

- https://leetcode.com/problems/reverse-bits/

## Summary

Asking that do you know bit operations.

## Solutions

### My Solution

Contrast to what the question was really asking, I'm not familiar with `bits`. So I brought arithmetic solution to solve this problem.

```cs
public uint reverseBits(uint n)
{
	uint result = 0;
	var k = 32;

	while (k >= 0)
	{
		var reminder = (n % 2);
		n /= 2;
		k--;
		if (reminder == 0) continue;
		result += (uint)Math.Pow(2, k) * reminder;
	}

	return result;
}
```

### Best Solution

By moving bits, the problem solved. Need to get use this this.

```cs
public int reverseBits(int n)
{
	int result = 0;
	for (int i = 0; i < 32; i++)
	{
		int end = n & 1;
		n >>= 1;
		result <<= 1;
		result |= end;
	}
	return result;
}
```
