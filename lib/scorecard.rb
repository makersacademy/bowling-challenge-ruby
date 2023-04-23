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
      scorecard_str += format_frame(index, frame, score)
    end
    scorecard_str
  end

  private

  def format_frame(index, frame, score)
    frame_info = "FRAME #{index + 1}:"
    rolls_info = frame.rolls.each_with_index.map { |roll, r_index| "ROLL #{r_index + 1}: #{roll.score}" }.join(' ')
    "#{frame_info} #{rolls_info} | TOTAL: #{frame.total} | SCORE: #{score}\n"
  end
end