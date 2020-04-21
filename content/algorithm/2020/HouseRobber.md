+++
title = "LeetCode/198. HouseRobber"
date = 2020-04-22T04:00:33+09:00
tags = ["coding", "algorithm", "leetCode"]
categories = "algorithm"
+++

<div class="description">

## Link

- https://leetcode.com/problems/house-robber

## Summary

Dp problem. I've struggle to fine a proper solution.

## Solutions

### My Solution

This is similar to maximumSubArray problem, however skipping one made me confused. I was able to find a solution directly with recursion but reached timeout.


```cs
// Time out, a slow solution.
public int Rob(int[] nums) {
	if (nums.Length == 0) return 0;
	if (nums.Length == 1) return nums[0];

	return Math.Max(Recursion(nums, 0), Recursion(nums, 1));
}

private int Recursion(int[] nums, int idx)
{
	if (idx >= nums.Length) return 0;

	return nums[idx] + Math.Max(Recursion(nums, idx + 2), + Recursion(nums, idx + 3));
}
```

```cs
public int Rob(int[] nums) {
	if (nums.Length == 0) return 0;
	if (nums.Length == 1) return nums[0];
	if (nums.Length == 2) return Math.Max(nums[0], nums[1]);

	var arr = new int[nums.Length];
	arr[0] = nums[0];
	arr[1] = nums[1];
	arr[2] = nums[2] + nums[0];

	for (int i = 3; i < nums.Length; i++)
	{
		arr[i] = nums[i] + Math.Max(arr[i - 2], arr[i - 3]);
	}
	return Math.Max(arr[nums.Length - 1], arr[nums.Length - 2]);
}
```

### Best Solution

- https://leetcode.com/problems/house-robber/discuss/156523/From-good-to-great.-How-to-approach-most-of-DP-problems.

I really like to link this discussion which explains well about how to solve dynamic programming quiz.

```cs
// Bottom-up solution
public int rob(int[] nums) {
    if (nums.length == 0) return 0;
    int[] memo = new int[nums.length + 1];
    memo[0] = 0;
    memo[1] = nums[0];
    for (int i = 1; i < nums.length; i++) {
        int val = nums[i];
        memo[i+1] = Math.max(memo[i], memo[i-1] + val);
    }
    return memo[nums.length];
}
```

