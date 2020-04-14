+++
title = "LeetCode/171. ExcelSheetColumnNumber"
date = 2020-04-15T00:00:49+09:00
tags = ["coding", "algorithm", "leetCode"]
categories = "algorithm"
+++

<div class="description">

## Link

- https://leetcode.com/problems/excel-sheet-column-number/

## Summary

This is the next series of ExcelSheetColumnTitle. Doesn't took a long time. But I was thinking in a wrong way, doesn't need to use `Maht.Pow`. Always good to think a simple & concise solution in arithmetic.

## Solutions

### My Solution

```cs
public int TitleToNumber(string s)
{
	var output = 0;
	var pow = 0;

	while (!String.IsNullOrEmpty(s))
	{
		var lastChar = s[s.Length - 1];
		output += ((lastChar + 1) - 65) * (int)Math.Pow(26, pow);
		pow++;
		s = s.Substring(0, s.Length - 1);
	}

	return output;
}
```

### Best Solution

```cs
// Best Solutions
public int BestTitleToNumber(string s)
{
	int result = 0;
	for (int i = 0; i < s.Length; i++)
	{
		result = result * 26 + (s[i] - 'A' + 1);
	}
	return result;
}
```