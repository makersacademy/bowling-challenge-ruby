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

- I'm a bit confused - .strike? should only be returning true if the first element of @shots is == PIN_COUNT. This means my test should be passing. I've set it up so that the frame has ten pins, the user then bowls PIN_COUNT, which means frame.strike? should return true because the first element of the @shots array is a ten.

  1) Frame#strike? returns true if first shot knocked down all the pins
     Failure/Error: expect(frame.strike?).to be true
     
       expected true
            got false

- Added frame_setup in front of .bowl and .strike? in test - this throws up a new error:

          1) Frame#strike? returns true if first shot knocked down all the pins
     Failure/Error: frame_setup.bowl(Frame::PIN_COUNT)
     
     NoMethodError:
       undefined method `bowl' for [10]:Array




=================

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
