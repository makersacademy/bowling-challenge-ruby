require_relative './lib/game.rb'
require_relative './lib/frame.rb'

class Application
  def initialize(io = Kernel)
    @io = io
  end

  def run
    n = 0
    @game = Game.new
    # For the first 9 frames the palyer can roll the ball and if it doesn't hit all the pins it can roll again
    while n < 10 do
      p @game
      @io.puts "Enter the first roll:"
      frame = Frame.new
      frame.roll_1 = @io.gets.chomp.to_i
      if frame.roll_1 < 10
        @io.puts "Enter the second roll:"
        frame.roll_2 = @io.gets.chomp.to_i
      end
      @game.add_frame(frame)
      n += 1
    end
    p @game
    # The 10th frame is a special one where the player can get a bonus roll
    @io.puts "Enter the first roll:"
    frame = Frame.new
    frame.roll_1 = @io.gets.chomp.to_i
    if frame.roll_1 < 10
      @io.puts "Enter the second roll:"
      frame.roll_2 = @io.gets.chomp.to_i
      @game.add_frame(frame)

      # If a player hits a spare they get an extra roll
      if frame.spare? == true
        @io.puts "Enter the bonus roll:"
        frame = Frame.new
        frame.roll_1 = @io.gets.chomp.to_i
        @game.add_frame(frame)
      end

    # If a player hits a strike they get extra rolls
    elsif frame.strike? == true
      @io.puts "Enter the bonus roll:"
      frame = Frame.new
      frame.roll_1 = @io.gets.chomp.to_i
      if frame.roll_1 < 10
        @io.puts "Enter the second roll:"
        frame.roll_2 = @io.gets.chomp.to_i
      end
      @game.add_frame(frame)

      if frame.strike? == true
        @io.puts "Enter the bonus roll:"
        frame = Frame.new
        frame.roll_1 = @io.gets.chomp.to_i
        @game.add_frame(frame)
        binding.irb
      end
    end 
    return @game
  end
end

# app = Application.new(Kernel)
# app.run