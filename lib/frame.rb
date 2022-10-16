# In frame.rb

class Frame
    
  attr_accessor :status, :roll1, :roll2, :total, :completed
  
  def initialize
    @status = :normal      # This is :normal or :spare or :strike
    @roll1 = 0             # This is pending if status is not :normal
    @roll2 = 0             # This is pending if status is not :normal or :spare
    @total = 0             # This is sum of roll1 and roll2 if status is :normal
                           # but will alter otherwise based on either one or two further rolls
    @completed = false    # This is set to false until the total is the final total for the
                           # frame taking into account additional rolls for spare and strike
  end

end
