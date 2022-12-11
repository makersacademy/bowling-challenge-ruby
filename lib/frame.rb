class Frame 
  attr_accessor :frame_number, :first_roll, :second_roll

  def initialize(frame_number)
    @frame_number = frame_number
  end

  def rolls
    [first_roll, second_roll]
  end 

  def frame_score
    first_roll.to_i + second_roll.to_i
  end 

end 