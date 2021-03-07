
class Game
attr_reader :score


def initialize(rolls = [])
  @score = 0
  @rolls = []
end

def roll(pins)
 @rolls.push(pins)
end

def score
  @score = 0
  @roll_index = 0
  10.times do
    if strike?(@roll_index)
      @score += strikeScore(@roll_index)
      print_scoreboard
      @roll_index += 1
    elsif spare?(@roll_index)
      @score += spareScore(@roll_index)
      print_scoreboard
      @roll_index += 2
    else
    @score += frameScore(@roll_index)
    print_scoreboard
    @roll_index += 2
    end
  end
  @score
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

def print_scoreboard
  print "\n"
  print "Frame #{@roll_index + 1}\n"
  print "Score so far #{@score}\n"
end

end
