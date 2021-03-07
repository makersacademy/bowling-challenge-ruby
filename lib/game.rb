
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
  result = 0
  roll_index = 0
  10.times do
    if spare?(roll_index)
      result += spareScore(roll_index)
    else
    result += frameScore(roll_index)
    end
    roll_index += 2
  end
  result
end

def spare?(roll_index)
  @rolls[roll_index] + @rolls[roll_index + 1 ] == 10
end

def spareScore(roll_index)
   @rolls[roll_index] + @rolls[roll_index + 1 ] + @rolls[roll_index + 2]
end

def frameScore(roll_index)
  @rolls[roll_index] + @rolls[roll_index + 1 ]
end
end
