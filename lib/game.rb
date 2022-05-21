require_relative 'frame.rb'

class Game

    attr_reader :roll, :rolls, :frame_score, :frame 

    def initialize(frame = Frame.new)
        @frame = frame
        @roll = frame.roll
        @rolls = frame.rolls
        @frame_score = frame_score
    end

    def input_roll(roll)
        @frame.input_roll(roll)
    end

    def frame_score
        @frame_score = @rolls.sum if @rolls.length == 2 && @rolls.sum <= 9
    end

    def clear_rolls
        @rolls.clear if @rolls.length == 2
    end
    
end