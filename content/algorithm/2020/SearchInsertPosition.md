+++
title = "LeetCode/35. SearchInsertPosition"
date = 2020-03-12T20:58:48+09:00
tags = ["coding", "algorithm", "leetCode"]
categories = "algorithm"
+++

<div class="description">

## Link

https://leetcode.com/problems/search-insert-position/

## Summary

The problem was easy. However it was asking how to solve the problem with `O(logn)` complexity rather than `O(n)`

## Solutions

### My Solution

I've solved the problem when I saw the problem however not thinking about the `O(logn)` solution.

```cs
public int SearchInsertOn(int[] nums, int target)
{
	int idx = 0;

	for (int i = 0; i < nums.Length; i++)
	{
		if (nums[i] < target)
		{
			idx++;
			continue;
		}
		else
		{
			break;
		}
	}

	return idx;
}
```

### Best Solution

The best solution is using `binary search method` Keep checking `low` and `high` and split into `2` section.

```cs
// O(logN)
public int SearchInsert(int[] nums, int target)
{
	int low = 0;
	int high = nums.Length - 1;

	while (low <= high)
	{
		var mid = (low + high) / 2;

		if (nums[mid] == target) return mid;
		else if (nums[mid] < target) low = mid + 1;
		else high = mid - 1;
	}

	return low;
}
```
