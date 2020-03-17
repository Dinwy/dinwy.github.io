+++
title = "LeetCode/104. MaximumDepthOfBinaryTree"
date = 2020-03-17T21:24:12+09:00
tags = ["coding", "algorithm", "leetCode"]
categories = "algorithm"
+++

<div class="description">

## Link

- https://leetcode.com/problems/maximum-depth-of-binary-tree

## Summary

Find a maximum depth of Binary Tree.

## Solutions

### My Solution

I was thinking about solving this problem with `BFS` but realized `DFS` is much easy to solve this problem after making some mistakes.

```cs
public class MaximumDepthOfBinaryTree
{
	public int MaxDepth(TreeNode root)
	{
		var sum = 0;
		return Recursion(root, sum);
	}

	public int Recursion(TreeNode root, int sum)
	{
		if (root == null) return sum;
		sum++;
		return Math.Max(Recursion(root.left, sum), Recursion(root.right, sum));
	}
}
```

### Best Solution

Even though I don't like the `Head Recursion` it gives quite clean solution to the problem.

```cpp
int maxDepth(TreeNode *root)
{
    return root == NULL ? 0 : max(maxDepth(root -> left), maxDepth(root -> right)) + 1;
}
```

BFS solution is not difficult, but be careful using `var size = q.Count` first. If referencing `q.Count` directly, it will not gonna work because the loop is dequeueing the `q` So the `q.Count` will change. 

```cs
public int BFSSolution(TreeNode root)
{
	if (root == null) return 0;

	int res = 0;
	var q = new Queue<TreeNode>();
	q.Enqueue(root);

	while (q.Count > 0)
	{
		res++;
		var size = q.Count;
		for (int i = 0; i < size; i++)
		{
			var p = q.Dequeue();

			if (p.left != null) q.Enqueue(p.left);
			if (p.right != null) q.Enqueue(p.right);
		}
	}

	return res;
}
```