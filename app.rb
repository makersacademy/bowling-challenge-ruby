# frozen_string_literal: true

require './lib/game'

game = Game.new
TOTAL_NUMBER_OF_FRAMES = 10

until game.current_frame_number > TOTAL_NUMBER_OF_FRAMES
  puts 'Your score:'
  score = gets.chomp.to_i
  game.bowl(score)
  game.print_scorecard
end
