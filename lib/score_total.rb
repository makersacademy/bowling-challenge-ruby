class ScoreTotal

    def initialize
        @total_score = []
    end
    
    def strike_score(score_card)
        score_card.each.with_index do | frame, index |
            if frame.length == 1 
                next_score = index + 1
                if next_score < score_card.length
                    if score_card[next_score].length == 1
                        frame[0] = 30
                    else
                        frame[0] = (10 + score_card[next_score].sum)
                    end
                end
            end 
        end
        # binding.irb
        @total_score = score_card
    end

    def spare_score
        @total_score.each.with_index do | frame, index |
            if frame.length == 2 && frame.sum == 10
                next_score = index + 1
                if next_score < @total_score.length
                    if @total_score[next_score].length == 1
                        frame[0] = 20
                        frame.pop
                    else
                        frame[0] = (10 + @total_score[next_score][0])
                        frame.pop
                    end
                end
            end 
        end
        # binding.irb
        @total_score = @total_score
    end

    def total_score
        return @total_score.flatten.sum
    end

    def print_score_card
        return @total_score
    end
end
