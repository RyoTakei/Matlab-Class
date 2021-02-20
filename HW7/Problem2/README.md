# Homework 7 - Problem 2 The Epidemic Problem

Welcome back to Epidemic problem, you had a week off, hope you're ready for this hehe

**[READ THIS BEFORE YOU BEGIN!!!!!!](https://github.com/RyoTakei/Matlab-Class)**
-

## Breakdown
First thing first, copy over your `DiseaseStep.m` file. You won't need anything else from last week.

This week, you'll be writing another function file with less than 10 lines of code,
and your main file will also have less than 10 lines of code(without extra credits).

Before we jump in, review for `fplot` and `fzero`. If you're confident, skip this part. 
If you didn't know, in `fplot` and `fzero`, f stands for function. Inside of those functions,
you NEED to throw in functions for them to work. In addition, those function needs to have input 
of one variable, and only one. Why? Well, here's how `fplot` works(and fzero works in very
similar way). When `fplot` receive function with input of one, it will automatically generate 
sets of input. Matlab could automatically decide the range of input. Or you can tell Matlab
what range you want to it to throw in by calling `fplot(function, [range])`. Once Matlab 
has your function and range of inputs, it will throw in inputs into your function 
and graph the output. And Matlab will do this continuously with small enough increments,
until it reaches the upper bound of the range. Once this process is over enough times, 
we now have graph of given(or selected) inputs vs output of your function. 

The main point I want to get out of this is that `fplot` and `fzero` takes a function with
one input and will vary the input for you. Remember this because we need this later. 

Now onto the guide. This week, the instruction is very very spicy. So hold on tight.

You're asked to make a function called `FindEpidemic`. Let's first look at the input and output.

```matlab
function [ fzeroValue ] = FindEpidemic(SStart, IStart, a, b)
```
Now, this is very misleading in my opinion. I don't think it should be called `fzeroValue`
but what can I do? 

Anyways, let's take a step back and talk about previous homework.

Do you remember when we did intersection of two functions? In that week's homework, if you can recall,
we had two functions and we also made `rootsFunction` where it returns 0 when two functions intersect.
That's kind of the idea here. We intentionally make a function that returns 0 at the point we're
interested in. If we can make a function that returns 0, we can use `fzero` to find those points
we're interested in. `FindEpidemic` is exactly that function. 

Don't get caught up by the variable called `fzeroValue`. It has nothing to do with roots, or 
anything in this case. We are simply returning values, and use `fzero` to catch values
we're interested in. 

So what are we interested in? We're interested in point where epidemic is really and epidemic.
That sounded so dumb but bear with me here. We're interested in the point where S population 
is large enough to cause an epidemic in given situation. By definition, it is an epidemic when 
slope of infected population is greater than 0(aka increasing). We'll talk more about this later.

So short story long(haha), this function we're writing returns the slope of infected
population given starting S value, I value, and a, b, h.

And in the main function, we will use this function, `FindEpidemic` to find the smallest
S population in which causes an epidemic. 


### Step 1. Write FindEpidemic
Once you understand what this function does, it's pretty easy. 

Per instruction,

```  
The slope at the start can be found by taking one time step (f(x+h) – f(x)) / h. Use DiseaseStep (or DiseaseSimulate) to calculate f(x) and f(x+h) for the infected value after one time step.   
```

One thing that we're going to assume(it's true but I don't want to explain why) is that we're only 
going to need to check the first step to know if it is an epidemic. If, by the first step, slope of 
infected population isn't positive(aka increasing) it will never going to happen. So, we're only 
going to check the first step and ignore the rest. 

Now, let's extract important bits from the instruction. 

```
(f(x+h) – f(x)) / h  
```

That's it. Everything else is meaningless for us. What does this mean? Well, go back to MTH 251, 
and you know that this is to calculate the slope of a function. In our case `f(x)` represents 
current infected population and `f(x+h)` represents the infected population of `h` days later. 
If this doesn't ring the bell yet, we're talking about one `DiseaseStep`-function-later.

We already know current infected population, `IStart`. 

And we can simply calculate infected population one step later but using `DiseaseStep` function.

And again, output value `fzeroValue` is just the slope of infected population, so you can 
directly assign the results into the function. 

Then, you are done with this function. We're going to go back to the main file(a brand new file 
actually) and finish this problem.

### Step 2. Main file and plot
In the beginning of this guide, I talked about how `fplot` and `fzero` need a function 
with only one input. 


<details><summary><b>!! I talked too much so I decided to hide this bit !!</b></summary>
<p>

A cool thing about Matlab is that you can (sort of) change the form of 
function to whatever you'd like. Here's some quick example:

```matlab  
% I set up a random function that returns a value in polynomial
% given m(slove) and b(y intersection) and x value. 
myFunction = @(m, b, x) m * x + b;


% Say we want to plot this in range of [0, 10]
range = [0, 10];

% simply doing
fplot(myFunction, range);
% will results in an error. 
% because we have more than one input. No good no good.

% So how can we do this? 
% Well, simple answer is, it's impossible...
% but if you knew m and b, you can graph them.
% So you can change the code a bit

% Now, this works.
fplot(@(x)myFunction(2, 3, x))
```

What I just did is, (what I called it) nested function. We embedded a function inside of 
a new anonymous function. If you don't know what just happened, look closer. We have 

```matlab
@(x)myFunction(2, 3, x)  
```

This is a new anonymous function we just created inside of `fplot` function. Has no name
(since we didn't assign it to anything). This anonymous function takes an input of `x`, and 
calls `myFunction` with given m and b, and replace `x` with this function's input `x`. 

(This is true power of anonymous function. the reason why it's called anonymous
-- at least in my theory -- is that this function doesn't exist anywhere else. 
It only exist at point we created them. We often refers to anonymous function as 
lambda. Because lambda is a unknown function with certain input. When you go into frequency,
or some kind of data with unknown variance, we often call that lambda and that's because 
it's an unknown function that exist in the nature but we don't know anything. In Matlab,
or any programming language, you can assign anonymous functions to a variable and use it
but often times, you define it in the spot and will never be used again.)

</p>
</details>

So how can we get 

```matlab
FindEpidemic(SStart, IStart, a, b, h)
```
to work with `fplot` and `fzero`. The simplest way is to nest this function
into an anonymous function with one input. Then, we can throw that into `fplot` and `fzero`.

To do this, we first need to identify which variables stay constant and which variable we want 
Matlab to vary. This one is simple, but if you don't know, think about what you want your 
x-axis to be when you plot them. That, will be the variable you want Matlab to vary. 

In this case, we want our x axis to be the number of S population, and we want to know how that 
affects the slope of infected population. 

At the end here's what you should have

```matlab
IStart = 100; % Given
a = 10; % Given
b = 1.25; % Given

% Change the function name if you'd like.
rootsFunction = @(s)( ... ) % Finish your code here
```

Now, we have a function with one input, s, that we can use with `fplot` and `fzero`.

The rest should be easy. Call `fplot` and `fzero` with `rootsFunction`. 

Remember that `fzero` needs a guess value. Use your answer from last week's homework, 
or you can use your educated guess. 


## That's all.

Pretty ok? I struggle because to me, `fzeroValue` meant something completely different.
The hardest part is to set up a new function so that you can use `fzero` and `fplot`. 
Otherwise, this problem should be ok. 