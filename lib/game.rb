class Game

def initialize
  @rolls = []
end

def roll(pins)
  @rolls << pins
end

def score
  score_total = 0
  roll_count = 0
  10.times do
    if @rolls[roll_count] + @rolls[roll_count + 1] == 10
    score_total += @rolls[roll_count] + @rolls[roll_count + 1] + @rolls[roll_count + 2]
    else 
    score_total += @rolls[roll_count] + @rolls[roll_count + 1]
    end
    roll_count += 2
  end
  score_total
end

end
