class Frame
  def initialize(frame, next_index)
    @frame = frame
    @next_index = next_index
  end

  def strike?
    @frame[0] == 10 && @next_index < 10 ? true : false
  end
  
  def spare?
    @frame[0] != 10 && @frame.sum == 10 && @next_index < 10 ? true : false
  end

end