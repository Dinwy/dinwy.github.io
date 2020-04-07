+++
title = "PascalsTriangle2"
date = 2020-04-08T00:23:04+09:00
tags = ["coding", "algorithm", "leetCode"]
categories = "algorithm"
+++

<div class="description">

## Link

- https://leetcode.com/problems/pascals-triangle-ii

## Summary

The extension of the pascal's triangle algorithm. Wasn't really hard to solve this problem.

## Solutions

### My Solution

```cs
public IList<int> GetRow(int rowIndex)
{
	if (rowIndex < 0) return new int[0];

	var res = new int[rowIndex + 1];

	for (int row = 0; row <= rowIndex; row++)
	{
		var t = new int[row + 1];
		t[0] = 1;
		t[t.Length - 1] = 1;

		for (int i = 1; i < t.Length - 1; i++)
		{
			t[i] = res[i - 1] + res[i];
		}

		res = t;
	}
	return res;
}
```

### Best Solution

Not really different but not using `temp` array.

```cpp
class Solution {
public:
    vector<int> getRow(int rowIndex) {
        vector<int> A(rowIndex+1, 0);
        A[0] = 1;
        for(int i=1; i<rowIndex+1; i++)
            for(int j=i; j>=1; j--)
                A[j] += A[j-1];
        return A;
    }
};
```