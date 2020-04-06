+++
title = "LeetCode/111. MinimumDepthOfBinaryTree"
date = 2020-03-30T21:51:13+09:00
tags = ["coding", "algorithm", "leetCode"]
categories = "algorithm"
+++

<div class="description">

## Link

- https://leetcode.com/problems/minimum-depth-of-binary-tree/

## Summary

Finding minimum depth of binary tree.

## Solutions

Best solution gives me a better idea. Don't need to use `targetNode` pointer, because when one of those are null I just have to add them.(Cuz it will return 0);

### My Solution

```cs
public int MinDepth(TreeNode root)
{
	if (root == null) return 0;

	if (root.left != null && root.right != null)
	{
		return Math.Min(MinDepth(root.left), MinDepth(root.right)) + 1;
	}
	else
	{
		var targetNode = root.left == null ? root.right : root.left;
		return MinDepth(targetNode) + 1;
	}
}
```

### Best Solution

```cs
public int MinDepthBestSolution(TreeNode root)
{
	if (root == null) return 0;
	var left = MinDepth(root.left);
	var right = MinDepth(root.right);
	return root.left != null && root.right != null ? Math.Min(left, right) + 1 : left + right + 1;
}
```