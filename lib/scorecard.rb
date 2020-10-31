class Scorecard

attr_reader :score

  def initialize(team)
    @team = team
    @score = scorecard
  end

  def scorecard
    {@team => {} }
  end

  def reset_scorecard
    @score[@team].each do |k,v|
    @score[@team][k] = 0
    end
  end

  def add_roll(turn, pins)
    @score[@team][turn] = pins
  end

  def total(frame)
    score_excl_bonus = 0
    while frame > 0 do
      score_excl_bonus += (@score[@team][frame+0.1] + @score[@team][frame+0.2])
        if @score[@team][frame+0.1] == 10 || @score[@team][frame+0.2] == 10
          score_excl_bonus += @score[@team][frame+1.1] + @score[@team][frame+1.2]
        end
        frame -= 1
    end
    score_excl_bonus
  end

end
