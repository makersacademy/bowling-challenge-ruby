require_relative './game'

class Frame

    attr_reader :scorecard
    attr_reader :first, :second
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

    def first_frame?
        if @scorecard.length < 4
            true
        end
    end

    def add_total
        if first_frame?
            @scorecard << @first + @second
        elsif @scorecard[-5] + @scorecard[-4] == 10 && @scorecard[-5] != 10
            adding_spare_bonus
        elsif @scorecard[-5] == 10
            add_strike_bonus
        else
            @scorecard << @first + @second + @scorecard[-3]
        
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




end