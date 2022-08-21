require_relative 'lib/frame'
require_relative 'lib/scorecard'

class App
  def initialize(io)
    @io = io
    @frame_number = 1
  end

  def play
    @io.puts "Welcome to bowling!"

    while @frame_number <= 10
      @io.puts "Please enter the first number of knocked down pins:"
      roll_1 = @io.gets.chomp.to_i
      @io.puts "Please enter the second number of knocked down pins:"
      roll_2 = @io.gets.chomp.to_i

      @frame_number += 1
    end
  end
end