+++
title = "LeetCode/3 Add Two Numbers"
date = 2020-03-10T21:30:57+09:00
tags = ["coding", "algorithm", "leetCode"]
categories = "algorithm"
+++

<div class="description">

## Preface

I've solved this problem a year ago with a weird way. Today I've reviewed this problem.

## Link

- https://leetcode.com/problems/add-two-numbers

## Summary

Reviewing this problem took more than an hour, which made me disappointed and surprise me. <br/>
I was very confused assigning `outputTail`. Same as

```cs
{
	l1 = l1.next;
	l2 = l2.next;
	outputTail = outputTail.next;
}
```

By assigning `nextNode` to the `currentNode` which will make loop end at some point. Also we assign `node` value before going to the next. `outputTail.next = node`. <br/>
Simply I have to remember that to iterate linkedList, `assign` `nextNode` to the `currentNode` in each loop. Then next turn, `nextNode` will be a `currentNode` and so on. <br/>

## Best Solution

```cs
		// Best solution
		public ListNode BestSolution(ListNode l1, ListNode l2)
		{
			ListNode output = new ListNode(0);
			ListNode outputTail = output;
			int carry = 0;

			while (l1 != null || l2 != null || carry > 0)
			{
				int val1 = l1 != null ? l1.val : 0;
				int val2 = l2 != null ? l2.val : 0;
				int total = (val1 + val2 + carry) % 10;
				carry = (val1 + val2 + carry) / 10;

				outputTail.next = new ListNode(total);
				outputTail = outputTail.next;

				l1 = l1 != null && l1.next != null ? l1.next : null;
				l2 = l2 != null && l2.next != null ? l2.next : null;
			}

			return output.next;
		}
```
