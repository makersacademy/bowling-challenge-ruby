
class Game
attr_reader :score

def initialize
  @score = 0
  @rolls = []
end

def roll(pins)
 @rolls.push(pins)
end

def score
  @rolls.sum
end

end
