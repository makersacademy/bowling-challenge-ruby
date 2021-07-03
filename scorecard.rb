class BowlingScore
  attr_reader :score

  def initialize
    @rolls = []
  end

  def roll(pins)
    @rolls.push(pins)
  end

  def score
    total = 0
    roll_index = 0
    frame = 1
    until frame == 11 do
      if @rolls[roll_index] == 10
        total += (@rolls[roll_index] + @rolls[roll_index + 1] + @rolls[roll_index + 2])
        @rolls.push(0)
        roll_index -= 1
      elsif @rolls[roll_index] + @rolls[roll_index + 1] == 10
        total += (@rolls[roll_index] + @rolls[roll_index + 1] + @rolls[roll_index + 2])
      else
        total += (@rolls[roll_index] + @rolls[roll_index + 1])
      end
      roll_index += 2
      frame += 1
    end
    total
  end

end
