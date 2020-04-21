+++
title = "LeetCode/202. HappyNumber"
date = 2020-04-22T04:26:14+09:00
tags = ["coding", "algorithm", "leetCode"]
categories = "algorithm"
+++

<div class="description">

## Link

- https://leetcode.com/problems/happy-number

## Summary

Simple math quiz.

## Solutions

### My Solution

Didn't really care about how to solve this problem. Directly translate the description to the code.

```cs
public bool IsHappy(int n)
{
	var str = n.ToString();
	var dict = new HashSet<int>() { n };

	while (str != "1")
	{
		var temp = 0;
		foreach (char c in str)
		{
			temp += (int)Math.Pow((int)char.GetNumericValue(c), 2);
		}

		if (dict.Contains(temp)) return false;
		dict.Add(temp);
		str = temp.ToString();
	}

	return true;
}
```

### Best Solution

- https://en.wikipedia.org/wiki/Cycle_detection

One nice guy linked wikipedia page about cycle detection. I've already seen these solution but didn't know they have a wiki page. Need to read that.

```cs
// Best solution
int digitSquareSum(int n)
{
	int sum = 0, tmp;
	while (n)
	{
		tmp = n % 10;
		sum += tmp * tmp;
		n /= 10;
	}
	return sum;
}

bool isHappy(int n)
{
	int slow, fast;
	slow = fast = n;
	do
	{
		slow = digitSquareSum(slow);
		fast = digitSquareSum(fast);
		fast = digitSquareSum(fast);
	} while (slow != fast);
	if (slow == 1) return 1;
	else return 0;
}
```

