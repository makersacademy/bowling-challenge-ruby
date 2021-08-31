require_relative 'scorecard'
require_relative 'round'

class Score 

    attr_reader :first_bowl, :second_bowl, :total_score, :score_card

    def initialize
        @score_card = []
        @total_score = 0
    end

    def total(x, y)
    @score_card << [x, y]
    if @score_card.length > 1
        if @score_card[-2][0] == 10
            strike(x,y)
        elsif @score_card[-2].sum == 10
            @total_score += x
            @total_score += x + y
        else
            p @score_card[-2]
            @total_score += (x + y)
        end
    else 
        @total_score += (x + y)
    end
    p "Your current total is #{@total_score}"
    end

    def strike(x, y)
        #IF THREE IN A ROW, ADD THIRTY
        if @score_card.length >= 3 && @score_card[-1][0] == 10 && @score_card[-2][0] == 10 && @score_card[-3][0] == 10
            @total_score += 30
        # IF TWO IN A ROW, ADD TWENTY
        elsif
            @score_card.length >= 2 && @score_card[-2][0] == 10 && @score_card[-1][0] == 10
            @total_score += 20
        # IF ONE PREVIOUSLY, ADD 10 AND X + Y
        else 
            @one_strike = ((x+y) + 10)
            @total_score += @one_strike
        end
    end    

    def last_round(x,y,z)
        # If the first frame is a strike, then it follows the usual strike pattern because there are two left
        @score_card << [x]
        if x == 10
           total(x, 0)
        end
        # If the second frame is a strike, it doesn't follow the same pattern because you only get extra points
        @score_card << [y]
        if y == 10
            @total_score += 20
            p "Your total score is #{total_score}"
        else total(x,y)
        end
        if (x + y) == 10 || y == 10
            @score_card << [z]
            @total_score += z
            p "Your total score is #{total_score}"
        end
    end

end