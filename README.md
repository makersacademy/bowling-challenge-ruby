# Bowling Challenge in Ruby

This is a solution to the bowling challenge in Ruby. The challenge is to write a program that calculates the score of a bowling game.

## How to use

Clone this repo and run bundle install to install the dependencies.

To run the tests, run rspec from the command line.

To run the program:

run irb from the command line and require the game file.

OR

run ruby game.rb from the command line.

## Diagram

INSERT DIAGRAM

## Classes

### Game

The main class that controls the flow of the game. It has an `initialize` method that sets up the game with a new Frame and a new Scorecard. It also has a `roll` method which calls the roll method on the current frame and updates the Scorecard. The game continues until all frames are played.

### Frame

Controls the rolls in a frame. It has a `roll` method that adds the score to the frame and checks if the frame is over. It also has methods to check if the frame is a strike or a spare. A frame is considered over if it's a strike or has two rolls.

### Scorecard

Controls the score. It has an `update` method that adds the score to the total score and calculates the bonus scores for strikes and spares, updating the frame scores accordingly. It also has a method to show the scorecard, which prints the score in a readable format.

### Roll

Records the score of the roll and feeds it to the Frame and Scorecard classes.