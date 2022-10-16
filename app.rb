# require_relative './lib/frame'
# require_relative './lib/scorecard'


# class App
#   def initialize(io = Kernel, scorecard, frame)
#     @io = io
#     @scorecard = scorecard
#     @frame = frame
#   end

#   def run_scorecard
#     @scorecard = Scorecard.new
#     game_score
#     @frame.add_rolls
#     p @scorecard
#   end

#   def roll_1
#     @io.puts 'First roll score:'
#     @frame = Frame.new
#     @frame.roll1 = @io.gets.to_i
#   end

#   def roll_2
#     @io.puts 'Second roll score:'
#     @frame = Frame.new
#     @frame.roll2 = @io.gets.to_i
#   end

#   def game_score
#     @io.puts "Frame 1: [#{roll_1},#{roll_2}]"
#   end
# end

# if __FILE__ == $0
#   app = App.new(
#     io = Kernel, Scorecard.new, Frame.new
#   )
#   app.run_scorecard
# end