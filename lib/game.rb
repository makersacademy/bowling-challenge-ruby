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
        if @frame.complete? && !@frame.strike? && !@frame.spare? && @tally.length < 9
            add_to_tally_and_generate_new_frame
        elsif @frame.complete? && @frame.strike? && @tally.length < 9
            @tally << []
            add_to_bonus_and_generate_new_frame
        elsif @frame.complete? && @frame.spare? && @tally.length < 9
            @tally << []
            add_to_bonus_and_generate_new_frame
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
        @frame = Frame.new
        @rolls = @frame.rolls
    end

    def add_to_frame_score
        @frame_score = 0
        @frame_score += @rolls.sum if @rolls.length == 2 && @rolls.sum <= 9
    end

    #now implement the below automatically

    def add_spare_bonus_and_points_to_tally
        #this example is for a spare
        # stored_points_index = @tally.length - 2
        #i.e. the second to last element in the bonus array
        index = @tally.length - 1
        #i.e. the last element in the tally array
        if @tally.last.empty?
            @tally[index-1] << @bonus[@tally.length-2][0]
            @tally[index-1] << @bonus[@tally.length-2][1] 
            @tally[index-1] << @bonus[index][0]
        elsif !@tally.last.empty?
            @tally[index-1] << @bonus[@tally.length-2][0]
            @tally[index-1] << @bonus[@tally.length-2][1] 
            @tally[index-1] << @tally[index][0]
        end
    end

    def add_strike_bonus_and_points_to_tally
        #this example is for a strike
        # stored_points_index = @tally.length - 2
        #i.e. the second to last element in the bonus array
        index = @tally.length - 1
        #i.e. the last element in the tally array
        if @tally.last.empty?
            @tally[index-1] << @bonus[@tally.length-2][0]
            @tally[index-1] << @bonus[index][0]
            @tally[index-1] << @bonus[index][1]
        elsif !@tally.last.empty?
            @tally[index-1] << @bonus[@tally.length-2][0] 
            @tally[index-1] << @tally[index][0]
            @tally[index-1] << @tally[index][1]
        end
    end

    # def add_to_tally
    #     @tally += @frame_score
    # end

end

#do I need to pass an argument to add_to_frame_scores?
#need to clear frame score after passing it to tally