require './lib/game.rb'

game = Game.new

while game.frames.count < game.total_frames
  frame = Frame.new
  while !frame.completed? do
    puts "input number of pins knocked down"
    throw = STDIN.gets.chomp
    frame.add(throw.to_i)
  end
  if frame.strike?
    new_frame = Frame.new
    while !new_frame.completed? do
      puts "input number of pins knocked down"
      throw = STDIN.gets.chomp
      new_frame.add(throw.to_i)
      frame.add(throw.to_i)
    end
    game.add_frame(frame.score)
    game.add_frame(new_frame.score)
    puts "New frame score: #{new_frame.score}"
  elsif frame.spare?
    # do something
  else
    game.add_frame(frame.score)
  end
puts "Frame score: #{frame.score}"
puts "Game current score: #{game.score}"
end
