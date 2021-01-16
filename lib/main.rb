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
puts 'Bowling game'.center(60)
puts 'Welcome'.center(60)
puts '-------------------'.center(60)
(1...10).each do |i|
  puts "Frame #{i}".center(50)
  puts
  roll1, roll2 = get_rolls
  frame = Frame.new(roll1, roll2)
  puts "Roll 1: #{roll1}".center(60)
  puts "Roll 2: #{roll2}".center(60)
  puts "That's a strike!".center(60) if roll1 == 10
  puts "That's a spare!".center(60) if (roll1 + roll2) == 10 && roll1 < 10

  game.play(frame)

  puts
  puts "Score: #{game.score}".center(50)
  puts '-------------------'.center(60)
end
roll1, roll2 = get_rolls
roll3 = rand(0..10)

puts 'Frame 10'.center(50)
puts
puts "Roll 1: #{roll1}".center(60)
puts "Roll 2: #{roll2}".center(60)
puts "That's a strike!".center(60) if roll1 == 10
puts "That's a spare!".center(60) if (roll1 + roll2) == 10 && roll1 < 10
puts "Roll 3: #{roll3}".center(60) if (roll1 + roll2) >= 10

frame_ten = FrameTen.new(roll1, roll2, roll3)
game.play(frame_ten)

puts "Score: #{game.score}".center(50)
puts '-------------------'.center(60)
puts 'Perfect game'.center(50) if game.score == 300
puts 'Gutter game'.center(50) if game.score.zero?
