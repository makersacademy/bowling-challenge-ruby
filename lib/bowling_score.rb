class BowlingScore
  attr_reader :total_score, :frame_number, :current_frame, :frames

  def initialize
    @total_score = 0
    @frame_number = 1
    @current_frame = []
    @frames = {}
  end

  def roll(pins)
    @current_frame << pins
    @total_score += pins if @frame_number > 1 && spare_bonus?
    if @current_frame.length == 2 || pins == 10
      @frames[@frame_number] = @current_frame
      @frame_number += 1
      @total_score += @current_frame.sum
      @current_frame = []
    end
    @total_score
  end

  def spare_bonus?
    last_frame = @frame_number - 1
    @frames[last_frame].sum == 10 && @current_frame.length == 1
  end
end
