require './lib/game.rb'

game = Game.new

while game.frames.count < game.total_frames
  frame = Frame.new
  while !frame.completed? do
    puts "Input number of pins knocked down"
    throw = STDIN.gets.chomp
    frame.add(throw.to_i)
  end
  if frame.strike?
    puts "Strike!\nNext frame"
    new_frame = Frame.new
    while !new_frame.completed? do
      puts "Input number of pins knocked down"
      throw = STDIN.gets.chomp
      new_frame.add(throw.to_i)
      frame.add(throw.to_i)
    end
    game.add_frame(frame.score)
    game.add_frame(new_frame.score)
    puts "New frame score: #{new_frame.score}"
  elsif frame.spare?
    puts "Spare!\nNext frame"
    new_frame = Frame.new
    puts "Input number of pins knocked down"
    throw = STDIN.gets.chomp
    new_frame.add(throw.to_i)
    frame.add(throw.to_i)
    game.add_frame(frame.score)
    puts "Frame score: #{frame.score}"
    
    puts "Input number of pins knocked down"
    throw = STDIN.gets.chomp
    new_frame.add(throw.to_i)
    game.add_frame(new_frame.score)
    puts "New frame score: #{new_frame.score}"
  else
    game.add_frame(frame.score)
  end
puts "Frame score: #{frame.score}"
puts "Game current score: #{game.score}"
end
