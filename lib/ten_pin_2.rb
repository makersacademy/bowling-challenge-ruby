class TenPinScore
    
    def initialize
        # @scorecard = []
        @total_score = []
        # Either 1 or 2
        @which_roll = 0
        # Should total rolls of each frame
        @roll_total = 0
        # Should count 0-9
        @which_frame = 0
        @strike = false 
        @double = false
        @spare = false
        @roll_1 = 0
        @roll_2 = 0
        @tenth = []
    end

    def format_arrays
        # 12.times{ @scorecard << [] }
        12.times{ @total_score << 0}
    
    end

# then do a seperate thing for frame 10
    def add_roll(roll) 
        if @which_frame > 8
            @roll = roll
            frame_10
        elsif @which_roll == 0
            @roll_1 = roll
            @which_roll += 1
            if roll == 10
                @which_roll = 0
                add_score
            end
        elsif @which_roll == 1
            @roll_2 = roll
            @which_roll = 0
           add_score
        end
    end

    def frame_10
        @tenth << @roll 
    end

    def sum_tenth
        @total_score[9] += @tenth.sum
        if @strike == false && @spare == true
            @total_score[8] += @tenth[0]
        elsif @strike == true
            if @tenth[0] < 10
                @total_score[8] += @tenth[0] + @tenth[1]
            else
                @total_score[8] += @tenth[0]
            end
        elsif @double == true
            if @tenth[0] < 10
                @total_score[8] += @tenth[0] + @tenth[1]
                @total_score[7] += @tenth[0] + @tenth[1]
            else
                @total_score[8] += @tenth[0]
                @total_score[8] += @tenth[0]
            end
        end
    end

    def add_score
        if @roll_1 == 10 #strike behavoiur
            @total_score[@which_frame] += (@roll_1 + @roll_2)
            if @strike == false && @spare == false
                @strike = true 
            elsif @strike == false && @spare == true
                @total_score[@which_frame-1] += @roll_1 
                @spare = false
                @strike = true
            elsif @strike == true
                @total_score[@which_frame-1] += (@roll_1 + @roll_2)
                @strike = false
                @double = true
            elsif @double == true
                @total_score[@which_frame-1] += (@roll_1 + @roll_2)
                @total_score[@which_frame-2] += (@roll_1 + @roll_2)
            end
        elsif @roll_1 < 10 # Non strike behaviour
            @total_score[@which_frame] += (@roll_1 + @roll_2)
            if @which_frame == 10
            # if last frame is spare they get points from 1st roll
            elsif @strike == false && @spare == true
                @total_score[@which_frame-1] += @roll_1 
                @spare = false
            # if last fram was strike then they get points from both rolls    
            elsif @strike == true
                @total_score[@which_frame-1] += (@roll_1 + @roll_2)
                @strike = false
            elsif @double == true
                @total_score[@which_frame-1] += (@roll_1 + @roll_2)
                @total_score[@which_frame-2] += (@roll_1 + @roll_2)
                @double = false
            end
            @spare = true if (@roll_1 + @roll_2) == 10
        end
        binding.irb
        @roll = 0 
        @roll_1 = 0
        @roll_2 = 0
        @which_frame += 1
    end

    def total_score
        sum_tenth
        return @total_score.sum
    end
end





    # def add_roll(roll)
    #     # roll_total is score for frame
    #     @roll_total += roll
    #     # Bahaviour for roll 1    
    #     if @which_roll == 0
    #         @scorecard[@which_frame][@which_roll] = roll
    #         @which_roll += 1
    #     # Bahaviour for roll 2
    #     elsif @which_roll == 1
    #         @scorecard[@which_frame][@which_roll] = roll
    #         @which_roll = 0
    #         @roll_total = 0
    #         @which_frame += 1
    #     end
    # end

    # def total_score
    #     @total_score.each_with_index do |zero, index|
    #         if @scorecard[@index][0] == 10