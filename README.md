# Bowling Challenge - Ruby #

An application that shows the running score of a bowling game for a single player after each frame after entering the individual scores for each roll.

## Objectives

- Diagramming
- Test driving the code (following the TDD process)
- Testing behavior rather than state
- Single Responsibility Principle and encapsulation
- Clear and readable code that's DRY

## Technologies used

Ruby. Tested using RSpec.

## Diagramming ##

### User Story ###

```
As a bowling player
In order to see my running score after each frame
I would like to enter my score on a scorecard after each roll 
```

### Domain Models ###
| Objects     | Actions     |
| :------------- | :------------- |
| Roll       | roll_score |
| Frame       | frame_score |
| Scorecard       | create, score |


## Example Tests ##

| Input - an array of the number of pins knocked after each _roll_|Output - an array of the _running_ score after each _frame_|Notes | 
| :------------- | :------------- | :----: |
| [0]       | [0,0,0,0,0,0,0,0,0,0] | Gutter Game |
| [0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0,0] | [0,0,0,0,0,0,0,0,0,0] | Gutter Game |
| [10,10,10,10,10,10,10,10,10,10,10,10] | [30,60,90,120,150,180,210,240,270,300]| Perfect Game |
| [0,10,0,10,0,10,0,10,0,10,0,10,0,10,0,10,0,10,0,10,0] | [10,20,30,40,50,60,70,80,90,100] |
| [1,4,4,5,6,4,5,5,10,0,1,7,3,6,4,10,2,8,6] | [5,14,29,49,60,61,77,97,117,133] |
| **Edge cases:** | |  |
| *Anything other than an array integers between 1 and 10 inclusive with max length of 21 and min length 1* | Error| |
| | | An array of integers with length 10 should be outputted unless it's an error |


***

## How to use ##

#### Download repo and install packages

1. Clone repo `git clone https://github.com/Reeshul/bowling-challenge-ruby`
2. Change directory `cd bowling-challenge-ruby`
3. Install gems `bundle`
4. ...



