require_relative 'lib/bowling.rb'

class Application
  def initialize(io = Kernel)
    @io = io
  end
  
  def run
    bowling_game = BowlingGame.new
    intro_message
    frame_num = 1
    10.times do
      @io.puts "What was you score for Frame #{frame_num}?"
      pins_knocked_input = @io.gets.chomp
      if pins_knocked_input.include? ','
        frame_array = pins_knocked_input.split(',')
        frame_array.each { |pins_knocked_down| bowling_game.roll(pins_knocked_down.to_i) }
      else
        bowling_game.roll(pins_knocked_input.to_i)
      end
      frame_num += 1
    end
    @io.puts "You final score for this game was: #{bowling_game.score}"
  end

  private 
  
  def intro_message
    @io.puts 'Input the score for each frame...'
    @io.puts 'If you scored a strike simply input 10'
    @io.puts 'Otherwise input 2 numbers seperated by a comma'
    @io.puts 'Examples:'
    @io.puts '4,3 if you knocked 4 pins followed by 3'
    @io.puts 'or'
    @io.puts '3,7 if you knocked 3 pins followed by 7'
    @io.puts 'Final frame could be 1. if you get strikes or 2. if you get a spare or 3. if not a strike or a spare:'
    @io.puts '1. 10,10,10'
    @io.puts 'or'
    @io.puts '2. 3,7,5'
    @io.puts 'or'
    @io.puts '3. 4,3'
  end
end

Application.new.run

