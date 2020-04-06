+++
title = "LeetCode/118. PascalsTriangle"
date = 2020-04-01T20:13:09+09:00
tags = ["coding", "algorithm", "leetCode"]
categories = "algorithm"
+++

<div class="description">

## Link

- https://leetcode.com/problems/pascals-triangle/

## Summary

I was trying to make a `optimal formula` of this problem when I was solving. However algorithm questions are often not asking `optimal` solution but asking the solution itself. Simply translate the description into a code will solve this problem.

## Solutions

### My Solution

```cs
public class PascalsTriangle
{
	public IList<IList<int>> Generate(int numRows)
	{
		var output = new int[numRows][];

		// Set pointer
		var p0 = 0;

		for (int level = 0; level < numRows; level++)
		{
			var l = new int[level + 1];
			output[level] = l;
			l[0] = 1;
			l[l.Length - 1] = 1;

			for (int col = 1; col < level; col++)
			{
				var arr = output[level - 1];
				l[col] = arr[p0] + arr[p0 + 1];
				p0++;
			}
			p0 = 0;
		}
		return output;
	}
```

### Best Solution


```cs
public IList<IList<int>> BestSolution(int numRows)
{
	var output = new int[numRows][];

	for (int level = 0; level < numRows; level++)
	{
		var l = new int[level + 1];
		output[level] = l;
		l[0] = 1;
		l[l.Length - 1] = 1;

		for (int col = 1; col < level; col++) l[col] = output[level - 1][col - 1] + output[level - 1][col];
	}
	return output;
}
```