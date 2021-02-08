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

After coming to rely on the controller to call methods I found it difficult to envisage how to build an app without one. I approached it with diagramming with flowcharts and annotating the table of scores provided to indicate bonuses.

The Game class includes a method to input a bowl, which initializes a new instance of the Frame class if some conditions are met; the game stops after ten frames and two rolls, unless there's been a strike or a spare. The Game class also calculates the score, so I think that could be extracted into a separate class.

To do:
- Finish calculating bonuses
- Have an output message after each roll; what it currently returns in irb doesn't correspond to what's happening, which makes it confusing
- Update Readme with irb excerpts
- Add diagrams to docs folder
