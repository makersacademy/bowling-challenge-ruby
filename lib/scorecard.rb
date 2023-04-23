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
      scorecard_str += "FRAME\t\t\t\t#{index + 1}\n"
      frame.rolls.each_with_index do |roll, r_index|
        scorecard_str += "  ROLL #{r_index + 1}\t#{roll.score}\n"
      end
      scorecard_str += "  TOTAL\t#{frame.total}\n"
      scorecard_str += "  SCORE\t#{score}\n"
    end
    scorecard_str
  end
end
