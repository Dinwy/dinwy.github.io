+++
title = "BestTimeToBuyAndSellStock"
date = 2020-04-08T00:26:28+09:00
tags = ["coding", "algorithm", "leetCode"]
categories = "algorithm"
+++

<div class="description">

## Link

- https://leetcode.com/problems/best-time-to-buy-and-sell-stock

## Summary

It was interesting to think how to solve this. First I found a very slow O(n²) then found a better solution which is O(n).

## Solutions

### My Solution

The slow solution was brutal forcing the problem. Find a max value each time you iterating it.

```cs
// Slow solution
public int MaxProfit_Slow(int[] prices)
{
	var res = 0;

	for (int i = 0; i < prices.Length; i++)
	{
		var max = prices.Skip(i).Max() - prices[i];
		res = Math.Max(res, max);
	}
	return res;
}
```

Since the previous answer is keep getting time out I have to optimize it. And I've realized that every time current value is smaller than previous value, it will a new marker for the min value. And after that I can find a max value.

```cs
public int MaxProfit(int[] prices)
{
	var previousVal = int.MaxValue;
	var minVal = int.MaxValue;
	var maxVal = int.MinValue;
	var result = 0;

	for (int i = 0; i < prices.Length; i++)
	{
		if (prices[i] < previousVal)
		{
			minVal = Math.Min(minVal, prices[i]);
			maxVal = int.MinValue;
		}
		else
		{
			maxVal = Math.Max(maxVal, prices[i]);
			result = minVal == int.MaxValue ? 0 : Math.Max(result, maxVal - minVal);
		}

		previousVal = prices[i];
	}

	return result;
}
```

### Best Solution

I was surprised that the solution of this algorithm is known as Kadane's Algorithm. It is same as "max subarray problem". There is a good explanation how this algorithm works so I'm attaching it in below.

```cs
public int maxProfit(int[] prices) {
	int maxCur = 0, maxSoFar = 0;
	for(int i = 1; i < prices.length; i++) {
		maxCur = Math.max(0, maxCur += prices[i] - prices[i-1]);
		maxSoFar = Math.max(maxCur, maxSoFar);
	}
	return maxSoFar;
}
```

```md
@jaqenhgar said in Kadane's Algorithm - Since no one has mentioned about this so far :) (In case if interviewer twists the input):

    *maxCur = current maximum value
    *maxSoFar = maximum value found so far

A more clear explanation on why sum of subarray works.:

Suppose we have original array:
[a0, a1, a2, a3, a4, a5, a6]

what we are given here(or we calculate ourselves) is:
[b0, b1, b2, b3, b4, b5, b6]

where,
b[i] = 0, when i == 0
b[i] = a[i] - a[i - 1], when i != 0

suppose if a2 and a6 are the points that give us the max difference (a2 < a6)
then in our given array, we need to find the sum of sub array from b3 to b6.

b3 = a3 - a2
b4 = a4 - a3
b5 = a5 - a4
b6 = a6 - a5

adding all these, all the middle terms will cancel out except two
i.e.

b3 + b4 + b5 + b6 = a6 - a2

a6 - a2 is the required solution.

so we need to find the largest sub array sum to get the most profit
```