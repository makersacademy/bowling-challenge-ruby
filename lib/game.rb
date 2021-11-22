class Game

  NUMBER_OF_FRAMES = 10  
  
  def self.start_game
    NUMBER_OF_FRAMES.times{ start_frame }
    puts "Game Over"
  end
  
  def self.start_frame
    puts "hello, please begin"
  end  
end  

#   def bowl(pins)

#   end
  
#   def score
#     0
#   end  
  