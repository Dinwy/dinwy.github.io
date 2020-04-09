+++
title = "LeetCode/122. BestTimeToBuyAndSellStock2"
date = 2020-04-10T00:18:54+09:00
tags = ["coding", "algorithm", "leetCode"]
categories = "algorithm"
+++

<div class="description">

## Link

- https://leetcode.com/problems/best-time-to-buy-and-sell-stock-ii/

## Summary

Since I've already solved the first one, solving second one was easy.

## Solutions

### My Solution

Despite I've already know the last best solution, I've tried with my way which is more intuitive to me.

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
			result += minVal == int.MaxValue ? 0 : maxVal - minVal;
			minVal = prices[i];
			maxVal = int.MinValue;
		}

		previousVal = prices[i];
	}

	return result;
}
```

### Best Solution

Very similar to the previous one, it just add value to the result when current price is bigger than previous value.

```cs
public int maxProfit(int[] prices)
{
	int total = 0;
	for (int i = 0; i < prices.Length - 1; i++)
	{
		if (prices[i + 1] > prices[i]) total += prices[i + 1] - prices[i];
	}

	return total;
}
```
