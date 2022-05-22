require_relative 'frame.rb'

class Game

    attr_reader :roll, :rolls, :frame, :frame_score, :tally

    def initialize(frame = Frame.new)
        # @roll = @frame.roll
        @frame = frame
        @rolls = @frame.rolls
        # @frame_score = 0
        @tally = []
    end

    def roll(roll)
        @frame.input_roll(roll)
        # add_to_frame_score if @rolls.length == 2
        # add_to_tally
        if @frame.complete? 
            @tally << @frame.rolls
            @frame = Frame.new
            @rolls = @frame.rolls
        end
    end

    def add_to_frame_score
        @frame_score = 0
        @frame_score += @rolls.sum if @rolls.length == 2 && @rolls.sum <= 9
    end

    def add_to_tally
        @tally += @frame_score
    end

end

#do I need to pass an argument to add_to_frame_scores?
#need to clear frame score after passing it to tally