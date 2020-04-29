+++
title = "LeetCode/203. RemoveLinkListElements"
date = 2020-04-29T16:54:16+09:00
tags = ["coding", "algorithm", "leetCode"]
categories = "algorithm"
+++

<div class="description">

## Link

- https://leetcode.com/problems/remove-linked-list-elements

## Summary

It is really confusing when you don't know how Linked List works. I've been struggling with linked list many times. Need to understand what is pointing what.

## Solutions

### My Solution

```cs
public ListNode RemoveElements(ListNode head, int val)
{
	var headPointer = head;
	var result = new ListNode(0);
	var previousPointer = result;

	while (headPointer != null)
	{
		if (headPointer.val == val)
		{
			headPointer = headPointer.next;
			previousPointer.next = headPointer;
			continue;
		}
		previousPointer.next = headPointer;
		previousPointer = previousPointer.next;
		headPointer = headPointer.next;
	}

	return result.next;
}
```

### Best Solution

Basically same as my solution but this is more simple and concise. I was doing extra actions on my solution because I didn't fully understand linked list.

```cs
public ListNode RemoveElements(ListNode head, int val)
{
	var headPointer = head;
	var result = new ListNode(0);
	var previousPointer = result;

	while (headPointer != null)
	{
		if (headPointer.val == val)
		{
			previousPointer.next = headPointer.next;
		}
		else
		{
			previousPointer = previousPointer.next;
		}
		headPointer = headPointer.next;
	}

	return result.next;
}
```
