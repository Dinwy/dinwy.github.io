+++
title = "LeetCode/70. ClimbingStairs"
date = 2020-03-16T20:19:55+09:00
tags = ["coding", "algorithm", "leetCode"]
categories = "algorithm"
+++

<div class="description">

## Link

- https://leetcode.com/problems/climbing-stairs/

## Solutions

### My Solution

I used `Dynamic Programming` to solve this problem. Quite easy to solve to me.

```cs
public int Solution(int n)
{
	var arr = new int[n + 1];

	return Recursion(n, arr);
}

private int Recursion(int n, int[] arr)
{
	if (n < 0) return 0;
	if (n == 0) return 1;
	if (arr[n] != 0) return arr[n];
	arr[n] = Recursion(n - 1, arr) + Recursion(n - 2, arr);

	return arr[n];
}
```
### Best Solution

However the best answer says that this is a `Fibonacci` problem. I didn't think about this can be converted like that but indeed it is. <br/>
But this what I have to understand about `bottom-up` method in DP. This is not an easy but I'll think about it later.

```cs
public int climbStairs(int n) {
    // base cases
    if(n <= 0) return 0;
    if(n == 1) return 1;
    if(n == 2) return 2;
    
    int one_step_before = 2;
    int two_steps_before = 1;
    int all_ways = 0;
    
    for(int i=2; i<n; i++){
    	all_ways = one_step_before + two_steps_before;
    	two_steps_before = one_step_before;
        one_step_before = all_ways;
    }
    return all_ways;
}
```