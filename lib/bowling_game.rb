class BowlingGame
  attr_reader :score_card

  def initialize(score_card = [])
    @score_card = score_card 
    @sum = 0   
    @player_points = 0
  end

  def roll(num)
    @score_card << num  
  end

  def strike?
    @score_card[@player_points] == 10
  end

  def strike_points
    @score_card[@player_points] + @score_card[@player_points + 1] + @score_card[@player_points + 2]
  end
  
  def spare?
    @score_card[@player_points] == 10
  end

  def spare_points
    @score_card[@player_points] + @score_card[@player_points + 1] + @score_card[@player_points + 2]
  end

  def base_points
    @score_card[@player_points] + @score_card[@player_points + 1] + @score_card[@player_points + 2]
  end
  
  def final_score
    10.times do
      if strike?
        sum += strike_points && player_turn += 1
      elsif spare?
        sum += spare_points && player_turn += 2
      else
        sum += base_points && player_turn += 2
      end
    end
    sum
  end
end
