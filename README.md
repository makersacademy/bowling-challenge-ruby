# Bowling Challenge in Ruby

Makers Academy Weekend Challenge - Week 5
------------------------------

For this weekend's challenge, we were given these instructions: 

## The Task

**THIS IS NOT A BOWLING GAME, IT IS A BOWLING SCORECARD PROGRAM. DO NOT GENERATE RANDOM ROLLS. THE USER INPUTS THE ROLLS.**

Count and sum the scores of a bowling game for one player. For this challenge, you do _not_ need to build a web app with a UI, instead, just focus on the logic for bowling (you also don't need a database). Next end-of-unit challenge, you will have the chance to translate the logic to Javascript and build a user interface.

A bowling game consists of 10 frames in which the player tries to knock down the 10 pins. In every frame the player can roll one or two times. The actual number depends on strikes and spares. The score of a frame is the number of knocked down pins plus bonuses for strikes and spares. After every frame the 10 pins are reset.

## My implementation

To fulfill this challenge, I created a BowlingScore class, each instance of which being the scorecard for one player. Within this class, I've defined an initialize method and attribute reader, and the method `#roll` which takes the number of pins knocked down as an argument and updates the score (which it also returns), relying on some private supporting methods. I have implemented the following features:
- Each frame allows the player two rolls, unless the player rolls a strike in the first roll, in which case the frame ends after one roll.
- Points from the frame are added to the overall score at the end of each frame.
- Bonus points are given for spares and strikes, and these are added to the score following a roll determining the amount of bonus points (first roll after a spare, or separately for first and second rolls after a strike).
- If the player rolls two consecutive strikes, a double bonus is awarded for the following roll.

Unfortunately I did not complete the challenge, and have the following features left to implement:
- The game ends after 10 frames. (Perhaps giving a 'game over' or error message if player tries to roll again after the end of the game.)
- Adding a 3rd roll to the 10th frame if the player rolls a spare in the first two rolls.
- Adding a 2nd and 3rd roll to the 10th frame if the player rolls a strike in the 10th frame.
- Only counting these extra rolls towards the bonus of the 10th frame, and not towards the frame total.

Additional features or changes I would implement if I had more time:
- Changing the way the points are calculated, so that scores are given separately for each frame (i.e. bonus points should be included within the points for the frame the bonus is awarded for, not for later rolls and, as such, score for a frame can only given after the bonus for it is calculated).
- Adding some safeguards to make sure it is used correctly: setting limits on the number of pins entered as an argument into the `#roll` method, to make sure players are not entering anymore than 10 pins for each frame.

## To play around with this code
1. Clone this repo locally
2. Run an REPL such as PRY or IRB
3. `require './lib/bowling_score'
4. Create a new instance of the BowlingScore class, e.g. `player1 = BowlingScore.new`
5. Enter your rolls by calling the `#roll` method (e.g. `player1.roll(5)`), and see the updated score returned.
