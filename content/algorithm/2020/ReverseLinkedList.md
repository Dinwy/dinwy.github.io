+++
title = "LeetCode/206. ReverseLinkedList"
date = 2020-04-29T17:22:44+09:00
tags = ["coding", "algorithm", "leetCode"]
categories = "algorithm"
+++

<div class="description">

## Link

- https://leetcode.com/problems/reverse-linked-list/

## Summary

I didn't really think about how to reverse linked list, so I was struggled so hard.

## Solutions

### My Solution

Rather than solving in-place, I was thinking that okay let just make a new node.

```cs
public ListNode ReverseList(ListNode head)
{
	var fakeNode = new ListNode(0);
	var previousPointer = fakeNode.next;
	var cur = head;
	var node = fakeNode.next;

	while (cur != null)
	{
		node = new ListNode(cur.val);
		node.next = previousPointer;
		previousPointer = node;
		cur = cur.next;
	}

	return node;
}
``
### Best Solution

The best solution was impressive. 

1. Create a `newHead` as null typeof ListNode
2. Loop `head`
3. Create temporary `next` node.
4. Set `head.next` to `next`
5. Set `head.next` to `newHead`
6. set `newHead` to `head`
7. set `head` to `headNext`

```cs
// Best solution
public ListNode BestReverseList(ListNode head)
{
	/* iterative solution */
	ListNode newHead = null;
	while (head != null)
	{
		ListNode next = head.next;
		head.next = newHead;
		newHead = head;
		head = next;
	}
	return newHead;
}
```
