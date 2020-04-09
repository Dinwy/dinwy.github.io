+++
title = "LeetCode/136. SingleNumber"
date = 2020-04-10T00:21:46+09:00
tags = ["coding", "algorithm", "leetCode"]
categories = "algorithm"
+++

<div class="description">

## Link

- https://leetcode.com/problems/single-number/

## Summary

Easy question, asking do you know data type dictionary.

## Solutions

### My Solution

```cs
public int Solution(int[] nums)
{
	var dict = new Dictionary<int, int>();

	for (int i = 0; i < nums.Length; i++)
	{
		if (!dict.ContainsKey(nums[i])) dict[nums[i]] = 1;
		else dict[nums[i]]++;
	}
	return dict.Where(x => x.Value == 1).FirstOrDefault().Key;
}
```

### Best Solution

Even though solving this question with dictionary is a one way, there is another way to solve this problem. It is using XOR. Because every element appears `twice` except for `one`. So XOR will remove bits. It is interesting to think in this way.

```cs
// Best Solution, using XOR
int singleNumber(int[] nums)
{
	int result = 0;
	for (int i = 0; i < nums.Length; i++)
	{
		result ^= nums[i];
	}
	return result;
}
```