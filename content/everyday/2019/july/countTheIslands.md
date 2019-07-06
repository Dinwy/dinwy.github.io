+++
title = "CountTheIslands"
date = 2019-07-06T13:48:46+09:00
tags = ["codewars", "algorithm"]
categories = "everyday"
thumbnail = "/img/thumbnails/codewarsLogo.jpg"
+++

# Description

I supposed to solve this problem 3 days ago **Count The Islands**(https://www.codewars.com/kata/count-the-islands) but didn't have time to make it happen. Therefore I've solved this problem today.

- Difficulty Level: 6kyu

## Count The Islands

### Details

Summary

Implement an algorithm which analyzes an two-color image and determines how many isolated areas of a single color the image contains.
Islands

An "island" is an set of adjacent pixels of one color which is completely surrounded by pixels of another color. Pixels are 'adjacent' if their coordinants differ by no more than 1 on the X and/or Y axis. The image below contains two islands of the color █.

```
≈	≈	≈	≈	≈	≈	≈	≈	≈	≈
≈	≈	█	█	≈	≈	≈	≈	≈	≈
≈	≈	█	█	≈	≈	≈	≈	≈	≈
≈	≈	≈	≈	≈	≈	≈	≈	█	≈
≈	≈	≈	≈	≈	█	█	█	≈	≈
≈	≈	≈	≈	≈	≈	≈	≈	≈	≈
```

Specification

Your task is to implement the method countIslands(image), where image is a two dimensional array containing the numbers 0 and 1. 0 will be considered the "background" color, while 1 will be the color of the islands.

The method shall return the number of islands as an integer.
Helpers

There is a dump(image) method provided which will log an image array to the console to help with debugging.

### My Solution

```js
let count = 0;
function countIslands(image) {
	let visited = new Array(image.length);
	for (let z = 0; z < visited.length; z++) {
		visited[z] = new Array(image[0].length).fill(false);
	}

	let isInLoop = false;
	count = 0;

	for (let i = 0; i < image.length; i++) {
		for (let j = 0; j < image[i].length; j++) {
			isInLoop = false;
			bfRecursion(image, visited, i, j, isInLoop, count)
		}
	}

	return count;
}

function bfRecursion(grid, visited, x, y, isInLoop) {
	if (x < 0 || y < 0) return;
	if (x >= grid.length || y >= grid[0].length) return;

	var val = grid[x][y];

	if (val === 1) {
		if (!visited[x][y]) {
			visited[x][y] = true;

			if (!isInLoop) {
				count++;
			}

			isInLoop = true;
			bfRecursion(grid, visited, x, y + 1, isInLoop);
			bfRecursion(grid, visited, x, y - 1, isInLoop);
			bfRecursion(grid, visited, x + 1, y, isInLoop);
			bfRecursion(grid, visited, x - 1, y, isInLoop);

			// Diagonal
			bfRecursion(grid, visited, x - 1, y - 1, isInLoop);
			bfRecursion(grid, visited, x + 1, y - 1, isInLoop);
			bfRecursion(grid, visited, x - 1, y + 1, isInLoop);
			bfRecursion(grid, visited, x + 1, y + 1, isInLoop);
		}
	}
}
```

### Stats

Time Taken: 01:15:00

### Thoughts

Clever solution on Codewars is quite interesting.
```js
function countIslands(matrix){
  const getCount = (x, y) => {
    matrix[x][y] = 0;
    const directions = [
      [x-1, y-1], [x-1, y], [x-1, y+1], 
      [x, y-1], [x, y+1], [x+1, y-1], 
      [x+1, y], [x+1, y+1]
    ].filter(([i, j]) => matrix[i] !== undefined && matrix[i][j] !== undefined);
    for (const [i, j] of directions)
      if (matrix[i][j] === 1) 
        getCount(i, j);
  }
  
  let count = 0;
  for (let i = 0; i < matrix.length; i++)
    for (let j = 0; j < matrix[i].length; j++)
      if (matrix[i][j] === 1) {
        getCount(i, j); count++
      }
  return count;
}
```

There are things I could improve my algorithm solving skill.

1. I've used boolean array to check whether visited or not, just changing array value to 0 could work.
2. Use dictionary when iterating it.
3. Filter the x, y value which only valid in matrix's range.
4. Iterate the tree and get the value.