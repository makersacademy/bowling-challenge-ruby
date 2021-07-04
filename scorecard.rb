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
    current_roll = 0
    frame = 1

    until frame == 11 do
      if @rolls[current_roll] == 10
        total += (@rolls[current_roll] + @rolls[current_roll + 1] + @rolls[current_roll + 2])
        @rolls.push(0)
        current_roll -= 1
      elsif @rolls[current_roll] + @rolls[current_roll + 1] == 10
        total += (@rolls[current_roll] + @rolls[current_roll + 1] + @rolls[current_roll + 2])
      else
        total += (@rolls[current_roll] + @rolls[current_roll + 1])
      end
      current_roll += 2
      frame += 1
    end
    
    total
  end

end
