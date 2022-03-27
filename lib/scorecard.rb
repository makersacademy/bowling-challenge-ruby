require_relative 'frame'

class ScoreCard
  attr_reader :total_score, :frame, :current_turn, :scorecard

  def initialize
    @total_score = (1..10).map { |x| [x, ""] }.to_h
    @scorecard = (1..10).map { |x| [x, []] }.to_h
    @frame = Frame.new
    @current_turn = @frame.current_frame
  end

  def frame_score
    if @frame.strike? || @frame.spare?
      @total_score[@frame.current_frame - 1] = "pending"
    else
      @total_score[@frame.current_frame - 1] = @frame.frames[@frame.current_frame - 1].sum
    end
  end

  def update_scorecard
    save_current_frame
    save_roll_details
    save_total_score
    @current_turn += 1
  end

  def save_current_frame
    @scorecard[@current_turn] << "Frame: #{@current_turn}"
  end

  def save_roll_details
    @scorecard[@current_turn] << "Roll 1: #{@frame.frames[@current_turn][0]}, Roll 2: #{@frame.frames[@current_turn][1]}" 
  end

  def save_total_score
    @scorecard[@current_turn] << "Total score: #{@total_score[@current_turn]}"
  end
end
