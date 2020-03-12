+++
title = "MergeTwoSortedLists"
date = 2020-03-12T20:03:48+09:00
tags = ["coding", "algorithm", "leetCode"]
categories = "algorithm"
+++

<div class="description">

## Link

https://leetcode.com/problems/merge-two-sorted-lists/

## Summary

This was asking same question as `AddTwoNumbers`. Can you distinguish `Ref` and `Val` in `LinkedArray`.

## Solutions

### My Solution

I was a bit confused which order comes first `outputTail.next` or `outputTail`. But it is obivious.<br/>
The proper steps will be,

1. Assign a new value to the `outputTail.next` via `new ListNode(x)`.
2. Change the pointer(ref) of `outputTail` to `outputTail.next` which is a new value has been assigned.

```cs
public ListNode MergeTwoLists(ListNode l1, ListNode l2)
{
	var output = new ListNode(0);
	var outputTail = output;

	while (l1 != null || l2 != null)
	{
		if (l1 == null)
		{
			outputTail.next = l2;
			break;
		}

		if (l2 == null)
		{
			outputTail.next = l1;
			break;
		}

		if (l1.val <= l2.val)
		{
			outputTail.next = new ListNode(l1.val);
			outputTail = outputTail.next;
			l1 = l1.next;
		}
		else
		{
			outputTail.next = new ListNode(l2.val);
			outputTail = outputTail.next;
			l2 = l2.next;
		}
	}

	return output.next;
}
```

### Best Solution

I should make it simpler like the code below. Also I don't need to assign a `New ListNode` just change the `ref` of the pointer.

```cs
public ListNode MergeTwoLists(ListNode l1, ListNode l2)
{
	var output = new ListNode(0);
	var outputTail = output;

	while (l1 != null && l2 != null)
	{
		if (l1.val <= l2.val)
		{
			outputTail.next = l1;
			l1 = l1.next;
		}
		else
		{
			outputTail.next = l2;
			l2 = l2.next;
		}
		outputTail = outputTail.next;
	}

	outputTail.next = l1 != null ? l1 : l2;

	return output.next;
}
```
