class Application

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

end