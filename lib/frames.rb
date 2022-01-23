require './lib/score_card'
require './lib/roll'

class Frames

  def self.new_round(round: , score_count: , strike_count: , bonus: )
    round += 1
    if round >= 11
      ScoreCard.new(score_count, @Strike_count)
    else
      Roll.new(round: round, score_count: score_count, strike_count: strike_count)
    end
  end

end