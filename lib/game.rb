require_relative 'frame.rb'

class Game

    attr_reader :rolls, :frame, :tally, :bonus

    def initialize(frame = Frame.new)
        @frame = frame
        @bonus = @frame.bonus
        @rolls = @frame.rolls
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

    def add_bonus_and_points_to_tally
        if not_first_frame && second_to_last_frame_was_a_spare
            add_spare_bonus_and_points_to_tally
        elsif not_first_frame && second_to_last_frame_was_a_strike
            add_strike_bonus_and_points_to_tally
        end
    end

    def not_first_frame
        @bonus[-2] != nil 
    end

    def second_to_last_frame_was_a_strike
        @bonus[-2].sum == 10 && @bonus[-2].length == 1
    end

    def second_to_last_frame_was_a_spare
        @bonus[-2].sum == 10 && @bonus[-2].length == 2
    end

    def add_spare_bonus_and_points_to_tally        
        final_index = @tally.length - 1
        penultimate_index = @tally.length - 2
        if @tally.last.empty?
            @tally[penultimate_index] << @bonus[penultimate_index][0] << @bonus[penultimate_index][1] << @bonus[final_index][0]
        elsif !@tally.last.empty?
            @tally[penultimate_index] << @bonus[penultimate_index][0] << @bonus[penultimate_index][1] << @tally[final_index][0]
        end
    end

    def add_strike_bonus_and_points_to_tally
        final_index = @tally.length - 1
        penultimate_index = @tally.length - 2
        if @tally.last.empty?
            @tally[penultimate_index] << @bonus[penultimate_index][0] << @bonus[final_index][0] << @tally[final_index][1]
        elsif !@tally.last.empty?
            @tally[penultimate_index] << @bonus[penultimate_index][0] << @tally[final_index][0] << @tally[final_index][1]
        end
    end
end

