class Frame
  attr_reader :rolls, :frame_score
  attr_accessor :frame_number, :bonus_score, :complete

  def initialize
    @frame_number = 0
    @rolls = []
    @frame_score = 0
    @bonus_score = 0
    @total_score = 0
    @complete = false
  end

  def add_roll(pins)
    fail "A frame may only contain up to three rolls" if @rolls.length == 3
    
    @rolls << pins
  end

  def calculate_frame_score
    @rolls.each do |roll|
      @frame_score += roll
    end

    return @frame_score
  end

  def calculate_total_score
    @total_score = calculate_frame_score + @bonus_score

    return @total_score
  end

  def is_strike?
    @rolls[0] == 10
  end

  def is_spare?
    (@rolls.length == 2) && (@rolls[0] + @rolls[1] == 10)
  end
end
