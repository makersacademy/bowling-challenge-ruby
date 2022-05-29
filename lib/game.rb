require_relative 'frame.rb'
require_relative 'final_frame.rb'

class Game

    attr_reader :rolls, :frame, :tally, :bonus, :final_frame, :all_rolls

    def initialize(frame = Frame.new, final_frame = FinalFrame.new)
        @frame = frame
        @final_frame = final_frame
        @bonus = @frame.bonus
        @rolls = @frame.rolls
        @tally = []
        @all_rolls = []
    end

    def score
        "Your score is #{@tally.flatten.sum}"
    end

    def roll(roll)
        if @tally.length < 9
        @frame.input_roll(roll)
            if open_frame && @tally.length < 9
                add_to_tally_and_generate_new_frame
                add_bonus_and_points_to_tally
                score
            elsif strike && @tally.length < 9
                add_to_bonus_and_generate_new_frame
                add_bonus_and_points_to_tally
                score
            elsif spare && @tally.length < 9
                add_to_bonus_and_generate_new_frame
                add_bonus_and_points_to_tally
                score
            end
        elsif tally.length >= 9
            @final_frame.input_roll(roll)
            add_final_frame_bonuses_to_tally
            add_roll_to_all_rolls_final_frame_edition
            add_final_roll_to_tally
            @final_frame.game_over
            # final_score
            #final score breaks one of the tests...
            #maybe make it so the array doesn't accept nil values?
        end
    end

    def open_frame
        @frame.complete? && !frame.bonus?
    end

    def strike
        @frame.complete? && @frame.strike?
    end

    def spare
        @frame.complete? && @frame.spare?
    end

    def final_score
        unless all_rolls.length < 12
        "You scored #{tally.flatten.sum}"
        end
    end

    def load_final_frame 
        @final_frame = FinalFrame.new
    end

    def add_final_roll_to_tally
        @tally << [] unless tally.length == 10
        if @tally[9] != nil && @tally[9].length == 0 #&& @final_frame != nil 
            #if tenth frame exists and there's nothing in it
            @tally[9] << @final_frame.rolls[0]
            #send the first roll of the final frame there
        elsif @tally[9] != nil && @tally[9].length == 1 #&& @final_frame != nil 
            #if tenth frame has one entry
            @tally[9] << @final_frame.rolls[1]
            #send the second entry there
        elsif @tally[9] != nil && @tally[9].length == 2 #&& @final_frame != nil 
            #if tenth frame has two entries
            @tally[9] << @final_frame.rolls[2]
            #send the third entry there
        end
    end

    def add_final_frame_bonuses_to_tally
        add_strike_bonus_and_points_to_tally_final_frame_edition
        add_spare_bonus_and_points_to_tally_final_frame_edition
    end

    def add_roll_to_all_rolls_final_frame_edition
        unless @all_rolls.length == 12
        @all_rolls << []
        @all_rolls.last << @final_frame.rolls.last
        end
    end

    def add_spare_bonus_and_points_to_tally_final_frame_edition
        #rolls a spare in ninth frame then an open
        if @all_rolls[8].length == 2 && @all_rolls[8].sum == 10 && @tally[8] != nil && @tally[8].empty?
            @tally[8] << @all_rolls[8] << @final_frame.rolls[0]  
        end
    end

    def add_strike_bonus_and_points_to_tally_final_frame_edition
        if @all_rolls[7].length == 1 && @all_rolls[8].length == 1 && @tally[7].empty?
            #if eighth frame a strike and ninth frame a strike and the eighth frame hasn't received its points yet
            @tally[7] << @all_rolls[7] << @all_rolls[8] << @final_frame.rolls[0] 
            #give eighth frame its points and the bonus from the ninth frame and first roll of tenth
        elsif @all_rolls[8].length == 1 && @final_frame.rolls[0] == 10 && @final_frame.rolls[1] == 10 && @tally[8].empty?
            #if ninth frame a strike and first roll of tenth frame a strike and second roll of tenth frame a strike and the ninth frame hasn't received its points yet
            @tally[8] << @all_rolls[8] << @final_frame.rolls[0] << @final_frame.rolls[1]
            #give ninth frame its points and the bonus from the first two rolls of the tenth frame
        elsif @all_rolls[8].length == 1 && @final_frame.rolls[0] == 10 && @final_frame.rolls[1] != 10 && @tally[8].empty?
            #if ninth frame a strike and first roll of tenth a strike and second roll not a strike
            @tally[8] << @all_rolls[8] << @final_frame.rolls[0] << @final_frame.rolls[1]
        elsif @all_rolls[8].length == 1 && @final_frame.rolls[0] != 10 && @tally[8].empty?
            #if ninth frame a strike and first roll of tenth not a strike 
            @tally[8] << @all_rolls[8] << @final_frame.rolls[0] << @final_frame.rolls[1]
            # @tally[9] << @final_frame.rolls[0] << @final_frame.rolls[1] #comment this back in soon 
            #give ninth frame its points from 10.1 and 10.2 and give 10.1 its points and 10.2 its points
        end 
    end

    def eighth_frame_was_a_strike
        @all_rolls[7].length == 1
    end

    def ninth_frame_was_a_strike
        @all_rolls[8].length == 1
    end

    def ninth_frame_was_a_spare
        @all_rolls[8].sum == 10 && @all_rolls[8].length == 2
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
        if not_first_frame && previous_frame_was_a_spare
            add_strike_bonus_and_points_to_tally
            add_spare_bonus_and_points_to_tally
        elsif not_first_frame && previous_frame_was_a_strike
            add_strike_bonus_and_points_to_tally
        elsif not_first_frame && previous_frame_but_one_was_a_strike
            add_strike_bonus_and_points_to_tally           
        end
    end

    def not_first_or_second_frame
        @bonus[-3] != nil && @all_rolls.length >= 3
    end

    def not_first_frame
        @bonus[-2] != nil && @all_rolls.length >= 2
    end

    def previous_frame_but_one_was_a_strike
        not_first_or_second_frame && @all_rolls[-3].sum == 10 && @bonus[-3].length == 1
    end

    def previous_frame_was_a_spare
        @bonus[-2].sum == 10 && @bonus[-2].length == 2
    end

    def previous_frame_was_a_strike
        @bonus[-2].sum == 10 && @bonus[-2].length == 1
    end

    def add_spare_bonus_and_points_to_tally        
        if last_frame_but_one_was_a_spare
            @tally[-2] << @all_rolls[-2] << @all_rolls[-1][0]
            #push the spare from that roll and the first roll of the previous frame to the frame two rolls back
        end
    end

    def last_frame_but_one_was_a_spare
        @all_rolls[-2].sum == 10 && @all_rolls[-2].length == 2 && @tally[-2].empty?
    end

    def add_strike_bonus_and_points_to_tally
        if @all_rolls[-2].sum == 10 && @all_rolls[-2].length == 1 && @tally[-2].empty? && @all_rolls[-1].length == 2 && @all_rolls[-3] != nil && @all_rolls[-3].length != 1
            #if last frame was a strike, two rolls back wasn't a strike and this frame wasn't a strike 
            @tally[-2] << @all_rolls[-2] << @all_rolls[-1][0] << @all_rolls[-1][1]
            'method 1'
        elsif @all_rolls[-2].sum == 10 && @all_rolls[-2].length == 1 && @tally[-2].empty? && @all_rolls[-1].length == 2 && @all_rolls[-3] == nil 
            #if last frame was a strike and two rolls back wasn't a strike and this frame wasn't a strike and it's the second frame 
            @tally[-2] << @all_rolls[-2] << @all_rolls[-1][0] << @all_rolls[-1][1]
            'method 2'
        elsif @all_rolls[-3] != nil && @all_rolls[-2].sum == 10 && @all_rolls[-2].length == 2 && @all_rolls[-3].length == 1 && @all_rolls[-3].sum == 10 && @tally[-2].empty? && @tally[-3].empty?
        #     #if last frame was a spare and this frame wasn't a strike and two frames back was a strike 
            @tally[-3] << @all_rolls[-3] << @all_rolls[-2] && @tally[-2] << @all_rolls[-2] << @all_rolls[-1][0]
        #     #give two frames back its points from the spare and the spare its points from the last roll
        elsif @all_rolls[-3] != nil && @all_rolls[-3].length != 1 && @all_rolls[-2].sum == 10 && @all_rolls[-2].length == 1 && @tally[-2].empty? && @all_rolls[-1].length == 1 
            #if last roll was a strike and this roll is a strike and two rolls back was not a strike
            "method 3"
        elsif @all_rolls[-3] != nil && @all_rolls[-3].sum == 10 && @all_rolls[-3].length == 1 && @all_rolls[-2].sum == 10 && @all_rolls[-2].length == 1 && @tally[-3].empty? && @all_rolls[-1].length == 1
            #if two frames back was a strike and one frame back was a strike and this frame was a strike 
            @tally[-3] << @all_rolls[-3] << @all_rolls[-2] << @all_rolls[-1]
            'method 4'
        elsif @all_rolls[-3] != nil && @all_rolls[-3].sum == 10 && @all_rolls[-3].length == 1 && @all_rolls[-2].sum == 10 && @all_rolls[-2].length == 1 && @tally[-3].empty? && @all_rolls[-1].length != 1
            #if two frames back was a strike and one frame back was a strike and this frame was not a strike 
            @tally[-3] << @all_rolls[-3] << @all_rolls[-2] << @all_rolls[-1][0]
            'method 5'
            if @all_rolls[-2] != nil && @all_rolls[-2].length == 1 && @tally[-2].empty? && @all_rolls[-1].length != 1
            @tally[-2] << @all_rolls [-2] << @all_rolls[-1]
            end
        end
    end
end
