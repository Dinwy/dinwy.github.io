+++
title = "The SuperMarket Queue And Sum Of Parts"
date = 2019-07-01T13:55:27+09:00
tags = ["codewars", "algorithm"]
categories = "everyday"
thumbnail = "/img/thumbnails/codewarsLogo.jpg"
+++

<div class="description">
# Description

This is the first day of starting `Practice July 2019` in `Algorithm` section. I want to review the code which I've solved in the past, and take a new one and solve it. <br/>
Today I'll review `The Supermarket Queue`(https://www.codewars.com/kata/the-supermarket-queue) and will solve `Some of Parts`(https://www.codewars.com/kata/5ce399e0047a45001c853c2b). Difficulty level is `5kyu` and `6kyu` respectively.

## The Supermarket Queue

I've solved this problem about two years ago in **C++** and 10 months ago in **CS**. I'll solve this problem in **JS** this time.

### Details

There is a queue for the self-checkout tills at the supermarket. Your task is write a function to calculate the total time required for all the customers to check out!

- input

    customers: an array of positive integers representing the queue. Each integer represents a customer, and its value is the amount of time they require to check out.
    n: a positive integer, the number of checkout tills.

- output

The function should return an integer, the total time required.

### My Solution

```js

function queueTime(customers, n) {
  var arr = new Array(n).fill(0);

  for (var i = 0; i < customers.length; i++) {
    var idx = arr.indexOf(Math.min(...arr));
    arr[idx] += customers[i];
  }

  return Math.max(...arr);
}

```

### Stats

- Time taken: 10 mins to write and solve, 30 mins in total. I was busy doing something else.

## Sums of Parts

Time to solve a new algorithm quiz.

### Details

Let us consider this example (array written in general format):

ls = [0, 1, 3, 6, 10]

Its following parts:

```
ls = [0, 1, 3, 6, 10]
ls = [1, 3, 6, 10]
ls = [3, 6, 10]
ls = [6, 10]
ls = [10]
ls = []
```

The corresponding sums are (put together in a list): [20, 20, 19, 16, 10, 0]

The function parts_sums (or its variants in other languages) will take as parameter a list ls and return a list of the sums of its parts as defined above.
Other Examples:

```
ls = [1, 2, 3, 4, 5, 6] 
parts_sums(ls) -> [21, 20, 18, 15, 11, 6, 0]

ls = [744125, 935, 407, 454, 430, 90, 144, 6710213, 889, 810, 2579358]
parts_sums(ls) -> [10037855, 9293730, 9292795, 9292388, 9291934, 9291504, 9291414, 9291270, 2581057, 2580168, 2579358, 0]
```

Notes

    Some lists can be long.
    Please ask before translating: some translations are already written and published when/if the kata is approved.

### My Solution

```cs

using System;

class SumParts
{
    public static int[] PartsSums(int[] ls)
    {
      var arr = new int[ls.Length + 1];

      for (int i = ls.Length - 1; i >= 0; i--)
      {
        arr[i] = ls[i] + arr[i + 1];
      }

      return arr;
    }
}

```
### Stats

- Time taken: To solve problem is 5 mins and total 13 mins. Setting up the CS project took some time.

## Thoughts

Now it is passing 50 mins on XNote stopwatch app. I think this is a good pipe line and want to iterate this process more and more. Even everything included(drinking coffee, go to bathroom, setting up the project, writing things in this document) total time taken can be less than 1 hour. I'll keep doing for this month. Total time taken **00:59:30**

### Changes on blog
- Added CS language in `prism.js`