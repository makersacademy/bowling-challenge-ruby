Bowling Challenge in Ruby
=================
This was my second attempt of this challenge. My previous attempt can be found at the commit stated below.

After some feedback and further planning I was able to seperate responsibilities better and meet all the bonus requirements for scoring.

All of the functionality is done.

Next steps:

- clean up the methods, some of them are long and not DRY
 - consider adding more tests in - game class and bonus stuff -  watch the mocking tutorial first

- irb
- require './lib/game'
- game = Game.new
- game.start_game


==========================

# project status at previous commit (5450cf3df147966304599b7bde4e37942039f44f)

This is not yet complete, all the code is working but I need to add some of the bonus functionality. Currently strikes and spares in the final frame have the bonuses calculate.

The next stage will be to make sure that strikes and spares in the non-final frames also can have their bonuses calculated.

The score is only printed as a total at the end. I want to change this in future so it is updated at the end of each round.

How to play

- irb
- require './lib/roll'
- game  = Frames.new
- game.new_round