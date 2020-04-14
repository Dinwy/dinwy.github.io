+++
title = "LeetCode/169. MajorityElement"
date = 2020-04-14T23:10:57+09:00
tags = ["coding", "algorithm", "leetCode"]
categories = "algorithm"
+++

<div class="description">

## Link

- https://leetcode.com/problems/majority-element/

## Summary

The solution wasn't hard to find. But the best solution was a known algorithm, http://www.cs.utexas.edu/~moore/best-ideas/mjrty/example.html

## Solutions

### My Solution

```cs
public int MajorityElement(int[] nums) {
	var target = nums.Length / 2 + 1;
	// num, count
	var dict = new Dictionary<int, int>();
	for (int i = 0; i < nums.Length; i++)
	{
		if (dict.ContainsKey(nums[i]))
		{
			dict[nums[i]]++;
			if (dict[nums[i]] == target) return nums[i];
		}
		else dict[nums[i]] = 1;
	}

	return dict.FirstOrDefault().Key;
}
```

### Best Solution

```cs
public int majorityElement(int[] num) {

	int major=num[0], count = 1;
	for(int i=1; i<num.length;i++){
		if(count==0){
			count++;
			major=num[i];
		}else if(major==num[i]){
			count++;
		}else count--;
		
	}
	return major;
}
```
