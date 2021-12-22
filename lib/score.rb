# frozen_string_literal: true

# score class
class Score
  def initialize
    @total = 0
  end

  def get_total(current_frame)
    result = current_frame.reduce(0, :+)
    @total += result
  end

  def spare?(current_frame)
    current_frame.reduce(0, :+) == 10 && current_frame[0] > 0 && current_frame[0] < 10
  end

  def strike?(current_frame)
    current_frame[0] == 10 || current_frame[1] == 10
  end

  def add_bonus(current_frame)
    spare?(previous_frame) ? @total += current_frame[0] : @total += current_frame.reduce(0, :+)
  end
end
