require_relative 'lib/game'
require_relative 'lib/frame'

game = Game.new
game.run_game
game.calculate_score
puts "Total score: #{game.grand_total}"
