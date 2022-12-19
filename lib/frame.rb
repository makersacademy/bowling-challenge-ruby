class Frame
  def initialize(scores)
    @scores = scores
  end

  def scores
    return @scores
  end

  def strike?
    return @scores[0] == 10 ? true : false
  end
  
  def spare?
    return @scores[0] != 10 && @scores.sum == 10 ? true : false
  end

  def complete?(frame_count)
    frame_length = 2
    if @scores.sum >= 10
      frame_count == 9 ? frame_length = 3 : frame_length = 1
    end

    return @scores.length >= frame_length ? true : false
  end
end
