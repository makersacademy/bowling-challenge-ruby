class ScoreInput
    def initialize
        @strike = Array.new(10, 0)
        @spare = Array.new(10, 0)
        @turn = -1
        @score = Array.new(10, 0)
    end

    def check_score
        return @score
    end

    def total
    end

    def add_score(roll_1, roll_2)
        raise "You can't hit more than 10 pins a turn" if roll_1 + roll_2 > 10 
        @turn += 1
        total = roll_1 + roll_2
        case total
        when 10 && roll_2 == 0
            @strike[@turn] = 1
            @score[@turn] = total
            call_strike_or_spare(@turn, total, roll_1)
            p @score
            return "Strike!"

        when 10 
            @spare[@turn] = 1
            @score[@turn] = total
            call_strike_or_spare(@turn, total, roll_1)
            p @score
            return "Spare!"
        else
            @score[@turn] = total
            call_strike_or_spare(@turn, total, roll_1)
            return "You missed a spot"
        end
    end

    def call_strike_or_spare(current_turn, total, roll_1)
        if @spare[@turn-1] == 1
            @score[current_turn] = @score[current_turn] + roll_1
        
        elsif @strike[@turn-1] == 1
            @score[current_turn] = @score[current_turn] + total
        
        else 
        end
    end

    def add_score_10(roll_1, roll_2, roll_3)
        raise "Score impossibly high" if roll_1 + roll_2 + roll_3 > 30

    end 
end