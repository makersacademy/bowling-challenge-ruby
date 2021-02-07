require_relative './frame'
require_relative './roll'

class Scorecard

    attr_reader :total_score, :frames

    def initialize 
        @total_score = 0 
        @frames = [Frame.new]
    end

    def add_frame(frame)
        @frames << frame
    end

    def check_for_strike 
        @frames.last.strike?
    end

    def check_for_spare
        @frames.last.spare?
    end

    def update_score
        @total_score += @frames.last.frame_score
    end
end

