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
    @total_score += pins * number_of_bonuses
    if @current_frame.length == 2 || pins == 10
      end_frame
    end
    @total_score
  end

  private

  def last_frame
    @frame_number - 1
  end

  def spare_bonus?
    @frames[last_frame].sum == 10 && @frames[last_frame].length == 2 && @current_frame.length == 1
  end

  def strike_bonus?
    @frames[last_frame].length == 1
  end

  def double_strike_bonus?
    frame_before_last = last_frame - 1
    @frames[frame_before_last].length == 1 && strike_bonus?
  end

  def number_of_bonuses
    if @frame_number > 2 && double_strike_bonus?
      2
    elsif @frame_number > 1 && (strike_bonus? || spare_bonus?)
      1
    else
      0
    end
  end

  def end_frame
    @frames[@frame_number] = @current_frame
    @frame_number += 1
    @total_score += @current_frame.sum
    @current_frame = []
  end
end
