class BowlingGame

  MAX_ROLLS = 20

  attr_reader :rolls, :result

  def initialize
    @rolls = []
    @result = 0
    @frame = 1
  end

  def roll(pins)
    @rolls << pins
  end

  def score
    roll_index = 0
    raise "The game has finished, final score is #{@result}." if @frame > 10
    10.times do
      if strike?(roll_index)
        @result += @rolls[roll_index] + @rolls[roll_index + 1] + @rolls[roll_index + 2]
        roll_index += 1
      elsif spare?(roll_index)
        @result += spare_score(roll_index)
        roll_index += 2
      else
        @result += frame_score(roll_index)
        roll_index += 2
      end
      @frame += 1
    end
    result
  end

  private

  def strike?(roll_index)
    @rolls[roll_index] == 10
  end

  def strike_score(roll_index)
    @rolls[roll_index] + @rolls[roll_index + 1] + @rolls[roll_index + 2]
  end

  def spare?(roll_index)
    @rolls[roll_index] + @rolls[roll_index + 1] == 10
  end

  def spare_score(roll_index)
    @rolls[roll_index] + @rolls[roll_index + 1] + @rolls[roll_index + 2]
  end

  def frame_score(roll_index)
    @rolls[roll_index] + @rolls[roll_index + 1]
  end

end
