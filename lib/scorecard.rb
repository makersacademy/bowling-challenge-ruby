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
      create_new_frame
      @frames[turn].rolled(pins)
      calculate_total
    else
      @frames[turn].rolled(pins)
      calculate_total
    end
  end

  def turn
    @current_turn
  end

  def calculate_total
    @total_score = 0
    calcualate_bonus
    @frames.each { |frame| @total_score += (frame.score + frame.bonus_score) }
  end

  private

  def calcualate_bonus
    if @frames[last_turn].strike? && @frames.length > 1
      @frames[last_turn].bonus_score = @frames[turn].score
    elsif @frames[last_turn].spare? && @frames.length > 1
      @frames[last_turn].bonus_score = @frames[turn].rolls[0]
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