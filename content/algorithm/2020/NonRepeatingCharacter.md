+++
title = "LeetCode/387 First Unique Character in a String"
date = 2020-02-12T23:15:22+09:00
tags = ["coding", "python", "algorithm"]
categories = "algorithm"
+++

https://leetcode.com/problems/first-unique-character-in-a-string

Basically this question is asking you about how to you `Dictionary`. Understanding how to handle `key` and `value` and `index`, can solve this problem easily.

### My Solution

```py
class Solution(object):
    def firstUniqChar(self, s):
        strDict = {}

        for item in s:
            if (item in strDict):
                strDict[item] += 1
            else:
                strDict[item] = 1

        for idx, key in enumerate(s):
            if strDict[key] == 1:
                return idx

        return -1
```