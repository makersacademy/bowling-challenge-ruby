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
    @rolls.each do |roll|
      total += roll
    end
    total
  end
end
