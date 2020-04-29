+++
title = "LeetCode/204. CountPrimes"
date = 2020-04-29T17:00:18+09:00
tags = ["coding", "algorithm", "leetCode"]
categories = "algorithm"
+++

<div class="description">

## Link

- https://leetcode.com/problems/count-primes/

## Summary

Count primes. Was struggling thinking how to remove primes. Answer was written in wikipedia. https://en.wikipedia.org/wiki/Sieve_of_Eratosthenes#Algorithm_complexity

Need to think how to translate human language to programming & think logically.

## Solution

```cs
public class Solution {
	List<int> list = new List<int>();

	public int CountPrimes(int n)
	{
		bool[] isPrime = new bool[n];
		for (int i = 2; i < n; i++) {
			isPrime[i] = true;
		}
		// Loop's ending condition is i * i < n instead of i < sqrt(n)
		// to avoid repeatedly calling an expensive function sqrt().
		for (int i = 2; i * i < n; i++) {
			if (!isPrime[i]) continue;
			for (int j = i * i; j < n; j += i) {
				isPrime[j] = false;
			}
		}
		int count = 0;
		for (int i = 2; i < n; i++) {
			if (isPrime[i]) count++;
		}
		return count;
	}
}
```