class Frame
  attr_reader :rolls, :frame_score, :total_score
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
    fail 'Only the tenth frame may consist of more than two rolls' if @frame_number < 10 && @rolls.length == 2
    fail 'The tenth frame may consist of no more than three rolls' if @frame_number == 10 && @rolls.length == 3
    
    @rolls << pins
  end

  def calculate_frame_score

    if is_strike?
      @frame_score = @rolls[0]
    else
      @frame_score = @rolls[0] + @rolls[1]
    end

    # return @frame_score
  end

  def calculate_total_score
    calculate_frame_score

    @total_score = (@frame_score + @bonus_score)

    # return @total_score
  end

  def is_strike?
    @rolls[0] == 10  
  end

  def is_spare?
    (@rolls.length == 2) && (@rolls[0] + @rolls[1] == 10) && @rolls[0] != 10 
  end
end
