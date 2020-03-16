+++
title = "LeetCode/67. AddBinary"
date = 2020-03-16T19:12:48+09:00
tags = ["coding", "algorithm", "leetCode"]
categories = "algorithm"
+++

<div class="description">

## Link

https://leetcode.com/problems/add-binary/

## Summary

Given two binary strings and return their sum. <br/>

## Solutions

### My Solution

In my solution, the idea using two pointer was correct. However checking for the `short` and `long` string was a bit too much.

```cs
public string Solution(string a, string b)
{
	var shorterString = "";
	var longerString = "";
	int pointerS, pointerL = 0;
	var output = "";

	if (a.Length > b.Length)
	{
		shorterString = b;
		pointerS = b.Length - 1;
		longerString = a;
		pointerL = a.Length - 1;
	}
	else
	{
		shorterString = a;
		pointerS = a.Length - 1;
		longerString = b;
		pointerL = b.Length - 1;
	}

	var carry = 0;

	while (pointerS >= 0)
	{
		var l = Int32.Parse(shorterString[pointerS].ToString());
		var r = Int32.Parse(longerString[pointerL].ToString());
		var sum = l + r + carry;

		if (sum > 1)
		{
			sum = sum % 2;
			carry = 1;
		}
		else
		{
			carry = 0;
		}

		output = sum + output;
		pointerS--;
		pointerL--;
	}

	while (pointerL >= 0)
	{
		var r = Int32.Parse(longerString[pointerL].ToString());
		var sum = r + carry;

		if (sum > 1)
		{
			sum = sum % 2;
			carry = 1;
		}
		else
		{
			carry = 0;
		}

		output = sum + output;
		pointerL--;
	}

	output = carry == 1 ? "1" + output : output;

	return output;
}
```

### Best Solution

In the best solution, we only check for the `pointer` is bigger than `0`. And then move pointer to get a correct output.

```cs
public string BestSolution(string a, string b)
{
	int pointerA = a.Length - 1;
	int pointerB = b.Length - 1;
	var output = "";
	var carry = 0;

	while (pointerA >= 0 || pointerB >= 0)
	{
		var sum = carry;
		if (pointerA >= 0) sum += Int32.Parse(a[pointerA--].ToString());
		if (pointerB >= 0) sum += Int32.Parse(b[pointerB--].ToString());

		output = (sum % 2) + output;
		carry = sum / 2;
	}

	output = carry == 1 ? "1" + output : output;

	return output;
}
```
