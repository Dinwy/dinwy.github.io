+++
title = "LeetCode/101. SymmetricTree"
date = 2020-03-17T20:31:19+09:00
tags = ["coding", "algorithm", "leetCode"]
categories = "algorithm"
+++

<div class="description">

## Link

- https://leetcode.com/problems/symmetric-tree

## Summary

Figure out given `TreeNode` is symmetric or not. I was thinking for a while and able to get an answer.

## Solutions

### My Solution

I feel like now I have some mindset that I can solve programming problem with using my brain. Using `BFS` to find an answer.

```cs
public class SymmetricTree
{
	public bool IsSymmetric(TreeNode root)
	{
		if (root == null) return true;

		var result = true;
		var queue = new Queue<TreeNode>();
		queue.Enqueue(root.left);
		queue.Enqueue(root.right);

		TreeNode left;
		TreeNode right;

		while (queue.Count != 0)
		{
			left = queue.Dequeue();
			right = queue.Dequeue();

			// Break the while loop
			if (left == null && right == null) continue;
			if (left != null && right == null) return false;
			if (left == null && right != null) return false;
			if (left.val != right.val) return false;

			queue.Enqueue(left.left);
			queue.Enqueue(right.right);
			queue.Enqueue(left.right);
			queue.Enqueue(right.left);
		}

		return result;
	}
}
```

### Best Solution

My solution is very close to the best solution, except checking if part, I'll skip.
