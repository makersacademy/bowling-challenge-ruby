require_relative './lib/game'
require_relative './lib/frame'

game = Game.new

24.times do
  game.take_turn(10)
  p game
end