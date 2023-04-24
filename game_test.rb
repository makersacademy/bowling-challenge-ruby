require_relative 'lib/game'

game = Game.new
game.roll(5)
game.roll(5)
game.roll(6)
game.roll(4)
puts game.scorecard.to_s
