+++
title = "LeetCode/7. ReverseInteger & LeetCode/9. PalindromeNumber"
date = 2020-03-11T19:24:54+09:00
tags = ["coding", "algorithm", "leetCode"]
categories = "algorithm"
+++

<div class="description">

## Preface

I'm trying to take a `Easy` difficulty ones to warm up my coding practice.

## Link

https://leetcode.com/problems/reverse-integer/
https://leetcode.com/problems/palindrome-number/

## Summary

Solving these two problem wasn't hard. Both are asking the same thing. Can you `pop` number from integer rather than using `string` <br/>
However re-learning that `pop = x % 10` & `x /= 10` 

## Solution

### 7.ReverseInteger

```cs
public class ReverseInteger
{
	public int Solution(int x)
	{
		var str = x.ToString();
		var leng = x < 0 ? str.Length - 1 : str.Length;
		var numDiv = (int)Math.Pow(10, leng - 1);
		var mul = 1;
		int res = 0;

		try
		{
			for (int i = 0; i < leng; i++)
			{
				res = checked(res + (x / numDiv) * mul);
				x = x % numDiv;
				numDiv /= 10;
			}
		}
		catch
		{
			return 0;
		}

		return res;
	}

	public int BestSolution(int x)
	{
		int rev = 0;

		while (x != 0)
		{
			int pop = x % 10;
			x /= 10;
			if (rev > Int32.MaxValue / 10 || (rev == Int32.MaxValue / 10 && pop > 7)) return 0;
			if (rev < Int32.MinValue / 10 || (rev == Int32.MinValue / 10 && pop < -8)) return 0;
			rev = rev * 10 + pop;
		}

		return rev;
	}
}
```

### 9.PalindromeNumber

```cs
	public class PalindromeNumber
	{
		public bool IsPalindrome(int x)
		{
			if (x < 0 || (x % 10 == 0 && x != 0))
			{
				return false;
			}

			int revertedNumber = 0;
			while (x > revertedNumber)
			{
				revertedNumber = revertedNumber * 10 + x % 10;
				x /= 10;
			}

			return x == revertedNumber || x == revertedNumber / 10;
		}

		public bool IsPalindromeByConvertingString(int x)
		{
			if (x < 0) return false;

			var str = x.ToString();

			for (int i = 0; i < str.Length / 2; i++)
			{
				if (str[i] != str[str.Length - 1 - i]) return false;
			}

			return true;
		}
	}
```