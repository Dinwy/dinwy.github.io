+++
title = "LeetCode/53. MaximumSubarray"
date = 2020-03-12T22:07:35+09:00
tags = ["coding", "algorithm", "leetCode"]
categories = "algorithm"
+++

<div class="description">

## Link

- https://leetcode.com/problems/maximum-subarray

## Summary

Getting maximum sub array. Writing in hand make this much easier to solve. took 13 mins to solve with `O(n)` complexity. However the problem asked me solve this in a better time complexity.

## Solutions

### My Solution

After checking the solution, my solution was actual very close to the best solution. I could think about `DP` solution by using `previous` values.

```cs
public int SolutionOn(int[] nums)
{
	var subsetSum = 0;
	var max = nums[0];

	for (int i = 0; i < nums.Length; i++)
	{
		subsetSum += nums[i];

		if (subsetSum < 0)
		{
			max = Math.Max(max, nums[i]);
			subsetSum = 0;
			continue;
		}

		max = Math.Max(max, subsetSum);
	}

	return max;
}
```

### Best Solution

Not sure I can think about `DP` solution easily. Might be useful to use `array` to store data rather than use single `value` type.

```cs
public int Solution(int[] nums)
{
	var subSet = new int[nums.Length];
	var max = nums[0];
	subSet[0] = max;

	for (int i = 1; i < nums.Length; i++)
	{
		subSet[i] = nums[i] + (subSet[i - 1] > 0 ? subSet[i - 1] : 0);
		max = Math.Max(max, subSet[i]);
	}

	return max;
}
```