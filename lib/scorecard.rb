require_relative './frame'
require_relative './roll'

class Scorecard

    attr_reader :total_score, :frames, :carry_over

    def initialize 
        @total_score = 0 
        @carry_over = 0 
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
        # do something with carry_over then reset it. should always be able to add it on, even if 0 as if 0 that will make no difference. 
        # if check_for_strike == true
            # do something with carry_over
        # end
        # if check_for_spare == true 
            # do something with carry_over
        # end
        @total_score += @frames.last.frame_score
        # @carry_over = 0 
    end
end

