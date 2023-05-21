class Scorecard 
  def initialize
    @scores = []
  end

  def scores
    @scores
  end

  def add_frame(rolls)
    calculate_bonus(rolls) 
    
    return @scores << { rolls: rolls } if rolls.sum == 10

    if @scores.empty?
      total = rolls.sum
    else
      total = @scores.last[:score] + rolls.sum
    end
    @scores << { rolls: rolls, score: total }
  end

  private

  def calculate_bonus(rolls)
    return if @scores.empty?

    if @scores.last[:rolls].include?(10)
      strike_bonus(rolls)
    elsif @scores.last[:rolls].sum == 10
      spare_bonus(rolls)
    end
  end

  def strike_bonus(rolls)
    @scores.last[:score] = prev_score + 10 + rolls.sum
  end

  def spare_bonus(rolls)
    @scores.last[:score] = prev_score + 10 + rolls[0]
  end

  def prev_score
    return @scores[-2] ? @scores[-2][:score] : 0
  end
end