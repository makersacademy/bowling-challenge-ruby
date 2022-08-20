require_relative 'lib/frame_repository'

class App
  def initialize(io)
    @io = io
    @frame_number = 1
  end

  def play
    @io.puts "Welcome to bowling!"

    while @frame_number <= 10
      @io.puts "Please enter the first number of knocked down pins:"
      @roll_1 = @io.gets.chomp.to_i
      @io.puts "Please enter the second number of knocked down pins:"
      @roll_2 = @io.gets.chomp.to_i

      @io.puts "Your score: #{@frame_score} points"
      @frame_number += 1
    end
  end
end