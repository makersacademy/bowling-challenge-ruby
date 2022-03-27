require 'frame.rb'

class Scorecard

  attr_accessor :frames, :total_score

  def initialize(frames = Frame.new )
    @frames = [frames]
    @current_turn = 0
    @total_score = 0
  end

  def roll(pins)
    if @frames[turn].next_turn?
      @total_score += @frames[turn].score
      create_new_frame
      @frames[turn].rolled(pins)
    else
      @frames[turn].rolled(pins)
    end
  end

  def turn
    @current_turn
  end

  private

  def calculate_total
    @total_score = 0
    calcualate_bonus
    @frames.sum { |frame| @total_score += frame}
  end

  def calcualate_bonus
    if @frames[last_turn].previous_was_strike?
      @frames[last_turn].score += @frames[turn].score
    end
  end

  def create_new_frame
    @current_turn += 1
    @frames << Frame.new
  end

  def last_turn
    @current_turn - 1
  end

end

# def calculate_status
#   if pins == 10
#     frame.strike = true
#     frame.complete = true
#   elsif frame.roll_1 + frame.roll_2 == 10
#     frame.spare == true
#     frame.complete = true
#   elseif frame.roll_1 != nil && frame.roll_2 != nil
#     frame.complete = true
#   end
# end