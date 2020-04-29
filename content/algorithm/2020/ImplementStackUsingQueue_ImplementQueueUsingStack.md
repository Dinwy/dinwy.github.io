+++
title = "LeetCode/225. ImplementStackUsingQueue LeetCode/232. ImplementQueueUsingStack"
date = 2020-04-29T17:36:10+09:00
tags = ["coding", "algorithm", "leetCode"]
categories = "algorithm"
+++

<div class="description">

## Link

- https://leetcode.com/problems/implement-queue-using-stacks
- https://leetcode.com/problems/implement-stack-using-queues/

## Summary

Basically both are asking the same question. Can you logically think about this. <br/>
Graphically imagine about this is a good way to solve this. Think about you have [1,2,3,4,5]. <br/>
Think about both solution that you have **Two Queue** when implementing stack, and **Two Stack** when Implementing queue.

## Solutions

### My Solution

- Implement stack using queue.

```cs
public class MyBestStack
{
	Queue<int> qStack = new Queue<int>();

	/** Push element x onto stack. */
	public void Push(int x)
	{
		qStack.Enqueue(x);
		for (int i = 0; i < qStack.Count - 1; i++)
			qStack.Enqueue(qStack.Dequeue());
	}

	// Removes the element on top of the stack.
	public int Pop()
	{
		return qStack.Dequeue();
	}

	// Get the top element.
	public int Top()
	{
		return qStack.Count > 0 ? qStack.Peek() : 0;
	}

	// Return whether the stack is empty.
	public bool Empty()
	{
		return qStack.Count == 0;
	}
}
```

- Implement queue using stack.
```cs
public class MyBestQueue
{
	Stack<int> sQueue = new Stack<int>();
	Stack<int> stackHelper = new Stack<int>();

	/** Push element x to the back of queue. */
	public void Push(int x)
	{
		sQueue.Push(x);
	}

	/** Removes the element from in front of queue and returns that element. */
	public int Pop()
	{
		Peek();
		return stackHelper.Pop();
	}

	/** Get the front element. */
	public int Peek()
	{
		if (stackHelper.Count != 0) return stackHelper.Peek();
		while (sQueue.Count != 0) stackHelper.Push(sQueue.Pop());
		return stackHelper.Peek();
	}

	/** Returns whether the queue is empty. */
	public bool Empty()
	{
		return sQueue.Count == 0 && stackHelper.Count == 0;
	}
}
```