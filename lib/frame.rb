class Frame

    attr_reader :roll, :rolls, :frame_score, :bonus

    def initialize
        @rolls = []
        @frame_score = [] #still necessary?
        @bonus = []
    end

    def input_roll(roll)
        @rolls << roll
    end 

    def add_to_frame_score
        @frame_score << @rolls if @rolls.length == 2
    end

    # def roll_less_than_ten?
    #     true if @roll <= 9
    # end

    def spare?  
        @rolls.sum == 10 && @rolls.length == 2 
    end

    def strike?
        @rolls.sum == 10 && @rolls.length == 1
    end

    def complete?
        @rolls.length == 2 || strike? || spare?
    end


end