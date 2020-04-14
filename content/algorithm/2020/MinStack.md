+++
title = "LeetCode/155. MinStack"
date = 2020-04-14T20:33:26+09:00
tags = ["coding", "algorithm", "leetCode"]
categories = "algorithm"
+++

<div class="description">

## Link

- https://leetcode.com/problems/min-stack/

## Summary

Find a min stack. I almost solved at 8 mins but stuck there more for 20 mins. I was stuck there because of I was not checking `Peek()` when `minStackCount` is more than 0.

## Solutions

### My Solution

So, I've stuck there for 20 mins finding simple `if` check. The reason was that I was brutal force and fix the error without thinking what is actually wrong. Therefore in the next time when I meet the same obstacle, I should `think` and `read` well.

```cs
public class MinStack
{
	private int minValue = Int32.MinValue;
	private Stack<int> minStack;
	private Stack<int> stack;

	/** initialize your data structure here. */
	public MinStack()
	{
		stack = new Stack<int>();
		minStack = new Stack<int>();
	}

	public void Push(int x)
	{
		minValue = minValue == Int32.MinValue ? x : Math.Min(minValue, x);
		minStack.Push(minValue);
		stack.Push(x);
	}

	public void Pop()
	{
		if (stack.Count == 0) return;
		stack.Pop();
		minStack.Pop();
		minValue = minStack.Count > 0 ? minStack.Peek() : Int32.MinValue;
	}

	public int Top()
	{
		return stack.Peek();
	}

	public int GetMin()
	{
		return minValue;
	}
}
```

### Best Solution

This was a quite ingenious that using two stack but only push to min stack when `minStack.Count` is `0` or `x` is less or equal to `minStack.Peek()`.

```cs
// Best Solution
public class MinStackBest
{
	private Stack<int> minStack;
	private Stack<int> stack;

	/** initialize your data structure here. */
	public MinStackBest()
	{
		stack = new Stack<int>();
		minStack = new Stack<int>();
	}

	public void Push(int x)
	{
		stack.Push(x);
		if (minStack.Count == 0 || x <= minStack.Peek()) minStack.Push(x);
	}

	public void Pop()
	{
		var c = stack.Pop();
		if (c == minStack.Peek()) minStack.Pop();
	}

	public int Top()
	{
		return stack.Peek();
	}

	public int GetMin()
	{
		return minStack.Peek();
	}
}
```