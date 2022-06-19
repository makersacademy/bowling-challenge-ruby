class FinalFrame

    attr_reader :roll, :rolls

    def initialize
        @rolls = []
    end

    def input_roll(roll)
        unless (@rolls.length == 2 && (!strike? && !spare?)) || (@rolls.length == 3) #&& (strike? || spare?)
        @rolls << roll
        end
    end 

    def spare?  
        rolls[0] != 10 &&  rolls[1] != 10 && rolls[0] + rolls[1] >= 10 
    end

    def strike?
        @rolls[0] == 10 || @rolls[1] == 10
    end

    def complete?
        @rolls.length == 2 && !strike? && !spare? || @rolls.length == 3 && strike? || @rolls.length == 3 && spare? 
    end

    def bonus?
         strike? || spare?
    end

    def game_over
        if complete? 
            true 
            "Game over!"
        end
    end

end

