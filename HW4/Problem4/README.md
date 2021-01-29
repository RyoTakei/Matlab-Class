# Homework 4 - Problem 4 (Epidemic Part 4)
This one was pretty tricky, took me 2 hours-ish. YMMV! 

**[READ THIS BEFORE YOU BEGIN!!!!!!](https://github.com/RyoTakei/Matlab-Class)**
-


## Breakdown
When we break this down to smaller pieces, it's actually not too bad. In this week's problem,
it's asking 3 main things.
- Create a function called `DiseaseStep`
- Create a function called `DiseaseSimulate`
- Plot using for loops.

So not too bad if you can break this down like this one. Let's go one by one and see 
what we have to do for each and hopefully saves you some time. Before that, let's take
a look at what we did last week.

Last week, our main goal was to accomplish two things. 
- Create big array, using for loops, to store calculated SIR values.
- Using that array to plot your changes in population.

Now, that's kind of what we're doing this week, except we're just using functions to 
make it fancy. We'll be using `DiseaseStep` and `DiseaseSimulate` to generate arrays,
and instead of doing one by one graphing, we're just going to be using for loops to 
graph them all together.

That being said, if you didn't finish last week's homework, go watch Kyle's video. 
He explains everything step-by-step. 

Ok, let's look at how we do this! 

### Step 1. `DiseaseStep`
This function takes care of main calculation -- population changes. Here's the header.
```matlab
function [SOut, IOut, ROut] = DiseaseStep(SIn, IIn, RIn, N, a, b, h)
    % Code here
end
```
First things first, let's look at the purpose of this function. This function 
calculates population change in each step. Again, step. Our `h` value is 0.05, so that 
means this function will calculate changes in population in 0.05 days. Essentially replacing

```matlab
% All the equations given
% dS = (-a * S * I) / N
% dI = (a * S * I) /  N - I / b
% dR = I / b
% N = S + I + R

% To update the numbers:
% S_1 = S_0 + dS * td
% for all S, R, I
```
this clock of code. Remember, we used for loop to calculate the population change over time,
by running this code over and over. `DiseaseStep` will take care of one step. 

**Inputs are as follows**
- `SIN`, S input at given time stamp.
- `IIn`, I input at given time stamp.
- `RIn`, R input at given time stamp.
- `N`, the total population. *SIn + IIn + RIn = N*
- `a`, a value given.
- `b`, b value given.
- `h`, delta time, time interval. 0.05 days in this case.

**Outputs are as follows**
- `SOut`, S output value for next time stamp.
- `IOut`, I output value for next time stamp.
- `ROut`, R output value for next time stamp.

Notice that NONE of them are array. They are NOT arrays!!

So now you should have enough information to write this function. 

tl;dr: This function takes current S, I, R value and calculates next S, I, R values.

### Step 2. `DiseaseSimulate`
This function is the function that runs the simulation.

Let's look at the header. 

```matlab
function [SvsT, IvsT, RvsT, time] = DiseaseSimulate(SStart, IStart, a, b, h, nSteps)
    % code here
end
```

This function is much bigger scale now. `DiseaseStep` was dealing with 0.05 days a step
but now, we're looking at much longer scale. 

This function is actually very simple! Like, very simple. 

All you're doing here is that you're going to call the function `DiseaseStep`, `nSteps` times.
Sound confusing? Well, we know that `sSteps` is 140, per instruction, you're going to run 
`DiseaseStep` 140 times using for loop. But it doesn't end there. Let's look at iputs and outputs
to understand better. 

**Inputs are as follows**
- `SStart`, S starting value.
- `IStart`, I Starting value.
- `a`, same as above.
- `b`, same as above.
- `h`, same as above.
- `nSteps`, How many steps this simulation should run for.

**Outputs are as follows**
- `SvsT`, An array of S values. Size of (nSteps + 1) by 1
- `IvsT`, An array of I values. Size of (nSteps + 1) by 1
- `RvsT`, An array of R values. Size of (nSteps + 1) by 1

So you can see, we take the initial condition of this simulation, given by `SStart`, 
`IStart`, R will always start at 0, and calculates 3 arrays containing population of each
at east time stamp -- our y values when we plot them. 

To make this function work, again, you need a for loop. For loop that runs `nSteps` times, and
calls `DiseaseStep` in the loop -- that updates SIR values. 

But you also need to keep track of each values that `DiseaseStep` outputs. At the end of the day,
this function will return an arrays of outputs from `DiseaseStep`. Hopefully that's 
enough info to get you started! 


### Step 3. Plotting
Plotting is pretty fun, but also challenging. Instead of doing 
```matlab
subplot(1, 4, 1)
plot(x, y)

% More code

subplot(1, 4, 2)
plot(x, y)

% More code 

subplot(1, 4, 3)
plot(x, y)

% blah blah blah
```
We're going to be using loops to making things prettier. 

Before that, let's take a second and look at what we have so far. Remember, `DiseaseSimulate`
only takes care of one `SStart` at a time! This is important!! Because, we're interested in
simulation multiple S values at the same time. Well, that means we have to have another for
loop to go through each S values and throw that into `DiseaseSimulate`. 

That's actaully not a bad news for us, because that means we can take advantage of that
for loop. Since we're already putting `DiseaseSimulate` in the for loop for each S value, 
why not just grab the outputs straight from the fucntion and plot that right away? That works quite beautifully 
here. 

If you read the instruction, you can see that we can use another for loop just for 
the labels, legend, etc etc. You already have somewhat of code given, so I'll let you 
figure that out ;pp

If you've done the right thing, you should get all the same answers as last week,
except our code is now a bit advanced. Again, nothing is changing, we're just being 
efficient and cool. We don't do dumb stuff here, only big brain stuff. 

### That's a wrap! 
That is everything you need to do! Might take you a coupe hours, but it's not terrible!
Always reach out if you get stuck!!!!