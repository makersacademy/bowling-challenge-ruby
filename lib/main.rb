# frozen_string_literal: true

require_relative './frame'
require_relative './game'

def get_rolls
  roll1 = rand(0..10)
  roll2 = rand(0..10)
  while (roll1 + roll2) > 10
    roll1 = rand(0..10)
    roll2 = rand(0..10)
  end
  [roll1, roll2]
end

game = Game.new
(1...10).each do |_i|
  roll1, roll2 = get_rolls
  frame = Frame.new(roll1, roll2)
  game.play(frame)
end
roll1, roll2 = get_rolls
roll3 = rand(0..10)
frame_ten = FrameTen.new(roll1, roll2, roll3)
game.play(frame_ten)

puts game.score
