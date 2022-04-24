Bowling Challenge in Ruby
=================

#### Makers Week 5 Weekend Challenge - bowling scorecard.
jackmcc08 answer to the challenge.

On Submission:
- RSPEC tests all passed
- Rubocop - only one violation (BowlingScorecard class too long)

## To use
1. git clone to your local machine
2. run `bundle install`
3. enter into terminal `ruby bowling_scorecard_run.rb` (This will run the command line interface for the scorecard - should be simple to follow).
4. enter your bowling scores - it should give you errors if incorrect scores are used.

## technologies
Program is built entirely with Ruby and used the following gems for testing development - Rspec, Rubocop, SimpleCov, Preek (thanks Stu for introducing me to this new pain!).

Cool features include:
- Using Sprintf method to format the display strings simply and easily.
- mocking user input with $stdin and stubbing gets.

The program is split into two classes:
- RunScorecard which includes the display logic and the game loop
- BowlingScorecard which includes all the logic for the game and storing the information.
- If I have time I will look to extract a Frame class, but unlikely at this point.

## Development History

Please see the development notes for my in progress write up during dev.

I started off this project through building out the specification into user stories and domain model, and I also did a flow chart to identify all possible routes the bowling game could take. This helped me map out the program.

I followed as much as possible strict TDD, incrementing the program with only what was necessary to meet the tests. This helped hugely in developing the logic and avoided getting lost in the complexity.

There was a point where I tried to make a big leap in the logic, but it was getting confusing so I broke it down into much smaller increments by writing more incremental tests.

For the 10th frame logic I wrote it out long hand before refactoring into the other methods I wrote for frames 1 to 9.

Areas to improve/concern:
- Program does not allow you to revise scores.
- I think I tackled all input edge cases but could have done with more testing.
- Needs more extraction to get it to be more object orientated/srp.
- Cool next steps would be to build a web app and database for the program.



# Original Instructions

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
