# Homework 7 - Problem 3 TSE problem

This one is kind of weird because there's no instruction...

So I won't give you too much guide since it's all about your method
and it sounds like there's no "right answers".

**[READ THIS BEFORE YOU BEGIN!!!!!!](https://github.com/RyoTakei/Matlab-Class)**
-

## Before you begin

You're going to need to edit "tse2001to2020.csv". (Btw, csv stands for comma 
separated values... If you didn't know. Literally my fav filetype). You can manually
delete everything you don't need, or you can find "cleanCSV.py" in this github page
and run it on your computer to do this for you, or you can simply download "cleanTSEData.csv".
"cleanTSEData.csv" is the output from "cleanCSV.py" file. 

**If you chose to download my csv file(or python file to DIY) here's the index**

```matlab
yearIndex = 1;
monthIndex = 2;
dayIndex = 3;
hourIndex = 4;
minuteIndex = 5;
secondIndex = 6;
sarosIndex = 7;
```

(If you argue that order of this is weird, that's maybeeee because you grew up in American and I
grew up in Japan LOL. I like yy/mm/dd better. mm/dd/yy makes NO SENSE)

You're free to regenerate your own CSV files, but I extracted hours, minutes and seconds.
So I guess that's cool? (you might wanna use those later ;))

Once you have fresh csv file, you can tackle this problem however you like. Sky is the limit here.

Make sure you read the instruction carefully(although, it won't tell you _what_ to do).

### Part 1
Reading the csv file. Again, reading "tse2001to2020.csv" will NOT work. You need to edit 
it or download my csv file from above.

### Part 2
Find matching Saros TSE and calculate how many days are in between. You can use whatever method 
you want but easiest way is to use code from previous week. You should get 
somewhere close to 6,585.3. It's ok if it is a bit off. 

### Part 3
Written answer. blah blah blah

### Part 4
Now we're going to be smarter here. Come up with a strategy(any strategy really), that 
will accurately(or more accurate than part 2) to calculate days in between two TSE. 
Again, your value should be closer to 6,585.3. And it would be better if answer from 
this part is closer to 6,585.3 than answer from part 2. If it is, your method got better, if it didn't,
you made it worse....

### Part 5
Use your strategy in part 4 to estimate next TSE for each Saros. You should be +/- 10 days
from self-check. 

Make sure to save those dates in the file.

## That's it!
I know this isn't "guide" but there really isn't anything to guide here... Be creative and you
should be able to get full credits for this one. 

