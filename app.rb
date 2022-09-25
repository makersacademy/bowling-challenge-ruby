require './lib/game'
require './lib/frame'

class Application

  current_game = Game.new

  def score(rolls, total, i)
    if rolls[i] == 10
      total = total + 10 + rolls[i+1] + rolls[i+2]
      i+2 == (rolls.length - 1) ? total : score(rolls, total, i+1)
    elsif rolls[i] + rolls[i+1] == 10
      total = total + 10 + rolls[i+2]
      i+2 >= (rolls.length - 1) ? total : score(rolls, total, i+2)
    else
      total = total + rolls[i] + rolls[i+1]
      i+2 >= (rolls.length - 1) ? total : score(rolls, total, i+2)
    end
  end

  def run_game(game = current_game)
    score(game, 0, 0)
  end


end
