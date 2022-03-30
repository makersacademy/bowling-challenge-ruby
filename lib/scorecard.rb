require_relative 'frame'

class ScoreCard
  attr_reader :total_score, :frame, :current_turn, :scorecard, :cum_sum

  def initialize
    @total_score = (1..10).map { |x| [x, ""] }.to_h
    @scorecard = (1..10).map { |x| [x, []] }.to_h
    @frame = Frame.new
    @current_turn = @frame.current_frame
    @cum_sum = 0 
  end

  def frame_score
    if @frame.strike? 
      @total_score[@current_turn] = "strike" 
    elsif @frame.spare?
      @total_score[@current_turn] = "spare" 
    end
      if @total_score[current_turn - 1] == "strike"
        strike_score
      elsif @total_score[current_turn - 1] == "spare"
        spare_score
      else
        @cum_sum += @frame.frames[@current_turn].sum
        @total_score[@current_turn] = @cum_sum 
      end                                            
  end

  def save_current_frame
    @scorecard[@current_turn] << "Frame: #{@current_turn}"
  end

  def save_roll_details
    @scorecard[@current_turn] << "Roll 1: #{@frame.frames[@current_turn][0]}, Roll 2: #{@frame.frames[@current_turn][1]}" 
  end

  def save_total_score
    if @current_turn > 1 && @scorecard[@current_turn - 1][0].include?("strike") 
      @scorecard[@current_turn - 1][0].gsub("strike", "#{@total_score[@current_turn - 1]}")
    end
    @scorecard[@current_turn] << "Total score: #{@total_score[@current_turn]}"
  end

  private
  
  def strike_score
    @cum_sum += @frame.frames[@current_turn - 1].sum 
    @total_score[@current_turn - 1] = @cum_sum 
    @cum_sum += @frame.frames[@current_turn].sum
    @total_score[@current_turn] = @cum_sum 
  end

  def spare_score
    @cum_sum += @frame.frames[@current_turn - 1][0] 
    @total_score[@current_turn - 1] = @cum_sum 
    @cum_sum += @frame.frames[@current_turn].sum
    @total_score[@current_turn] = @cum_sum 
  end

  def update_scorecard
    save_current_frame
    save_roll_details
    save_total_score
    @current_turn += 1
  end
end
