require_relative 'frame.rb'

class Game

    attr_reader :roll, :rolls, :frame_score, :frame 

    def initialize(frame = Frame.new)
        @frame = frame
        @roll = frame.roll
        @rolls = frame.rolls
        @frame_score = frame.frame_score
    end

    def input_roll(roll)
        @frame.input_roll(roll)
    end

    # def add_to_frame_score
    #     @frame.frame_score
    # end
    
end