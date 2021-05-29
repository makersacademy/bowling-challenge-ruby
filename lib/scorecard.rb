# frozen_string_literal: true

class Scorecard
  attr_reader :total_score, :current_frame, :current_roll

  def initialize
    @total_score = 0
    @current_frame = 1
    @current_roll = 1
  end

  def roll_1(pins)
    raise 'Max pins exceeded, recheck and try again' if pins > 10

    @roll_1 = pins
    @total_score += @roll_1
    if pins == 10
      @current_frame += 1
    else @current_roll += 1
    end
  end

  def roll_2(pins)
    raise 'Max pins exceeded, recheck and try again' if pins + @roll_1 > 10

    @total_score += pins
    @current_frame += 1
    @current_roll = 1
  end
  
  def final_score
    raise 'You have not bowled 10 frames yet' if game_over? == false

    @total_score
  end 

  def game_over?
    if @current_frame > 10
      true
    else false
    end
  end
end
