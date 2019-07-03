+++
title = "BestTravel And CountTheIsland"
date = 2019-07-03T12:31:05+09:00
tags = ["codewars", "algorithm"]
categories = "everyday"
thumbnail = "/img/thumbnails/codewarsLogo.jpg"
+++

# Description

1. I'll review **Best Travel**(https://www.codewars.com/kata/best-travel)
2. I'll solve a new Problem **Count The Islands**(https://www.codewars.com/kata/count-the-islands)

- Difficulty Level: 5kyu, 6kyu in order.

## Best Travel

### Details
	> John and Mary want to travel between a few towns A, B, C ... Mary has on a sheet of paper a list of distances between these towns. ls = [50, 55, 57, 58, 60]. John is tired of driving and he says to Mary that he doesn't want to drive more than t = 174 miles and he will visit only 3 towns.

Which distances, hence which towns, they will choose so that the sum of the distances is the biggest possible

    to please Mary and John- ?

Example:

With list ls and 3 towns to visit they can make a choice between: [50,55,57],[50,55,58],[50,55,60],[50,57,58],[50,57,60],[50,58,60],[55,57,58],[55,57,60],[55,58,60],[57,58,60].

The sums of distances are then: 162, 163, 165, 165, 167, 168, 170, 172, 173, 175.

The biggest possible sum taking a limit of 174 into account is then 173 and the distances of the 3 corresponding towns is [55, 58, 60].

The function chooseBestSum (or choose_best_sum or ... depending on the language) will take as parameters t (maximum sum of distances, integer >= 0), k (number of towns to visit, k >= 1) and ls (list of distances, all distances are positive or null integers and this list has at least one element). The function returns the "best" sum ie the biggest possible sum of k distances less than or equal to the given limit t, if that sum exists, or otherwise nil, null, None, Nothing, depending on the language. With C++, C, Rust, Swift, Go, Kotlin return -1.

Examples:

ts = [50, 55, 56, 57, 58] choose_best_sum(163, 3, ts) -> 163

xs = [50] choose_best_sum(163, 3, xs) -> nil (or null or ... or -1 (C++, C, Rust, Swift, Go)

ys = [91, 74, 73, 85, 73, 81, 87] choose_best_sum(230, 3, ys) -> 228

### My Solution

```js
function chooseBestSum(t, k, ls) {
	var setA = new Set();

	recursiveMethod(t, k, ls, 0, setA)
	var ans = Math.max(...setA);
	return isFinite(ans) ? ans : null;
}

function recursiveMethod(t, k, ls, sum, setA) {
	if (t < 0) return;
	if (t >= 0 && k == 0) {
		setA.add(sum)
		return;
	}
	if (ls.length <= 0) return;
	if (k <= 0) return;

	var arr = ls.slice(1);
	recursiveMethod(t - ls[0], k - 1, arr, sum + ls[0], setA)
	recursiveMethod(t, k, arr, sum, setA)
}
```

### Stats

Preparation Time: 00:05:10
Time Taken: 01:58:00

### Thoughts

I still remember that when I first saw this problem it took more than 2 days. I was totally confused how to solve this problem. Watching **CS Dojo** Youtube channel gave me some idea but this is not a still optimized way to solve this problem. I'll comeback to this Kata again and solve in bottom-up way later. Also want to check about this in `c++` because I saw the solution from other people that using `permutation` and `bitmask`.
It is really easy to get an answer just iterating everything but need to think how to optimize this.

## Count The Islands

It took too long to solve the previous problem, I'll sovle this tomorrow.