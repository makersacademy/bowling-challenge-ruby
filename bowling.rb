# class Bowling
#   def initialize(io)
#     @io = io
#     @frames = []
#     @frame_number = 1
#     @name = ""
#   end

#   def run
#     welcome
#     frame
#   end

#   def welcome
#     @io.puts "Welcome, what is your name?"
#     @name = @io.gets.chomp
#     @io.puts "Hello, #{@name}! Let's start bowling!"
#   end

#   def frame
#     while @frame_number <= 10 do
#       @io.puts "Enter frame #{@frame_number}, roll 1:"
#       roll_1 = @io.gets.chomp.to_i
#       @io.puts "Enter frame #{@frame_number}, roll 2:"
#       roll_2 = @io.gets.chomp.to_i
#       if roll_1 + roll_2 < 10
#         @frames << [roll_1, roll_2]
#         @frame_number += 1
#       end
#     end
#        @io.puts "Well done #{@name}! You scored #{@frames.flatten.sum} points in this bowling game!"
#     return @frames.flatten.sum
#   end

#   def calculate_sum
#       @frames.map do |frame|
#       frame[0] + frame[1]
#     end.sum
#   end

#   if __FILE__ == $0
#     app = Bowling.new(Kernel)
#     app.run
#   end
# end
