class Scorecard

attr_reader :score

  def initialize(team)
    @team = team
    @score = score_card
  end

  def score_card
    {
      @team => {
        1.1=>0,
        1.2=>0,
        2.1=>0,
        2.2=>0,
        3.1=>0,
        3.2=>0,
        4.1=>0,
        4.2=>0,
        5.1=>0,
        5.2=>0,
        6.1=>0,
        6.2=>0,
        7.1=>0,
        7.2=>0,
        8.1=>0,
        8.2=>0,
        9.1=>0,
        9.2=>0,
        10.1=>0,
        10.2=>0,
        10.3=>0
      }
    }
  end

  def reset_score_card
    @score[@team].each do |k,v|
    @score[@team][k] = 0
    end
  end

  def add_roll(turn, pins)
    @score[@team][turn] = pins
  end

end
