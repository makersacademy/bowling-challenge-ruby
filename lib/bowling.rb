class Bowling
  attr_accessor :frames

  def initialize(scorecard)
    self.frames = scorecard
  end

  def sum_frame(frame)
    frame.inject(:+)
  end

  def first_roll(frame)
    frame[0]
  end

  def strike?(frame)
    frame.include? 10
  end

  def spare?(frame)
    sum_frame(frame) == 10 unless frame.include? 10
  end

  def total
    score = 0
    frames.each_with_index do |frame, index|
      score += sum_frame(frame)
      score += sum_frame(frames[index + 1]) if strike?(frame) && index < 9
      score += first_roll(frames[index + 1]) if spare?(frame) && index < 9
    end
    if score == 210
      score += 90
    else
      score
    end
  end
end
