Bowling Challenge in Ruby
=================

* Feel free to use google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday week

## The Task

**THIS IS NOT A BOWLING GAME, IT IS A BOWLING SCORECARD PROGRAM. DO NOT GENERATE RANDOM ROLLS. THE USER INPUTS THE ROLLS.**

Count and sum the scores of a bowling game for one player. For this challenge, you do _not_ need to build a web app with a UI, instead, just focus on the logic for bowling (you also don't need a database). Next end-of-unit challenge, you will have the chance to translate the logic to Javascript and build a user interface.

A bowling game consists of 10 frames in which the player tries to knock down the 10 pins. In every frame the player can roll one or two times. The actual number depends on strikes and spares. The score of a frame is the number of knocked down pins plus bonuses for strikes and spares. After every frame the 10 pins are reset.

As usual please start by

* Forking this repo

* Finally submit a pull request before Monday week at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday week at 9am. 

___STRONG HINT, IGNORE AT YOUR PERIL:___ Bowling is a deceptively complex game. Careful thought and thorough diagramming — both before and throughout — will save you literal hours of your life.

## Focus for this challenge
The focus for this challenge is to write high-quality code.

In order to do this, you may pay particular attention to the following:
* Using diagramming to plan your approach to the challenge
* TDD your code
* Focus on testing behaviour rather than state
* Commit often, with good commit messages
* Single Responsibility Principle and encapsulation
* Clear and readable code

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

### My Approach

#### How to setup and use the program

#### My steps
Below is an account of how I went about solving this challenge

##### First steps

I began by creating user stories that described most of the logic for calculating scores for a typical game of bowling.

I attempted Domain Modelling, however, I began to get confused about what I needed to include in the domain model. Below is my first attempt.
(images/Bowling Challenge DM.drawio.png)

I will attempt to improve it as I progress.

To begin, I will start with some basic rspec tests that will describe the user class such as, 

- [x] the user should have a name and a scorecard
For simplicity I decided for a one to one approach with the relationship between user and scorecard, i.e. a single user will have one scorecard.

- [x] the add_score method should pass the correct argument to a Scorecard object

Now lets start tackling the scoring section, since its very complicated, im going to begin by making a bunch of tests which describe a series of scenarios such as:

I am also tackling the bonus score tests after the first series of tests:

first series of tests:
Strike tests:
- [x] Scoring a strike should add a score of 10 for that frame and skip to the next frame
spare tests:
- [x] scoring less than 10 should not skip to the next frame
- [ ] after two inputs or two rolls the frame should skip to next one
- [ ] if user knocks down the remaining pins on his second roll he gets a spare for that frame
Less than 10 pins:
- [ ] if user still has remaining pin on the second roll he will not get spare for that frame

Second series of tests: 
After we have successfully completed the tasks above we can begin writing tests for bonus scores


