# class Bowling 
#   def initialize 
#     @bowling_game = []
#     @frames = []
#   end 

#   def add(roll)
#     frames = Counter.new(@bowling_game)

#     if frames.max_number_of_frame?
#       return nil
#     end 

#     @frames << roll.score 
#     if @frames.length == 2 
#       @bowling_game << @frames 
#       @frames = []
#     end 

#     return nil 
#   end 
  
#   def rolls_by_frame
#     return @bowling_game 
#   end 
# end 
   