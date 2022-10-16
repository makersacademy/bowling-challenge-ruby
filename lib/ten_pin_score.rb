

class TenPinScore
    
    def initialize
        @scorecard = []
        @total_score = []
        # Either 1 or 2
        @which_roll = 0
        # Should total rolls of each frame
        @roll_total = 0
        # Should count 0-9
        @which_frame = 0
    end

    def format_arrays
        11.times{ @scorecard << [] }
        11.times{ @total_score << 0}
    
    end

    def add_roll(roll)
        # roll_total is score for frame
        @roll_total += roll
        # Bahaviour for roll 1    
        if @which_roll == 0
            @scorecard[@which_frame][@which_roll] = roll
            @which_roll += 1
        # Bahaviour for roll 2
        elsif @which_roll == 1
            @scorecard[@which_frame][@which_roll] = roll
            @which_roll = 0
            @roll_total = 0
            @which_frame += 1
        end
    end

    def scorecard
        #binding.irb
        return @scorecard
    end

    def total_score
        strike = false
        double = false
        spare = false
        @total_score.each_with_index do |zero, index|
            # Extra rolls, if no strike or spare is bowled in tenth is not triggered
            if index == 10
                if @scorecard[index-1].sum == 20 && double == true
                    @total_score[index] += @scorecard[index].sum
                    @total_score[index-2] += 10
                else
                    @total_score[index] += @scorecard[index].sum
                end
            # 10th frame
            elsif index == 9 
                if strike == false && double == false && spare == false
                    @total_score[index] += @scorecard[index].sum
                elsif strike == false && double == false && spare == true
                    @total_score[index] += @scorecard[index].sum
                    @total_score[index-1] += @scorecard[index][0]
                elsif strike == true && double == false && spare == false
                        @total_score[index] += @scorecard[index].sum
                        @total_score[index-1] += 10                        
                elsif strike == false && double == true && spare == false
                    # For some reason, that I can't find in the rules, if you bowl all
                    # strikes then a spare in the tenth frame the 8th frame dow not get 
                    # the total points for the 10th frame as bonus it just gets the 
                    # first roll.
                    if @total_score[index][0] == 10
                        @total_score[index] += @scorecard[index].sum
                        @total_score[index-1] += 10
                        @total_score[index-2] += 10
                    else
                        @total_score[index] += @scorecard[index].sum
                        @total_score[index-1] += 10
                        @total_score[index-2] += @scorecard[index][0]
                    end
                end 
            # Strike behaviour    
            elsif @scorecard[index][0] == 10
                if strike == false && spare == false && double == false
                    @total_score[index] += 10
                    strike = true 
                elsif strike == false && spare == true && double == false
                    @total_score[index] += 10
                    @total_score[index-1] += 10
                    strike = true 
                    spare = false
                elsif strike == true && spare == false && double == false
                    @total_score[index] += 10
                    @total_score[index-1] += 10
                    strike = false
                    double = true
                elsif double == true && spare == false
                    @total_score[index] += 10
                    @total_score[index-1] += 10
                    @total_score[index-2] += 10
                end
            # Spare behaviour
            elsif @scorecard[index][0] != 10 && @scorecard[index].sum == 10
                if strike == false && spare == false
                    @total_score[index] += 10
                    spare = true 
                elsif strike == false && spare == true
                    @total_score[index] += @scorecard[index].sum
                    @total_score[index-1] += @scorecard[index][0]
                    spare = true 
                elsif strike == true && spare == false
                    @total_score[index] += 10
                    @total_score[index-1] += 10
                    strike = false
                    spare == true
                elsif double == true && spare == false
                    @total_score[index] += 10
                    @total_score[index-1] += 10
                    @total_score[index-2] += 10
                    strike = false
                    double = false
                    spare == true     
                end      
            # If you bowl less than 10 and spare false        
            elsif @scorecard[index].sum < 10 && spare == false
                if strike == false 
                    @total_score[index] += @scorecard[index].sum
                elsif strike == true 
                    @total_score[index] += @scorecard[index].sum
                    @total_score[index-1] += @scorecard[index].sum
                    strike = false
                elsif double == true 
                    @total_score[index] += @scorecard[index].sum
                    @total_score[index-1] += @scorecard[index].sum
                    @total_score[index-2] += 10
                    strike = false
                    double = false
                end
                # If you bowl less than 10 and spare true         
            elsif @scorecard[index].sum < 10 && spare == true
                if spare == false
                    @total_score[index] += @scorecard[index].sum
                    spare = false
                elsif spare == true 
                    @total_score[index] += @scorecard[index].sum
                    @total_score[index-1] += @scorecard[index][0]
                    spare = false
                end
            end 
        end
        @total_score.sum
    end

end
