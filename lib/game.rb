class Game

    attr_reader :scorecard, :first, :second

    def initialize
    @scorecard = []
    end


    def roll(first, second)
        @first = first
        @second = second
        @scorecard << first
        @scorecard << second

        add_total            
        
    end

    def add_total
        if first_frame?
            @scorecard << @first + @second
        elsif @scorecard[-5] + @scorecard[-4] == 10 && @scorecard[-5] != 10
            adding_spare_bonus
        elsif @scorecard[-5] == 10
            add_strike_bonus
        elsif @first == 0 && @second == 0
            gutter
        elsif @scorecard.length >= 30
            end_game
        else
            @scorecard << @first + @second + @scorecard[-3]
        end
    end

    def first_frame?
        if @scorecard.length < 4
            true
        end
    end

    def adding_spare_bonus
        if first_frame? == true
            @scorecard << 10 + @first + @first + @second
        else
            @scorecard << scorecard[-3] + @first + @first + @second
        end
    end

    def add_strike_bonus
        if first_frame? == true
            @scorecard << 10 + @first + @first + @second + @second
        else
            @scorecard << scorecard[-3] + @first + @first + @second + @second
        end
    end

    def gutter
       "Double gutter! Bad luck!"
    end

    def end_game
        if @scorecard[-3] == 10
            extra_rolls = 0
            while extra_rolls < 2 do
            roll(first, second)
            extra_rolls += 1
            end
        else
            "Game Over!"
        end
    end


end