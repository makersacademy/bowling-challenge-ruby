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
  20 .times do
    score_total += @rolls[roll_count]
    roll_count += 1
  end
  score_total
end

end
