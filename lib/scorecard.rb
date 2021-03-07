class Scorecard

  attr_reader :player_rolls

  def initialize
    @player_rolls = []
  end

  def player_roll(pins_knocked)
    @player_rolls << pins_knocked
  end

  def points
    score = 0
    player_rolls_index = 0
    10.times do
    if spare?(player_rolls_index)
      score += spare_points(player_rolls_index)
      player_rolls_index += 2
    else
      score += noSpare_noStrike_points(player_rolls_index)
      player_rolls_index += 2
    end
  end
  score
end

  def spare?(player_rolls_index)
   @player_rolls[player_rolls_index] + @player_rolls[player_rolls_index + 1] == 10
 end

 def spare_points(player_rolls_index)
   @player_rolls[player_rolls_index] + @player_rolls[player_rolls_index + 1] + @player_rolls[player_rolls_index + 2]
 end

 def noSpare_noStrike_points(player_rolls_index)
   @player_rolls[player_rolls_index] + @player_rolls[player_rolls_index + 1]
 end



end
