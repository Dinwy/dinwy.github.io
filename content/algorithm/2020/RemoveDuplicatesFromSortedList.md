+++
title = "LeetCode/83. RemoveDuplicatesFromSortedList"
date = 2020-03-16T23:29:15+09:00
tags = ["coding", "algorithm", "leetCode"]
categories = "algorithm"
+++

<div class="description">

## Link

- https://leetcode.com/problems/remove-duplicates-from-sorted-list

## Summary

## Solutions

### My Solution

When I was solving this problem I made mistakes at start.

1. I didn't think about it is `SortedLists`. Which make me use `HashSet`.

Also I was confused using `pointer` properly. Was thinking too much ended up using 3 pointers.

```cs
public ListNode Solution(ListNode head)
{
	var output = new ListNode(0);
	var resultNode = output;
	var outputTail = head;
	var dict = new HashSet<int>();

	while (outputTail != null)
	{
		if (dict.Add(outputTail.val))
		{
			var node = new ListNode(outputTail.val);
			output.next = node;
			output = output.next;
		}
		outputTail = outputTail.next;
	}

	return resultNode.next;
}
```

### Best Solution

The best solution was simpler than I thought. It only use one pointer. Also looping `list.next` rather than `list` node itself. <br/>
By keep assigning ref, `list` = `list.next` & `list.next` = `list.next.next`, I will change `head` node itself. <br/>
Really need to think about `pointer`.

```cs
public ListNode BestSolution(ListNode head)
{
	if (head == null || head.next == null) return head;

	ListNode list = head;

	while (list.next != null)
	{
		if (list.val == list.next.val) list.next = list.next.next;
		else list = list.next;
	}

	return head;
}
```