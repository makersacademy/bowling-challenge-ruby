Bowling Challenge in Ruby
=================

How to run
------
- Clone directory
- run `bundle install`
- run the app using `ruby ./lib/bowling.rb` if in project directory
- Input the score for your current frame!

Implementation
-----
- Started with basic methods and implementing spares (w/o special 10th frame)
- Then implemented logic for strikes and got scores for each frame correct
- Implemented 10th game logic for normal games
- Checked edge cases for perfect and gutter games
- Created function which updates scores at end of game and play function
- In process of implementing update_scores function which updates a frame's score ASAP, works for a perfect game but nothing else...
- Code currently does not defend against wrong inputs - will break the calculator.
- Code needs a lot of refactoring and new classes, any advice would be appreciated!

Tasks
-----
- [x] Using diagramming to plan your approach to the challenge
- [x] TDD your code
- [x] Focus on testing behaviour rather than state
- [ ] Commit often, with good commit messages
- [ ] Single Responsibility Principle and encapsulation
- [ ] Clear and readable code

## The Task

**THIS IS NOT A BOWLING GAME, IT IS A BOWLING SCORECARD PROGRAM. DO NOT GENERATE RANDOM ROLLS. THE USER INPUTS THE ROLLS.**

Count and sum the scores of a bowling game for one player. For this challenge, you do _not_ need to build a web app with a UI, instead, just focus on the logic for bowling (you also don't need a database). Next end-of-unit challenge, you will have the chance to translate the logic to Javascript and build a user interface.

A bowling game consists of 10 frames in which the player tries to knock down the 10 pins. In every frame the player can roll one or two times. The actual number depends on strikes and spares. The score of a frame is the number of knocked down pins plus bonuses for strikes and spares. After every frame the 10 pins are reset.

## Focus for this challenge
The focus for this challenge is to write high-quality code.

In order to do this, you may pay particular attention to the following:
* Using diagramming to plan your approach to the challenge
* TDD your code
* Focus on testing behaviour rather than state
* Commit often, with good commit messages
* Single Responsibility Principle and encapsulation
* Clear and readable code
