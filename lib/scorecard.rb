class Scorecard
  attr_reader :frames

  def initialize
    @frames = []
  end

  def update(frame, frames)
    frame.total = frame.rolls.sum(&:score)
    if frame.rolls.size == 2 || frame.rolls.map(&:score).sum >= 10
      @frames << frame
    end
  end

  def to_s
    scorecard_str = ""
    score = 0
    @frames.each_with_index do |frame, index|
      score += frame.total
      scorecard_str += "FRAME #{index + 1}:"
      frame.rolls.each_with_index do |roll, r_index|
        scorecard_str += " ROLL #{r_index + 1}: #{roll.score}"
      end
      scorecard_str += " | TOTAL: #{frame.total}"
      scorecard_str += " | SCORE: #{score}\n"
    end
    scorecard_str
  end
end