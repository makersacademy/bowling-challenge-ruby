class Score
  
  def initialize
    @total = 0
  end

  def get_total(current_frame)
    result = current_frame.reduce(0, :+)
    @total += result
  end

  def spare?(current_frame)
    current_frame.reduce(0, :+) == 10
  end

  def strike?(current_frame)
    current_frame[0] == 10 || current_frame[1] == 10
  end
end