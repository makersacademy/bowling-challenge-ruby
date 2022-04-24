class Score

  def initialize
    @total_score = 0
  end

  def calculate_total_score(knocked_down_pins_log)
    @total_score = knocked_down_pins_log.sum
  end

  
end