I may have jumped the gun by setting up the UI - this is logic only to begin with.

Misunderstanding on my behalf - but at least that's set up for next weekend.

------------------------------------------

Set up a diagram

https://miro.com/app/board/o9J_lLkDGNc=/

------------------------------------------

As a player
So that I know who is playing
I want to be able to put my name in


- *Started off writing this but realised actually this is a feature and shouldn't really be here as this is logic only.*

------------------------------------------

Okay so I'm going to divvy this up into two Classes - Frames and Game.

Frame is going to set up each frame of a game:

- A frame should have no more than 10 pins
- A frame should allow for two rolls then move onto the next frame, unless:
        - The first shot is a strike (X) then we move onto the next frame
        - The second shot is a spare (/) then we move onto the next frame and add the bonus points from the first roll of the next frame
- There should be no more than 10 frames per game

Game is going to be set up to run a bowling game and display the final scores

------------------------------------------

Issue with repo - had to set up again

------------------------------------------

As a player
So that I know how many frames I've played
I want to be able to count my frames

- For some reason new_frame can't be call on Frame class...

------------------------------------------
    
As a player
So that I know that I have won after the 10th frame
I want to see a summary of the game

- My tests were working and now they are not. This is rather confusing...

      1) Frame end_game ends the game if number of frames is equal to 10
     Failure/Error: frame.new_frame(10)
     
     NoMethodError:
       undefined method `new_frame' for #<Frame:0x00007fdc03954368 @frame_number=[]>

        *How bizzare, it didn't like that I called frame.new_frame on the test despite having no problem with it earlier... but makes sense as I have frame = Frame.new_frame(10) in a previous test*


- I feel like I jumped the gun with making this second.
    
------------------------------------------

As a player
So that I know how much each of my rolls are worth
I want to be able to keep track of my score




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
