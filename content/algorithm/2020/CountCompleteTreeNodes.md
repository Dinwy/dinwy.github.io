+++
title = "LeetCode/222. CountCompleteTreeNodes"
date = 2020-06-23T21:56:59+09:00
tags = ["coding", "algorithm", "leetCode"]
categories = "algorithm"
+++

<div class="description">

## Link

https://leetcode.com/problems/count-complete-tree-nodes

## Summary

Counting complete tree nodes. First, I was counting everything which is O(n) time complexity.
After reading about article in discussion, indeed able to cut things half everything. It took awhile to fully understand.

## Solutions

### My Solution

Simply counting every nodes.

```cs
public int CountNodesAll(TreeNode root)
{
	if (root == null) return 0;

	var queue = new Queue<TreeNode>();
	queue.Enqueue(root);
	var count = 0;

	while (queue.Count > 0)
	{
		var cur = queue.Dequeue();
		count++;

		if (cur.left != null) queue.Enqueue(cur.left);
		if (cur.right != null) queue.Enqueue(cur.right);
	}
	return count;
}
```

### Best Solution

Using the power of complete tree. By comparing left & right node, we know which node to count.

```cs
int GetLeftHeight(TreeNode root)
{
	return root == null ? 0 : 1 + GetLeftHeight(root.left);
}
public int CountNodes(TreeNode root)
{
	var res = 0;

	while (root != null)
	{
		var leftHeight = GetLeftHeight(root);
		if (leftHeight == (1 + GetLeftHeight(root.right)))
		{
			res += 1 << (leftHeight - 1);
			root = root.right;
		}
		else
		{
			leftHeight = leftHeight - 2 < 0 ? 0 : leftHeight - 2;
			res += 1 << leftHeight;
			root = root.left;
		}
	}

	return res;
}
```