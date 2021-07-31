require_relative 'score'

class Frame
  attr_reader :score, :round
  attr_accessor :frame_score
  def initialize(round:)
    @round = round
    @score = Score.new
    @framescore
  end

  def first_roll(pins:)
    @score.first_roll(pins: pins)
  end
  
  def second_roll(pins:)
    @score.second_roll(pins: pins)
  end

  def calculate_score(type)
    case type
    when 'strike'
       @score.calculate_strike_score
    when 'spare'
       @score.calculate_spare_score
    when 'normal'
      @score.calculate_normal_score
    end
  end
end