class Frame

    attr_reader :frame_score, :roll_1, :roll_2

    def initialize
        @frame_score = 0 
        @roll_1 = 0 
        @roll_2 = 0 
    end

    def strike? 
        @roll_1 == 10 ? true : false
    end

    def spare?
        @roll_1 + @roll_2 == 10 ? true : false 
    end

    def add_roll_1(roll_score)
     @roll_1 = Roll.new(roll_score).score 
    end

    def add_roll_2(roll_score)
        @roll_1 == 10 ? @roll_2 = 0 : @roll_2 = Roll.new(roll_score).score 
    end

    def end_frame
        if @roll_1 == 10 
            @frame_score = @roll_1 
        else 
            @frame_score += @roll_1 
            @frame_score += @roll_2
        end

        # @roll_1 == 10 ? @frame_score = @roll_1 : @frame_score = @roll_1 + @roll_2
    end

end