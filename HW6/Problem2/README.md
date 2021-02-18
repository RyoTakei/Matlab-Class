# Homework 6 - Problem 2 Linearization of data

Instruction *extra* spicy. And HARD

**[READ THIS BEFORE YOU BEGIN!!!!!!](https://github.com/RyoTakei/Matlab-Class)**
-

## Breakdown (more like mumbling at this point)
This problem might be the most confusing of all homework we've done before. I'm going to 
go slow, and do one thing at a time. 

Linearization is a very common thing we'll be doing. You should know what linear function
looks like and none-linear function looks like. We LOVE linear functions because it's simple
and robust while none-linear functions(`sin`, `cos`, `tan`, `exp`, `sqrt` etc) are hard to 
work with. The point of linearization is to take the none-linear function within an interval we're 
interested in, and see if we can approximate the function using a linear function. It's impossible
to linearize a none-linear function over long interval. But we can somewhat linearize any functions
as long as it is within s small intervals. 

Now, enough mumbling done, let's talk about this week's homework. This week, we're given data points, 
and we're trying to linearize the data points using a few different methods. Unlike linearizing 
functions, we can't use Taylor series, or any method we've done in the past.

For this week, instead of adjusting data points, we will take those raw data and plot them 
using:
- Full linear scale
- Semi-log scale 
- loglog scale

To be honest, I just made those names up. Sorry if there's actual mathmatical names for it 
but let's go with it for now. 

Full linear scale refers to graphs we've all been using for. x and y axis are scale of 1, 2, 3,
etc. As you move one scale, the number becomes one bigger. 

Semi-log scale refers to one of axis being logarithmic scale. 0.001, 0.01, 0.1, 1, 10, 100 etc.
As you move one scale, the number becomes 10 times bigger. We call this semi because only 
one axis is log scale while the other one is still linear scale. If x is log scale while y is linear 
scale(or vice versa), we call this semi-log scale.

Lastly, loglog scale. loglog scale is when BOTH of axis are in log scale. 

So in total, we have 4 variations of scales:
- linear vs linear
- log vs linear
- linear vs log
- log vs log

So, now, your task this week is to generate some data, and add noise, and plot them
using 4 different scales mentioned above. 

We'll follow instruction and do one part at a time.


### Step 1. Retrieve data and add noise

Let's go ahead and set up the function first. We're given that:
```matlab
A = @(A_0, r, t)A_0 .* exp(r .* t);
```
We also know that 
```matlab
A_0 = 20; % mg
r = -0.000436; decaying rate
```
Since we already know 2/3 variables, we can set up another anonymous function. 
Your anonymous function should look something like
```matlab
A_ra = @(t) ( ..... )
```

First part is done. Make sure to run this code and your `A_ra` or whatever you called 
is set up correctly. Go to your command window and check with self check below.

<details><summary><b>!! Self Check Here !!</b></summary>
<p>

```matlab
>> A_ra(2000)

ans =

    8.3623

>> A_ra(3500)

ans =

    4.3481
```

</p>
</details>

Now, let's generate some samples(data). We're asked to generate 20 samples. Set up this 
variable(copy and paste, as you will need this variable later).
```matlab
numberOfSamples = 20;
```
Now, the instruciton says:
```text
Use 0 <= t <= 4000 years with r = -0.000436 and A0 = 20mg to generate 20 evenly spaced measurements of A
```
Don't worry about t and A0 since we already did that. And we also set up a variable called `numberOfSamples`.
Now, we just need to set up `t` so that we can generate 20 samples. Set up `t` so that `t` starts from 0, 
ends at 4000 and has `numerOfSamples` amount of data inside.

Run it, and go to command window and check with my self check below.

<details><summary><b>!! Self Check Here !!</b></summary>
<p>

```matlab
>> t

t =

   1.0e+03 *

  Columns 1 through 17

         0    0.2105    0.4211    0.6316    0.8421    1.0526    1.2632    1.4737    1.6842    1.8947    2.1053    2.3158    2.5263    2.7368    2.9474    3.1579    3.3684

  Columns 18 through 20

    3.5789    3.7895    4.0000
```
Notice, `1.0e+03 *`. 

</p>
</details>

Once you have t correctly, you can simply plug t into `A_ra` and `A_ra` should return 20 data points. 

<details><summary><b>!! Self Check Here !!</b></summary>
<p>

```matlab
>> A_ra(t)

ans =

  Columns 1 through 17

   20.0000   18.2459   16.6457   15.1858   13.8540   12.6390   11.5305   10.5192    9.5967    8.7550    7.9872    7.2867    6.6476    6.0646    5.5327    5.0475    4.6048

  Columns 18 through 20

    4.2010    3.8325    3.4964
```

</p>
</details>

Once you have that, go ahead and save that variable into whatever name you want. It should 
look something like this
```matlab
radiumData = R_ra(t);
```

The last part in this section is to add some noise. 

Copy and paste this code into your file.

```matlab
addSampleNoise = (rand([1 numberOfSamples])-0.5) .* (original_data_A.*0.1);
A_noisy = original_data_A + addSampleNoise;
```

Our variable name is different from instruction, so you will need to change the variable names.
- You should already have `numberOfSamples`. Change it if you used different name
- `original_data_A` is our `radiumData`

Once you fix your variables, you should be able to run this code. Make sure there are no errors.

Go to workspace and click on `A_noisy`. You should have 20 values inside, with slightly different values
from `radiumData`. Every time you run, the values inside this will change because it's using `randi`. 

That is the end of step 1.

### Step 2. Plot using different scales.
First of all, go ahead and set up 2 by 2 subplot. 

By instruction, your plots will have
- linear linear at subplot 1
- log log at subplot 2
- linear log at subplot 3
- log linear at subplot 4

Remember!! To convert linear scale to log scale, you use `log`. To convert log scale 
back to linear scale, you use `exp`. 

Right now, we have `t` as our x axis, and `A_noisy` as our y axis. Go ahead and use `plot` function 
to plot `t` vs `A_noisy` in linear-linear scale. 

To plot semi-log scale, you can take `log` of axis and use `plot` to plot them.

Here's list of different scales and command to plot each. Assuming that `x` and `y` are in linear scale.

Scale | Command |
------------ | ---------------------
linear linear | plot(x, y) |
loglog | plot(log(x), log(y)) |
linear log| plot(x, log(y)) |
log linear | plot(log(x), y) |

Don't forget to add title, label, and set x and y limit so that it matches with self check. 
Remember, random noise is added to your data, so it won't look EXCATLY the same as self check 
and that is ok.

To add 2 lines title like what self check has:
```matlab
title("Mass vs Time", "Linear-Linear")

% OR

title({'Mass vs Time'; 'Linear-Linear'});
```

Lastly, answer the question in the instruction:
```text
output  your  choice  of  function  to  the  command  window (linear,  power,  exponential,  or  logarithmic).  
(Hint:  Does  your  choice  match  the  form  of  the equation in part a?)
```

In my opinion, this hint is not very well worded....lol

Here's my hint: Which line is straightest of all 4. That's it.

Should be the end of step 2 (part b).

### Step 3. Polyfit data (part c)
Once you have a method picked, we can go ahead and use `polyfit` to calculate coefficients of 
polynomial(line of best fit). 

Remember, since you changed the scaling on axis, you need to do the same when you calculate coefficients 
of polynomial.

Print out `b`(y-intersection) and `m`(slope). Make sure it makes sense. 

### Step 4. Converting coefficients back to each function (part d)
In part c, we calculated the coefficients of polynomial in different scale(semilog or loglog).
Now, we will being everything back to linear scale.

Here is where it gets confusing. 

Take a look at the instruction, and understand what each equation really is. We have:

Function | Equation |
------------ | ---------------------
Linear| y = mx+b |
Power | y = bx^m |
Exponential | y = be^(mx) |
Log | y = m * ln(x) + b |

From part c, we already have `b` and `m`. But are they the same as those in the table? 
Can we just use the same `b` amd `m` and plug it back in? 

Well, not really. Remember, `b` and `m` from part c was coefficient of polynomial in 
different scale. Whether you used loglog or semi-log, scaling wasn't linear. 

In this part, we're bringing everything back to linear-linear scale. So we have to undo some 
of operations we did to get `b` and `m`. 

I might add "nerds onl" section but for now, look at the table below to see which operation 
that needs to be done.

Conversion | function | b | m |
------------ | ------------ |------------ | --------------------- 
Linear-linear -> Linear| Linear | b -> b | m -> m
loglog -> Linear | Power | b -> exp(b) | m -> m
linear-log -> Linear | Exponential | b -> exp(b) | m -> m
Log-linear -> Linear | Log| b -> b | m -> m

Format is `old -> new` where `old` is b and m from part c. `new` is that b and m you will be
using to re-construct each function from loglog/semi-log scale polynomial. 

Now, you just need to print your `b` and `m` values. Instriction refers `b` as `A_0`, and `m`
as `r`. 

### Step 5. Plotting (part e)
Almost done...

You just need to plot the data, and function and you're done. 

Look back into two tables above and you should be able to figure out what you need to do from here.

For example, if you used linear-log to calculate `b` and `m` in part c, you can take `exp(b)` to get new b value.
Then, your line of best fit will be a exponential function -- so you'd use `y=be^(mx)`. 
Does that make sense? 

Once you have new b and m, go ahead and plot `A_noisy` in a new graph. And line of best fit with function
of your choosing. And you should get pretty graph like self check. 

### That's a wrap! 
oh man, this was rough...
If you don't understand anything, let me know but hopefully I went more in depth than ever, so that 
might help....???
