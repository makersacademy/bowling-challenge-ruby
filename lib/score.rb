class Score
  
  def initialize
    @total = 0
  end

  def get_total(frame_arr)
    result = frame_arr.reduce(0, :+)
    @total += result
  end
end