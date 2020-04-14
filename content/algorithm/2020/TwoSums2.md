+++
title = "LeetCode/167. TwoSums2"
date = 2020-04-14T20:41:38+09:00
tags = ["coding", "algorithm", "leetCode"]
categories = "algorithm"
+++

<div class="description">

## Link

- https://leetcode.com/problems/two-sum-ii-input-array-is-sorted/

## Summary

Finding solution with `Dictionary` was simple. However in the best answer, using two pointer was which I didn't think about before.

## Solutions

### My Solution

```cs
public int[] TwoSum(int[] numbers, int target)
{
	// value, index
	var pair = new Dictionary<int, int>();
	var res = new int[2] { 0, 0 };

	for (int i = 0; i < numbers.Length; i++)
	{
		if (pair.ContainsKey(target - numbers[i]))
		{
			res[0] = pair[target - numbers[i]] + 1;
			res[1] = i + 1;
			return res;
		}
		pair.TryAdd(numbers[i], i);
	}

	return res;
}
```

### Best Solution

```python
# two-pointer
def twoSum1(self, numbers, target):
	l, r = 0, len(numbers)-1
	while l < r:
		s = numbers[l] + numbers[r]
		if s == target:
			return [l+1, r+1]
		elif s < target:
			l += 1
		else:
			r -= 1

# dictionary           
def twoSum2(self, numbers, target):
	dic = {}
	for i, num in enumerate(numbers):
		if target-num in dic:
			return [dic[target-num]+1, i+1]
		dic[num] = i

# binary search        
# Will not check for duplication
def twoSum(self, numbers, target):
	for i in xrange(len(numbers)):
		l, r = i+1, len(numbers)-1
		tmp = target - numbers[i]
		while l <= r:
			mid = l + (r-l)//2
			if numbers[mid] == tmp:
				return [i+1, mid+1]
			elif numbers[mid] < tmp:
				l = mid+1
			else:
				r = mid-1		
```