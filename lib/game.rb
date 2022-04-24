class Game
  def initialize
    @score = 0
    @rolls = []
    @roll_number = 0
  end

  def bowl(pins)
    if @roll_number.even?
      @frame = []
      @frame << pins
    else
      @frame << pins
      @rolls << @frame
    end
    @roll_number += 1
  end

  def score
    @rolls.each_with_index do |frame, index|
      if frame.sum == 10
        @score += frame.sum + @rolls[index + 1].first
      else
        @score += frame.sum
      end
    end
   @score
  end

end