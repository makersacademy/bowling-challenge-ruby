# This file is for testing scenarios without having 
# to rerun a series of commands in IRB

require_relative './lib/game'

game = Game.new
p game.scorecard.last.complete?
game.roll(10)
p game.scorecard.last.complete?
game.roll(1)
game.roll(1)
p game.scorecard.last.complete?


