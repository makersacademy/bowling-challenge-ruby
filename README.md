# bowling-cli-game-ruby

This repo allows the user to play a game of bowling in the CLI by entering the numeber of pins for each roll. To play just run `ruby play.rb`.

A bowling game consists of 10 frames in which the player tries to knock down the 10 pins. In every frame the player can roll one or two times. The actual number depends on strikes and spares. The score of a frame is the number of knocked down pins plus bonuses for strikes and spares. After every frame the 10 pins are reset.

###### Strikes

The player has a strike if he knocks down all 10 pins with the first roll in a frame. The frame ends immediately (since there are no pins left for a second roll). The bonus for that frame is the number of pins knocked down by the next two rolls. That would be the next frame, unless the player rolls another strike.

###### Spares

The player has a spare if the knocks down all 10 pins with the two rolls of a frame. The bonus for that frame is the number of pins knocked down by the next roll (first roll of next frame).

###### 10th frame

If the player rolls a strike or spare in the 10th frame they can roll the additional balls for the bonus. But they can never roll more than 3 balls in the 10th frame. The additional rolls only count for the bonus not for the regular frame count.

    10, 10, 10 in the 10th frame gives 30 points (10 points for the regular first strike and 20 points for the bonus).
    1, 9, 10 in the 10th frame gives 20 points (10 points for the regular spare and 10 points for the bonus).

### Approach

As opposed to creating the most succinct solution to the problem, my aim was to create a solution that most directly reflected the logical flow of how a bowling game could be calculated. This probably resulted in more verbose code than necessary - most notably with a 'roll' class which could easily have been combined with the 'frame' class - but for me it feels easier to follow and refactor than would otherwise be the case.

At a high level the structure of the programme is as follows:
* There is a roll class responsible for creating and saving rolls
* There is a frame class responsible for creating and saving frames (and each frame also saves rolls)
* There is a game class responsible for running a new game instance and counting frames
* There is a scorecard class responsible for calculating scores, both in real time and when the game is complete

I started the task by drawing simple diagrams on paper; I knew that I wanted to have a game, frame and roll class, and I had some ideas over separation of concerns. The end product differed quite significantly from the initial design however, as it became apparent as I worked through the complexities that certain responsibilites were better suited to certain classes, and that an additional class of 'scorecard' was a logical addition. 

### Reflections

Scoring for strikes and spares are dependent on future rolls/frames, which creates the issue of real-time delays in calculating scores (since the future rolls haven't been played yet) but more notably creates the problem of being able to find the correct rolls for calculating the score. I considered a few alternatives to this problem: 
* Take the roll saved in an instance of 'frame' and count the next rolls in an array of all rolls (issue: contradicts single source principles)
* Count to the next frame and take the rolls from there, instead of from an array of all rolls (issue: possibly more verbose logically)
* Only store the rolls in a class variable of 'rolls' and then recalculate on each turn which rolls belong to which frame (issue: possibly inefficient/slow)

The way I decided to locate the correct rolls was to match the object ID for the roll in the frame that had the strike/spare, to the object ID of the roll in an array of all rolls. Although this requires storage of the rolls in two places (a 'frame' instance variable and the 'roll' class variable), it was most consistent with my aim to create something that flowed logically as opposed to the most succinct solution.

The other main complexity in creating this game was where the responsibility of the final frame logic should lie. It felt right for the logic to remain as part of the 'frame' class, but doing so meant that final frame control flow had to be littered throughout the 'game' and 'scorecard' classes. In hindsight the logic for the final frame might have be extracted to another class or other methods. 
