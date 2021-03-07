Bowling Challenge in Ruby
=================

![image](https://user-images.githubusercontent.com/75075773/110204624-f3b11000-7e6b-11eb-860a-76925a307d07.png)


This is my solution for the end of week 5 challenge at Makers Academy. The goal is to create a program that allows a user to keep score of their 10 pin bowling game. The user will input their scores each turn and will be returned an array displaying their scorecard.



## Focuses

- Test Driven Development
- Code clarity
- Using Diagraming to approach this challenge
- Good Git practices
- Designing class responsibilities 

## How to install

simply follow the instructions beloew

```
fork and clone this repo
```
```
run $rspec--init 
```
```
to run the tests, type $rspec
```

## How to play

start by creating a new instance of the user interface class:
```
bowling = Ui.new
```
to begin the first frame:
```
bowling.begin_frame
```
to enter throw 1 or throw 2 points:
```
bowling.throw_1(7)   your points are typed in the brackets.
bolwing.throw_2(1)
```
to add to the scorecard:
```
bowling.add_to_scorecard
```
to see your scorecard at any point in the game:
```
bowling.scorecard
```
if you got a spare or a strike, add the respective bonus in the following frame (note - spare won't work for a strike and vice versa): 
```
bowling.spare_bonus
```
```
bowling.strike_bonus
```
at the end of each turn, begin a new frame
```
bowling.begin_frame
```

repeat until you've entered your points for all 10 rounds, for the tenth round, simply add your rolls and bonus points then enter the following to see your total:
```
bowling.finish_game
```

## Bowling — how does it work?

### Strikes

The player has a strike if he knocks down all 10 pins with the first roll in a frame. The frame ends immediately (since there are no pins left for a second roll). The bonus for that frame is the number of pins knocked down by the next two rolls. That would be the next frame, unless the player rolls another strike.

### Spares

The player has a spare if the knocks down all 10 pins with the two rolls of a frame. The bonus for that frame is the number of pins knocked down by the next roll (first roll of next frame).

### 10th frame

If the player rolls a strike or spare in the 10th frame they can roll the additional balls for the bonus. But they can never roll more than 3 balls in the 10th frame. The additional rolls only count for the bonus not for the regular frame count.

    10, 10, 10 in the 10th frame gives 30 points (10 points for the regular first strike and 20 points for the bonus).
    1, 9, 10 in the 10th frame gives 20 points (10 points for the regular spare and 10 points for the bonus).

### Gutter Game

A Gutter Game is when the player never hits a pin (20 zero scores).

### Perfect Game

A Perfect Game is when the player rolls 12 strikes (10 regular strikes and 2 strikes for the bonus in the 10th frame). The Perfect Game scores 300 points.

In the image below you can find some score examples.

More about ten pin bowling here: http://en.wikipedia.org/wiki/Ten-pin_bowling

![Ten Pin Score Example](images/example_ten_pin_scoring.png)
