class BowlingGame

TOTAL_PINS = 10

  def initialize
    @total_score = 0
    @number_of_rolls = 0
    @rolls = []
  end

  def roll(pins)
    fail "Invalid score, please try again." if pins > TOTAL_PINS
      if @number_of_rolls.even?
        @frame = []
        @frame << pins
      else
        @frame << pins
        @rolls << @frame
      end
    @number_of_rolls += 1
  end

  def score
    @rolls.each_with_index do |frame, index|
      if frame.sum == 10
        @total_score += frame.sum + @rolls[index + 1].first
      else
        @total_score += frame.sum
      end
    end
    @total_score
  end
end
