class BowlingGame

  MAX_ROLLS = 20
  SPARE = 10

  attr_reader :rolls

  def initialize
    @rolls = []
  end

  def roll(pins)
    @rolls << pins
  end

  def score
    result = 0
    roll_index = 0
    10.times do
      if strike?(roll_index)
        result += @rolls[roll_index] + @rolls[roll_index + 1] + @rolls[roll_index + 2]
        roll_index += 1
      elsif spare?(roll_index)
        result += spare_score(roll_index)
        roll_index += 2
      else
        result += frame_score(roll_index)
        roll_index += 2
      end
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

#   def score
#     MAX_ROLLS.times do
#       if spare?(@roll_index)
#         @total_score += spare_score(@roll_index)
#       else
#         @total_score += frame_score(@roll_index)
#       end
#       @roll_index += 1
#     end
#   end
#
#   def frame_score(roll_index)
#     @rolls[@roll_index] + @rolls[@roll_index + 1]
#   end
#
#   def spare?(roll_index)
#     @rolls[@roll_index] + @rolls[@roll_index + 1] == 10
#   end
#
#   def spare_score(roll_index)
#     10 + @rolls[@roll_index + 1] + @rolls[@roll_index + 2]
#   end
#
#   def strike?(roll_index)
#     @rolls[@roll_index] + @rolls[@roll_index + 1] == 10
#   end
#
#   def strike_score(roll_index)
#     10 + @rolls[@roll_index + 1] + @rolls[@roll_index + 2]
#   end
#
# end
