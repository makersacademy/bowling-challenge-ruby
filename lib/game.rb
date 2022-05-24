require_relative 'frame.rb'
require_relative 'final_frame.rb'

class Game

    attr_reader :rolls, :frame, :tally, :bonus, :final_frame, :all_rolls

    def initialize(frame = Frame.new)
        @frame = frame
        @bonus = @frame.bonus
        @rolls = @frame.rolls
        @tally = []
        @all_rolls = []
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
        elsif @frame.complete? && tally.length == 9
            load_final_frame
            "final frame"
        end
    end

    def load_final_frame 
        @final_frame = FinalFrame.new
    end

    def add_to_tally_and_generate_new_frame
        @tally << @frame.rolls
        @all_rolls << @frame.rolls
        @bonus << []
        @frame = Frame.new
        @rolls = @frame.rolls
        
    end

    def add_to_bonus_and_generate_new_frame
        @bonus << @frame.rolls
        @all_rolls << @frame.rolls
        @tally << []
        @frame = Frame.new
        @rolls = @frame.rolls
    end

    def add_bonus_and_points_to_tally
        if not_first_or_second_frame && previous_frame_was_a_spare
            add_spare_bonus_and_points_to_tally
        elsif not_first_or_second_frame && previous_frame_but_one_was_a_strike
            add_strike_bonus_and_points_to_tally
        end
    end

    def not_first_or_second_frame
        @bonus[-3] != nil && @all_rolls.length >= 3
    end

    def previous_frame_but_one_was_a_strike
        @bonus[-3].sum == 10 && @bonus[-2].length == 1
    end

    def previous_frame_was_a_spare
        @bonus[-2].sum == 10 && @bonus[-2].length == 2
    end

    def add_spare_bonus_and_points_to_tally        
        if @all_rolls[-3].sum == 10 && @all_rolls[-3].length == 2
            #if two rolls back was a spare 
            @tally[-3] << @all_rolls[-3] << @all_rolls[-2][0]
            #push the spare from that roll and the first roll of the previous frame to the frame three rolls back
        end
    end

    # def add_strike_bonus_and_points_to_tally
    #     if @tally.last.empty? && (@bonus[-2][0] + @bonus[-1][0]) == 20
    #         @tally[-2] << @bonus[-2][0] << @bonus[-1][0] << @tally[-1][0]
    #     elsif !@tally.last.empty?
    #         @tally[penultimate_index] << @bonus[penultimate_index][0] << @tally[final_index][0] << @tally[final_index][1]
    #     end
    # end

    def add_strike_bonus_and_points_to_tally
        if @all_rolls[-3].sum == 10 && @all_rolls[-3].length == 1 && @all_rolls[-2].length == 2
            #if three rolls back was a strike and the second to last roll wasn't a strike
            @tally[-3] << @all_rolls[-3] << @all_rolls[-2][0] << @all_rolls[-2][1]
            #push the strike from that roll and both rolls from the second to last roll to the score for that roll three back 
        elsif @all_rolls[-3].sum == 10 && @all_rolls[-3].length == 1 && all_rolls[-2].length == 1
            #if three rolls back was a strike and two rolls back was a strike
            @tally[-3] << @all_rolls[-3] << @all_rolls[-2][0] << @all_rolls[-1][0]
            #push the strike from that roll and from the previous roll to the score for that roll three back
        end
    end
end

# currently the bonus isn't added to the tally until two rolls after the roll in which
#the bonus was incurred, regardless of whether they continue to get spares or strikes
#this should only happen if the player scores a strike in the second roll
#if they score anything else, the bonus should be calculated at the end of that frame.
#so for [5,5] [6, 2] the 6 should be added to the spare at the end of the [6, 2] frame
#for [10] [10] [3, 1] the 10 and the 3 should be added at the end of the third frame
#for [10] [4, 3] the 4 and the 3 should be added at the end of that go
#for [10] [5, 5] [4, 2] the 5 and the 5 should be added at the end of that the [5,5] frame, and 
#the 4 should be added to the 5, 5 at the end of the 4, 2 frame

#so that spare method needs to change from [-3] to [-2] for starters...


