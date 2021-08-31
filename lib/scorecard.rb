require './lib/round'
require './lib/score'
require './lib/last_round'

class Scorecard

    attr_reader :score_card, :total_score

    def game
        @round_count = 0
        @score = Score.new
        while @round_count < 9
            @round_count += 1
            @new_round = Round.new
            p @round_count
            @score.total(@new_round.round1,@new_round.round2)
        end
        @last_round = LastRound.new   
        @score.last_round(@last_round.round1,@last_round.round2,@last_round.round3)
    end

end

