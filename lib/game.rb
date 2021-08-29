class BowlingGame 

  def initialize 
    @rolls = []
  end

  def roll(pins)
    @rolls<< pins
  end 

  def score
    total_score = 0
    count = 0
    20.times do 
      total_score += @rolls[count]
      count += 1
    end
    total_score
  end
end