class BowlingScore
  attr_reader :total_score, :frame_number

  def initialize
    @total_score = 0
    @frame_number = 1
    @current_frame = []
  end

  def roll(pins)
    @total_score += pins
    @current_frame << pins
    @frame_number += 1 if @current_frame.length == 2
  end
end
