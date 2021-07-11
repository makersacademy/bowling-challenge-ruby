
class Bowling

  def initialize
    @rolls = []
  end

  def roll(pins)
    pins.flatten!
    counter = 0
    while counter < pins.length do
      @rolls.push(pins[counter])
      counter += 1
    end
  end

  def score
    result = 0
    turns = 0
    10.times do
        if strike?(turns)
        result += strike_score(turns)
        turns += 1
      elsif spare?(turns)
        result += spare_score(turns)
        turns += 2
      else 
        result += normal_score(turns)
        turns += 2
      end
    end
    return result
  end
  
  def strike?(turns)
    @rolls[turns] == 10;
  end

  def spare?(turns)
    @rolls[turns] + @rolls[turns + 1] == 10;
  end

  def strike_score(turns)
    10 + @rolls[turns + 1] + @rolls[turns + 2]
  end 

  def spare_score(turns)
    10 + @rolls[turns + 2]
  end 

  def normal_score 
     @rolls[turns] + @rolls[turns + 1]
  end

end


test = Bowling.new

test.roll(game)

puts test.score
