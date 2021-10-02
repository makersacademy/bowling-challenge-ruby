class Scorecard
  attr_reader :player, :running_score, :bowl_total, :bowl_card, :score_card, :index

  def initialize(running_score = 0, player = 'Lilly')
    @player = player
    @running_score = running_score
    @bowl_card = []
    @score_card = []
    @index = -1
  end

  def bowl(first_bowl, second_bowl = 0)
    @index += 1
    frame = [first_bowl, second_bowl]
    @bowl_card << frame
    score
    @bowl_card.length == 10 ? gameover : roll_total
  end

  def roll_total
    @bowl_card[@index].sum
  end

  def spare?
    (@bowl_card[@index-1][0] + @bowl_card[@index-1][1]) == 10 && !@bowl_card[@index-1].include?(10) ? true : false
  end

  def strike?
    @bowl_card[@index-1][0] == 10 ? true : false
  end
  
  def score
    @score_card << roll_total 
    @running_score += roll_total
    return if @index == 0
    previous_spare_bonus if spare?
    previous_strike_bonus if strike?
  end

  def previous_spare_bonus
    spare_points = @bowl_card[@index][0]
    @score_card[@index-1] += spare_points
    @running_score += spare_points
  end

  def previous_strike_bonus
    strike_points = roll_total
    @score_card[@index-1] += strike_points
    @running_score += strike_points
  end

  def gameover
    @running_score == 0 ? "Gutter game!" : "Gameover, you scored: #{@running_score}"
  end
end
