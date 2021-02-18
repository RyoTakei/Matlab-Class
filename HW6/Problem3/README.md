# Homework 6 - Problem 3 (Spilled tea)

If you laugh, you lose. We all need to grow up here ok?

**[READ THIS BEFORE YOU BEGIN!!!!!!](https://github.com/RyoTakei/Matlab-Class)**
-

## Breakdown
This problem is using all about numerical integration. 

If you've taken 252 before, you already know the right-side, left-side, middle,
and trapezoid method of integration. Say goodbye to doing those by hand because 
who needs that when we have matlab.

We will be using trapezoid method in this problem.

If you don't know how to use `trapz` function, go read the zybooks or google it. 

This problem will take 5 lines of code (not including comments and white lines).


### Line #0: Make sure to add `clc`, `clear` etc. 
And comments. Those don't count. But you need it to get credits so do that.

### Line #1: Grab data from file.
Use `dlmread()` Load it into a variable that makes sense.

### Line #2: Let's setup x axis
Or width of trapezoid. Making sure that length of this variable and length of data from line 1 is the same.
Otherwise, it won't work. And make sure that interval between each values inside of this array
is 1.5. **All unit in this problem is cm**.

### Line #3: trapz()
You already have x and y. Store the output into a variable. 

### Line #4: Print
Print the area you calculated in line #3. Make sure it matches with selfcheck. Check the unit too.

(I also realized that you could combine line 3 and 4....whatever...)

### Line #5: Plot
Plot your x and y, it should look something like weird trapezoid.

