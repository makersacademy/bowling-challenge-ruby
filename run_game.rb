# This file is for testing scenarios without having 
# to rerun a series of commands in IRB

require_relative './lib/game'

game = Game.new
game.roll(6)
game.roll(4)

game.roll(1)
game.roll(1)
game.roll(1)
game.roll(1)
game.roll(1)
game.roll(1)
game.roll(1)
game.roll(1)
game.roll(1)
game.roll(1)
game.roll(1)
game.roll(1)
game.roll(1)
game.roll(1)

game.score

