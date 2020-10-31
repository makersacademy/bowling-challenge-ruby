class Scorecard

attr_reader :score

  def initialize(team)
    @team = team
    @score = score_card
  end

  def score_card
    {@team => {} }
  end

  def reset_score_card
    @score[@team].each do |k,v|
    @score[@team][k] = 0
    end
  end

  def add_roll(turn, pins)
    @score[@team][turn] = pins
  end

  def total(frame)
    @score[@team][frame+0.1] + @score[@team][frame+0.2]
  end

end
