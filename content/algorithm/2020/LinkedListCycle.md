+++
title = "LeetCode/141. LinkedListCycle"
date = 2020-04-10T00:27:08+09:00
tags = ["coding", "algorithm", "leetCode"]
categories = "algorithm"
+++

<div class="description">

## Link

- https://leetcode.com/problems/linked-list-cycle

## Summary

I was very confused about `input` parameters in description. The question suggested two inputs but I've got only one. After reading thread about the same question I have, I only have to test whether given Linked list is cycle or not.

## Solutions

### My Solution

My solution uses dictionary which I've already seen that node or not.

```cs
public bool HasCycle(ListNode head)
{
	var haveSeen = new Dictionary<ListNode, bool>();
	var p = head;

	while (p != null)
	{
		if (!haveSeen.ContainsKey(p))
		{
			haveSeen.Add(p, true);
			p = p.next;
		}
		else return true;
	}
	return false;
}

```

### Best Solution

There is space optimal way to solve this problem. Using two pointers which is going to only next node, the other ones goes one step further each time. If Linked list cycles then it will meet each other at some point.

```cs
public bool HasCycle(ListNode head)
{
	if (head == null) return false;
	ListNode walker = head;
	ListNode runner = head;
	while (runner.next != null && runner.next.next != null)
	{
		walker = walker.next;
		runner = runner.next.next;
		if (walker == runner) return true;
	}
	return false;
}
```