Bowling Challenge in Ruby
=================

## Challenge description

Count and sum the scores of a bowling game for one player. For this challenge, you do _not_ need to build a web app with a UI, instead, just focus on the logic for bowling (you also don't need a database). Next end-of-unit challenge, you will have the chance to translate the logic to Javascript and build a user interface.

A bowling game consists of 10 frames in which the player tries to knock down the 10 pins. In every frame the player can roll one or two times. The actual number depends on strikes and spares. The score of a frame is the number of knocked down pins plus bonuses for strikes and spares. After every frame the 10 pins are reset.

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

## My approach to the challenge

* I've started diagramming the following stories:

```shell
As a bowling player
So that I can practice my skills
I want to play a full bowling game 

As a bowling player
So that I know how well I’m doing
I want to see how many pins I knock down in each roll

As a bowling player
So that I have a record for next time
I want to keep track of my total score for each frame

As a bowling player
So that I have some more information about my rolls
I want to have some notes on my strikes, spares and bonuses

As a bowling player
So that I know how the game went
I want to see my final total score
```

* I decided to create 3 classes: 
    * Frame: in charge of keeping track of the number of frames, rolls and pins that are knocked down
    * Scorecard: in charge of keeping track of the total score for each frame and final score
    * BowlingGame: in charge of letting the player play a bowling game and returning the scores for each frame and final score
     
* I started with the Frame class following a TDD approach:
    * the class has the following methods:
        add_first_roll adds pins number for first roll and current_frame
        add_second_roll adds pins number for second roll (if applicable) and current_frame
        next_frame (private) changes current frame to next one
        complete?(current_frame) returns true if current frame is complete
        strike? Returns true if scored strike at first roll
        spare? Returns true if scored total of 10 with second roll
    * and properties:
        @frames = hash with 10 keys as frames and arrays to store rolls for each frame
        @current_frame = current turn, starts at 1
        @next_frame = following turn, starts at 2

* I then moved to the Scorecard class with the same approach, but I think I overcomplicated things as I wanted to print the actual score after each frame as it's supposed to happen when going to play bowling. I didn't manage to complete what I was aiming to do and I ran out of time.

## Notes

As I run out of time I didn't manage to complete the challenge. I think I should have followed a different and more simple approach. 
I will try to complete it as soon as I can. Also there are some methods that need to be refactored as they are pretty long and complex to understand.

At the moment the only way to run the program in irb is by following the commands below, but again this is not what I was aiming to implement as final product:

```shell
irb
require './lib/frame.rb'
frame = Frame.new
```

Then call the method .adds_first_roll(pin) with number of pins as argument. Call this again if the previous time it was a strike.
```shell
frame.add_first_roll(10)
```

Call .adds_first_roll(pin) and .adds_second_roll(pin) if there is no strike in the first roll
```shell
frame.add_first_roll(3)
frame.add_second_roll(4)
```

Call the same methods until you get to the 10th turn, then to see the frames scores run the following command:
```shell
frame.frames
```

## Technologies use

* Ruby
* Rspec