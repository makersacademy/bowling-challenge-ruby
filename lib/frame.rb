class Frame

    attr_reader :roll, :rolls, :frame_score

    def initialize
        @roll
        @rolls = []
        @frame_score = []
    end

    def input_roll(roll)
        fail 'max rolls reached' if @rolls.length == 2
        @roll = roll
        @rolls << @roll 
    end 

    def roll_less_than_ten?
        true if @roll <= 9
    end

    def frame_less_than_ten?
        @rolls.sum <= 9 ? true : false
    end

    def frame_score
        @frame_score = @rolls.sum if @rolls.length == 2 && @rolls.sum <= 9
    end


end