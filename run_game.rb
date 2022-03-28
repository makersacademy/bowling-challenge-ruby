# This file is for testing scenarios without having 
# to rerun a series of commands in IRB

require_relative './lib/game'

game = Game.new
18.times{ game.roll(1) }
3.times{ game.roll(10) }

p game.scorecard

p game.score

