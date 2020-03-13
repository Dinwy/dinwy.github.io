+++
title = "LeetCode/58. LengthOfLastWord & LeetCode/66. PlusOne"
date = 2020-03-13T20:16:45+09:00
tags = ["coding", "algorithm", "leetCode"]
categories = "algorithm"
+++

<div class="description">

## Link

- https://leetcode.com/problems/length-of-last-word
- https://leetcode.com/problems/plus-one

## Summary

58. Length Of Last Word is not even a algorithm question. <br/>
66. PlusOne was really easy but I was making a simple mistake which should be handled. <br/>

## Solutions

### My Solution

I'll skip explaining #58.

```cs
public int Solution(string s)
{
	var res = 0;
	for (int i = s.Length - 1; i >= 0; i--)
	{
		if (Char.IsWhiteSpace(s[i]))
		{
			if (res != 0) return res;
			res = 0;
			continue;
		}
		res++;
	}
	return res;
}
```

66. PlusOne was interesting because I was missing two thing. <br/>

1. I was not using pen & paper and write those down.
2. I was missing the case like `[9, 9]` which will make a new array like as `[1, 0, 0]`.

I should think about these cases.

```cs
public int[] Solution(int[] digits)
{
	var reminder = 1;
	for (int i = digits.Length - 1; i >= 0; i--)
	{
		digits[i] += reminder;

		if (digits[i] >= 10)
		{
			digits[i] = 0;
			reminder = 1;
			continue;
		}
		reminder = 0;

		break;
	}

	if (reminder != 0) {
		var arr = new int[digits.Length + 1];
		arr[0] = reminder;
		Array.Copy(digits, 0, arr, 1, digits.Length);
		return arr;
	}
	return digits;
}
```

