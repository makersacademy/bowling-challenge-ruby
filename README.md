Bowling Challenge in Ruby
=================

This is not yet complete, all the code is working but I need to add some of the bonus functionality. Currently strikes and spares in the final frame have the bonuses calculate.

The next stage will be to make sure that strikes and spares in the non-final frames also can have their bonuses calculated.

The score is only printed as a total at the end. I want to change this in future so it is updated at the end of each round.

How to play

- irb
- require './lib/roll'
- game  = Frames.new
- game.new_round