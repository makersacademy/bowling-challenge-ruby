class Frame

  def initialize 
    @frame = []
    @score = 0
  end 

  def add_frame(roll_1, roll_2)
    @frame << roll_1
    @frame << roll_2
  end 

  def calc_score
    @score = @frame.sum
  end 
end 