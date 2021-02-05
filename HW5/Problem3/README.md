# Homework 5 - Problem 3 (Epidemic)

By now, we all kind of hate epidemic problem... But you're going to like this one! 

Super super easy this week, only like 15 lines of code needed! Took me 30 min ish, YMMV! 

Since this is about adding lines to last week's problem, there's no guide code provided.

**[READ THIS BEFORE YOU BEGIN!!!!!!](https://github.com/RyoTakei/Matlab-Class)**
-

## Breakdown

We're asked to write a function `IsEpidemic`. And modify the last weeks main file, and add a couple 
lines of code. That's it! 


### Step 1. Function
`IsEpidemic` function will run `DiseasesSimulate` from last week and calculates a couple of 
things. Before we go deep, let's look at the function header.

```matlab
function [ bIsEpidemic, peakIValue, peakTime ] = IsEpidemic( SStart, IStart, a, b)
```

Outputs are as follows:
- `bIsEpidemic`, Wheather if simulated case is an epidemic.
- `peakIValue`, peak value of I during the simulation.
- `peakTime`, when the peak I happened.

Inputs are as follows:
- `SStart`, Starting S value for `DiseaseSimulate` function.
- `IStart`, Starting I value for `DiseaseSimulate` function.
- `a`, a const for `DiseaseSimulate` function.
- `b`, b const for `DiseaseSimulate` function.

As you see here, all of inputs go directly into `DiseaseSimulate` function from last week. 
So the only thing left here is that we need to calculate all of those outputs. 

`bIsEpidemic` is a boolean. Boolean is a true or false value(1 or 0 in Matlab). We will return
1 if the case we ran is an epidemic. We will return 0 is the case we ran is not an epidemic. So
how do we know? The mathmatical way to answer this question is that if the derivative(slope) of I
is more than 0. In other words, if I increased at all at any point. We already know that I will 
reach to 0 at some point, but before that, did I increase at all from the starting value? That's 
all you're trying to answer in this case.

`peakIValue` what's the highest I value. Remember, `DiseaseSimulate` will return `IvsT` arrays 
which contains I values from the simulation. You can use `max` function to find the highest 
value from the array. 

`peakTime` is when did the `peakIValue` happened. Hint: `max` function can return two things. 
The highest value, and index of that highest value. Since all arrays we get back from 
`DiseaseSimulate` is linked, we can use that index to find the t value. 

That should be all. Again, this function should be around 10 lines. It's pretty easy! 

### Step 2. Edit the main file

If you haven't done it, go ahead and copy your main file, DiseaseSimulate.m and DiseaseStep.m 
into your homework 5 folder. You should now have those, as well as IsEpidemic.m file. 

Run the main file and make sure it still works. If it's broken, you can't even copy and paste. 
Congratulations.

Now what you're going to be editing is the part where you're printing the final value. Should be
inside of your for loop, at the very bottom(or before graphs if your code is setup that way.). 
You're doing to call `IsEpidemic`, with the same `SStart`, `IStart` values as ones you gave in
the `DiseaseSimulate` function. You're then going to look at `bIsEpidemic` variable. 
If `bIsEpidemic` is true, you're going to want to print out extra lines. (see self-check) or output
of my code below.

```
Start S=0, Ending after 7 days: S=0, I=0, R=100, total 100 
 Is NOT Epidemic

Start S=500, Ending after 7 days: S=0, I=2, R=598, total 600 
 Is Epidemic, time 0.45 days, number of people 457

Start S=1000, Ending after 7 days: S=0, I=5, R=1095, total 1100 
 Is Epidemic, time 0.55 days, number of people 830

Start S=1500, Ending after 7 days: S=0, I=7, R=1593, total 1600 
 Is Epidemic, time 0.60 days, number of people 1204

Start S=2000, Ending after 7 days: S=0, I=10, R=2090, total 2100 
 Is Epidemic, time 0.65 days, number of people 1576
```

Again, this is very minor change in your code from last week. You're just going to be calling
`IsEpidemic` function, and if statement to change the print statement based on the output 
from the `IsEpidemic` function. 


### That's a wrap!
yup, we all hate epidemic problem but this one is not bad right? It is less than 20 lines of code 
and that's all you need to get full credits. 


