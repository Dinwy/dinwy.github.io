+++
title = "LeetCode/100. SameTree"
date = 2020-03-17T18:52:36+09:00
tags = ["coding", "algorithm", "leetCode"]
categories = "algorithm"
+++

<div class="description">

## Link

- https://leetcode.com/problems/same-tree

## Summary

Find the tree is the same.

## Solutions

### My Solution

Solved directly when I saw this problem. Also my solution is one of the best answers. This question not asking about optimization. <br/>
Basically this is the same question as `70.ClimbingStairs`.

```cs
public bool IsSameTree(TreeNode p, TreeNode q)
{
	if (p == null && q != null) return false;
	if (p != null && q == null) return false;
	if (p == null && q == null) return true;
	if (p.val != q.val) return false;

	return IsSameTree(p.left, q.left) && IsSameTree(p.right, q.right);
}
```