+++
title = "LeetCode/189. RotateArray"
date = 2020-04-16T00:48:46+09:00
tags = ["coding", "algorithm", "leetCode"]
categories = "algorithm"
+++

<div class="description">

## Link

- https://leetcode.com/problems/rotate-array/

## Summary

Another rotate array problem. I've wasted my time a lot (more than 4 hours) to optimize this.

## Solutions

### My Solution

I was not able to find a O(1) space solution.

```cs
public class Solution {
    public void Rotate(int[] nums, int k) {
        var temp = new int[nums.Length];
        Array.Copy(nums,temp, nums.Length);
        for (int i = 0; i < nums.Length; i++)
        {
            nums[(i + k) % nums.Length] = temp[i];
        } 
    }
}
```

### Best Solution

Didn't really know about reverse the array with certain length will solve this problem. <br/>
Basically cutting the array into two pieces and concatenating it.

```cs
// Best Solution
public void rotate(int[] nums, int k)
{
	k %= nums.Length;
	reverse(nums, 0, nums.Length - 1);
	reverse(nums, 0, k - 1);
	reverse(nums, k, nums.Length - 1);
}

public void reverse(int[] nums, int start, int end)
{
	while (start < end)
	{
		int temp = nums[start];
		nums[start] = nums[end];
		nums[end] = temp;
		start++;
		end--;
	}
}
```
