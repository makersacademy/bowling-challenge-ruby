require_relative './frame'
require_relative './game'

def get_rolls
  roll_1 = rand(0..10)
  roll_2 = rand(0..10)
  while (roll_1 + roll_2) > 10
    roll_1 = rand(0..10)
    roll_2 = rand(0..10)
  end
  [roll_1, roll_2]
end

game = Game.new
(1...10).each do |_i|
  roll_1, roll_2 = get_rolls
  frame = Frame.new(roll_1, roll_2)
  game.play(frame)
end
roll_1, roll_2 = get_rolls
roll_3 = rand(0..10)
frame_ten = FrameTen.new(roll_1, roll_2, roll_3)
game.play(frame_ten)

puts game.score
