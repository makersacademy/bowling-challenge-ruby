class Frame

    attr_reader :roll, :rolls, :bonus

    def initialize
        @rolls = []
        @frame_score = []
        @bonus = []
    end

    def input_roll(roll)
        @rolls << roll
    end 

    def spare?  
        @rolls.sum == 10 && @rolls.length == 2 
    end

    def strike?
        @rolls.sum == 10 && @rolls.length == 1
    end

    def complete?
        @rolls.length == 2 || strike? || spare?
    end

    def bonus?
         strike? || spare?
    end


end