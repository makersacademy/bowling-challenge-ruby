class Frame

    attr_reader :roll, :rolls, :frame_score

    def initialize
        @roll
        @rolls = []
        @frame_score = 0
    end

    def input_roll(roll)
        @rolls.clear if @rolls.length == 2
        @roll = roll
        @rolls << @roll
    end 

    def roll_less_than_ten?
        true if @roll <= 9
    end

    def frame_less_than_ten?
        @rolls.sum <= 9 ? true : false
    end

end