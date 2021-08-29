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
    10.times do 
      if @rolls[count] + @rolls[count + 1] == 10
        total_score += @rolls[count] + @rolls[count + 1] + @rolls[count + 2]
      else
        total_score += @rolls[count] + @rolls[count + 1]
      end
      count += 2
    end
    total_score
  end
end