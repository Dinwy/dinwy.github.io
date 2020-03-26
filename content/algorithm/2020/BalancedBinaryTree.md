+++
title = "LeetCode/110. BalancedBinaryTree"
date = 2020-03-27T00:11:58+09:00
tags = ["coding", "algorithm", "leetCode"]
categories = "algorithm"
+++

<div class="description">

## Link

- https://leetcode.com/problems/balanced-binary-tree/

## Summary

I was super confused about this problem and took a day to solve it. <br/>
Really need to think about how to go to all nodes with DFS.

## Solutions

### My Solution

I finally reached the solution with DFS. However I used `try` `catch` witch doesn't really needed.

```cs
public bool IsBalanced(TreeNode root)
{
	try {
		Height(root);
		return true;
	} catch {
		return false;
	}
}

public int Height(TreeNode node)
{
	if (node == null)
	{
		return 0;
	}
	else
	{
		var left = Height(node.left) + 1;
		var right = Height(node.right) + 1;

		if (Math.Abs(left - right) > 1) throw new Exception();

		return Math.Max(left, right);
	}
}
```

### Best Solution

When I was spending a day, I almost reached exact solution as below. However I was adding value. <br/>
 `var left = Height(node.left) + 1;` rather than just using `var left = Height(node.left)`. <br/>
 Which cause that next `-1` become `0`.

```cs
public bool IsBalanced(TreeNode root)
{
	return Height(root) != -1;
}

public int Height(TreeNode node)
{
	if (node == null) return 0;

	var left = Height(node.left);
	if (left == -1) return -1;
	var right = Height(node.right);
	if (right == -1) return -1;

	if (Math.Abs(left - right) > 1) return -1;
	return Math.Max(left, right) + 1;
}
```