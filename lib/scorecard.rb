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

    # def check_previous_for_strike 
        # if an array, .last.strike? to check whether it is a strike. if hash, it will have to be somesort of counter?
    # end

    # def check_previous_for_spare
        # if an array, .last.spare? to check whether it is a spare. if hash, it will have to be somesort of counter?
    # end

end

