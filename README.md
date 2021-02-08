Bowling Challenge in Ruby
=================

## The Task

## Focus for this challenge
The focus for this challenge is to write high-quality code.

In order to do this, you may pay particular attention to the following:
* Using diagramming to plan your approach to the challenge
* TDD your code
* Focus on testing behaviour rather than state
* Commit often, with good commit messages
* Single Responsibility Principle and encapsulation
* Clear and readable code

After coming to rely on the controller to call methods I found it difficult to envisage how to build an app without one. I approached it with diagramming (in the docs folder) with flowcharts and annotating the table of scores provided to indicate bonuses.

The Game class includes a method to input a bowl, which initializes a new instance of the Frame class if some conditions are met; the game stops after ten frames and two rolls, unless there's been a strike or a spare. The Game class also calculates the score, so I think that could be extracted into a separate class. I didn't manage to get the bonuses working but I intend to update this repo.
