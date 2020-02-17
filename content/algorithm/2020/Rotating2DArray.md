+++
title = "Udemy/11Essential: Rotating 2D array 90 degree"
date = 2020-02-17T22:47:51+09:00
tags = ["coding", "algorithm"]
categories = "algorithm"
+++

<div class="description">

## Preface

It is a interesting question that how to solve this problem. It was really easy to solve this with `temp array` and copy the value with recursive function. However I was quite confused how to solve `in-array`
 When I was solving this problem I was quite confused how to move the element to the array.

## My Solution

```py
# Recursive solution
def rotate(given_array, n):
    rotated = copy.deepcopy(given_array)
    for pRow in range(n):
        for pCol in range(n):
            rotated[pCol][(n - 1) - pRow] = given_array[pRow][pCol]

    return given_array
```

```py
# In-place solution
def rotate(given_array, n):
    for y in range((int)(n / 2)):
        for x in range(math.ceil(n / 2)):
            temp = given_array[y][n-1-x]
            given_array[y][n-1-x] = given_array[x][y]
            given_array[x][y] = given_array[n-1-y][x]
            given_array[n-1-y][x] = given_array[n-1-x][n-1-y]
            given_array[n-1-x][n-1-y] = temp
            
    return given_array
```

