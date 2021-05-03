Bowling Challenge in Ruby
=================
The task for the Makers Academy Week 5 weekend challenge is to write the backend logic for a program that calculates a scorecard for a single player bowling game. The program doesn't simulate a game itself, it operates as a calculator and requires the user to enter in manually the number of pins knocked down each roll.
## Approach

<details>
    <summary> Planning </summary>
    <br>



### Diagramming Game Logic
<img src="/public/images/bowling_rules.png">

### Domain Model
[attach image]
</details>

<details>
    <summary> Implementation </summary>
    <br>

 ### Inclusions: 
- [x] Need to allow for a frame to consist of 2 rolls, and to calculate the game score based on 10 frames 
- [ ] Need to allow for a total of 10 frames per game (raise an error if further rolls entered, or set scorecard to 0?)
- [x] Need to allow game score to be 0 == gutter game
- [x] Need to allow for a spare == all ten pins knocked down over 2 rolls of a frame
- [x] Need to allow for a strike == all ten pins knocked down with first roll of frame, no second roll (i.e. score of 10 ends the turn)
- [x] Need to allow for a perfect score == 300 (in tests) 
- [x] Need to allow for bonus rolls if strike or spare scored in the 10th frame (2 and 1 respectively)

<details>
        <summary> Pseudocode </summary>
        <br>

**Scorecard class methods:**
 
	Initialize 
		Rolls = [ ]
 
    Roll(no. of pins) (i.e. - play)
        Raise error if ‘pins’ value > 10
        Push no of pins to rolls array
    
        Total_score (i.e. - points as result of play)
            using the roll index from the rolls array - sum the rolls per frame to return frame score, and use this to return total score for whole game by iterasting through whole array (using counter). 


**Private methods:**

    Frame score
        Need to establish that a frame consists of 10 pins and 2 possible rolls
        
    Strike? (roll)
        First roll in frame == all ten pins knocked down, no second roll.

    Strike score
        Frame 1 == 10 + (frame 2a Score + frame 2b score)

    Spare? (roll)
        First roll + second roll == 10
        
    Spare score 
        Frame 1 == 10 + (frame 2a score)
    
    Bonus rolls (end of game)
        10th frame has max of 3 rolls if strike or spare rolled. 
    
    Game over?
        If frame(10) score == strike?
            Allow 2 more rolls
        Elsif frame(10) score == spare?
            Allow 1 more roll
        Else
        Frames == 10
        End game/ error: max no. rolls played. 

Notes: <br>
Currently automated iteration through array - would like to try and convert logic to manually input two roll scores per frame so that I can attempt to implement a 'game over' method which resets the scorecard to 0 once the 10th frame has been played. 


</details>

</details>

## To Test in IRB


## Task Overview
<details>
    <summary> Instructions </summary>
    <br>

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

</details>

<details>
    <summary> Bowling rules </summary>
    <br>

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

</details>
