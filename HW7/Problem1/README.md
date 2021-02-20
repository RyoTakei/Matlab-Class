# Homework 7 - Problem 1 The Caesar Ciphe

Encoding and decoding the code

**[READ THIS BEFORE YOU BEGIN!!!!!!](https://github.com/RyoTakei/Matlab-Class)**
-

## Breakdown
This problem is all about string operations, ASCII character encoding.

If that sounds hard, don't worry I'm just making it sound hard. In short, make sure to do the reading
and understand everything they've talked about. And look up ASCII encoding method if you have 
no idea how this works(it's pretty cool).

First things first, download the file and extract them. Make sure you know where they are. You need following 4 files for this assignment.
- shifts.txt
- caesar1.txt
- caesar2.txt
- caesar3.txt

Once you have those, you're ready to go. 

This assignment, you need to know how to get character from a number. Specifically, getting a character from a ASCII code. It's in zybooks. 

Steps you need to take
- Read the data from shift.txt
- Set up a way to decode given code
- Read each caesar files
- Convert decoded ACSII code to characters

**While you work on this, you need to keep track which language you're talking. We will be treating
characters as numbers. And you will be working with scale of 0-25(26 characters, A-Z), 
and you'll be working with scale of 65-90(ACSII code for A-Z).**

Let's get started.

### Step 1. Reading the data
This step should be very easy by now. Use `dlmread` to read the contents of shifts.txt. 
You should have 3x1 array. Those number is how many characters you'll be shifting in your code.

### Step 2. Setting up decoding method
You can do this in a few different ways. 

Let's go ahead and look at what's inside of caesar1.txt.

```text
80,68,87,79,68,69,76,86,73,88,81  
```

We need a way to shift all this number by certain amount, given from shifts.txt. You might 
think we can simply shift all this number by adding or subtracting. Well, here's an issue for you.

Say we're shifting "W" by 7. Logically, we can say  
```text
W -> X -> Y -> Z -> A -> B
```
We are smart to and simply just take care of rollover easily. We know that there's nothing after "Z"
so we rollover to "A". But computer doesn't know that. If you simply shift W by 5 here's what would happen.

| Character | ACSII |
|------| -----|
| ... |  ... |
| W | 87 |
| X | 88 |
| Y | 89 |
| Z | 90 | 
| [ | 91 |
| \ | 92 |
| ... | ... |

You can see that ACSII code for W is 87, and if we add 5, we get 92, which translate into character 
"\". That's a problem. 

Now you can approach it in a few different ways. But here's what I would do, and looks like 
the instruction wants you to do this way too. Per instruction: 

```
N = (x + s) % 26
```
`%` is just mod() in matlab. We can simply re-write this into matlab language. `x` is the ACSII code,
and `s` is how many you're shifting. And `%` takes care of rollover for us. And here's how it would 
look like in matlab code. 

```
N = mod(x + s, 26)
```
We can set this up as an anonymous function with input of x and s. So we take input of encoded 
numbers and shift by `s` amount. 

**But here's the catch.** We need to be talking in scale of 0-25. In order for this code 
to work, we have to be talking in scale of 0-25, otherwise, rollover at 26(with `% 26` part 
of the code) won't work. Remember, in the file we're reading from, they are in ASCII dec, and 
we need to be talking in 0-25 scale. 

To fix this issue, you can just scale ASCII dec down to 0-25 scale. We already know that 
ASCII dec for "A" is 65. So we can scale everything down by 65. 

```matlab
N = @(x, s) ( ... ) % Finish the code here
```

<details><summary><b>!! Self Check Here !!</b></summary>
<p>

```text
>> N(87, 5) % shifting w by 5

ans =

     1

>> N([80,68,87,79], 4) % should work with arrays too

ans =

    19     7     0    18

```

(First one make sense because A=0, B=1. And we said that shifting W by 5 should get us to B.)

</p>
</details>

### Step 3. Reading each caesar file and decode them

This one should be fairly simple. You might need to do some string operation to make 
for loop work but here's the basic idea. 

You make a for loop, and each loop, we read from different file. First loop should be from 
"caesar1.txt", second one should be from "caesar2.txt", etc etc. 

Once you have data loaded into a variable, and we already saw that N function can take 
an array as an input, you can directly feed it into `N` with s value being a value from
"shifts.txt". 

<details><summary><b>!! Self Check Here !!</b></summary>
<p>

```  
decodedNumber =

    12     0    19    11     0     1     8    18     5    20    13  
```  

Here's the decoded value for the first one. If this matches with yours, you're doing good.
I am not including second or third one. 

</p>
</details>

### Step 4 Convert and print

While you're inside of the for loop, and have decoded values, let's convert them back 
to ASCII dec and finally to string(characters). 

Again, at this point, we are dealing with 0-25 scale. We need to go back to ASCII dec scale. 
To do this, we can simply undo the scaling we did in step 2. 

After descaling(is that a word???), we should be in the range of 65-90 range, back to ASCII codec.

Now, it's your job to figure out how to convert ASCII codec into **char**acers.(hint hint)

Google or zybooks if you need to.

Compare your answer with selfcheck in the instruction. 

## That's all.

Congratulation, fairly painless problem. Now, get ready for another epidemic problem ;)