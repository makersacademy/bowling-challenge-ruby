class Frame 
  attr_accessor :roll_1, :roll_2
  
  def initialize(roll_1, roll_2)
    @roll_1 = roll_1
    @roll_2 = roll_2
  end 

  def total_score
    return (@roll_1 + @roll_2)
  end

#   def strike 
#     if @roll_1 == 10 
#       return true
#     elsif @roll_2 == 10 
#       return false 
#     end 
#   end 

#   def spare 
#     if (@roll_1 + @roll_2) == 10
#       return true
#     else
#       return false
#     end
#   end 
end 
