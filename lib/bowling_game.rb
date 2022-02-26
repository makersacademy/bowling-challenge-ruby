class Bowlinggame

  def initialize 
    @rolls = []
  end

  def roll(pin)
    @rolls.push pin

  end

  def score
   #retult is score_counter
    score_counter = 0
    rollIndex = 0
    20.times do     
    score_counter += @rolls[rollIndex].to_i
    rollIndex += 1
   
  end
  score_counter
  end

end