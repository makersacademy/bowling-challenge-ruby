require_relative 'frame.rb'

class Game

    attr_reader :roll, :rolls, :frame, :frame_score, :tally, :bonus

    def initialize(frame = Frame.new)
        # @roll = @frame.roll
        @frame = frame
        @bonus = @frame.bonus
        @rolls = @frame.rolls
        # @frame_score = 0
        @tally = []
    end

    def roll(roll)
        @frame.input_roll(roll)
        if @frame.complete? && !frame.bonus? && @tally.length < 9
            add_to_tally_and_generate_new_frame
            add_bonus_and_points_to_tally
        elsif @frame.complete? && @frame.strike? && @tally.length < 9
            add_to_bonus_and_generate_new_frame
            add_bonus_and_points_to_tally
        elsif @frame.complete? && @frame.spare? && @tally.length < 9
            add_to_bonus_and_generate_new_frame
            add_bonus_and_points_to_tally
        # elsif @frame.complete? && tally.length == 9
            # @final_frame = FinalFrame.new
        end
    end

    def add_to_tally_and_generate_new_frame
        @tally << @frame.rolls
        @bonus << []
        @frame = Frame.new
        @rolls = @frame.rolls
    end

    def add_to_bonus_and_generate_new_frame
        @bonus << @frame.rolls
        @tally << []
        @frame = Frame.new
        @rolls = @frame.rolls
    end

    def add_to_frame_score
        @frame_score = 0
        @frame_score += @rolls.sum if @rolls.length == 2 && @rolls.sum <= 9
    end

    #now implement the below automatically

    def add_bonus_and_points_to_tally
        if @bonus[-2] != nil && @bonus[-2].sum == 10 && @bonus[-2].length == 2
            add_spare_bonus_and_points_to_tally
        elsif @bonus[-2] != nil && @bonus[-2].sum == 10 && @bonus[-2].length == 1
            add_strike_bonus_and_points_to_tally
        end
    end

    def add_spare_bonus_and_points_to_tally        
        final_index = @tally.length - 1
        penultimate_index = @tally.length - 2
        if @tally.last.empty?
            @tally[penultimate_index] << @bonus[penultimate_index][0]
            @tally[penultimate_index] << @bonus[penultimate_index][1] 
            @tally[penultimate_index] << @bonus[final_index][0]
        elsif !@tally.last.empty?
            @tally[penultimate_index] << @bonus[penultimate_index][0]
            @tally[penultimate_index] << @bonus[penultimate_index][1] 
            @tally[penultimate_index] << @tally[final_index][0]
        end
    end

    def add_strike_bonus_and_points_to_tally
        final_index = @tally.length - 1
        penultimate_index = @tally.length - 2
        if @tally.last.empty?
            @tally[penultimate_index] << @bonus[penultimate_index][0]
            @tally[penultimate_index] << @bonus[final_index][0]
            @tally[penultimate_index] << @tally[final_index][1]
        elsif !@tally.last.empty?
            @tally[penultimate_index] << @bonus[penultimate_index][0] 
            @tally[penultimate_index] << @tally[final_index][0]
            @tally[penultimate_index] << @tally[final_index][1]
        end
    end

    # def add_to_tally
    #     @tally += @frame_score
    # end

end

#do I need to pass an argument to add_to_frame_scores?
#need to clear frame score after passing it to tally

#the below needs not to be called if
            # if @tally.length > 1 && !@tally[penultimate_index].empty? && @tally[penultimate_index].length == 1 
            #     add_strike_bonus_and_points_to_tally
            # elsif tally.length > 1 && !@tally[penultimate_index].empty? && @tally[penultimate_index].length == 2
            #     add_spare_bonus_and_points_to_tally
            # end