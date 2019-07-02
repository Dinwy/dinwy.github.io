+++
title = "DoubleCola And PrimesInNumbers"
date = 2019-07-02T12:01:09+09:00
tags = ["codewars", "algorithm"]
categories = "everyday"
thumbnail = "/img/thumbnails/codewarsLogo.jpg"
+++

# Description

Today I'll review `Double Cola`(https://www.codewars.com/kata/double-cola/) <br/>
And I'll solve a new kata `Primes in numbers`(https://www.codewars.com/kata/54d512e62a5e54c96200019e) <br/>
Difficulty level of both are `5kyu`.

## Double Cola

Time time I solved before: a year ago
Which language I've used to solve: C#

## Details

> Sheldon, Leonard, Penny, Rajesh and Howard are in the queue for a "Double Cola" drink vending machine; there are no other people in the queue. The first one in the queue (Sheldon) buys a can, drinks it and doubles! The resulting two Sheldons go to the end of the queue. Then the next in the queue (Leonard) buys a can, drinks it and gets to the end of the queue as two Leonards, and so on.

For example, Penny drinks the third can of cola and the queue will look like this:

Rajesh, Howard, Sheldon, Sheldon, Leonard, Leonard, Penny, Penny

Write a program that will return the name of the person who will drink the n-th cola.
Input

The input data consist of an array which contains at least 1 name, and single integer n which may go as high as the biggest number your language of choice supports (if there's such limit, of course).
Output / Examples

Return the single line — the name of the person who drinks the n-th can of cola. The cans are numbered starting from 1.

whoIsNext(["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"], 1) == "Sheldon"
whoIsNext(["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"], 52) == "Penny"
whoIsNext(["Sheldon", "Leonard", "Penny", "Rajesh", "Howard"], 7230702951) == "Leonard"

### My Solution

```js
function whoIsNext(names, r) {
	var arrLeng = names.length;
	var j = 1;

	while (r > arrLeng) {
		r -= arrLeng;
		arrLeng *= 2;
	}

	while (r > arrLeng / names.length * j) {
		j++
	}

	return names[j - 1]
}
```

### Stats

Preparation time: 00:06:00
Time taken: 01:03:00

### Thoughts

I've spend way more time than I've expected. Need to train some parts of brain which should work when I'm tired or cannot concentrate.

- Lesson learned: Find a rule, break into pieces.

## Primes in numbers

### Details

<div>
Given a positive number n > 1 find the prime factor decomposition of n. The result will be a string with the following form :

"(p1**n1)(p2**n2)...(pk**nk)"

with the p(i) in increasing order and n(i) empty if n(i) is 1.

Example: n = 86240 should return "(2**5)(5)(7**2)(11)"

</div>

### My Solution

```js
function primeFactors(n) {
  var ans = ""
  var k = 2;
  var c = 0;
  var i = 0;

  while (k <= n) {
    while (n % k == 0) {
      n /= k;
      c++;
    }
    if (c == 0) {
      k++;
      i++;
      continue;
    }

    if (c == 1) { ans += `(${k})` }
    else ans += `(${k}**${c})`
    c = 0;
    k++;
    i++;
}

  return ans;
}
```

### Stats

Preparation time: 02:00:00
Time Taken: 27:10:00

### Thoughts

Feel much better than reviewing the DoubleCola kata.
