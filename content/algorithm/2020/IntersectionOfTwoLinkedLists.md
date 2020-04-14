+++
title = "LeetCode/161. IntersectionOfTwoLinkedLists"
date = 2020-04-14T20:39:36+09:00
tags = ["coding", "algorithm", "leetCode"]
categories = "algorithm"
+++

<div class="description">

## Link

- https://leetcode.com/problems/intersection-of-two-linked-lists/

## Summary

It wasn't really hard to solve it with `Dictionary`, however there is a another way to solve this problem.

## Solutions

### My Solution

```cs
public ListNode GetIntersectionNode(ListNode headA, ListNode headB)
{
	var dict = new HashSet<ListNode>();

	while (headA != null || headB != null)
	{
		if (headA != null)
		{
			if (dict.Contains(headA)) return headA;
			else dict.Add(headA);
			headA = headA.next;
		}

		if (headB != null)
		{
			if (dict.Contains(headB)) return headB;
			else dict.Add(headB);
			headB = headB.next;
		}
	}

	return null;
}
```

### Best Solution

I still like my answer for this question but it is good to think about I can iterate only `X` time which is the length gap between `A` and `B`.

```cs
// Best Solution
public ListNode getIntersectionNode(ListNode headA, ListNode headB)
{
	//boundary check
	if (headA == null || headB == null) return null;

	ListNode a = headA;
	ListNode b = headB;

	//if a & b have different len, then we will stop the loop after second iteration
	while (a != b)
	{
		//for the end of first iteration, we just reset the pointer to the head of another linkedlist
		a = a == null ? headB : a.next;
		b = b == null ? headA : b.next;
	}

	return a;
}
```