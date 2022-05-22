Bowling Challenge in Ruby
=================

The purpose of the challenge was to create a program to count the score of a bowling game, using Ruby as language.

The user inputs the rolls (amount of pins that went down) and the program shows the score after each frame. Spares and Strikes are not counted into the score until the final points for those are determined (Spare is 10 points plus the value of next roll. Strike is 10 points plus the value of next 2 rolls). Frames consists in 2 rolls, except 2 exemptions: when the 10 pins go down after first roll (Strike) or in last frame, when, if the user gets a hit all 10 pins in first 2 rolls, a third one is needed to determine the bonus points for Strikes/Spares.

Maximum of pins that can be knocked down on a same frame is 10 (expect from last frame), so the program will raise an error in that case.


Getting started:
-----

Run `bundle install` to install all the needed gems. Ruby version is 3.1.2


Usage:
-----

On irb, require `./lib/scorecard.rb`
Create a new scorecard with `Scorecard.new` and call `.insert_play(pins)` with the number of pins knocked down for each roll. Score is printed on the screen after each frame.


Running tests:
-----

Run `rspec` on main folder