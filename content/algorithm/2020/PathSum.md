+++
title = "LeetCode/112. PathSum"
date = 2020-03-30T22:13:43+09:00
tags = ["coding", "algorithm", "leetCode"]
categories = "algorithm"
+++

<div class="description">

## Link

- https://leetcode.com/problems/path-sum

## Summary

When I was solving this problem, I was missing two things. <br/>

1. Not caring about negative numbers.
2. Not carefully reding a description.

The description says that `adding up all the values along the path`. However I was thinking that `Adding up until we find a value`. This kind of process of thinking should be prevented, the assumption and misunderstanding.

## Solutions

```cs
public bool HasPathSum(TreeNode root, int sum)
{
	if (root == null) return false;
	if (sum - root.val == 0) return root.left == null && root.right == null ? true : HasPathSum(root.left, sum - root.val) || HasPathSum(root.right, sum - root.val);
	if (Math.Abs(sum - root.val) < 0) return false;
	return HasPathSum(root.left, sum - root.val) || HasPathSum(root.right, sum - root.val);
}
```


