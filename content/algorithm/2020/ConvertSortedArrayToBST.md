+++
title = "LeetCode/108. ConvertSortedArrayToBST"
date = 2020-03-22T19:50:49+09:00
tags = ["coding", "algorithm", "leetCode"]
categories = "algorithm"
+++

<div class="description">

## Link

- https://leetcode.com/problems/convert-sorted-array-to-binary-search-tree/

## Summary

I was taking break way more than it should be. Also I totally misunderstood this problem. <br/>
I really should read document carefully.

## Solutions

### My Solution

The below is my first solution without caring many things.

```cs
public class ConvertSortedArrayToBST
{
	public TreeNode SortedArrayToBST(int[] nums)
	{
		if (nums.Length == 0) return null;

		var output = new TreeNode(0);

		Recursion(ref output.left, nums);

		return output.left;
	}

	private void Recursion(ref TreeNode output, int[] nums)
	{
		if (nums.Length == 0) return;

		int mIdx = nums.Length / 2;
		output = new TreeNode(nums[mIdx]);

		Recursion(ref output.left, nums.Take(mIdx).ToArray());
		Recursion(ref output.right, nums.Skip(mIdx + 1).ToArray());
	}
}
```

### Best Solution

This is a better solution that rather modifying array and passing it, sending `low` and `high` indexes. <br/>
Explicitly selecting the value by index, this will be the ideal solution and which I need to learn.

```cs
public class ConvertSortedArrayToBST
{
	public TreeNode SortedArrayToBST(int[] nums)
	{
		if (nums.Length == 0) return null;

		return BestSolution(nums, 0, nums.Length - 1);
	}

	private TreeNode BestSolution(int[] nums, int low, int high)
	{
		if (low > high) return null;

		int mid = (low + high) / 2;
		var node = new TreeNode(nums[mid]);
		node.left = BestSolution(nums, low, mid - 1);
		node.right = BestSolution(nums, mid + 1, high);
		return node;
	}
}
```