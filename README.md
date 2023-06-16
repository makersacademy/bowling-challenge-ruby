Bowling Challenge in Ruby
=================

A weekend challenge as part of the Makers Academy software engineering bootcamp.

## The Task

We were given the following brief:

**THIS IS NOT A BOWLING GAME, IT IS A BOWLING SCORECARD PROGRAM. DO NOT GENERATE RANDOM ROLLS. THE USER INPUTS THE ROLLS.**

Count and sum the scores of a bowling game for one player.

A bowling game consists of 10 frames in which the player tries to knock down the 10 pins. In every frame the player can roll one or two times. The actual number depends on strikes and spares. The score of a frame is the number of knocked down pins plus bonuses for strikes and spares. After every frame the 10 pins are reset.

The focus for this challenge is to write high-quality code.

## Getting started

`git clone https://github.com/tomcarmichael/bowling-challenge-ruby.git`

Install dependencies:

`bundle install`

Run the tests:

`rspec`

Run the program:

`ruby app.rb`

Enter the score for each roll. A strike will immediately move the program onto the next frame. A strike or a spare in frame 10 results in additional bonus balls for the player.

At the end of the game the score will be calculated and printed to the terminal.
