require_relative './lib/game.rb'

will = Game.new
puts "Starting score: #{will.score}"

will.start_game
will.score
