
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
    if strike?(roll_index)
      result += strikeScore(roll_index)
      roll_index += 1
    elsif spare?(roll_index)
      result += spareScore(roll_index)
      roll_index += 2
    else
    result += frameScore(roll_index)
    roll_index += 2
    end
  end
  result
end

def spare?(roll_index)
  @rolls[roll_index] + @rolls[roll_index + 1 ] == 10
end

def strike?(roll_index)
  @rolls[roll_index] == 10
end

def spareScore(roll_index)
   10 +  @rolls[roll_index + 2]
end

def strikeScore(roll_index)
   10 +  @rolls[roll_index + 1 ] + @rolls[roll_index + 2]
end

def frameScore(roll_index)
  @rolls[roll_index] + @rolls[roll_index + 1 ]
end
end
