class Game

    attr_reader :roll_one, :roll_two

def initialize(roll_one, roll_two)
  @roll_one = roll_one 
  @roll_two = roll_two 
end 

def total_of_frame
    roll_one + roll_two 
end

end 
