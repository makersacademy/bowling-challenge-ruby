class BowlingScore
  attr_reader :total_score, :frame_number, :current_frame

  def initialize
    @total_score = 0
    @frame_number = 1
    @current_frame = []
  end

  def roll(pins)
    @current_frame << pins
    if @current_frame.length == 2
      @frame_number += 1
      @total_score += @current_frame.sum
      @current_frame = []
    end
    @total_score
  end
end
